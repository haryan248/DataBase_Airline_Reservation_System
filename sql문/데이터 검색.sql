/*각 테이블 전체 데이터 검색*/
SELECT * FROM 고객;
SELECT * FROM 고객_연락처;
SELECT * FROM 게시글;
SELECT * FROM 공항;
SELECT * FROM 비행편;
SELECT * FROM 예약;
SELECT * FROM 환불;
SELECT * FROM 환불_요청;
SELECT * FROM 항공사;
SELECT * FROM 비행기;
SELECT * FROM 운행;
SELECT * FROM 비행_요금;

/*질의1 : 도착지가 'IN CHEON' 인 고객의 고객ID 와 고객 이름을 검색하라*/
SELECT 고객.고객ID, 고객.성명
FROM 고객, 예약, 비행편
WHERE 고객.고객ID=예약.고객ID AND 예약.비행편_코드=비행편.비행편_코드 
AND 비행편.도착지='IN CHEON';

/*질의2 : 연락처가 2개 이상인 고객의 고객 id와 고객 이름을 검색하라*/
SELECT 고객.고객Id, 고객.성명
FROM 고객
WHERE 고객.고객id IN (select 고객id from 고객_연락처 group by 고객id having count(*) >= 2); 

/*질의3 : 환불 사유가 'FLIGHT HAS DELAYED'인 고객의 고객ID를 검색하라*/
SELECT 환불_요청.고객ID
FROM 환불, 환불_요청,고객
WHERE 환불.환불_사유_코드=환불_요청.환불_사유_코드 AND 고객.고객ID=환불_요청.고객ID
AND 환불_사유='FLIGHT HAS DELAYED';

/*질의4 : 이키노미석 비행요금이 60000원 이상인 출발지와 도착지를 검색하라*/
SELECT 비행편.출발지,비행편.도착지
FROM 비행_요금,비행편
WHERE 비행편.비행편_코드=비행_요금.비행편_코드 
AND 비행_요금.이코노미석>=60000;

/*질의5 : 'KWANG JU' 로 가는 고객중에 비행기 번호가 'B747-400'을 타는 고객의 고객ID를 검색하라*/
SELECT 예약.고객ID
FROM 운행,비행편,예약 
WHERE 예약.비행편_코드=비행편.비행편_코드 
AND 비행편.비행편_코드=운행.비행편_코드 
AND 운행.비행기_번호='B747-400' 
AND 비행편.도착지='KWANG JU';

/*질의6 : 항공사_이름이 'DAEHAN' 인 비행기 중에 'KWANG JU'로 가는 비행기 번호와 출발지를 검색하라*/
SELECT 운행.비행기_번호, 비행편.출발지
FROM 비행기,운행,항공사, 비행편
WHERE 비행편.비행편_코드=운행.비행편_코드 
AND 운행.비행기_번호=비행기.비행기_번호 
AND 비행기.항공사ID =항공사.항공사ID 
AND 항공사.항공사_이름='DAEHAN' AND 비행편.도착지='KWANG JU';

/*질의7 : 환불 사유가 'FLIGHT HAS DELAYED'인 고객 중에서 고객의 고객ID와 고객이름, 출발지, 도착지를 검색하라*/
SELECT DISTINCT 예약.고객ID, 비행편.출발지, 비행편.도착지
FROM 비행편,예약,고객
WHERE 예약.비행편_코드=비행편.비행편_코드 AND 고객.고객ID=예약.고객ID 
AND(고객.고객ID, 고객.성명)IN(SELECT 환불_요청.고객ID ,고객.성명
FROM 환불,환불_요청, 고객
WHERE 환불.환불_사유_코드=환불_요청.환불_사유_코드 AND 고객.고객ID=환불_요청.고객ID 
AND 환불_사유='FLIGHT HAS DELAYED');

/*질의8 : 항공사_이름이 'ASIANA' 인 비행기를 타지 않는 고객의 고객ID와 도착지를 검색하라*/
SELECT 예약.고객ID, 비행편.도착지
FROM 예약,비행편,운행,비행기,항공사
WHERE 예약.비행편_코드=비행편.비행편_코드 AND 비행편.비행편_코드 = 운행.비행편_코드
AND 운행.비행기_번호=비행기.비행기_번호 
AND 비행기.항공사ID =항공사.항공사ID 
MINUS
/*항공사_이름이 'ASIANA' 인 비행기를 타는 고객의 고객ID와 도착지를 검색하라*/
SELECT 예약.고객ID, 비행편.도착지
FROM 예약,비행편,운행,비행기,항공사
WHERE 예약.비행편_코드=비행편.비행편_코드 AND 비행편.비행편_코드 = 운행.비행편_코드
AND 운행.비행기_번호=비행기.비행기_번호 
AND 비행기.항공사ID =항공사.항공사ID 
AND 항공사.항공사_이름='ASIANA';



