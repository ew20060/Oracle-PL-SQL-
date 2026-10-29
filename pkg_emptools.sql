create or replace package emptools
is 
function getSal(p_empno number) return number;
function raiseSal(p_empno number , p_percent number ) return  number;
procedure listByDept(p_deptno number) ;
procedure deleteEmp (p_empno number);
end;
/

create or replace package body emptools 
is
function getSal(p_empno number)return number 
is
v_sal emp.sal%TYPE;
begin
select sal into v_sal from emp where empno = p_empno;
return v_sal;

exception 
when no_data_found then
return null;
end;

function raiseSal(p_empno number,p_percent number )return number
is
begin 
update emp set sal =  sal * (1+p_percent / 100 ) 
where empno = p_empno ;
if sql%found then
commit;
return 1 ;
else 
return 0 ;
end if ;
end;

procedure listByDept (p_deptno number) is

cursor emp_cursor(p_dno number) is select ename,sal from emp where deptno = p_dno;
begin
for e in emp_cursor(p_deptno) loop
dbms_output.put_line(e.ename||','||e.sal);
end loop;
end;

procedure deleteEmp (p_empno number)
is
begin
delete from emp where empno = p_empno ;
commit;
end;

end;
/