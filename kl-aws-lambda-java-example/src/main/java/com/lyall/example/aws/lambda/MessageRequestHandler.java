package com.lyall.example.aws.lambda;

import br.com.tdsis.lambda.forest.http.exception.HttpException;
import br.com.tdsis.lambda.forest.http.handler.AbstractRequestHandler;
import com.amazonaws.services.lambda.runtime.Context;
import com.lyall.example.aws.lambda.model.MessageResponse;

import java.util.Optional;

public class MessageRequestHandler extends AbstractRequestHandler<Void, MessageResponse> {

    private HelloWorld helloWorld = new HelloWorld();

    @Override
    public void before(Context context) throws HttpException {

    }

    @Override
    public MessageResponse execute(Void request, Context context) throws HttpException {
        Optional<String> nameParameter = getQueryStringParameter("name");

        String name = nameParameter.orElse("");

        String message = helloWorld.createMessage(name);
        return new MessageResponse(message);
    }
}