<?php
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
    </div>
</main>




<?php
get_footer();
?>