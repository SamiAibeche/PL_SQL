```sql
/*************** The Complete PL/SQL Bootcamp ***************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle PL/SQL Bootcamp            *
 * Lecture : Basic Loops                                    *
 ************************************************************/
 
/*********************** Basic Loops ************************/
DECLARE
  v_counter NUMBER(2) := 1;
BEGIN
  LOOP
    dbms_output.put_line('My counter is : '|| v_counter);
    v_counter := v_counter + 1;
    --IF v_counter = 10 THEN
    --  dbms_output.put_line('Now I reached : '|| v_counter);
    --  EXIT;
    --END IF;
    EXIT WHEN v_counter > 10;
  END LOOP;
END;
/************************************************************/
```
