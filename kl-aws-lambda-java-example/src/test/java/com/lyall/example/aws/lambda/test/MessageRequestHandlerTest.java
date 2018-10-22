package com.lyall.example.aws.lambda.test;

import br.com.tdsis.lambda.forest.http.request.HttpRequest;
import br.com.tdsis.lambda.forest.http.response.ResponseEntity;
import com.amazonaws.services.lambda.runtime.Context;
import com.lyall.example.aws.lambda.MessageRequestHandler;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

public class MessageRequestHandlerTest {

    private static final Context DUMMY_CONTEXT = null;

    private MessageRequestHandler testee = new MessageRequestHandler();

    @Test
    public void shouldCreateDefaultMessage() {
        String expectedBody = "{\"message\":\"Hello World!\"}";

        HttpRequest request = new HttpRequest();

        ResponseEntity response = testee.handleRequest(request, DUMMY_CONTEXT);
        String actualBody = response.getBody();

        assertThat("Message", actualBody, is(equalTo(expectedBody)));
    }

    @Test
    public void shouldCreateCustomMessage() {
        String expectedBody = "{\"message\":\"Hello Bob!\"}";

        Map<String, String> queryStringParameters = new HashMap<>();
        queryStringParameters.put("name", "Bob");

        HttpRequest request = new HttpRequest();
        request.setQueryStringParameters(queryStringParameters);

        ResponseEntity response = testee.handleRequest(request, DUMMY_CONTEXT);
        String actualBody = response.getBody();

        assertThat("Message", actualBody, is(equalTo(expectedBody)));
    }
}
