```sql
/*************** The Complete PL/SQL Bootcamp ***************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle PL/SQL Bootcamp            *
 * Lecture : FOR LOOPs                                      *
 ************************************************************/
 
/************************ FOR LOOP **************************/
BEGIN
  FOR i IN REVERSE 1..3 LOOP
    dbms_output.put_line('My counter is : ' || i);
  END LOOP;
END;
/************************************************************/
```
