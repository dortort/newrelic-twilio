#!/bin/bash

WORKDIR=/usr/local/newrelic_twilio_plugin-1.0.2

cp $WORKDIR/config/newrelic_plugin.yml.example config/newrelic_plugin.yml && \
    sed -e "s/YOUR_LICENSE_KEY_HERE/${NEWRELIC_KEY}/g" -i $WORKDIR/config/newrelic_plugin.yml && \
    sed -e "s/YOUR_TWILIO_ACCOUNT_SID_HERE/${TWILIO_ACCOUNT_SID}/g" -i $WORKDIR/config/newrelic_plugin.yml && \
    sed -e "s/YOUR_TWILIO_AUTH_TOKEN_HERE/${TWILIO_AUTH_TOKEN}/g" -i $WORKDIR/config/newrelic_plugin.yml

bundle exec $WORKDIR/bin/newrelic_twilio