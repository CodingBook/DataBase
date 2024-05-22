
// Q1. equi join 사용하기
// -> 팀ID를 기준으로 player와 team 테이블 연결
SELECT  PLAYER.PLAYER_NAME as "선수 이름", TEAM.TEAM_NAME as "팀명"
FROM    PLAYER, TEAM 
WHERE   PLAYER.TEAM_ID = TEAM.TEAM_ID;



// Q2. inner join(with on 조건)
// -> 창설년도가 2000 이후인 조건을 whre절로, 아이디 비교는 on절로 해결
SELECT  TEAM_NAME as "팀명", TEAM.STADIUM_ID as "경기장 이름", TEAM.ORIG_YYYY as "창설년도"
FROM    TEAM JOIN STADIUM
ON      TEAM.STADIUM_ID = STADIUM.STADIUM_ID
WHERE   TEAM.ORIG_YYYY > 2000;



// Q3. 3개 테이블 join
// -> where로 연결
SELECT  PLAYER.PLAYER_NAME as "선수 이름", TEAM.TEAM_NAME as "팀명", STADIUM.STADIUM_NAME as "홈 필드"
FROM    PLAYER, TEAM, STADIUM
WHERE   PLAYER.TEAM_ID = TEAM.TEAM_ID
AND     TEAM.STADIUM_ID = STADIUM.STADIUM_ID;



// Q4. Cross join (조건 없이)
// -> team과 stadium 연결 (15 * 20 = 300 경우의 수)
SELECT  TEAM.TEAM_NAME as "팀명", STADIUM.STADIUM_NAME as "홈 필드"
FROM    TEAM CROSS JOIN STADIUM;



// Q5. LEFT outer join
// -> team과 stadium 연결 
SELECT  TEAM_NAME as "팀명", TEAM.STADIUM_ID as "경기장 이름", TEAM.ORIG_YYYY as "창설년도"
FROM    TEAM LEFT OUTER JOIN STADIUM
ON      TEAM.STADIUM_ID = STADIUM.STADIUM_ID;


