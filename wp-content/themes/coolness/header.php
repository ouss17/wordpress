<!DOCTYPE html>
<html <?php language_attributes() ?>>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="utf-8">
    <link rel='stylesheet' id='dashicons-css' href='/wp-includes/css/dashicons.min.css' type='text/css' media='all' />
    <?php if (is_home()) { ?>
        <meta name="description" content="meta accueil">
    <?php } elseif (is_category()) { ?>
        <meta name="description" content="<?= category_description() ?>">
    <?php } elseif (is_single() || is_page()) { ?>
        <meta name="description" content="<?= get_post_meta($post->ID, 'meta-description', true); ?>">
    <?php } else { ?>
    <?php } ?>
    <link rel="stylesheet" href="<?php echo get_stylesheet_uri(); ?>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <?php wp_head(); ?>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>
</head>

<body>
    <header>
        <div class="container-fluid">
            <nav class="navbar navbar-expand-md navbar-light bg-faded">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs4navbar" aria-controls="bs4navbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>
                <?php wp_nav_menu([
                    'menu' => 'menu-principal',
                    'theme_location' => 'menu-principal',
                    'container' => 'div',
                    'container_id' => 'bs4navbar',
                    'container_class' => 'collapse navbar-collapse',
                    'menu_id' => false,
                    'menu_class' => 'navbar-nav mr-auto',
                    'depth' => 2,
                    'fallback_cb' => 'bs4navwalker::fallback',
                    'walker' => new bs4navwalker()
                ]); ?>
            </nav>
        </div>
        <?= get_template_part('template-parts/searchform'); ?>
    </header>
    <?php if (function_exists('rw_breadcrumbs')) rw_breadcrumbs(); ?>