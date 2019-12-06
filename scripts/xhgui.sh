#!/usr/bin/env bash

cat <<'EOT' > /opt/xhgui/config/config.php
<?php
/**
 * Configuration for XHGui.
 */
return array(
    // Which backend to use for Xhgui_Saver.
    // Must be one of 'mongodb', or 'file'.
    //
    // Example (save to a temporary file):
    //
    //     'save.handler' => 'file',
    //     # Beware of file locking. You can adujst this file path
    //     # to reduce locking problems (eg uniqid, time ...)
    //     'save.handler.filename' => __DIR__.'/../data/xhgui_'.date('Ymd').'.dat',
    //
    'save.handler' => 'mongodb',

    // Database options for MongoDB.
    //
    // - db.host: Connection string in the form `mongodb://[ip or host]:[port]`.
    //
    // - db.db: The database name.
    //
    // - db.options: Additional options for the MongoClient contructor,
    //               for example 'username', 'password', or 'replicaSet'.
    //               See <https://secure.php.net/mongoclient_construct#options>.
    //
    'db.host' => 'mongodb://127.0.0.1:27017',
    'db.db' => 'xhprof',
    'db.options' => array('username' => 'homestead', 'password' => 'secret'),

    // Whether to instrument a user request.
    //
    // NOTE: Only applies to using the external/header.php include.
    //
    // Must be a function that returns a boolean,
    // or any non-function value to disable the profiler.
    //
    // Default: Profile 1 in 100 requests.
    //
    // Example (profile all requests):
    //
    //     'profiler.enabled' => function() {
    //         return true;
    //     },
    //
    'profiler.enable' => function() {
      // Never profile ourself.
      if (isset($_SERVER['REQUEST_URI']) && strpos($_SERVER['REQUEST_URI'], '/xhgui') === 0) {
        return false;
      }

      // Profile if ?xhgui=on, and continue to profile for the next hour.
      foreach (array('xhgui') as $switch) {
        if (isset($_GET[$switch]) && $_GET[$switch] == 'on') {
          setcookie('xhgui', 'on', time() + 3600);
          return true;
        }
      }

      // Profile if we have been set to profiling mode.
      if (isset($_COOKIE['xhgui']) && $_COOKIE['xhgui'] == 'on') {
        return true;
      }

      // Profile the CLI when the XHGUI environment variable is set.
      if (getenv('XHGUI') == 'on') {
        return true;
      }
    },

    // Transformation for the "simple" variant of the URL.
    // This is stored as `meta.simple_url` and used for
    // aggregate data.
    //
    // NOTE: Only applies to using the external/header.php include.
    //
    // Must be a function that returns a string, or any
    // non-callable value for the default behaviour.
    //
    // Default: Remove numeric values after `=`. For example,
    // it turns "/foo?page=2" into "/foo?page".
    'profiler.simple_url' => null,

    // Additional options to be passed to the `_enable()` function
    // of the profiler extension (xhprof, tideways, etc.).
    //
    // NOTE: Only applies to using the external/header.php include.
    'profiler.options' => array(),

    // Date format used when browsing XHGui pages.
    //
    // Must be a format supported by the PHP date() function.
    // See <https://secure.php.net/date>.
    'date.format' => 'M jS H:i:s',

    // The number of items to show in "Top lists" with functions
    // using the most time or memory resources, on XHGui Run pages.
    'detail.count' => 6,

    // The number of items to show per page, on XHGui list pages.
    'page.limit' => 25,

    );
EOT
