@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        Edit MarketPlace
    </div>

    <div class="card-body">
        <form action="{{ route("admin.amenities.update", [$amenity->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="name">{{ trans('cruds.amenity.fields.name') }}*</label>
                <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($amenity) ? $amenity->name : '') }}" required>
                @if($errors->has('name'))
                    <p class="help-block">
                        {{ $errors->first('name') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.amenity.fields.name_helper') }}
                </p>
            </div>

            <!-- New Phone Field -->
            <div class="form-group {{ $errors->has('phone') ? 'has-error' : '' }}">
                <label for="phone">Phone*</label>
                <input type="text" id="phone" name="phone" class="form-control" value="{{ old('phone', isset($amenity) ? $amenity->phone : '') }}" required>
                @if($errors->has('phone'))
                    <p class="help-block">
                        {{ $errors->first('phone') }}
                    </p>
                @endif
                <p class="helper-block">
                    Please enter the phone number associated with this amenity.
                </p>
            </div>

            <!-- New Email Field -->
            <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
                <label for="email">Email*</label>
                <input type="email" id="email" name="email" class="form-control" value="{{ old('email', isset($amenity) ? $amenity->email : '') }}" required>
                @if($errors->has('email'))
                    <p class="help-block">
                        {{ $errors->first('email') }}
                    </p>
                @endif
                <p class="helper-block">
                    Please enter the email associated with this amenity.
                </p>
            </div>

            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
@endsection
