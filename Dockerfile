FROM mcr.microsoft.com/azure-functions/java:4-java11-appservice 

COPY . /src/java-function-app
RUN ls && \
    echo f


ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

