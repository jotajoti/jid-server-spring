-- liquibase formatted sql

-- changeset frankbille:4-create-participant-table

CREATE TABLE `participant`
(
    `id`                 VARCHAR(36)  NOT NULL,
    `name`               VARCHAR(150) NOT NULL,
    `pin_code`           VARCHAR(4)   NOT NULL,
    `event_id`           VARCHAR(36)  NOT NULL,
    `admin_id`           VARCHAR(36)  NULL,
    `created_date`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_modified_date` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT unq_participant_location_name UNIQUE KEY (`name`, `event_id`),
    CONSTRAINT fk_participant_event FOREIGN KEY (`event_id`) REFERENCES event (`id`),
    CONSTRAINT fk_participant_admin FOREIGN KEY (`admin_id`) REFERENCES admin (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- rollback DROP TABLE IF EXISTS `participant`
