FROM emqx/emqx:v4.1-beta.1

RUN chown -R emqx:emqx /opt/emqx

# Set environment variables
ENV EMQX_NAME foo_emqx
ENV EMQX_HOST 127.0.0.1

# Copy configuration files
COPY emqx.conf /opt/emqx/etc/

# Expose ports
EXPOSE 1883 8083 18083

# Set up volumes
VOLUME /root
VOLUME /opt/emqx/data
VOLUME /opt/emqx/etc
VOLUME /opt/emqx/log

# Start EMQX broker service
CMD ["/opt/emqx/bin/emqx", "start"]
