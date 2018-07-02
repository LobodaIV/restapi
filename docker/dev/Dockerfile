FROM libroli1988/restapi-backend-base-image:latest
MAINTAINER Igor Loboda

# Install dev/build dependencies
RUN apt-get update && \
    apt-get install -qy python-dev libmysqlclient-dev

#Activate virtual environment and install wheel support
RUN . /appenv/bin/activate && \
    pip install wheel --upgrade
#PIP environment variables(NOTE: must be set after installing wheel)
ENV WHEELHOUSE=/wheelhouse PIP_WHEEL_DIR=/wheelhouse PHP_FIND_LINKS=/wheelhouse XDG_CACHE_HOME=/cache

#OUTPUT: Build artefacts (Wheels) are output here
VOLUME /wheelhouse

#OUTPUT: Build cache, will be shared between a test service and a builder service that we are about to create
VOLUME /build


#OUTPUT: Test reports are output here
VOLUME /reports

#Create test entrypoint
COPY scripts/test.sh /usr/local/bin/test.sh
RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["test.sh"]
CMD ["python","manage.py","test","--noinput"]

#Add app source
COPY src /application
WORKDIR /application
