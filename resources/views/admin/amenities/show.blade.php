@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            Afficher MarketPlace
        </div>

        <div class="card-body">
            <div class="mb-2">
                <table class="table table-bordered table-striped">
                    <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.amenity.fields.id') }}
                        </th>
                        <td>
                            {{ $amenity->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.amenity.fields.name') }}
                        </th>
                        <td>
                            {{ $amenity->name }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Phone
                        </th>
                        <td>
                            {{ $amenity->phone }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Email
                        </th>
                        <td>
                            {{ $amenity->email }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Photos
                        </th>
                        <td>
                            @if($amenity->photos)
                                @foreach($amenity->photos as $media)
                                    <a href="{{ $media->getUrl() }}" target="_blank">
                                        <img src="{{ $media->getUrl('thumb') }}" width="50" height="50" alt="Photo Thumbnail">
                                    </a>
                                @endforeach
                            @else
                                <p>No photos available.</p>
                            @endif
                        </td>
                    </tr>
                    </tbody>
                </table>
                <a style="margin-top:20px;" class="btn btn-default" href="{{ url()->previous() }}">
                    {{ trans('global.back_to_list') }}
                </a>
            </div>

            <nav class="mb-3">
                <div class="nav nav-tabs">

                </div>
            </nav>
            <div class="tab-content">

            </div>
        </div>
    </div>
@endsection
