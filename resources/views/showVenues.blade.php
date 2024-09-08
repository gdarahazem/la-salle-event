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
                    <h2>Calendrier des événements</h2>
                    <p>Voici notre calendrier d'événements</p>
                </div>

                <ul class="nav nav-tabs" role="tablist">
                    @foreach($schedules as $key => $day)
                        <li class="nav-item">
                            <a class="nav-link{{ $key === 1 ? ' active' : '' }}" href="#day-{{ $key }}" role="tab"
                               data-toggle="tab">Day {{ $key }}</a>
                        </li>
                    @endforeach
                </ul>

                <h3 class="sub-heading">
                    Découvrez notre gamme d'événements à venir et réservez votre place lors de sessions engageantes et
                    informatives dirigées par des experts du secteur.
                </h3>

                <div class="tab-content row justify-content-center">
                    @foreach($schedules as $key => $day)
                        <div role="tabpanel" class="col-lg-9 tab-pane fade{{ $key === 1 ? ' show active' : '' }}"
                             id="day-{{ $key }}">
                            @foreach($day as $schedule)
                                <div class="row schedule-item">
                                    <div class="col-md-2">
                                        <span>{{ $schedule->venue->name }}</span>
                                        <date>{{ \Carbon\Carbon::parse($schedule->venue->event_date)->format("d M") }}</date>
                                        <br>
                                        <time>{{ \Carbon\Carbon::parse($schedule->start_time)->format("h:i A") }}</time>
                                        <br>
                                    </div>
                                    <div class="col-md-10">
                                        @if($schedule->speaker)
                                            <div class="speaker">
                                                <img src="{{ $schedule->speaker->photo->getUrl() }}"
                                                     alt="{{ $schedule->speaker->name }}">
                                            </div>
                                        @endif
                                        <h4>{{ $schedule->title }} @if($schedule->speaker)
                                                <span>{{ $schedule->speaker->name }}</span>
                                            @endif</h4>
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
                <h4>Prix du billet: {{ number_format($venue->price, 2) }} TND</h4>
                <button type="button" class="btn btn-danger btn-rounded mt-3"
                        data-toggle="modal"
                        data-target="#ticketModal">
                    {{ $venue->price > 0 ? 'Acheter des billets' : 'Obtenir un billet' }}
                </button>
            </div>

        </section>

    </main>

    <!-- Modal -->
    <div class="modal fade" id="ticketModal" tabindex="-1" role="dialog" aria-labelledby="ticketModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ticketModalLabel">Obtenez un billet pour {{ $venue->name }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form
                        action="{{ $venue->price > 0 ? route('formation.init.payment', $venue->id) : route('tickets.store') }}"
                        method="POST">
                        @csrf
                        <input type="hidden" name="event_id" value="{{ $venue->id }}">
                        <div class="form-group">
                            <label for="user_name">Votre nom</label>
                            <input type="text" class="form-control" id="user_name" name="user_name" required>
                        </div>
                        <div class="form-group">
                            <label for="user_email">Votre e-mail</label>
                            <input type="email" class="form-control" id="user_email" name="user_email" required>
                        </div>
                        <div class="form-group">
                            <label for="user_phone">Votre téléphone</label>
                            <input type="text" class="form-control" id="user_phone" name="user_phone" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Valider</button>
                    </form>

                </div>
            </div>
        </div>
    </div>

@endsection
