FROM denoland/deno:1.36.1

ARG UID

ARG GID

RUN apt-get update && apt-get install -y lcov && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN groupmod -o -g $GID deno && usermod -u $UID deno

RUN mkdir -p /home/deno/app

RUN chown -R deno:deno /home/deno

RUN chown -R deno:deno /deno-dir

USER deno

WORKDIR /home/deno/app
