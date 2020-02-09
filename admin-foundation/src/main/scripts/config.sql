INSERT INTO `config` (`category`, `name`, `description`, `status`, `details`, `creation_date`, `last_modified_date`)
VALUES ('security', 'web.page.enabled', 'Enable page access control or not', 1, 'false', NOW(), NOW());

INSERT INTO `config` (`category`, `name`, `description`, `status`, `details`, `creation_date`, `last_modified_date`)
VALUES ('security', 'authorization.xml', 'Authorization model in XML', 1, '<authorization></authorization>', NOW(), NOW());

INSERT INTO `config` (`category`, `name`, `description`, `status`, `details`, `creation_date`, `last_modified_date`)
VALUES ('security', 'cipher.key', 'Cipher Key for encryption Login data', 1, '', NOW(), NOW());
