<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here');

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'YYfm(]|x_8n|*w1CoW/EOJ*;i{y+Rs9g]/3TGemw7%;=RUW%=MOZ!uqHOfKT+;(2');
define('SECURE_AUTH_KEY',  '7C0-lJj1eMFkKn<BzNEsf2psO55ab?>WOWja$pEa#`K)(09f#m5.egO6HeJ[A5S5');
define('LOGGED_IN_KEY',    '3SvN_:K+?%/^kJ/sS~3(}vMf(5]HY|b+>BXF[|oU6cF>zP&q!w9k|KQdmu*Y2;|B');
define('NONCE_KEY',        'Tu?E%_FL5R8~`d`1UP:T^5`85,jLw$++ILpju3qb[0B+;ja(] xhZu +lf:W[|2~');
define('AUTH_SALT',        '_Lro-oaY4zi_`C}0A+FOAd`mv4%sq*S5m.ezMr$>jg1q[XtX~gYH3q4;>lCNn;!B');
define('SECURE_AUTH_SALT', 'i+0/)8c{q{hpSamC]R3VOtGQ%X2_6W7Yc.[R2@[{LE=1~Z8OQV1QQvnfGTbxlvov');
define('LOGGED_IN_SALT',   '<8=R0|-|toB6a5SKv0{M9_2u)A^P^JFp^an&|LUVB%G|ps~wxtD?T?Mns-AcFmb7');
define('NONCE_SALT',       '-|u(N}XdBvZkR6VV?}*O/NE)2d (]/UK@5H+BY(#~xeE}=MVbH-D+Pa7S|Cr8 AH');
/**#@-*/

/**
 * WordPress database table prefix.
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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/wordpress' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
