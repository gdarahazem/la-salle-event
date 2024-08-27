@extends('layouts.admin')
@section('content')
@can('amenity_create')
    <div style="margin-bottom: 10px;" class="row">
        <div class="col-lg-12">
            <a class="btn btn-success" href="{{ route("admin.amenities.create") }}">
                Add
            </a>
        </div>
    </div>
@endcan
<div class="card">
    <div class="card-header">
        MarketPlace List
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class=" table table-bordered table-striped table-hover datatable datatable-Amenity">
                <thead>
                    <tr>
                        <th width="10">

                        </th>
                        <th>
                            ID
                        </th>
                        <th>
                            Name
                        </th>
                        <th>
                            Phone
                        </th>
                        <th>
                            Email
                        </th>
                        <th>
                            &nbsp;
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($amenities as $key => $amenity)
                        <tr data-entry-id="{{ $amenity->id }}">
                            <td>

                            </td>
                            <td>
                                {{ $amenity->id ?? '' }}
                            </td>
                            <td>
                                {{ $amenity->name ?? '' }}
                            </td>
                            <td>
                                {{ $amenity->phone ?? '' }}
                            </td>
                            <td>
                                {{ $amenity->email ?? '' }}
                            </td>
                            <td>
                                @can('amenity_show')
                                    <a class="btn btn-xs btn-primary" href="{{ route('admin.amenities.show', $amenity->id) }}">
                                        {{ trans('global.view') }}
                                    </a>
                                @endcan

                                @can('amenity_edit')
                                    <a class="btn btn-xs btn-info" href="{{ route('admin.amenities.edit', $amenity->id) }}">
                                        {{ trans('global.edit') }}
                                    </a>
                                @endcan

                                @can('amenity_delete')
                                    <form action="{{ route('admin.amenities.destroy', $amenity->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                        <input type="hidden" name="_method" value="DELETE">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        <input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">
                                    </form>
                                @endcan

                                    <a class="btn btn-xs btn-warning" href="mailto:{{ $amenity->email }}">
                                        Contacter par mail
                                    </a>

                            </td>

                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@section('scripts')
@parent
<script>
    $(function () {
  let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
@can('amenity_delete')
  let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
  let deleteButton = {
    text: deleteButtonTrans,
    url: "{{ route('admin.amenities.massDestroy') }}",
    className: 'btn-danger',
    action: function (e, dt, node, config) {
      var ids = $.map(dt.rows({ selected: true }).nodes(), function (entry) {
          return $(entry).data('entry-id')
      });

      if (ids.length === 0) {
        alert('{{ trans('global.datatables.zero_selected') }}')

        return
      }

      if (confirm('{{ trans('global.areYouSure') }}')) {
        $.ajax({
          headers: {'x-csrf-token': _token},
          method: 'POST',
          url: config.url,
          data: { ids: ids, _method: 'DELETE' }})
          .done(function () { location.reload() })
      }
    }
  }
  dtButtons.push(deleteButton)
@endcan

  $.extend(true, $.fn.dataTable.defaults, {
    order: [[ 1, 'desc' ]],
    pageLength: 100,
  });
  $('.datatable-Amenity:not(.ajaxTable)').DataTable({ buttons: dtButtons })
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
        $($.fn.dataTable.tables(true)).DataTable()
            .columns.adjust();
    });
})

</script>
@endsection
