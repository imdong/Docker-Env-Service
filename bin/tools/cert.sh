#!/bin/bash

certonly -w /var/www/letsencrypt -m www@qs5.org -d a1.gself.top --test-cert
