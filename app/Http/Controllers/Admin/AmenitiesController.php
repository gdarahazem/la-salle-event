<?php

namespace App\Http\Controllers\Admin;

use App\Amenity;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyAmenityRequest;
use App\Http\Requests\StoreAmenityRequest;
use App\Http\Requests\UpdateAmenityRequest;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AmenitiesController extends Controller
{
    use MediaUploadingTrait;
    public function index()
    {
        abort_if(Gate::denies('amenity_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $amenities = Amenity::all();

        return view('admin.amenities.index', compact('amenities'));
    }

    public function create()
    {
        abort_if(Gate::denies('amenity_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.amenities.create');
    }

    public function store(StoreAmenityRequest $request)
    {
        $amenity = Amenity::create($request->all());

        foreach ($request->input('photos', []) as $file) {
            $amenity->addMedia(storage_path('tmp/uploads/' . $file))->toMediaCollection('photos');
        }
        return redirect()->route('admin.amenities.index');
    }

    public function edit(Amenity $amenity)
    {
        abort_if(Gate::denies('amenity_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.amenities.edit', compact('amenity'));
    }

    public function update(UpdateAmenityRequest $request, Amenity $amenity)
    {
        $amenity->update($request->all());

        if (count($amenity->photos) > 0) {
            foreach ($amenity->photos as $media) {
                if (!in_array($media->file_name, $request->input('photos', []))) {
                    $media->delete();
                }
            }
        }

        $media = $amenity->photos->pluck('file_name')->toArray();

        foreach ($request->input('photos', []) as $file) {
            if (count($media) === 0 || !in_array($file, $media)) {
                $amenity->addMedia(storage_path('tmp/uploads/' . $file))->toMediaCollection('photos');
            }
        }
        return redirect()->route('admin.amenities.index');
    }

    public function show(Amenity $amenity)
    {
        abort_if(Gate::denies('amenity_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.amenities.show', compact('amenity'));
    }

    public function destroy(Amenity $amenity)
    {
        abort_if(Gate::denies('amenity_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $amenity->delete();

        return back();
    }

    public function massDestroy(MassDestroyAmenityRequest $request)
    {
        Amenity::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
