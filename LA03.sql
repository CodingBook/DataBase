/* Q0 테이블 생성 from LA02 */
CREATE TABLE LA                       /* 학생의 정보를 저장하는 테이블 */
  ( S_CODE NUMBER(9),             /* 학번 */
    S_NAME VARCHAR2(20) not null, /* 이름 (항상 값을 가짐) */
    S_BIRTH DATE,                 /* 생일 */
    S_DEPT VARCHAR2(10),          /* 학부 */
    S_GRADE NUMBER(1),            /* 학년 */
    primary key (S_CODE) );
      


/* Q1 instance 5개 입력 */
INSERT INTO LA (S_CODE, S_NAME, S_BIRTH, S_DEPT, S_GRADE)
    VALUES  ('202202590', '김윈도우', '20030301', '컴융', 01);
    
INSERT INTO LA (S_CODE, S_NAME, S_BIRTH, S_DEPT, S_GRADE)
    VALUES  ('202002473', '김맥북', '20010627', '컴융', 05);
    
INSERT INTO LA (S_CODE, S_NAME, S_BIRTH, S_DEPT, S_GRADE)
    VALUES  ('202102210', '박패드', '20020315', '메카', 02);
    
INSERT INTO LA (S_CODE, S_NAME, S_BIRTH, S_DEPT, S_GRADE)
    VALUES  ('202002100', '박필', '20030505', '물리', 01);
    
INSERT INTO LA (S_CODE, S_NAME, S_BIRTH, S_DEPT, S_GRADE)
    VALUES  ('201902709', '오보드', '20001225', '수학', 05);
/* 5개의 instance 입력 */
    
    
    
/* Q2 2개 이상에 튜플에게 산술 연산자 적용 */
UPDATE LA
SET LA.S_GRADE = LA.S_GRADE - 1
WHERE LA.S_GRADE = 05;
/* 학년에 5가 들어간 튜플의 학년 값을 -1 연산 수행 */



/* Q3 2개 이상의 조건 사용 with LIKE */
SELECT S_CODE "학번", S_NAME "이름", S_DEPT "학부" FROM LA
WHERE S_NAME LIKE '김%'
AND S_GRADE > 02;
/* 이름이 '김'으로 시작하면서 학년이 2보다 튜플 출력 */



/* Q4 3개 이상의 조건 사용 with IN */
SELECT S_CODE "학번", S_NAME "이름", S_DEPT "학부", S_GRADE "학년" FROM LA
WHERE S_DEPT IN ('컴융', '수학')
AND (S_GRADE >= 03 OR S_NAME LIKE '김%');
/* 학부가 '컴융' 또는 '수학' 이면서, 학년이 3 이상 이거나 이름이 '김'으로 시작하는 튜플 출력 */



/* Q5 2개 이상의 조건 사용 with NOT */
SELECT S_CODE "학번", S_NAME "이름", S_DEPT "학부", S_GRADE "학년" FROM LA
WHERE S_GRADE > 01
AND NOT S_DEPT = '컴융';
/* 학년이 2 이상이면서, 학부가 컴융이 아닌 튜플 출력 */




drop table LA;
