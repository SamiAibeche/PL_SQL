# PL/SQL Practical Examples

This document provides 10 practical PL/SQL examples, starting from the simplest to the more complex. These examples use the `HR` database schema.

## 1. Hello World
```sql
BEGIN
   DBMS_OUTPUT.PUT_LINE('Hello, World!');
END;
```
2. Declaring and Using Variables
```sql
DECLARE
   v_message VARCHAR2(50);
BEGIN
   v_message := 'Hello, PL/SQL!';
   DBMS_OUTPUT.PUT_LINE(v_message);
END;
```
3. Simple IF-THEN-ELSE Statement
```sql
DECLARE
   v_salary NUMBER := 5000;
BEGIN
   IF v_salary < 10000 THEN
      DBMS_OUTPUT.PUT_LINE('Salary is less than 10000');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Salary is 10000 or more');
   END IF;
END;
```
4. Using a FOR Loop
```sql
BEGIN
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
   END LOOP;
END;
```
5. Working with Cursors
```sql
DECLARE
   CURSOR emp_cursor IS SELECT first_name, salary FROM employees WHERE department_id = 10;
   v_emp_record emp_cursor%ROWTYPE;
BEGIN
   OPEN emp_cursor;
   LOOP
      FETCH emp_cursor INTO v_emp_record;
      EXIT WHEN emp_cursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Name: ' || v_emp_record.first_name || ', Salary: ' || v_emp_record.salary);
   END LOOP;
   CLOSE emp_cursor;
END;
```
6. Handling Exceptions
```sql
DECLARE
   v_salary NUMBER;
BEGIN
   SELECT salary INTO v_salary FROM employees WHERE employee_id = 99999;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employee found with ID 99999');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
```
7. Creating a Stored Procedure
```sql
CREATE OR REPLACE PROCEDURE update_salary(p_emp_id IN NUMBER, p_new_salary IN NUMBER) IS
BEGIN
   UPDATE employees SET salary = p_new_salary WHERE employee_id = p_emp_id;
   DBMS_OUTPUT.PUT_LINE('Salary updated for employee ID ' || p_emp_id);
END;
```
8. Using a WHILE Loop
```sql
DECLARE
   v_counter NUMBER := 1;
BEGIN
   WHILE v_counter <= 5 LOOP
      DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
      v_counter := v_counter + 1;
   END LOOP;
END;
```
9. Creating and Using a Package
    
Package Specification
```sql
CREATE OR REPLACE PACKAGE emp_pkg IS
   PROCEDURE add_employee(p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2);
END emp_pkg;
```
Package Body
```sql
CREATE OR REPLACE PACKAGE BODY emp_pkg IS
   PROCEDURE add_employee(p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2) IS
   BEGIN
      INSERT INTO employees (first_name, last_name, email, hire_date, job_id) VALUES (p_first_name, p_last_name, p_email, SYSDATE, 'IT_PROG');
      DBMS_OUTPUT.PUT_LINE('Employee added: ' || p_first_name || ' ' || p_last_name);
   END add_employee;
END emp_pkg;
```
10. Creating a Trigger
```sql
CREATE OR REPLACE TRIGGER trg_before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
   IF :NEW.email IS NULL THEN
      :NEW.email := :NEW.first_name || '.' || :NEW.last_name || '@example.com';
   END IF;
END;
```
These examples demonstrate the basics of PL/SQL, including control structures, cursors, exception handling, procedures, packages, and triggers.
