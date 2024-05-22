/* Q1 테이블 생성 */
create table la02                       /* 학생의 정보를 저장하는 테이블 */
  ( SSO NUMBER(13),                     /* 주민등록번호 */ 
    STUDENT_CODE NUMBER(9),             /* 학번 */
    STUDENT_NAME VARCHAR2(10) not null, /* 이름 (항상 값을 가짐) */
    STUDENT_BIRTH DATE,                 /* 생일 */
    STUDENT_DEPT VARCHAR2(10),          /* 학부 */
    primary key (SSO) );
      
/* Q2 attribute 추가 */      
alter table la02 
add (Address VARCHAR2(80));

/* Q3 이름 변경 */
alter table la02
rename column Address to Address_fixed;

/* Q4 정보 변경 */
alter table la02
modify (    STUDENT_CODE    NUMBER(9)   default 202000001,
            STUDENT_BIRTH   date        default '20000101' not null );
       
/* Q5 테이블 삭제 */
drop table la02;

describe la02;