
// Q1. 서브쿼리 + IN 연산자
// -> where절에서 IN을 사용해 검색
SELECT  REGION_NAME as "지역", TEAM_ID as "코드", TEAM_NAME as "팀명"
FROM    TEAM
WHERE   TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정현수')
ORDER BY REGION_NAME;



// Q2. 서브쿼리 + EXISTS 연산자
// -> EXISTS를 통해 다중 결과값 검색
SELECT  STADIUM.STADIUM_ID as "코드", STADIUM.STADIUM_NAME as "이름"
FROM    STADIUM
WHERE EXISTS (SELECT 1 FROM SCHEDULE
              WHERE STADIUM.STADIUM_ID = SCHEDULE.STADIUM_ID
                AND SCHEDULE.SCHE_DATE BETWEEN '20120501' AND '20120601');
              
              
              
// Q3. 연관 서브 쿼리 
// -> 서브쿼리 내부에서 메인쿼리 P 사용
SELECT  T.REGION_NAME as "지역", T.TEAM_NAME as "팀명", P.PLAYER_NAME as "이름"
FROM    TEAM T, PLAYER P
WHERE   T.TEAM_ID = P.TEAM_ID
AND     P.HEIGHT < (SELECT AVG(S.HEIGHT) FROM PLAYER S WHERE S.TEAM_ID = P.TEAM_ID AND S.TEAM_ID IS NOT NULL)
ORDER BY P.PLAYER_NAME;



// Q4. 인라인 뷰
// -> FROM 절에서 서브쿼리 사용
SELECT  T.REGION_NAME as "지역", T.TEAM_ID as "코드", T.TEAM_NAME as "팀명", P.PLAYER_NAME as "이름"
FROM    (SELECT TEAM_ID, PLAYER_NAME
         FROM   PLAYER
         WHERE POSITION = 'GK') P, TEAM T
WHERE   P.TEAM_ID = T.TEAM_ID
ORDER BY REGION_NAME;



// Q5. 뷰 활용
// -> 뷰 생성 후 해당 뷰에서 SELECT 실행 진행
CREATE VIEW V_PLAYER_NAME as 
SELECT P.PLAYER_NAME, P.POSITION, P.TEAM_ID, T.TEAM_NAME
FROM PLAYER P, TEAM T
WHERE P.TEAM_ID = T.TEAM_ID;

SELECT PLAYER_NAME as "이름", POSITION as "포지션", TEAM_ID as "코드", TEAM_NAME as "팀명"
FROM V_PLAYER_NAME
WHERE PLAYER_NAME LIKE '고%';

DROP VIEW V_PLAYER_NAME;

