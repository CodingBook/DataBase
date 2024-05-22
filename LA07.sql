
// Q1. UNION ALL 사용하기
// -> 칼럼 이름인 포지션으로 덮어씌워짐
SELECT 'PLYR' as "구분코드", POSITION as "포지션"
FROM PLAYER
GROUP BY POSITION
UNION ALL
SELECT 'TEAM' as "구분코드", TEAM_ID as "팀 코드"
FROM TEAM
GROUP BY TEAM_ID;



// Q2. MINUS, 적용 및 사용 안할때
// -> 이름이 3글자인 선수 중, 닉네임 있는 선수만 필터링
SELECT PLAYER_NAME as "선수 이름", NICKNAME as "닉네임", POSITION as "포지션" 
FROM PLAYER
WHERE LENGTH(PLAYER_NAME) = 3
MINUS 
SELECT PLAYER_NAME as "선수 이름", NICKNAME as "닉네임", POSITION as "포지션" 
FROM PLAYER
WHERE NICKNAME IS NULL;

SELECT PLAYER_NAME as "선수 이름", NICKNAME as "닉네임", POSITION as "포지션" 
FROM PLAYER
WHERE LENGTH(PLAYER_NAME) = 3 AND NICKNAME IS NOT NULL;




// Q3. 순방향 계층 구조 (중간은 X, 최하위는 O)
// -> MGR이 null인 사장일 기준으로 계층 출력
SELECT LEVEL, SUBSTR(LPAD(' ', 5 * (LEVEL-1)), 1, 16) || ENAME as "이름", 
    CASE 
        WHEN LEVEL IN (2, 3) THEN ' X'
        WHEN LEVEL = 4 THEN ' O'
        ELSE ''
    END 
        as "정보"
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR
ORDER BY LEVEL;



// Q4. 순방향 계층 구조 (루트 표시, 최하위만 출력)
// -> LEVEL에 조건 걸기
SELECT LEVEL, SUBSTR(SYS_CONNECT_BY_PATH(ENAME, '/'), 1, 30) as "경로"
FROM EMP
WHERE LEVEL = 4
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR
ORDER BY LEVEL;



// Q5. 역방향 계층 구조 
// -> 최하위 중 한명인 ADAMS를 기준으로 출력
SELECT LEVEL, SUBSTR(LPAD(' ', 5 * (LEVEL-1)), 1, 22) || ENAME as "이름", 
    CASE 
        WHEN LEVEL = 4 THEN ' O '
        ELSE ' X '
    END 
        as "TOP"
FROM EMP
START WITH EMPNO = 7876
CONNECT BY PRIOR MGR = EMPNO
ORDER BY LEVEL;


