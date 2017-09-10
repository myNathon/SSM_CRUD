# 创建数据库
DROP DATABASE ssm_crud;
CREATE DATABASE ssm_crud;

# 创建员工数据表
CREATE TABLE `ssm_crud`.`_emp` (
  `emp_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_name` VARCHAR(255) NOT NULL,
  `gender` CHAR(1) NULL,
  `email` VARCHAR(255) NULL,
  `d_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`emp_id`)
  ) ENDINE=InnoDB DEFAULT CHARSET=utf8;

# 创建部门数据表
CREATE TABLE `ssm_crud`.`_dept` (
  `dept_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
  ) ENDINE=InnoDB DEFAULT CHARSET=utf8;

# 关联外键
ALTER TABLE `ssm_curd`.`_emp`
ADD INDEX `fk_emp_dept_idx` (`d_id` ASC);
ALTER TABLE `ssm_curd`.`_emp`
ADD CONSTRAINT `fk_emp_dept`
  FOREIGN KEY (`d_id`)
  REFERENCES `ssm_curd`.`_dept` (`dept_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
