package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
class ContactExceptionHandler {

    @ExceptionHandler(ContactNotFoundException.class)
    ResponseEntity<Void> handleContactNotFound(ContactNotFoundException ex) {
        return ResponseEntity.notFound().build();
    }

}