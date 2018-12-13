package app;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModelProperty.AccessMode;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class MessageEntity {

    @Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(name = "id")
	@Type(type = "uuid-char")
	@JsonProperty(value="@id", access=JsonProperty.Access.READ_ONLY)
	@ApiModelProperty(notes="The generated message ID", accessMode= AccessMode.READ_ONLY, hidden=true)
	@Setter(AccessLevel.NONE)
    private UUID id;

	@NotNull
    @Column(name="content", nullable=false)
    private String content;

    @Column(name="active", nullable=false)
	private boolean isActive = true;

}
