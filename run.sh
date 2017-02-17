#!/bin/bash

docker rm -f phpmyadmin

docker run -id   \
                -v "$PWD"/public_html:/var/www/html \
                -p 8888:80 \
                appsoa/docker-centos-devops-phpmyadmin \
                --name phpmyadmin

