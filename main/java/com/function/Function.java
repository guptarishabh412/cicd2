package com.function;

import java.util.Optional;

import com.microsoft.azure.functions.*;
import com.microsoft.azure.functions.annotation.AuthorizationLevel;
import com.microsoft.azure.functions.annotation.FunctionName;
import com.microsoft.azure.functions.annotation.HttpTrigger;
import com.microsoft.azure.functions.annotation.QueueOutput;

/**
 * Azure Functions with HTTP Trigger.
 */
public class Function
{


    @FunctionName("HttpExample")
    public HttpResponseMessage run(@HttpTrigger(name = "req", methods = {
        HttpMethod.GET,
        HttpMethod.POST}, authLevel = AuthorizationLevel.ANONYMOUS)
    HttpRequestMessage<Optional<String>> request,
        @QueueOutput(name = "msg", queueName = "outqueue", connection = "AzureWebJobsStorage")
        OutputBinding<String> msg, final ExecutionContext context)
    {
        context.getLogger().info("Java HTTP trigger processed a request.");

        String query = request.getQueryParameters().get("name");
        String name = request.getBody().orElse(query);

        if (name == null)
        {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST)
                .body("hiiii").build();
        }
        else
        {
            msg.setValue(name);
            return request.createResponseBuilder(HttpStatus.OK).body("Hello, "
                + name).build();
        }
    }


}
