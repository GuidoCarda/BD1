CREATE TABLE `meteorologia` (
  `id` INT AUTO_INCREMENT,
  `ciudad` VARCHAR(22),
  `pais` VARCHAR(22),
  `max_temp` TINYINT CHECK(max_temp >= -20 AND max_temp <= 40),
  `min_temp` TINYINT CHECK(min_temp >= -20 AND min_temp <= 40),
  `precip_media_anual` SMALLINT UNSIGNED CHECK (precip_media_anual <= 2000),
  PRIMARY KEY (id)
)