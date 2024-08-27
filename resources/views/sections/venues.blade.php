<style>
    #venue .section-header {
        color: #333;
        padding-bottom: 30px;
    }

    .carousel-item .card {
        margin: 0 auto; /* Centers the card within the carousel */
        width: 90%; /* Adjusts the card width */
        border-radius: 8px; /* Rounded corners for a smoother look */
    }

    .carousel-item .card-body {
        padding: 20px;
    }

    .venue-map iframe {
        border-radius: 0 0 0 8px; /* Rounded corners on the map */
    }

    .venue-gallery img {
        border-radius: 8px; /* Rounded corners on images */
        box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Adds shadow to images */
    }

    .carousel-control-prev-icon,
    .carousel-control-next-icon {
        background-color: #000; /* More visible control icons */
        border-radius: 50%; /* Circular background */
        padding: 10px;
    }

    .carousel-control-prev-icon:hover,
    .carousel-control-next-icon:hover {
        background-color: #555; /* Hover effect for better UX */
    }

</style>
<section id="venue" class="wow fadeInUp">
    <div class="container">
        <div class="section-header text-center mb-5">
            <h2>Upcoming Event</h2>
            <p>Explore the venue and gallery for our next exciting event.</p>
        </div>

        <!-- Bootstrap Carousel with Improved Cards -->
        <div id="venueCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                @foreach($venues as $index => $venue)
                    <div class="carousel-item {{ $index == 0 ? 'active' : '' }}">
                        <div class="card shadow-lg">
                            <div class="row no-gutters">
                                <div class="col-md-6">
                                    <iframe src="https://maps.google.com/maps?q={{ $venue->latitude }},{{ $venue->longitude }}&hl=en&z=14&output=embed" frameborder="0" style="border:0; width: 100%; height: 250px;" allowfullscreen></iframe>
                                </div>
                                <div class="col-md-6">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            <a href="{{ route('venues.show.visitor', ['venue' => $venue->id]) }}">{{ $venue->name }}</a>
                                        </h5>
                                        <p class="card-date">Event Date: {{ \Carbon\Carbon::parse($venue->event_date)->format('M d, Y') }}</p>
                                        <div class="venue-gallery-container">
                                            @if($venue->photos)
                                                <div class="d-flex flex-wrap">
                                                    @foreach($venue->photos as $photo)
                                                        <div class="p-1">
                                                            <a href="{{ $photo->getUrl() }}" class="venobox" data-gall="venue-gallery">
                                                                <img src="{{ $photo->getUrl() }}" alt="" class="img-fluid" style="max-width: 100px; height: auto;">
                                                            </a>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <!-- Carousel Controls -->
            <a class="carousel-control-prev" href="#venueCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#venueCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</section>
