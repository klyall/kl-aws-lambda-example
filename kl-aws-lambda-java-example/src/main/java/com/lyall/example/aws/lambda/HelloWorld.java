package com.lyall.example.aws.lambda;

import static java.lang.String.format;

public class HelloWorld {

    private static final String DEFAULT_NAME = "World";
    private static final String MESSAGE = "Hello %s!";

    public String createMessage() {
        return createMessage(DEFAULT_NAME);
    }

    public String createMessage(String name) {
        String messageName = name;

        if (name == null || name.trim().equals("")) {
            messageName = DEFAULT_NAME;
        }

        return format(MESSAGE, messageName);
    }
}
