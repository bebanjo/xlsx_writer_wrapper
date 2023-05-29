ARG RUBY_VERSION

FROM ruby:${RUBY_VERSION}-slim

WORKDIR /app


RUN apt-get update && apt-get install \
    -yq \
    --no-install-suggests \
    --no-install-recommends \
    --allow-downgrades \
    --allow-remove-essential \
    --allow-change-held-packages  \
    git build-essential  \
        libffi-dev  && apt clean

# To get gems from git
COPY docker/gitconfig /root/.gitconfig
COPY docker/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
