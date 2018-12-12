package app;

import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<MessageEntity, UUID> {

	MessageEntity findOneById(UUID id);

}
