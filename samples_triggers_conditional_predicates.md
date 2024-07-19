```sql
/***************** The Complete PL/SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle PL/SQL Bootcamp            *
 * Lecture : Using Conditional Predicates                        *
 ************************************************************/

create or replace trigger before_row_emp_cpy 
before insert or update or delete on employees_copy 
referencing old as O new as N
for each row
begin
  dbms_output.put_line('Before Row Trigger is Fired!.');
  dbms_output.put_line('The Salary of Employee '||:o.employee_id
    ||' -> Before:'|| :o.salary||' After:'||:n.salary);
  if inserting then
    dbms_output.put_line('An INSERT occurred on employees_copy table');
  elsif deleting then
    dbms_output.put_line('A DELETE occurred on employees_copy table');
  elsif updating ('salary') then
    dbms_output.put_line('A DELETE occurred on the salary column');
  elsif updating then
    dbms_output.put_line('An UPDATE occurred on employees_copy table');
  end if;
end;


---------------------------------------------------------------------------------------------
--------------------------------USING UPDATE OF EVENT IN TRIGGERS----------------------------
---------------------------------------------------------------------------------------------
create or replace trigger prevent_updates_of_constant_columns
before update of hire_date,salary on employees_copy 
for each row
begin
  raise_application_error(-20005,'You cannot modify the hire_date and salary columns');
end;


---------------------------------------------------------------------------------------------
----------------------------------USING WHEN CLAUSE ON TRIGGERS------------------------------
---------------------------------------------------------------------------------------------
create or replace trigger prevent_high_salary
before insert or update of salary on employees_copy 
for each row
when (new.salary > 50000)


----------------- creating a complex view -----------------
CREATE OR REPLACE VIEW VW_EMP_DETAILS AS
  SELECT UPPER(DEPARTMENT_NAME) DNAME, MIN(SALARY) MIN_SAL, MAX(SALARY) MAX_SAL 
    FROM EMPLOYEES_COPY JOIN DEPARTMENTS_COPY
    USING (DEPARTMENT_ID)
    GROUP BY DEPARTMENT_NAME;


----------------- updating the complex view -----------------
UPDATE VW_EMP_DETAILS SET DNAME = 'EXEC DEPT' WHERE
  UPPER(DNAME) = 'EXECUTIVE';


----------------- Instead of trigger -----------------
CREATE OR REPLACE TRIGGER EMP_DETAILS_VW_DML
  INSTEAD OF INSERT OR UPDATE OR DELETE ON VW_EMP_DETAILS
  FOR EACH ROW
  DECLARE
    V_DEPT_ID PLS_INTEGER;
  BEGIN
  
  IF INSERTING THEN
    SELECT MAX(DEPARTMENT_ID) + 10 INTO V_DEPT_ID FROM DEPARTMENTS_COPY;
    INSERT INTO DEPARTMENTS_COPY VALUES (V_DEPT_ID, :NEW.DNAME,NULL,NULL);
  ELSIF DELETING THEN
    DELETE FROM DEPARTMENTS_COPY WHERE UPPER(DEPARTMENT_NAME) = UPPER(:OLD.DNAME);
  ELSIF UPDATING('DNAME') THEN
    UPDATE DEPARTMENTS_COPY SET DEPARTMENT_NAME = :NEW.DNAME
      WHERE UPPER(DEPARTMENT_NAME) = UPPER(:OLD.DNAME);
  ELSE
    RAISE_APPLICATION_ERROR(-20007,'You cannot update any data other than department name!.');
  END IF;
END;

begin
  raise_application_error(-20006,'A salary cannot be higher than 50000!.');
end;


```
