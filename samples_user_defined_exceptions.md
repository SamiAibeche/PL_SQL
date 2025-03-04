```sql
/***************** The Complete PL/SQL Bootcamp ********************
 * Author  : Oracle Master Training                                *
 * Course  : The Complete Oracle PL/SQL Bootcamp                   *
 * Lecture : Handling & Raising User-Defined Exceptions            *
 *******************************************************************/
 
/*************** Creating a User defined Exception *****************/
declare
too_high_salary exception;
v_salary_check pls_integer;
begin
  select salary into v_salary_check from employees where employee_id = 100;
  if v_salary_check > 20000 then
    raise too_high_salary;
  end if;
  --we do our business if the salary is under 2000
  dbms_output.put_line('The salary is in an acceptable range');
exception
  when too_high_salary then
  dbms_output.put_line('This salary is too high. You need to decrease it.');
end;
/**************** Raising a Predefined Exception *******************/
declare
  too_high_salary exception;
  v_salary_check pls_integer;
begin
  select salary into v_salary_check from employees where employee_id = 100;
  if v_salary_check > 20000 then
    raise invalid_number;
  end if;
  --we do our business if the salary is under 2000
  dbms_output.put_line('The salary is in an acceptable range');
exception
  when invalid_number then
    dbms_output.put_line('This salary is too high. You need to decrease it.');
end;
/****************** Raising Inside of the Exception ****************/
declare
  too_high_salary exception;
  v_salary_check pls_integer;
begin
  select salary into v_salary_check from employees where employee_id = 100;
  if v_salary_check > 20000 then
    raise invalid_number;
  end if;
  --we do our business if the salary is under 2000
  dbms_output.put_line('The salary is in an acceptable range');
exception
  when invalid_number then
    dbms_output.put_line('This salary is too high. You need to decrease it.');
 raise;
end;
```
