@component('mail::message')
    # Payment Successful

    Dear {{ $ticket->user_name }},

    Your payment was successful. The details of the transaction are:

    - Payment Reference: {{ $ticket->pay_ref }}
    - Event Name: {{ $event->name }}
    - Event Date: {{ \Carbon\Carbon::parse($event->event_date)->format('d M, Y') }}
    - Updated At: {{ \Carbon\Carbon::parse($ticket->updated_at)->format('d M, Y h:i A') }}

    Thank you for your payment!

    Thanks,
    {{ config('app.name') }}
@endcomponent
