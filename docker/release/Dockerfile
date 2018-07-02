FROM libroli1988/restapi-backend-base-image:latest
MAINTAINER Igor Loboda

#Copy app. artifacts
COPY target /wheelhouse

#Install App
RUN . /appenv/bin/activate && \
    pip install --no-index -f /wheelhouse todobackend && \
    rm -rf /wheelhouse
