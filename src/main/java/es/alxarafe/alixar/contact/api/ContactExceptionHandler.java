package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.InvalidContactDataException;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ContactExceptionHandler {

    @ExceptionHandler(ContactNotFoundException.class)
    ResponseEntity<Void> handleContactNotFound(ContactNotFoundException ex) {
        return ResponseEntity.notFound().build();
    }

    @ExceptionHandler(InvalidContactDataException.class)
    ResponseEntity<Void> handleInvalidContactData(InvalidContactDataException ex) {
        return ResponseEntity.badRequest().build();
    }

    @ExceptionHandler(InvalidThirdPartyReferenceException.class)
    ResponseEntity<Void> handleInvalidThirdPartyReference(InvalidThirdPartyReferenceException ex) {
        return ResponseEntity.unprocessableEntity().build();
    }

}