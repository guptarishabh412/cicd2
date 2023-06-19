FROM mcr.microsoft.com/azure-functions/java:4-java11-build AS installer-env

COPY . /src/java-function-app
RUN ls

FROM mcr.microsoft.com/azure-functions/java:4-java11-appservice

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY --from=installer-env ["/home/site/wwwroot", "/home/site/wwwroot"]
