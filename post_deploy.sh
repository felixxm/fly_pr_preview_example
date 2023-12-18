#!/usr/bin/env bash
python /code/manage.py migrate
mkdir -p /code/staticfiles
yes yes | python /code/manage.py collectstatic
