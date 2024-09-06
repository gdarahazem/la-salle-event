<header id="header"@if(Route::current()->getName() != 'home') class="header-fixed"@endif>
  <div class="container">

    <div id="logo" class="pull-left">
      <h1>
        <a href="{{ route('home') }}#intro">
          <span><i class="fa fa-map-marker" aria-hidden="true"></i></span>
          {{ env('APP_NAME', 'The Event') }}
        </a>
      </h1>
    </div>

    <nav id="nav-menu-container">
      <ul class="nav-menu">
          <li class="menu-active"><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#intro">Accueil</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#about">À propos</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#speakers">Intervenants</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#schedule">Programme</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#venue">Événement</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#hotels">Hôtels</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#gallery">Galerie</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#supporters">Sponsors</a></li>
          <li><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#contact">Contact</a></li>
{{--        <li class="buy-tickets"><a href="{{ Route::current()->getName() != 'home' ? route('home') : '' }}#buy-tickets">Buy Tickets</a></li>--}}
      </ul>
    </nav>
  </div>
</header>
