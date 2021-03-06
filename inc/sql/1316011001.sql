-- To 1.3.16011001;
ALTER TABLE `log`
  ADD log_level VARCHAR(20) NOT NULL;
CREATE TABLE `publicLinks` (
  publicLink_id       INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  publicLink_itemId   INT UNSIGNED,
  publicLink_hash     VARBINARY(100)           NOT NULL,
  publicLink_linkData LONGBLOB
);
ALTER TABLE `accounts` DROP INDEX `IDX_searchTxt`;
ALTER TABLE `usrData`
  ENGINE = InnoDB;
ALTER TABLE `accFiles`
  ENGINE = InnoDB;
ALTER TABLE `accGroups`
  ENGINE = InnoDB;
ALTER TABLE `accHistory`
  ENGINE = InnoDB;
ALTER TABLE `accUsers`
  ENGINE = InnoDB;
ALTER TABLE `categories`
  ENGINE = InnoDB;
ALTER TABLE `config`
  ENGINE = InnoDB;
ALTER TABLE `customers`
  ENGINE = InnoDB;
ALTER TABLE `log`
  ENGINE = InnoDB;
ALTER TABLE `usrGroups`
  ENGINE = InnoDB;
ALTER TABLE `usrPassRecover`
  ENGINE = InnoDB;
ALTER TABLE `usrProfiles`
  ENGINE = InnoDB;
ALTER TABLE `accounts`
  ENGINE = InnoDB;
CREATE UNIQUE INDEX unique_publicLink_accountId
  ON publicLinks (publicLink_itemId);
CREATE UNIQUE INDEX unique_publicLink_hash
  ON publicLinks (publicLink_hash);
ALTER TABLE `config`
  CHANGE config_value config_value VARCHAR(2000);
CREATE TABLE `accFavorites` (
  `accfavorite_accountId` SMALLINT UNSIGNED NOT NULL,
  `accfavorite_userId`    SMALLINT UNSIGNED NOT NULL,
  INDEX `fk_accFavorites_accounts_idx` (`accfavorite_accountId` ASC),
  INDEX `fk_accFavorites_users_idx` (`accfavorite_userId` ASC),
  INDEX `search_idx` (`accfavorite_accountId` ASC, `accfavorite_userId` ASC)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;