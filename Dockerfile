###
#
# A ubuntu based newrelic-twilio monitoring agent image using the latest official release when built
#
###
FROM ubuntu:14.04

WORKDIR /usr/local/newrelic_twilio_plugin-1.0.2

####
# Base stuff, software dependencies from APT
# App installation: latest version of the newrelic plugin
# cleanup after by removing dev-stuff, /tmp stuff and just leaving the app

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -qy --no-install-recommends build-essential curl ruby-dev libxml2-dev libxslt-dev ruby && \
    apt-get autoremove --purge && \
    apt-get clean && \
    gem install --no-rdoc --no-ri bundler && \
    curl -L https://github.com/newrelic-platform/newrelic_twilio_plugin/archive/1.0.2.tar.gz > latest.tar.gz && \
    tar -zxf latest.tar.gz -C /usr/local && \
    cp config/newrelic_plugin.yml.example config/newrelic_plugin.yml && \
    sed -e "s/YOUR_LICENSE_KEY_HERE/<%= ENV[\"NEWRELIC_KEY\"] %>/g" -i config/newrelic_plugin.yml && \
    sed -e "s/YOUR_TWILIO_ACCOUNT_SID_HERE/<%= ENV[\"TWILIO_ACCOUNT_SID\"] %>/g" -i config/newrelic_plugin.yml && \
    sed -e "s/YOUR_TWILIO_AUTH_TOKEN_HERE/<%= ENV[\"TWILIO_AUTH_TOKEN\"] %>/g" -i config/newrelic_plugin.yml && \
    bundle install --clean --quiet --without test && \
    apt-get remove -yq --purge build-essential curl ruby-dev libxml2-dev libxslt-dev && \
    apt-get autoremove -yq --purge && \
    rm -rf latest.tar.gz /tmp/* /var/tmp/* /var/lib/apt/lists/*

ENTRYPOINT ["bundle", "exec", "./bin/newrelic_twilio"]