@extends('layouts.main')

@section('content')

    <style>
        .btn-rounded {
            border-radius: 50px;
            padding-left: 20px;
            padding-right: 20px;
            background-color: #FF004F; /* Adjust the color as needed */
            border: none;
        }

        .btn-rounded:hover {
            background-color: #e60045; /* Darker shade on hover */
        }

    </style>
    <main id="main" class="mt-5">

        <section id="schedule" class="section-with-bg">
            <div class="container wow fadeInUp">
                <div class="section-header">
                    <h2>Event Schedule</h2>
                    <p>Here is our event schedule</p>
                </div>

                <ul class="nav nav-tabs" role="tablist">
                    @foreach($schedules as $key => $day)
                        <li class="nav-item">
                            <a class="nav-link{{ $key === 1 ? ' active' : '' }}" href="#day-{{ $key }}" role="tab" data-toggle="tab">Day {{ $key }}</a>
                        </li>
                    @endforeach
                </ul>

                <h3 class="sub-heading">
                    Explore our lineup of upcoming events and secure your place at engaging and informative sessions led by industry experts.
                </h3>


                <div class="tab-content row justify-content-center">
                    @foreach($schedules as $key => $day)
                        <div role="tabpanel" class="col-lg-9 tab-pane fade{{ $key === 1 ? ' show active' : '' }}" id="day-{{ $key }}">
                            @foreach($day as $schedule)
                                <div class="row schedule-item">
                                    <div class="col-md-2">
                                        <span>{{ $schedule->venue->name }}</span>
                                        <date>{{ \Carbon\Carbon::parse($schedule->venue->event_date)->format("d M") }}</date><br>
                                        <time>{{ \Carbon\Carbon::parse($schedule->start_time)->format("h:i A") }}</time><br>
                                    </div>
                                    <div class="col-md-10">
                                        @if($schedule->speaker)
                                            <div class="speaker">
                                                <img src="{{ $schedule->speaker->photo->getUrl() }}" alt="{{ $schedule->speaker->name }}">
                                            </div>
                                        @endif
                                        <h4>{{ $schedule->title }} @if($schedule->speaker)<span>{{ $schedule->speaker->name }}</span>@endif</h4>
                                        <p>{{ $schedule->subtitle }}</p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="text-center mt-4">
                <!-- Display the Venue Price -->
                <h4>Ticket Price: {{ number_format($venue->price, 2) }} TND</h4>
                <button type="button" class="btn btn-danger btn-rounded mt-3">Buy Tickets</button>
            </div>

        </section>

    </main>
@endsection
