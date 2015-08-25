#!/bin/bash

cd /var/www && php app/console d:d:c && php app/console d:s:u --force

