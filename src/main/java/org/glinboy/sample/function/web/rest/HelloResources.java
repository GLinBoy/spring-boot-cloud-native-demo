package org.glinboy.sample.function.web.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/hello")
public class HelloResources {

  @RequestMapping
  public String sayHello() {
    return "Hello, World!";
  }
}
