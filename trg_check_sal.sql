create or replace trigger trg_check_sal
before update of sal on emp 
for each row 
begin

if :NEW.sal < :OLD.sal then

raise_application_error(-20001, '錯誤:薪水不能越調越低!舊薪水:' ||:OLD.sal || '新薪水:' ||:New.sal);
end if;
end;
