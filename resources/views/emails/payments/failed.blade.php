@component('mail::message')
    # Payment Failed

    Dear {{ $ticket->user_name }},

    Your payment has failed. Please check your payment details and try again. The details of the failed transaction are:

    - Payment Reference: {{ $ticket->pay_ref }}
    - Event Name: {{ $event->name }}
    - Event Date: {{ \Carbon\Carbon::parse($event->event_date)->format('d M, Y') }}

    If you continue to experience issues, please contact our support team.

    Thank you,
    {{ config('app.name') }}
@endcomponent
