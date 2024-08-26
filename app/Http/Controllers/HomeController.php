<?php

namespace App\Http\Controllers;

use App\Setting;
use App\Speaker;
use App\Schedule;
use App\Venue;
use App\Hotel;
use App\Gallery;
use App\Sponsor;
use App\Faq;
use App\Price;
use App\Amenity;
use Carbon\Carbon;

class HomeController extends Controller
{
    public function index()
    {
        $settings = Setting::pluck('value', 'key');
        $speakers = Speaker::all();
        $schedules = Schedule::with('speaker', 'venue')
            ->orderBy('start_time', 'asc')
            ->get()
            ->groupBy('day_number');
        $venues = Venue::where('event_date', '>=', Carbon::today()->toDateString())->get();
        $hotels = Hotel::all();
        $galleries = Gallery::all();
        $sponsors = Sponsor::all();
        $faqs = Faq::all();
        $prices = Price::with('amenities')->get();
        $amenities = Amenity::with('prices')->get();

        return view('home', compact('settings', 'speakers', 'schedules', 'venues', 'hotels', 'galleries', 'sponsors', 'faqs', 'prices', 'amenities'));
    }

    public function view(Speaker $speaker)
    {
        $settings = Setting::pluck('value', 'key');

        return view('speaker', compact('settings', 'speaker'));
    }
}
