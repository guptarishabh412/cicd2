FROM mcr.microsoft.com/azure-functions/java:4-java11-appservice AS installer-env
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true
RUN ls && \
    echo first

COPY --from=installer-env ["/home/site/wwwroot", "/home/site/wwwroot"]

RUN ls && \
    echo first
