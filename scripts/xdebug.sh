#!/usr/bin/env bash

for version in 5.6 7.0 7.1 7.2 7.3 7.4
do
  cat << 'EOT' > /etc/php/$version/mods-available/xhgui.ini
;Include xhgui's header for performance profiling
;auto_prepend_file="/opt/xhgui/external/header.php"
zend_extension=xdebug.so
xdebug.remote_connect_back = 1
xdebug.max_nesting_level = 512
xdebug.remote_enable = 1
xdebug.remote_connect_back = 1
xdebug.remote_port = 9001
xdebug.scream=0
xdebug.show_local_vars=1
xdebug.idekey=PHPSTORM

EOT
done
