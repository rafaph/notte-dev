FROM golang:1.19.1

ENV PORT=3000
ENV GOBIN=$GOPATH/bin

ARG UID
ARG GID

RUN apt-get update && apt-get -y install python3 curl git

RUN getent group $GID || addgroup --gid $GID notte && adduser --system --uid $UID --gid $GID --disabled-password --gecos "" notte

COPY --chown=notte:notte entrypoint.sh /usr/local/bin/entrypoint

RUN chown -R notte:notte $GOPATH

HEALTHCHECK --interval=30s --timeout=10s CMD wget -q "http://localhost:$PORT/status" -O /dev/null

USER notte

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint"]
