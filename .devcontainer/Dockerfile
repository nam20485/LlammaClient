# [Choice] .NET version: 8.0-bookworm, 8.0-jammy, 8.0-bullseye
#FROM mcr.microsoft.com/devcontainers/dotnet:1-8.0-bookworm
FROM ghcr.io/nam20485/dotnet-prebuild:latest

# Install SQL Tools: SQLPackage and sqlcmd
COPY sql/installSQLtools.sh installSQLtools.sh
RUN bash ./installSQLtools.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts