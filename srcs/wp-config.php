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
define( 'DB_NAME', 'database_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );

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
define('AUTH_KEY',         ')l:*^`7a7M&?jQ=I/+dJ$^dnry&^0uA.3i,7JMC18|2}Z#=7qV8%5b.5E*&Ln;D(');
define('SECURE_AUTH_KEY',  'DsPN}j-lTpZ*Uv[Ls:!Ao9PDG*9/I+ivC%>)HrTd!35oM5hUASK[Y`:F*>A?vOcJ');
define('LOGGED_IN_KEY',    'R4yy:thl_=dX$o^*nVI=3[Zbba8I3 Y^F9heh<wH1,Kaz-QCpgStPp3TF-g{7:df');
define('NONCE_KEY',        'qa[9KRxE1~+(-/Ma(>D*vd&Bl&p)2I0@KKd31F$:}4[cG,Dvj0j~Bv6biew$vW8^');
define('AUTH_SALT',        '<16x:A7R-#N0<;vs6q>fK|$AOLS8~oEDS5:,Zh]ty{:TI*OkkBzptHkHEyh&Zjuf');
define('SECURE_AUTH_SALT', '~KH1~,F{k ~;~mcMDe]icSbb-qqj`mBT>1`&,f~q8/Xu2ke1KW2~;2B3;4hh3LZP');
define('LOGGED_IN_SALT',   '{wz(W2x0_sDfI/{u|)`t_~!/#8Aa9`mIfaNTm,f0 Ld`)0Jk)qdL(`*+D<gssx}I');
define('NONCE_SALT',       'Y$Q!x;q)60_vbd8=3l86z-`.i1n|b+G[i)9z+.]2fk y>x;I-bOP>ey7{!]?5F=^');

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
