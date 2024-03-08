FROM ruby:3-slim-bookworm

LABEL org.opencontainers.image.title="LinuxFr.org boards"
LABEL org.opencontainers.image.description="Chat rooms for LinuxFr"
LABEL org.opencontainers.image.source="https://github.com/linuxfrorg/board-sse-linuxfr.org"
LABEL org.opencontainers.image.url="https://github.com/linuxfrorg/board-sse-linuxfr.org"
LABEL org.opencontainers.image.licenses="AGPL-3.0-only"
LABEL org.opencontainers.image.version="ruby3-bookworm"
LABEL org.opencontainers.image.authors="Adrien Dorsaz <adrien@adorsaz.ch>"

ARG UID=1200

RUN apt-get update \
  # Install dependencies \
  && apt-get install -y --no-install-recommends \
    build-essential ruby ruby-dev \
  && apt-get clean

USER ${UID}
WORKDIR /linuxfr-board
ENV HOME=/linuxfr-board

# Install board-linuxfr
COPY --chown=${UID}:0 --chmod=770 . .
RUN gem build board-linuxfr.gemspec \
  && gem install ./board-linuxfr-*.gem

# Clean development dependencies
USER 0
RUN apt purge --autoremove -y build-essential ruby-dev

USER ${UID}
EXPOSE 9000

CMD ["board-linuxfr"]

