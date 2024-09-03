<!-- resources/views/emails/ticket.blade.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Ticket</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 20px;
        }
        .ticket {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        .ticket-header {
            text-align: center;
        }
        .ticket-header img {
            max-width: 100px;
            margin-bottom: 20px;
        }
        .ticket-body {
            margin-top: 20px;
        }
        .ticket-body h2 {
            color: #007bff;
        }
        .ticket-body p {
            font-size: 16px;
            line-height: 1.5;
        }
        .ticket-footer {
            text-align: center;
            margin-top: 20px;
        }
        .ticket-footer p {
            font-size: 14px;
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="ticket">
    <div class="ticket-header">
        <h1>{{ $event->name }}</h1>
        @if($event->getPhotosAttribute()->first())
            <img src="{{ $event->getPhotosAttribute()->first()->url }}" alt="{{ $event->name }}">
        @endif
    </div>
    <div class="ticket-body">
        <h2>Event Details</h2>
        <p><strong>Date:</strong> {{ \Carbon\Carbon::parse($event->event_date)->format('d M, Y') }}</p>
        <p><strong>Venue:</strong> {{ $event->address }}</p>
        <p><strong>Description:</strong> {{ $event->description }}</p>
    </div>
    <div class="ticket-footer">
        <p>Thank you for registering. We look forward to seeing you at the event!</p>
    </div>
</div>
</body>
</html>
