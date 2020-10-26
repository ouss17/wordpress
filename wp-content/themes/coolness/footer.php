<footer>
    <nav>
        <?php wp_nav_menu(array('theme_location' => 'menu-secondaire')); ?>
    </nav>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script>
    jQuery(function($) {
        if ($(window).width() > 769) {
            $('.navbar .dropdown').hover(function() {
                    $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
                },
                function() {
                    $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp();
                });
            $('.navbar .dropdown > a').click(function() {
                location.href = this.href;
            });
        }
    });
</script>

<?php wp_footer(); ?>
</body>

</html>