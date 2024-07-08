```sql
/*************** The Complete PL/SQL Bootcamp ***************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle PL/SQL Bootcamp            *
 * Lecture : CONTINUE Statement                             *
 ************************************************************/
 
 
/*********************** Example 1 **************************/
DECLARE
 v_inner NUMBER := 1;
BEGIN
 FOR v_outer IN 1..10 LOOP
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    WHILE v_inner * v_outer < 15 LOOP
      v_inner := v_inner + 1;
      CONTINUE WHEN MOD(v_inner * v_outer,3) = 0;
      dbms_output.put_line('  My inner value is : ' || v_inner );
    END LOOP;
 END LOOP;
END;
/************************************************************/
 
 
/*********************** Example 2 **************************/
DECLARE
 v_inner NUMBER := 1;
BEGIN
<<outer_loop>>
 FOR v_outer IN 1..10 LOOP
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    <<inner_loop>>
    LOOP
      v_inner := v_inner + 1;
      CONTINUE outer_loop WHEN v_inner = 10;
      dbms_output.put_line('  My inner value is : ' || v_inner );
    END LOOP inner_loop;
 END LOOP outer_loop;
end;
/************************************************************/
```
