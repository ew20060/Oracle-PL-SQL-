CREATE OR REPLACE VIEW v_emp_dept10 AS
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno = 10;