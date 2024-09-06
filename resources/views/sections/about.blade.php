<section id="about">
  <div class="container">
      <div class="row">
          <div class="col-lg-6">
              <h2>À propos</h2>
              <p>{{ $settings['about_description'] ?? '' }}</p>
          </div>
          <div class="col-lg-3">
              <h3>Où</h3>
              <p>{!! $settings['about_where'] ?? '' !!}</p>
          </div>
          <div class="col-lg-3">
              <h3>Quand</h3>
              <p>{!! $settings['about_when'] ?? '' !!}</p>
          </div>
      </div>

  </div>
</section>
