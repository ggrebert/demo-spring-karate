package app;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.NotAcceptableStatusException;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.util.UriComponentsBuilder;

import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@RequestMapping(
	path = "/flash-message",
	produces = MediaType.APPLICATION_JSON_VALUE
)
class MessageController {

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	private MessageRepository repository;

	@GetMapping
	public Iterable<MessageEntity> list() {
		return repository.findAll();
	}

	@PostMapping
	@ApiResponses(value={
		@ApiResponse(code = 201, message = "Message successfuly created")
	})
	public ResponseEntity<MessageEntity> create(@RequestBody MessageEntity message, UriComponentsBuilder ucBuilder) {
		logger.trace("Creating new message");

		try {
			repository.save(message);

			HttpHeaders headers = new HttpHeaders();
			headers.setLocation(ucBuilder.path("/flash-message/{id}").buildAndExpand(message.getId()).toUri());

			logger.info("Message with id {} created.", message.getId());

			return new ResponseEntity<>(message, headers, HttpStatus.CREATED);
		}
		catch(Exception e) {
			logger.error("Unable to create message.", e);
			throw new NotAcceptableStatusException("Unable to create message");
		}
	}

	@GetMapping(path = "/hello")
	public String hello() {
		return "world";
	}

	@GetMapping(path = "/{id}")
	public ResponseEntity<MessageEntity> get(@PathVariable("id") UUID id) {
		MessageEntity message = repository.findOneById(id);

		if (message == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No message found");
		}

		return new ResponseEntity<>(message, HttpStatus.OK);
	}

	@PutMapping(path = "/{id}")
	public ResponseEntity<MessageEntity> update(
		@PathVariable("id") UUID id,
		@RequestBody MessageEntity updated
	) {
		logger.trace("Updating message {}.", id);

		MessageEntity message = repository.findOneById(id);

		if (message == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No message found");
		}

		message.setActive(updated.isActive());
		message.setContent(updated.getContent());

		repository.save(message);

		logger.info("Message with id {} updated.", id);

		return new ResponseEntity<>(message, HttpStatus.ACCEPTED);
	}

	@DeleteMapping(path = "/{id}")
	public ResponseEntity<MessageEntity> delete(@PathVariable("id") UUID id) {
		logger.trace("Deleting message {}.", id);

		MessageEntity message = repository.findOneById(id);

		if (message == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No message found");
		}

		repository.delete(message);

		logger.info("Message with id {} deleted.", id);

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

}
