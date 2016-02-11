<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wp_compass_public');

/** MySQL database username */
define('DB_USER', 'compass');

/** MySQL database password */
define('DB_PASSWORD', 'I24Ahwmbdcpqe8YM6GlE');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'j],DVnF(y(}DeV-5^{|rdMTq*6b^IoO&J#V^- u(l|+Ht@3C}DW-)nq;VeHo]Y_y');
define('SECURE_AUTH_KEY',  '[J)>=*0H1HFG&p9KtJ(M18||e7NR:OH|!_DjH!It_o #)f{ByQd PS@wFslf|qO-');
define('LOGGED_IN_KEY',    'DkrHLV+<br:3.9*)PW[A e-`5^, >](ND{6)v- ]+%@[MO!u}H/rgR/Zf}-E#1fv');
define('NONCE_KEY',        '.:uu-JydThr Yq +MZnqG@FdOY9_IC8E:p+Z=iyrK=_A:4+o-7FID{t!0/YW/D`{');
define('AUTH_SALT',        'K-1bW+kdB-RE6~kTS=_sm+B5|jXe`a0n[,*W6&,1gpHr,Evr#]z2X7%`Vg1oU~tK');
define('SECURE_AUTH_SALT', '>cMjP+HN*v8Np=eop>zVSlJvX:SW5@t7I->%g@m6To#P4=)zjjwPPbF gsw@n^,|');
define('LOGGED_IN_SALT',   '9b~dY&0KHfRC?8d(hRu.jNWXX._n+;NU#q+%TpehCh@WUDw|b&2*EcDsQ0R6ecZS');
define('NONCE_SALT',       'O}lh,Z0-kl8ak-XZE}zkGo?]R7k?qt0GT9AHJo/tE2yGEoa8{vLj,@t[Rf7?ygtT');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* Allow users to install plug-ins without FTP or SSH */
define('FS_METHOD', 'direct');

/* Don't allow anyone to edit files through the Wordpress Admin
 * This is an attack vectors for hackers.
 */
define( 'DISALLOW_FILE_EDIT', true );

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
