<?php

add_theme_support('post-thumbnails', array('post', 'slides', 'infos_cpt'));
add_theme_support('title-tag');
require_once('bs4navwalker.php');

remove_filter("widget_text_content","wpautop");
remove_filter("term_description", "wpautop");

function register_nav()
{
    register_nav_menus(array(
        'menu-principal' => __('Menu principal'),
        'menu-secondaire' => __('Menu secondaire')
    ));
}
add_action('init', 'register_nav');

function coolness_widgets_init()
{
    register_sidebar( array(
        'name' => __('Texte accueil', 'coolness'),
        'id' => 'texteaccueil',
        'description' => __('Le texte de la page d\'accueil','coolness'),
        'before_widget' => '<div class="container bg-dark text-light p-3 my-3 rounded clearfix">',
        'after_widget'=> '</div>',
        'before_title' => '<h1 class="text-right mb-3">',
        'after_title' => '</h1>'
    ));
}
add_action('widgets_init','coolness_widgets_init');

function slides_custom_post_type() {
$labels = array(
'name' => _x( 'Slides', 'Post Type General Name'),
'singular_name' => _x( 'Slide', 'Post Type Singular Name'),
'menu_name' => __( 'Slides'),
'all_items' => __( 'Tous les slides'),
'view_item' => __( 'Voir le slide'),
'add_new_item' => __( 'Ajouter un slide'),
'edit_item' => __( 'Editer le slide'),
'update_item' => __( 'Modifier le slide'),
'search_items' => __( 'Rechercher un slide'),
'featured_image' => __( 'Slide'),
'set_featured_image' => __( 'Selectionner un slide'),
'remove_featured_image' => __( 'Supprimer le slide'),
'use_featured_image' => __( 'Utiliser le slide'));
$args = array(
'label' => __( 'Slides'),
'description' => __( 'Description des slides'),
'labels' => $labels,
'public' => true,
'supports' => array( 'title', 'thumbnail' ),
'menu_position' => 7,
'menu_icon' =>'dashicons-groups',
); register_post_type ('slides', $args ); } add_action( 'init', 'slides_custom_post_type', 0);



register_taxonomy('infos', 'infos_cpt', array(
'rewrite' => array( 'slug' => 'infos', 'with_front' => false,),
'public' => true,
'hierarchical' => true,
'show_admin_column' => true,
'label' => __('Catégories Infos')
));
register_post_type('infos_cpt', array(
'rewrite' => array('slug' => 'infos/%infos%', 'with_front' => false),
'has_archive' => 'infos',
'public' => true,
'supports' => array( 'title', 'editor', 'thumbnail', 'excerpt' ),
'label' => __( 'Infos'),
'menu_position' => 6,
'menu_icon' =>'dashicons-megaphone',
'show_admin_column' => true
));

function taxonomy_permalinks($post_link, $post)
{
    if (is_object($post) && $post->post_type == 'infos_cpt') {
        $terms = wp_get_object_terms($post->ID, 'infos');
        if ($terms) {
            return str_replace('%infos%', $terms[0]->slug, $post_link);
        }
    }
    return $post_link;
}
add_filter('post_type_link', 'taxonomy_permalinks', 1, 2);

// Adapter la galerie d'images des articles au composant Modal de Bootstrap
add_filter('post_gallery', 'customFormatGallery', 10, 2);
function customFormatGallery($string, $attr)
{
    $posts_order_string = $attr['ids'];
    $posts_order = explode(',', $posts_order_string);
    $output = '<div class="row">';
    $posts = get_posts(array(
        'include' => $posts_order,
        'post_type' => 'attachment',
        'orderby' => 'post__in',
    ));
    if ($attr['orderby'] == 'rand') {
        shuffle($posts);
    }
    foreach ($posts as $imagePost) {
        $output .= '<button type="button" class="btn col-12 col-sm-6 col-lg-4 mb-4" data-toggle="modal" data-target="#myModal' . preg_replace('/-\d+x\d+(?=\.(jpg|jpeg|png|gif)$)/i', ' ', $imagePost->ID) . '">';
        $output .= '<img src="' . wp_get_attachment_image_src($imagePost->ID, 'thumbnail')[0] . '" class="img-fluid" alt="' . get_post_meta($imagePost->ID, '_wp_attachment_image_alt', true) . '" width="' . wp_get_attachment_image_src($imagePost->ID, 'thumbnail')[1] . '" height="' . wp_get_attachment_image_src($imagePost->ID, 'thumbnail')[2] . '"></button>';

        $output .= '<div class="modal text-center" id="myModal' . preg_replace('/-\d+x\d+(?=\.(jpg|jpeg|png|gif)$)/i', ' ', $imagePost->ID) . '" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog modal-dialog-centered" role="document"><div class="modal-content"><div class="modal-body">';

        $output .= '<img class="img-fluid" src="' . wp_get_attachment_image_src($imagePost->ID, 'large')[0] . '" alt="' . get_post_meta($imagePost->ID, '_wp_attachment_image_alt', true) . '" width="' . wp_get_attachment_image_src($imagePost->ID, 'large')[1] . '" height="' . wp_get_attachment_image_src($imagePost->ID, 'large')[2] . '">';

        $output .= '<button type="button" class="btn btn-default btn-prev ml-2" style="position:absolute;left:0;top:50%"><i class="fas fa-angle-left text-white fa-2x"></i></button><button type="button" class="btn btn-default btn-next mr-2" style="position:absolute;right:0;top:50%"><i class="fas fa-angle-right fa-2x text-white"></i></button><button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times text-white" style="position:absolute;right:50%;bottom:0"></i></button></div></div></div></div>';
    }
    $output .= '</div>';
    return $output;
}


//Breadcrumbs
function rw_breadcrumbs()
{
    global $post;
    $delimiter = '&nbsp;/&nbsp;'; // delimiter between crumbs
    $home = 'Home'; // text for the 'Home' link
    $showCurrent = 1; // 1 - show current post/page title in breadcrumbs, 0 - don't show
    $homeLink = get_bloginfo('url');
    echo '<nav class="breadcrumb col-12"><a href="' . $homeLink . '">' . $home . '</a>' . $delimiter;
    if (is_category()) {
        global $wp_query;
        $cat_obj = $wp_query->get_queried_object();
        $thisCat = $cat_obj->term_id;
        $thisCat = get_category($thisCat);
        $parentCat = get_category($thisCat->parent);
        if ($thisCat->parent != 0) echo (get_category_parents($parentCat, TRUE, ' ' . $delimiter . ' '));
        echo single_cat_title('', false);
    } elseif (is_tax('infos')) {
        echo '<a href="' . $homeLink . '/infos">Infos</a>' . $delimiter;
        echo single_cat_title('', true);
    } elseif (is_singular('infos_cpt')) {
        echo '<a href="' . $homeLink . '/infos">Infos</a>' . $delimiter;
        $infos_terms = wp_get_object_terms($post->ID,  'infos');
        if (!empty($infos_terms)) {
            if (!is_wp_error($infos_terms)) {
                foreach ($infos_terms as $term) {
                    echo '<a href="' . get_term_link($term->slug, 'infos') . '">' . esc_html($term->name) . '</a>' . $delimiter;
                }
            }
        }
        echo  get_the_title();
    } elseif (is_search()) {
        echo 'Search results for "' . get_search_query() . '"';
    } elseif (is_day()) {
        echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $delimiter . ' ';
        echo '<a href="' . get_month_link(get_the_time('Y'), get_the_time('m')) . '">' . get_the_time('F') . '</a> ' . $delimiter . ' ';
        echo get_the_time('d');
    } elseif (is_month()) {
        echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $delimiter . ' ';
        echo get_the_time('F');
    } elseif (is_year()) {
        echo get_the_time('Y');
    } elseif (is_single() && !is_attachment()) {
        if (get_post_type() != 'post') {
            $post_type = get_post_type_object(get_post_type());
            $slug = $post_type->rewrite;
            echo '<a href="' . $homeLink . '/' . $slug['slug'] . '/">' . $post_type->labels->singular_name . '</a> ' . $delimiter . ' ';
            if ($showCurrent == 1) echo get_the_title();
        } else {
            $cat = get_the_category();
            $cat = $cat[0];
            $cats = get_category_parents($cat, TRUE, ' ' . $delimiter . ' ');
            if ($showCurrent == 0) $cats = preg_replace("/^(.+)\s$delimiter\s$/", "$1", $cats);
            echo $cats;
            if ($showCurrent == 1) echo get_the_title();
        }
    } elseif (!is_single() && !is_page() && get_post_type() != 'post' && !is_404()) {
        $post_type = get_post_type_object(get_post_type());
        echo $post_type->labels->singular_name;
    } elseif (is_attachment()) {
        $image_id = get_post_thumbnail_id();
        $image_title = get_the_title($image_id);
        echo get_the_title();
    } elseif (is_page() && !$post->post_parent) {
        if ($showCurrent == 1) echo get_the_title();
    } elseif (is_page() && $post->post_parent) {
        $parent_id  = $post->post_parent;
        $breadcrumbs = array();
        while ($parent_id) {
            $page = get_page($parent_id);
            $breadcrumbs[] = '<a href="' . get_permalink($page->ID) . '">' . get_the_title($page->ID) . '</a>';
            $parent_id  = $page->post_parent;
        }
        $breadcrumbs = array_reverse($breadcrumbs);
        foreach ($breadcrumbs as $crumb) echo $crumb . ' ' . $delimiter . ' ';
        if ($showCurrent == 1) echo get_the_title();
    } elseif (is_tag()) {
        echo 'Posts tagged "' . single_tag_title('', false) . '"';
    } elseif (is_author()) {
        global $author;
        $userdata = get_userdata($author);
        echo 'Articles posted by' . $userdata->display_name;
    } elseif (is_404()) {
        echo 'Error 404';
    }
    if (get_query_var('paged')) {
        if (is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author() || is_tax('infos')) echo ' (';
        echo __('Page') . ' ' . get_query_var('paged');
        if (is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author() || is_tax('infos')) echo ')';
    }
    echo '</nav>';
} // Afficher avec if (function_exists('rw_breadcrumbs')) rw_breadcrumbs();



register_taxonomy('commerces', 'commerces_cpt', array(
    'rewrite' => array('slug' => 'commerces', 'with_front' => false,),
    'public' => true,
    'hierarchical' => true,
    'show_admin_column' => true,
    'label' => __('Categories commerces'),
));
register_post_type('commerces_cpt', array(
    'rewrite' => array('slug' => 'commerces/%commerces%', 'with_front' => false),
    'has_archive' => 'commerces',
    'public' => true,
    'supports' => array('editor', 'title', 'custom-fields'),
    'label' => __('Commerces'),
    'menu_position' => 7,
    'menu_icon' => 'dashicons-store',
    'show_admin_column' => true,
));

function taxonomycommerces_permalinks($post_link, $post)
{
    if (is_object($post) && $post->post_type == 'commerces_cpt') {
        $terms = wp_get_object_terms($post->ID, 'commerces');
        if ($terms) {
            return str_replace('%commerces%', $terms[0]->slug, $post_link);
        }
    }
    return $post_link;
}
add_filter('post_type_link', 'taxonomycommerces_permalinks', 1, 2);