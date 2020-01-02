wget https://github.com/swoole/swoole-src/archive/v4.4.13.tar.gz

phpize5.6
./configure --with-php-config=/usr/bin/php-config5.6 > /dev/null
make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/5.6/mods-available/swoole.ini"
sudo ln -s /etc/php/5.6/mods-available/swoole.ini /etc/php/5.6/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/5.6/mods-available/swoole.ini /etc/php/5.6/fpm/conf.d/20-swoole.ini
sudo service php5.6-fpm restart

phpize7.4
./configure --with-php-config=/usr/bin/php-config7.4 > /dev/null
make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/7.4/mods-available/swoole.ini"
sudo ln -s /etc/php/7.4/mods-available/swoole.ini /etc/php/7.4/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/7.4/mods-available/swoole.ini /etc/php/7.4/fpm/conf.d/20-swoole.ini
sudo service php7.0-fpm restart

phpize7.1
./configure --with-php-config=/usr/bin/php-config7.1 > /dev/null
make clean > /dev/null
make >/dev/null 2>&1
sudo make install
sudo bash -c "echo 'extension=swoole.so' > /etc/php/7.1/mods-available/swoole.ini"
sudo ln -s /etc/php/7.1/mods-available/swoole.ini /etc/php/7.1/cli/conf.d/20-swoole.ini
sudo ln -s /etc/php/7.1/mods-available/swoole.ini /etc/php/7.1/fpm/conf.d/20-swoole.ini
sudo service php7.1-fpm restart
