<?php
get_header();
?>
<main>
    <div>
        <?php $dlat = get_post_meta($post->ID, "latitude", true); ?>
        <?php $dlon = get_post_meta($post->ID, "longitude", true); ?>
        <script type="text/javascript">
            var lat = <?php echo $dlat; ?>;
            var lon = <?php echo $dlon; ?>;
            var macarte = null;

            function initMap() {
                macarte = L.map('mapsingle').setView([lat, lon], 17);
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: 'données © <a href="//osm.org/copyright">OpenStreetMap</a>/ODbL - rendu <a href="//openstreetmap.fr">OSM France</a>',
                    minZoom: 1,
                    maxZoom: 20
                }).addTo(macarte);
                var marker = L.marker([<?php echo $dlat; ?>, <?php echo $dlon; ?>]).addTo(macarte);
            }
            window.onload = function() {
                initMap();
                macarte.scrollWheelZoom.disable();
            };
        </script>
        <div id="mapsingle" style="height:500px"></div>
    </div>
    <div class="container">
        <?php while (have_posts()) : the_post(); ?>
            <article>
                <?= the_post_thumbnail('large'); ?>
                <p>Par <?= the_author() ?>, le <time datetime="<?= get_the_date('c'); ?>"><?= get_the_date(); ?></time></p>
                <h1><?php the_title(); ?></h1>
                <?php the_content(); ?>
                <?php comments_popup_link(
                    'Pas de commentaires',
                    '1 Commentaire',
                    '% Commentaires',
                    'comments-link',
                    'Commentaires désactivés'
                ); ?><?php comments_template(); ?>
            </article>
        <?php endwhile; ?>
        <?php
        $tags = wp_get_post_terms(get_queried_object_id(), 'post_tag', ['fields' => 'ids']);
        $args = [
            'post__not_in' => array(get_queried_object_id()),
            'posts_per_page' => 10,
            'orderby' => 'rand',
            'tax_query' => [['taxonomy' => 'post_tag', 'terms' => $tags]]
        ];
        $my_query = new wp_query($args);
        if ($my_query->have_posts()) {
            echo '';
            while ($my_query->have_posts()) {
                $my_query->the_post(); ?>
                <article>
                    <a href="<?php the_permalink() ?>">
                        <h3><?php the_title(); ?></h3>
                    </a>
                </article>
        <?php }
            wp_reset_postdata();
            echo '';
        } ?>
    </div>
</main>




<?php
get_footer();
?>