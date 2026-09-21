
SQL> CREATE TABLE customer8(ID int PRIMARY KEY, NAME varchar(50),AGE int ,ADDRESS varchar(50),SALARY int);

Table created.

SQL> insert into customer8 values (1,'Ezhil',23,'aaa',20000);

1 row created.

SQL> insert into customer8 values (2,'Aarthi',24,'bbb',30000);

1 row created.

SQL> insert into customer8 values (3,'Sumathi',21,'ccc',35000);

1 row created.

SQL> insert into customer8 values (4,'Viji',24,'ddd',40000);

1 row created.

SQL> insert into customer8 values (5,'Priya',21,'eee',43000);

1 row created.

SQL> SELECT*FROM customer8;

        ID NAME                                                      AGE
---------- -------------------------------------------------- ----------
ADDRESS                                                SALARY
-------------------------------------------------- ----------
         1 Ezhil                                                      23
aaa                                                     20000

         2 Aarthi                                                     24
bbb                                                     30000

         3 Sumathi                                                    21
ccc                                                     35000


        ID NAME                                                      AGE
---------- -------------------------------------------------- ----------
ADDRESS                                                SALARY
-------------------------------------------------- ----------
         4 Viji                                                       24
ddd                                                     40000

         5 Priya                                                      21
eee                                                     43000


SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  c_id customer8.id%type:=5;
  3  c_name customer8.name%type;
  4  c_addr customer8.address%type;
  5  BEGIN
  6  SELECT name, address INTO c_name, c_addr
  7  FROM customer8 where id=c_id;
  8  dbms_output.put_line('name:' || c_name);
  9  dbms_output.put_line('address:' || c_addr);
 10  EXCEPTION
 11  WHEN no_data_found THEN
 12  dbms_output.put_line('no such customer!');
 13  WHEN others THEN
 14  dbms_output.put_line('error!');
 15  END;
 16  /
name:Priya
address:eee

PL/SQL procedure successfully completed.


SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  c_id customer8.id%type :=&cc_id;
  3  c_name customer8.name%type; c_addr customer8.address%type;
  4  ex_invalid_id EXCEPTION;
  5  BEGIN
  6  IF c_id<= 0 THEN RAISE ex_invalid_id;
  7  ELSE
  8  SELECT name, address INTO c_name, c_addr FROM customer8 WHERE id = c_id;
  9  DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
 10  DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
 11  END IF;
 12  EXCEPTION
 13  WHEN ex_invalid_id THEN
 14  dbms_output.put_line('ID must be greater than zero!');
 15  WHEN no_data_found THEN dbms_output.put_line('No such customer!');
 16  WHEN others THEN dbms_output.put_line('Error!');
 17  END;
 18  /
Enter value for cc_id: -6
old   2: c_id customer8.id%type :=&cc_id;
new   2: c_id customer8.id%type :=-6;
ID must be greater than zero!

PL/SQL procedure successfully completed.
