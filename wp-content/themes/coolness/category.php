<?php
get_header();
?>
<main>
    <div class="container">
        <!-- <nav class="ariane container">
            <ul itemscope itemtype="http://schema.org/BreadcrumbList">
                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <a itemprop="item" href="/" class="text-black"><span itemprop="name">Accueil</span></a>
                    <meta itemprop="position" content="1" /> -->
        <!-- echo '&#x2F;'  -->
        <!-- </li>
                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"> -->
        <!-- echo single_cat_title(); -->
        <!-- <meta itemprop="position" content="2" /> -->
        <!-- </li> -->
        <!-- </ul> -->
        <!-- </nav>
        <nav class="ariane container">
            <ul itemscope itemtype="http://schema.org/BreadcrumbList">
                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <a itemprop="item" href="/"><span itemprop="name">Accueil</span></a>
                    <meta itemprop="position" content="1" /> -->
        <!-- echo '&#x2F;' -->
        <!-- </li> -->
        <!-- <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <span itemprop="name">the_title(); ?></span>
                    <meta itemprop="position" content="2" />
                </li>
            </ul>
        </nav> -->
        <section class="row">
            <h1 class="col-12"><?php single_cat_title(); ?></h1>
            <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
                    <article class="col-lg-4">
                        <?= the_post_thumbnail('thumbnail'); ?>
                        <h2><?php the_title(); ?></h2>
                        <?php the_excerpt(); ?>
                        <a href="<?php the_permalink(); ?>" target="_blank" class="cta">Lire la suite</a>
                    </article>
                <?php endwhile; ?>
                <div class="col-12 d-flex justify-content-center">
                    <?= the_posts_pagination(array('prev_text' => __('Précédent'), 'next_text' => __('Suivant'),)); ?>
                </div>
            <?php else : ?>
                <p><?php esc_html_e('Pas de résultats.'); ?></p>
            <?php endif; ?>
        </section>
    </div>
</main>




<?php
get_footer();
?>