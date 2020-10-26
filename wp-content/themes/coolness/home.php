<?php
get_header();
?>
<main>
    <section>
        <script type="text/javascript">
            var lat = 48.866835;
            var lon = 2.438741;
            var macarte = null;
            var villes = {
                <?php $commerces = get_posts(array('post_type' => 'commerces_cpt', 'posts_per_page' => -1)); ?>
                <?php foreach ($commerces as $commerce) : ?>
                    <?php echo '"<a href=' . get_permalink($commerce->ID) . '>' . get_the_title($commerce->ID) . '</a>" : { "lat":' . get_post_meta($commerce->ID, 'latitude', true) . ', "lon":' . get_post_meta($commerce->ID, 'longitude', true) . '},' ?>
                <?php endforeach; ?>
            };

            function initMap() {
                macarte = L.map('map').setView([lat, lon], 12);
                L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
                    attribution: 'données © OpenStreetMap/ODbL - rendu OSM France',
                    minZoom: 1,
                    maxZoom: 20
                }).addTo(macarte);
                for (ville in villes) {
                    var marker = L.marker([villes[ville].lat, villes[ville].lon]).addTo(macarte);
                    marker.bindPopup(ville);
                }
            }
            window.onload = function() {
                initMap();
                macarte.scrollWheelZoom.disable();
            };
        </script>
        <div id="map" style="height:500px"></div>
    </section>
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <?php $slider = get_posts(array('post_type' => 'slides', 'posts_per_page' => 3));
            $counter = 0;
            foreach ($slider as $slide) { ?>
                <li class="<?php echo ($counter == 0) ? 'active' : ''; ?>" data-target="#carouselExampleCaptions" data-slide-to="<?= $counter ?>"></li>
            <?php $counter++;
            } ?>
        </ol>
        <div class="carousel-inner">
            <?php
            //var_dump($slider) 
            ?>
            <?php $count = 0; ?>
            <?php foreach ($slider as $slide) : ?>
                <div class="carousel-item <?php echo ($count == 0) ? 'active' : ''; ?>">
                    <img src="<?php echo wp_get_attachment_url(get_post_thumbnail_id($slide->ID)) ?>" class="d-block w-
100">
                    <div class="carousel-caption d-none d-md-block">
                        <h2><?php echo get_the_title($slide->ID) ?></h2>
                        <p><?php echo wp_get_attachment_caption(get_post_thumbnail_id($slide->ID)) ?></p>
                    </div>
                </div>
                <?php $count++; ?>
            <?php endforeach; ?>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Précedent</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Suivant</span>
        </a>
    </div>
    <div class="container">
        <?php if (is_active_sidebar('texteaccueil')) {
            dynamic_sidebar('texteaccueil');
        }
        $categories = get_categories(['get' => 'all', 'hide_empty' => 0]);
        foreach ($categories as $categorie) {
            if ($categorie->category_count > 0) { ?>
                <section>
                    <?php $query = new WP_Query('posts_per_page=3&cat=' . $categorie->term_id);
                    print('<h2>Catégorie ' . $categorie->term_id . ': ' . $categorie->name . '</h2>');
                    while ($query->have_posts()) {
                        $query->the_post(); ?>
                        <a href="<?= the_permalink(); ?>">
                            <h3><?= the_title(); ?></h3>
                            <?= the_post_thumbnail('medium'); ?>
                        </a>
                    <?php } ?>
                    <?php wp_reset_postdata(); ?>
                </section>
        <?php }
        } ?>
    </div>
</main>
<?php
get_footer();
?>