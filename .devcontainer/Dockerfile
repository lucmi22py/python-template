FROM mcr.microsoft.com/devcontainers/base:noble

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN rm -f /etc/apt/apt.conf.d/docker-clean \
    && echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt update && \
    apt-get install -y --no-install-recommends \
        ripgrep \
        fd-find \
        python-is-python3 \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd
