
// Q1. ROLLUP, CUBE 사용하기
// -> CUBE가 더 다양한 경우의 수를 출력
SELECT  DNAME as "부서", JOB as "역할", COUNT(*) as "총사원", SUM(SAL) as "총임금"
FROM    EMP, DEPT
WHERE   DEPT.DEPTNO = EMP.DEPTNO
GROUP BY    ROLLUP (DNAME, JOB);

SELECT  DNAME as "부서", JOB as "역할", COUNT(*) as "총사원", SUM(SAL) as "총임금"
FROM    EMP, DEPT
WHERE   DEPT.DEPTNO = EMP.DEPTNO
GROUP BY    CUBE (DNAME, JOB);



// Q2. RANK() 사용하기
// -> 임금 순위 표시 및 정렬
SELECT  JOB as "역할", ENAME as "이름", SAL as "임금", 
        RANK() over (ORDER BY SAL desc) as "임금 순위"
FROM    EMP;



// Q3. FIRST_VALUE() 사용하기
// -> 부서별 임금 내림차순 정렬 후, 첫번째를 출력하여 부서별 1등 검색
SELECT  DEPTNO as "부서", ENAME as "이름", SAL as "임금", 
        FIRST_VALUE(ENAME) over (PARTITION BY DEPTNO ORDER BY SAL desc) as "부서별 1등"
FROM    EMP;



// Q4. PIVOT 사용하기
// -> 각 역할에 대해, 부서별 임금의 합을 PIVOT을 통해 계산 및 출력
SELECT  *
FROM    (SELECT JOB as "역할", DEPTNO, SAL FROM EMP)
PIVOT(SUM(SAL) FOR DEPTNO IN (10,20,30));



// Q5. REGEXP_SUBSTR 사용하기
// -> 정규표현식으로 이메일 부분만 추출
SELECT REGEXP_SUBSTR('send mail to "hello@cnu.ac.kr"', 
                     '?[[:alnum:]]+@([[:alnum:]]+\.){1,2}[[:alnum:]]+') as "이메일1",
       REGEXP_SUBSTR('received from "again@naver.com"', 
                     '?[[:alnum:]]+@([[:alnum:]]+\.){1,2}[[:alnum:]]+') as "이메일2"
FROM DUAL;
