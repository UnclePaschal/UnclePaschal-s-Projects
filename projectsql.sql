use project;
select * from project_employee;
# Show distinct value on any of the fields on your table
Select distinct Salaries from project_employee;
# create a function on the table.
DELIMITER $$
CREATE FUNCTION 
CalculateAnnualSalary(monthlySalary
DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE annualSalary DECIMAL(10,2);
SET annualSalary = monthlySalaries*12;
RETURN annualSalary;
END  $$
create table employee_log(log_id int auto_increment primary key,action varchar(10) not null,
-- 'insert'. 'update', or 'delete'
employee_id INT NOT NULL, action_time datetime not null , additional_info varchar(255));
select * from employee_log;
create trigger after_project_employee_insert
AFTER INSERT ON project_employee
FOR EACH ROW
BEGIN
INSERT INTO employee_log(action,employee_id,action_time)
VALUES ('INSERT',NEW.id,NOW());
END;
Delete Trigger
Create trigger after_employee_delete
AFTER DELETE ON project_employee
FOR EACH ROW
BEGIN
INSERT INTO employee_log (action,employee_id,action_time)
VALUES('DELETE',OLD.id,NOW());
END;
Create Trigger after_employee_update
AFTER UPDATE ON employee
FOR EACH ROW 
BEGIN
INSERT INTO employee_log(action,employee_id,action_time)
VALUES ('UPDATE',NEW.id,NOW());
END;
DELIMITER//
CREATE PROCEDURE GetEmployeeTotalSalary(IN Employee_Id OUT Salaries DECIMAL(10,2))
BEGIN
SELECT SUM(Salaries) INTO totall_salaries FROM project_employee
WHERE Emp_Id= Employee_Id;
END//
DELIMITER;
CALL GetEmployeeTotalSalary(42853, @total);
select @total;
Alter table project_employee
ADD COLUMN Birth_date DATE;
Alter table project_employee 
change column Year Years int;

