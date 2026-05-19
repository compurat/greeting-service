package org.greeting.services.goodmorningservice;

import jakarta.persistence.Id;

public record GreetingKind(@Id Long id, String kind, Long greetingId) {
}
