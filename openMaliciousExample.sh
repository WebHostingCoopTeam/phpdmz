#!/bin/bash
echo 'you will need this password to get in'
cat MALICIOUS-error.php.tar.gz.crypt.password
echo ''
cat MALICIOUS-error.php.tar.gz.crypt|openssl des3 -d -salt|tar -xvz
