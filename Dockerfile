ARG PYTHON_VERSION=3.10-slim-bullseye

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /code

WORKDIR /code

COPY requirements.txt /tmp/requirements.txt
RUN set -ex && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/
COPY . /code

RUN set -ex && \
    yes yes | python /code/manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "hello_pr_preview_example.wsgi"]
