@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            Liste des réservations
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover datatable datatable-Ticket">
                    <thead>
                    <tr>
                        <th width="10"></th>
                        <th>ID</th>
                        <th>ID Événement</th>
                        <th>Nom d'utilisateur</th>
                        <th>Email d'utilisateur</th>
                        <th>Téléphone d'utilisateur</th>
                        <th>Référence de paiement</th>
                        <th>Date de création</th>
                        <th>Date de mise à jour</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($tickets as $ticket)
                        <tr data-entry-id="{{ $ticket->id }}">
                            <td></td>
                            <td>{{ $ticket->id ?? '' }}</td>
                            <td>{{ $ticket->event_id ?? '' }}</td>
                            <td>{{ $ticket->user_name ?? '' }}</td>
                            <td>{{ $ticket->user_email ?? '' }}</td>
                            <td>{{ $ticket->user_phone ?? '' }}</td>
                            <td>{{ $ticket->pay_ref ?? '' }}</td>
                            <td>{{ $ticket->created_at ?? '' }}</td>
                            <td>{{ $ticket->updated_at ?? '' }}</td>
                            <td>
                                @can('ticket_show')
                                    <a class="btn btn-xs btn-primary" href="{{ route('admin.tickets.show', $ticket->id) }}">
                                        {{ trans('global.view') }}
                                    </a>
                                @endcan

                                @can('ticket_edit')
                                    <a class="btn btn-xs btn-info" href="{{ route('admin.tickets.edit', $ticket->id) }}">
                                        {{ trans('global.edit') }}
                                    </a>
                                @endcan

                                @can('ticket_delete')
                                    <form action="{{ route('admin.tickets.destroy', $ticket->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                        <input type="hidden" name="_method" value="DELETE">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        <input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">
                                    </form>
                                @endcan
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

            @can('ticket_delete')
            let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
            let deleteButton = {
                text: deleteButtonTrans,
                url: "{{ route('admin.tickets.massDestroy') }}",
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
            $('.datatable-Ticket:not(.ajaxTable)').DataTable({ buttons: dtButtons })
            $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
                $($.fn.dataTable.tables(true)).DataTable()
                    .columns.adjust();
            });
        })
    </script>
@endsection
