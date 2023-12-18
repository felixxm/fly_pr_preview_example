#!/usr/bin/env bash
python /code/manage.py migrate
yes yes | python /code/manage.py collectstatic
