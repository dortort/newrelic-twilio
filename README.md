Newrelic-twilio
===================

A simple [newrelic twilio plugin](https://github.com/newrelic-platform/newrelic_twilio_plugin) docker container.
This image is available for pulling from [Docker Hub](https://index.docker.io/u/dortort/newrelic-twilio/)

Launch this container with the following environment variables to suit your situation:

* NEWRELIC_KEY
* TWILIO_ACCOUNT_SID
* TWILIO_AUTH_TOKEN

These will be used by the agent to connect to your Twilio account.

### Why use this container?

This container has everything setup so you can easily run the monitoring agent without having to install everything by hand. It's not much, but still
Even though it isn't particularly difficult, it can be cumbersome. It also allows to contain all the dependencies inside the container and keep the host clean.

### Running this container

Running this container is as simple as running the following command:

    docker run -d \
        -e NEWRELIC_KEY=123 \
        -e TWILIO_ACCOUNT_SID=123123 \
        -e TWILIO_AUTH_TOKEN=123 \
        dortort/newrelic-twilio

