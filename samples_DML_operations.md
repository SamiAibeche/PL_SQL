```sql
/************** The Complete PL/SQL Bootcamp ****************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle PL/SQL Bootcamp            *
 * Lecture : DML Operations in PL/SQL                       *
 ************************************************************/
 
/************************* Example **************************/
CREATE TABLE employees_copy 
AS SELECT * FROM employees;
 
DECLARE
  v_employee_id     PLS_INTEGER := 0;
  v_salary_increase NUMBER      := 400;
BEGIN
  FOR i IN 217..226 LOOP
    -- INSERT INTO employees_copy 
    -- (employee_id, first_name, last_name, email, hire_date, job_id, salary)
    -- VALUES
    -- (i, 'employee#'||i,'temp_emp','abc@xmail.com',sysdate,'IT_PROG',1000);
    -- UPDATE employees_copy 
    -- SET    salary = salary + v_salary_increase
    -- WHERE  employee_id = i;
    DELETE FROM employees_copy
    WHERE employee_id = i;
  END LOOP;
END; 
```
