CREATE DATABASE examen;
USE examen;

ALTER TABLE `mydb`.`gestion_medico` 
DROP FOREIGN KEY `fk_gestion_medico_medico`;

ALTER TABLE `mydb`.`vacaiones` 
DROP FOREIGN KEY `fk_vacaiones_empleado`;

ALTER TABLE `mydb`.`horario` 
DROP FOREIGN KEY `fk_horario_empleado`;

ALTER TABLE `mydb`.`gestion_medico` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`empleado` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`gestion_paciente` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`vacaiones` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `tipo` `id_tipo` INT(11) NOT NULL ;

ALTER TABLE `mydb`.`medico` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `estado` `id_estado` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `mydb`.`horario` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `mydb`.`estado` (
  `id_estado` INT(11) NOT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`))

DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`tipo` (
  `id_tipo` INT(11) NOT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo`))

DEFAULT CHARACTER SET = utf8;

ALTER TABLE `mydb`.`gestion_medico` 
DROP FOREIGN KEY `fk_gestion_medico_paciente`;

ALTER TABLE `mydb`.`gestion_medico` ADD CONSTRAINT `fk_gestion_medico_paciente`
  FOREIGN KEY (`id_gestion_paciente`)
  REFERENCES `mydb`.`gestion_paciente` (`id_gestion_paciente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_gestion_medico_medico`
  FOREIGN KEY (`id_medico`)
  REFERENCES `mydb`.`medico` (`id_medico`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`vacaiones` 
DROP FOREIGN KEY `fk_vacaiones_medico`;

ALTER TABLE `mydb`.`vacaiones` ADD CONSTRAINT `fk_vacaiones_medico`
  FOREIGN KEY (`id_medico`)
  REFERENCES `mydb`.`medico` (`id_medico`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_vacaiones_empleado`
  FOREIGN KEY (`id_empleado`)
  REFERENCES `mydb`.`empleado` (`id_empleado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_vacaiones_tipo`
  FOREIGN KEY (`id_tipo`)
  REFERENCES `mydb`.`tipo` (`id_tipo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`medico` 
ADD CONSTRAINT `fk_medico_estado`
  FOREIGN KEY (`id_medico`)
  REFERENCES `mydb`.`estado` (`id_estado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`horario` 
DROP FOREIGN KEY `fk_horario_medico`;

ALTER TABLE `mydb`.`horario` ADD CONSTRAINT `fk_horario_medico`
  FOREIGN KEY (`id_medico`)
  REFERENCES `mydb`.`medico` (`id_medico`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_horario_empleado`
  FOREIGN KEY (`id_empleado`)
  REFERENCES `mydb`.`empleado` (`id_empleado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



--Consultas

--Número de pacientes atendidos por cada médico

SELECT M.id_medico AS id, M.nombre AS nombre, M.apellido as apellido, count(distinct(GM.id_gestion_paciente) as NumeroPacientes
FROM medico M
	INNER JOIN gestion_medico GM 
		on M.id_medico = GM.id_medico
GROUP BY M.id_medico, M.nombre, M.apellido;

--Total de días de vacaciones planificadas y disfrutadas por cada empleado

SELECT E.id_empleado AS id, E.nombre as nombre, E.apellido as apellido, SUM(datediff(V.fecha_fin, V.fecha_inicio)) as HorasVacaciones
FROM vacaciones V
	INNER JOIN empleado E 
		on E.id_empleado = V.id_empleado
group by E.id_empleado, E.nombre, E.apellido;

--Médicos con mayor cantidad de horas de consulta en la semana

SELECT M.id_medico AS id, M.nombre as nombre, M.apellido as apellido,SUM(timediff(H.hora_fin, H.hora_inicio)) as horas
FROM medico M 
	INNER JOIN horario H 
		on M.id_medico = H.id_medico
GROUP BY M.id_medico, M.nombre, M.apellido;
        
--Número de médicos que están actualmente en sustitución

SELECT M.estado,COUNT(M.id_medico)
FROM medico M
WHERE estado = ´sustituido´

-- Horas totales de consulta por médico por día de la semana

SELECT M.id_medico AS id, M.nombre as nombre, M.apellido as apellido, timediff(H.hora_fin, H.hora_inicio) as horas, H.dia as dia
FROM medico M
	INNER JOIN horario H 
		ON M.id_medico = H.id_medico
group by M.id_medico, M.nombre, M.apellido, H.dia;

