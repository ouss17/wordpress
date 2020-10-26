<?php
get_header();
?>
<main>
    <div class="container">
        <h1>Résultats de recherche pour "<?= $_GET['s'] ?>"</h1>
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
                <a href="<?php the_permalink(); ?>" target="_blank" class="cta">
                    <p><?php the_title(); ?></p>
                </a>
            <?php endwhile; ?>
            <div class="col-12 d-flex justify-content-center">
                <?= the_posts_pagination(array('prev_text' => __('Précédent'), 'next_text' => __('Suivant'),)); ?>
            </div>
        <?php else : ?>
            <p><?php esc_html_e('Pas de résultats.'); ?></p>
        <?php endif; ?>
    </div>
</main>




<?php
get_footer();
?>