<?php

namespace App\Http\Controllers;

use App\Ticket;
use App\Venue;
use Exception;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Support\Facades\Log;

class PaymentController extends Controller
{
    public function initPayment(Request $request, Venue $venue)
    {
        // Validate the request data
        $request->validate([
            'user_name' => 'required|string|max:255',
            'user_email' => 'required|email',
            'user_phone' => 'required|string|max:15',
        ]);

        $client = new Client(['headers' => [
            'x-api-key' => "64a7e53aedd4795ff4bbb8d5:RXMkqdpeQtfUfJihzNOVhsvUFRlQ5Hv",
            'Content-Type' => 'application/json'
        ],
            'verify' => false,
        ]);

        try {
            $response = $client->request('POST', 'https://api.konnect.network/api/v2/payments/init-payment', [
                'json' => [
                    'receiverWalletId' => '64a7e53aedd4795ff4bbb8d8',
                    'token' => 'TND',
                    'amount' => $venue->price * 1000,
                    "webhook" => route('payment_gateway'),
                    "successUrl" => "https://dev.konnect.network/gateway/payment-success",
                    "failUrl" => "https://dev.konnect.network/gateway/payment-failure",
                ]
            ]);

            $body = json_decode($response->getBody()->getContents(), true);
            $paymentRef = $body['paymentRef'];

            // Store the ticket information in the database
            $ticket = new Ticket();
            $ticket->event_id = $venue->id;
            $ticket->user_name = $request->user_name;
            $ticket->user_email = $request->user_email;
            $ticket->user_phone = $request->user_phone;
            $ticket->pay_ref = $paymentRef;
            $ticket->save();

            return response()->json(['status' => $response->getStatusCode(), 'body' => $body]);

        } catch (RequestException $e) {
            if ($e->hasResponse()) {
                $response = $e->getResponse();
                $body = json_decode($response->getBody()->getContents(), true);
                return response()->json(['status' => $response->getStatusCode(), 'body' => $body], $response->getStatusCode());
            }

            Log::debug($e);
            return response()->json(['status' => 500, 'body' => 'An error occurred'], 500);
        }
    }

    public function processPayment(Request $request)
    {
        $pay_ref = $request->payment_ref;
        $ticket = Ticket::where("pay_ref", $pay_ref)->first();

        // Instantiate Guzzle HTTP Client
        $client = new Client();

        // Define the API endpoint
        $url = 'https://api.konnect.network/api/v2/payments/' . $pay_ref;

        try {
            // Make a GET request to the API
            $response = $client->request('GET', $url, [
                'headers' => [
                    'x-api-key' => "64a7e53aedd4795ff4bbb8d5:RXMkqdpeQtfUfJihzNOVhsvUFRlQ5Hv",
                    'Content-Type' => 'application/json'
                ],
                'verify' => false,
            ]);

            // Get the body of the response
            $responseBody = $response->getBody();

            // Convert the response to an array
            $responseArray = json_decode($responseBody, true);
            $status = $responseArray["payment"]["status"];

            if ($status == "completed") {
                $ticket->status = 'completed';
                $ticket->updated_at = $responseArray["payment"]["updatedAt"];
                $ticket->save();

                // Send email for successful payment
                \Mail::to($ticket->user_email)->send(new \App\Mail\PaymentSuccessful($ticket));
                Log::debug($pay_ref . " Completed");

                return view('payments.payment_success');
            } else {
                // Update ticket status to failed
                $ticket->status = 'failed';
                $ticket->save();

                // Send failed payment email
                \Mail::to($ticket->user_email)->send(new \App\Mail\PaymentFailed($ticket));

                return view('payments.payment_failed');
            }

        } catch (Exception $e) {
            // Handle the exception
            Log::error('Error: ' . $e->getMessage());

            return view("errors.404");
        }
    }
}
