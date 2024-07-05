CREATE TABLE `students` (
	`stu_id` int(11) NOT NULL AUTO_INCREMENT 
	COMMENT 'Esta columna es la clave primaria con un auto incremental', 
	`stu_name` varchar(25) NOT NULL, 
	`age` int(11) NOT NULL, 
	`gender` char(1) NOT NULL, 
	`doa` date NOT NULL, 
	`address` varchar(20) NOT NULL, 
	PRIMARY KEY (`stu_id`)
	) ENGINE=InnoDB AUTO_INCREMENT=2 
	DEFAULT CHARSET=cp850 COLLATE=cp850_general_ci;

INSERT INTO students VALUES (null,'Álvaro López',94,'O'now(),'Calle Emilio Muñoz 15');
SELECT * FROM ourdatabase.students;

SELECT COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE FROM COLUMNS WHERE TABLE_NAME='students';