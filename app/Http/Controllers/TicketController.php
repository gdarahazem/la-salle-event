<?php

namespace App\Http\Controllers;

use App\Mail\TicketMail;
use App\Ticket;
use App\Venue;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class TicketController extends Controller
{
    public function store(Request $request)
    {

        $request->validate([
            'event_id' => 'required|exists:events,id',
            'user_name' => 'required|string|max:255',
            'user_email' => 'required|email',
            'user_phone' => 'required|string|max:15',
        ]);

        // Assuming Ticket is the model that stores the ticket data
        $ticket = Ticket::create([
            'event_id' => $request->event_id,
            'user_name' => $request->user_name,
            'user_email' => $request->user_email,
            'user_phone' => $request->user_phone,
        ]);

        // Get the  event details
        $event = Venue::find($request->event_id);

        // Send the email
        Mail::to($request->user_email)->send(new TicketMail($event, $request->user_name));

        return redirect()->back()->with('success', 'Your ticket request has been submitted successfully. Please check your email for the ticket.');
    }
}
