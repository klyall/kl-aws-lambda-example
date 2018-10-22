package com.lyall.example.aws.lambda.test;

import com.lyall.example.aws.lambda.HelloWorld;
import org.junit.Test;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

public class HelloWorldTest {

    private HelloWorld testee = new HelloWorld();

    @Test
    public void shouldCreateDefaultMessage() {
        String expectedMessage= "Hello World!";

        String actualMessage = testee.createMessage();

        assertThat("Message", actualMessage, is(expectedMessage));
    }

    @Test
    public void shouldCreateCustomMessage() {
        String expectedMessage= "Hello Bob!";

        String actualMessage = testee.createMessage("Bob");

        assertThat("Message", actualMessage, is(expectedMessage));
    }

    @Test
    public void shouldCreateDefaultMessageForNullName() {
        String expectedMessage= "Hello World!";

        String actualMessage = testee.createMessage(null);

        assertThat("Message", actualMessage, is(expectedMessage));
    }

    @Test
    public void shouldCreateDefaultMessageForEmptyName() {
        String expectedMessage= "Hello World!";

        String actualMessage = testee.createMessage("   ");

        assertThat("Message", actualMessage, is(expectedMessage));
    }
}
