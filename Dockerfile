FROM emqx/emqx:5.0.16-alpine

RUN chown -R emqx:emqx /opt/emqx

EXPOSE 1883 8883 8083 18083

CMD ["emqx", "start"]