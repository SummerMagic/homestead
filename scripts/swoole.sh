phpize7.4
./configure --with-php-config=/usr/bin/php-config7.4  --enable-coroutine --enable-openssl  --enable-http2  --enable-async-redis --enable-sockets --enable-mysqlnd >  /dev/null
make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/7.4/mods-available/swoole.ini"
sudo ln -s /etc/php/7.4/mods-available/swoole.ini /etc/php/7.4/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/7.4/mods-available/swoole.ini /etc/php/7.4/fpm/conf.d/20-swoole.ini
sudo service php7.4-fpm restart



sudo bash -c "echo 'extension=tideways_xhprof.so' > /etc/php/7.4/mods-available/tideways_xhprof.ini"
sudo ln -s /etc/php/7.4/mods-available/tideways_xhprof.ini /etc/php/7.4/cli/conf.d/20-tideways_xhprof.ini
sudo ln -s /etc/php/7.4/mods-available/tideways_xhprof.ini /etc/php/7.4/fpm/conf.d/20-tideways_xhprof.ini
sudo service php7.4-fpm restart

phpize7.3
./configure --with-php-config=/usr/bin/php-config7.3  --enable-coroutine --enable-openssl  --enable-http2  --enable-async-redis --enable-sockets --enable-mysqlnd >  /dev/null

make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/7.3/mods-available/swoole.ini"
sudo ln -s /etc/php/7.3/mods-available/swoole.ini /etc/php/7.3/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/7.3/mods-available/swoole.ini /etc/php/7.3/fpm/conf.d/20-swoole.ini
sudo service php7.3-fpm restart

phpize7.2
./configure --with-php-config=/usr/bin/php-config7.2  --enable-coroutine --enable-openssl  --enable-http2  --enable-async-redis --enable-sockets --enable-mysqlnd >  /dev/null

make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/7.2/mods-available/swoole.ini"
sudo ln -s /etc/php/7.2/mods-available/swoole.ini /etc/php/7.2/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/7.2/mods-available/swoole.ini /etc/php/7.2/fpm/conf.d/20-swoole.ini
sudo service php7.2-fpm restart

phpize7.1
./configure --with-php-config=/usr/bin/php-config7.1  --enable-coroutine --enable-openssl  --enable-http2  --enable-async-redis --enable-sockets --enable-mysqlnd >  /dev/null
make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/7.1/mods-available/swoole.ini"
sudo ln -s /etc/php/7.1/mods-available/swoole.ini /etc/php/7.1/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/7.1/mods-available/swoole.ini /etc/php/7.1/fpm/conf.d/20-swoole.ini
sudo service php7.1-fpm restart

phpize7.0
./configure --with-php-config=/usr/bin/php-config7.0  --enable-coroutine --enable-openssl  --enable-http2  --enable-async-redis --enable-sockets --enable-mysqlnd >  /dev/null
make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/7.0/mods-available/swoole.ini"
sudo ln -s /etc/php/7.0/mods-available/swoole.ini /etc/php/7.0/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/7.0/mods-available/swoole.ini /etc/php/7.0/fpm/conf.d/20-swoole.ini
sudo service php7.0-fpm restart

phpize5.6
./configure --with-php-config=/usr/bin/php-config7.4  --enable-coroutine --enable-openssl  --enable-http2  --enable-async-redis --enable-sockets --enable-mysqlnd >  /dev/null
make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/5.6/mods-available/swoole.ini"
sudo ln -s /etc/php/5.6/mods-available/swoole.ini /etc/php/5.6/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/5.6/mods-available/swoole.ini /etc/php/5.6/fpm/conf.d/20-swoole.ini
sudo service php5.6-fpm restart


phpize && \
./configure \
--enable-coroutine \
--enable-openssl  \
--enable-http2  \
--enable-async-redis \
--enable-sockets \
--enable-mysqlnd && \
make clean && make && sudo make install
