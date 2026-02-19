package org.greeting.services.goodmorningservice;

import org.springframework.web.bind.annotation.GetMapping;import org.springframework.web.bind.annotation.RestController;

@RestController
public class GoodMorningController {
    @GetMapping("/greeting/good-morning")
    public String getGoodMorning() {
        return "Good Morning!";
    }
}
