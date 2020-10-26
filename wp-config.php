<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'g5oKERs;}OG3w_?l`yZf511Qqw&q},V?M=,Ol:qY$aQKa;xhAgv|Q(CB8E~H/^PM' );
define( 'SECURE_AUTH_KEY',  '8`>3^@us@WNiu?pJza:XA,9sA2HsAhj!*UeQ|O~I1Gq}vyY:nWo:(?e;e@ WyQT|' );
define( 'LOGGED_IN_KEY',    'B5abO3PLS/W}~}3}>KH`~bP4fu&pp2aA^SQ6>3mk76mo[@>BbbNL3]]4PI{Ns_)_' );
define( 'NONCE_KEY',        'g^<mw@D0K/5ydtuYn +#7_O_w00!J,|Q{*A7w4E4o=o|jea>A5&*z>w{Oz_z,Er4' );
define( 'AUTH_SALT',        'ERx!*;w(tzMHtOsJM8|} q=l7JZ<k0F9IQ&r]y#h9+k&S1`qnh3m eo4#~/i-GKe' );
define( 'SECURE_AUTH_SALT', 'J}?+o;M{4ji1}aQNAh<q<}<uD,@T>{OLLL}|@H>AJb+@=b^VTT:ivcp#BFC[Dhag' );
define( 'LOGGED_IN_SALT',   '#gECM_:Uk&an(X(]Zh4bkWGR*87OEwk/:a1;tJc5I7& tlC(pW^h7-Hmq{WSfs4O' );
define( 'NONCE_SALT',       'jLC{]@Tw?9QW;$DUF+Az/V24/nv[,g%wslD:1U0cC-3[X{! 0 /}TIPHlQ644B^a' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
