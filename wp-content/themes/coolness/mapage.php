<?php
/* Template Name: mapage */
get_header();
?>
<main>
    <div class="container">
        <?php while (have_posts()) : the_post(); ?>
            <article>
                <h1><?php the_title(); ?></h1>
                <?= the_content(); ?>
            </article>
        <?php endwhile; ?>
        <ul><?php wp_get_archives('type=monthly'); ?></ul>
        <?php wp_list_pages(); ?>
        <?php wp_list_authors(); ?>
        <?php wp_list_categories(); ?>
        <?php wp_tag_cloud(); ?>p
    </div>
</main>




<?php
get_footer();
?>