FROM python:3.6.5-alpine3.7

ADD ./ops/requirements_unittest.txt /tmp/requirements.txt

# python libraries install
RUN apk upgrade --update \
    && apk add --update --no-cache g++ mariadb-dev \
    && apk add --update --no-cache --virtual=.build-dependencies tzdata ethtool linux-headers \
    && cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r /tmp/requirements.txt \
    && apk del --purge .build-dependencies \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/log/nrgp

ENV PYTHONPATH=/opt/smp_ci/app
WORKDIR ${PYTHONPATH}

# add source
ADD ./app/app.py ${PYTHONPATH}/app.py

# add test files
ADD ./app/tests/test_app.py ${PYTHONPATH}/tests/test_app.py
ADD ./ops/run_nose_test.sh ${PYTHONPATH}/run_nose_test.sh

CMD ["ash"]
