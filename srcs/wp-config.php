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
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define('AUTH_KEY',         '3!,=ocBY0Ii)qLMU![#KSh(-C9$1kxSQQ4<TD-xbd>& wPWundh{z6+2|27Tozb:');
define('SECURE_AUTH_KEY',  'oNld2 7VjeK+Xz8DkoC)a0FD5N<wHl!>z=#y{m0uS@->?&qcC{qZVl|JnX::-fT8');
define('LOGGED_IN_KEY',    '/uPL;#Z9xp9!=xy6LtyQC$en1&7}]/M-l4Twh(;QyBGv`iR%A<+{!-SZ<q]xWWm ');
define('NONCE_KEY',        '(j5[U0Fl2]g6P?5(~R1;2f48Z]$+L|^=+&TgU*ihL(mZ6j/]-Z!-!-}m4<HZ4=T^');
define('AUTH_SALT',        'hnGY$>Qo6%}di5R)!q2sdYsJKQE+gtQ+WG+%S_zj>}S$:D5f/,JI $HxRon*YVbA');
define('SECURE_AUTH_SALT', 'T-6wC#%+2B1rdw+893:3+*++wLh/T Jj@rtmn>/`nDM$$v|2r7[|m$?Bw#5}`jR|');
define('LOGGED_IN_SALT',   'Xe3T-2cF5p//R|b]?kFZu4R%T@-!`!C@EGpSl|ewZ5=@6<ru:y|q&x*,}PL[]<}W');
define('NONCE_SALT',       '.n+F7muRX?iVrFA=RK7Bke-Q.z$5$g`+hJblPN:1?KgD->^$O-2gSN-OAXAx/Q,;');

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
