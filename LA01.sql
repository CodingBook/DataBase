alter session set "_ORACLE_SCRIPT"=true;
create user d202002473_TP identified by 1234;
grant connect, resource to d202002473_TP;
alter user d202002473_TP quota unlimited on users;