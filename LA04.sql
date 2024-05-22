/* LA-4용 추가 인스턴스 */
INSERT INTO LA (S_CODE, S_NAME, S_BIRTH, S_DEPT, S_GRADE)
    VALUES  ('201802709', '망원경', '19991015', '천체', 05);

INSERT INTO LA (S_CODE, S_NAME, S_BIRTH, S_DEPT, S_GRADE)
    VALUES  ('202402828', '정신입', '20050405', NULL, 00);




/* Q1 문자형 함수를 써서 데이터 조회 -> 이름이 3글자인 학생들 출력 */
SELECT S_CODE as "학번", S_NAME as "이름", S_DEPT as "학부" FROM LA
WHERE LENGTH(S_NAME) = 3;



/* Q2 숫자형 함수를 써서 데이터 조회 -> 학년이 홀수인 학생들 출력 */
SELECT S_CODE as "학번", S_NAME as "이름", S_GRADE as "학년" FROM LA
WHERE MOD(S_GRADE, 2) = 1;



/* Q3 날짜형 함수를 써서 데이터 조회 -> EXTRACT로 출생년도 출력 */
SELECT S_CODE as "학번", 
       S_NAME as "이름", 
       S_DEPT as "학부", 
       EXTRACT(YEAR from S_BIRTH) as "출생년도"
FROM LA;



/* Q4 CASE + 산술 연산자로 계산 -> 학년을 CASE 문으로 수정하여 출력 */
SELECT  S_CODE as "학번", 
        S_NAME as "이름", 
        S_DEPT as "학부",
        CASE WHEN S_GRADE > 4
             THEN S_GRADE - 1
             ELSE S_GRADE
        END as "학년"
FROM LA;



/* Q5 AND와 NULL을 사용,  */
SELECT  
    S_CODE as "학번", 
    S_NAME as "이름", 
    S_DEPT as "학부"  FROM LA
WHERE LENGTH(S_NAME) = 3
AND NVL(S_DEPT, '미정') = '미정'


