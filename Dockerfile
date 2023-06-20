FROM mcr.microsoft.com/azure-functions/java:4-java11-appservice

COPY . /src/java-function-app
RUN cd /src/java-function-app && \
    mkdir -p /home/site/wwwroot && \
    apt-get update && \
    apt-get install -y tree && \
    tree . && \
