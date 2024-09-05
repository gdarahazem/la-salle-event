<?php

namespace App\Mail;

use App\Venue;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PaymentFailed extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * The Ticket instance.
     *
     * @var \App\Ticket
     */
    public $ticket;

    /**
     * Create a new message instance.
     *
     * @param \App\Ticket $ticket
     * @return void
     */
    public function __construct($ticket)
    {
        $this->ticket = $ticket;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Your Payment Failed')
            ->markdown('emails.payments.failed')
            ->with([
                'ticket' => $this->ticket,
                'event' => Venue::where("id", $this->ticket->event_id)->first(),
            ]);
    }
}
