package org.greeting.services.goodmorningservice;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.util.List;

@Entity
public record Greeting(
    @Id
    Long id,
    String greeting,
    List<GreetingKind> greetingKinds
) {

}
