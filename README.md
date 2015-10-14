#PHP DMZ

A dockerimage so you can locally (in a VM please!) run a php setup and look at how a compromised php file behaves

if you have just cloned this repo, place the compromised php file in this directory and type

`make run`

now

`docker ps`

you should see your docker container running, 

`make enter`

will enter the Docker container

as an example I will include a compromised file we recently found on one of our servers

once you are in the container `cd /var/www` and there is shell script in there that will open the encrypted file

once the file is unencrypted, you can view what the evildoer was trying to obscure with his substitution cipher and all the base64 encoding

http://127.0.0.1:$PORT/MALICIOUS-error.php


##debug.php

use this file to find log what the old compromised was receiving.

that is you would replace the suspected php file with this debug.php file

the next time it is hit it will make a new temporary file in /tmp and log what it received

be carefull this can potentially fill /tmp if the traffic is heavy

