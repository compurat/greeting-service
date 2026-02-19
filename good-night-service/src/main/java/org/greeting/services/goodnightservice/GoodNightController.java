package org.greeting.services.goodnightservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GoodNightController {

    @GetMapping("/greeting/good-night")
    public String goodNight() {
        return "Good Night!";
    }
}
