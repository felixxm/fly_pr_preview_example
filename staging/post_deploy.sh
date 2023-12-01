# staging/post_deploy.sh
#!/usr/bin/env bash

python /code/manage.py migrate
python /code/manage.py loaddata /code/staging/test_groups.json
