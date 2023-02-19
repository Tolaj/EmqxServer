FROM emqx/emqx:v4.1-beta.1

ENV EMQX_NAME foo_emqx
ENV EMQX_HOST 127.0.0.1

USER root

# Set container name and hostname
ARG CONTAINER_NAME=foo_emqx
ARG HOST_NAME=foo_emqx





# Set environment variables
ENV EMQX_NAME=${EMQX_NAME} \
    EMQX_HOST=${EMQX_HOST}

# Expose ports
EXPOSE 1883 8083 18083

# Set up volumes
VOLUME /root
VOLUME /opt/emqx/data
VOLUME /opt/emqx/etc
VOLUME /opt/emqx/log

CMD ["emqx", "start"]

