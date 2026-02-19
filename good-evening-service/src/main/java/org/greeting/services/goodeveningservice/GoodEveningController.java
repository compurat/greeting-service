package org.greeting.services.goodeveningservice;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class GoodEveningController {

    @GetMapping("/greeting/good-evening")
    public String goodEvening() {
        return "Good Evening!";
    }
}
