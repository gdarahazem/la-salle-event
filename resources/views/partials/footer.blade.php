<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-6 footer-info">
                    <img src="img/logo.png" alt="TheEvent">
                    <p>{{ $settings['footer_description'] ?? '' }}</p>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Liens utiles</h4>
                    <ul>
                        <li><i class="fa fa-angle-right"></i> <a href="#">Accueil</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">À propos de nous</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">Services</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">Conditions d'utilisation</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">Politique de confidentialité</a></li>
                        @guest
                            <li><i class="fa fa-angle-right"></i> <a href="{{ route('login') }}">Connexion</a></li>
                        @endguest
                        @auth
                            <li><i class="fa fa-angle-right"></i> <a href="{{ route('admin.home') }}">Panneau d'administration</a></li>
                        @endauth
                    </ul>
                </div>



                <div class="col-lg-3 col-md-6 footer-contact">
                    <h4>Contactez-nous</h4>
                    <p>
                        {!! $settings['footer_address'] ?? '' !!}<br>
                        <strong>Téléphone :</strong> {{ $settings['contact_phone'] }}<br>
                        <strong>Email :</strong> {{ $settings['contact_email'] }}<br>
                    </p>

                    <div class="social-links">
                        <a href="{{ $settings['footer_twitter'] ?? '' }}" class="twitter"><i class="fa fa-twitter"></i></a>
                        <a href="{{ $settings['footer_facebook'] ?? '' }}" class="facebook"><i class="fa fa-facebook"></i></a>
                        <a href="{{ $settings['footer_instagram'] ?? '' }}" class="instagram"><i class="fa fa-instagram"></i></a>
                        <a href="{{ $settings['footer_googleplus'] ?? '' }}" class="google-plus"><i class="fa fa-google-plus"></i></a>
                        <a href="{{ $settings['footer_linkedin'] ?? '' }}" class="linkedin"><i class="fa fa-linkedin"></i></a>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong>{{ env('APP_NAME', 'TheEvent') }}</strong>. Tous droits réservés
        </div>
    </div>
</footer><!-- #footer -->
