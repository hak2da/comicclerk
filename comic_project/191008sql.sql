

select*from COMIC_EMPLOYEE;
desc COMIC_EMPLOYEE;
drop table COMIC_EMPLOYEE CASCADE CONSTRAINTS;
drop table COMIC_WORKINGHOUR;
drop table COMIC_PRODUCTORDER;
drop table COMIC_PRODUCTSTOCK;
drop table COMIC_BOOK;
drop table COMIC_ROOM CASCADE CONSTRAINTS;
drop table COMIC_ROOMUSE;
drop table COMIC_ORDER;
drop table COMIC_PRODUCTSALES;
drop table COMIC_ROOMSALES CASCADE CONSTRAINTS;
drop table COMIC_CHAT;
drop table COMIC_LOSS;
drop table COMIC_COMMENTS;
drop table COMIC_PAY;
drop table COMIC_BOARD;
drop table COMIC_MEMBER CASCADE CONSTRAINTS;

CREATE TABLE COMIC_MEMBER (--회원
	MEMBER_ID VARCHAR2(20) PRIMARY KEY, --아이디
	MEMBER_PWD VARCHAR2(30) NOT NULL, --비밀번호
	MEMBER_NAME VARCHAR2(30) NOT NULL, --이름
	MEMBER_EMAIL VARCHAR2(30) UNIQUE, --이메일
	MEMBER_PHONE_NUMBER VARCHAR2(30) NOT NULL --연락처
);

--직원
CREATE TABLE COMIC_EMPLOYEE (
    EMPLOYEE_NUM NUMBER DEFAULT 1000 PRIMARY KEY, --직원사번
    EMPLOYEE_PWD VARCHAR(30) NOT NULL, -- 비밀번호
    EMPLOYEE_NAME VARCHAR2(30) NOT NULL, --이름
    EMPLOYEE_PHONE VARCHAR2(30) NOT NULL, --연락처
    EMPLOYEE_ACCOUNT VARCHAR2(30) NOT NULL, --계좌번호
    EMPLOYEE_STARTDAY DATE NOT NULL, --입사일
    EMPLOYEE_POSITION VARCHAR2(50) NOT NULL, --직책
    EMPLOYEE_PAY NUMBER NOT NULL--시급/월급
);
CREATE TABLE COMIC_EMP_ATTACH (
    UUID VARCHAR2(100) NOT NULL,
    UPLOADPATH VARCHAR2(200) NOT NULL,
    FILENAME VARCHAR2(100) NOT NULL,
    FILETYPE CHAR(1) DEFAULT 'I',
    EMPLOYEE_NUM NUMBER
);
select*from COMIC_EMP_ATTACH;
commit;
select*From comic_employee;

update comic_employee set employee_pay=8750;

commit;

select * from comic_employee order by employee_num;

	select roomuse_id,roomuse_num,roomuse_status,to_char(roomuse_starttime,'hh24:mi:ss')
		"starttime" from comic_roomuse;

-- 직원급여
drop table comic_pay;
CREATE TABLE COMIC_PAY (
--  PAY_NUM NUMBER, --급여번호
    PAY_WORKMONTH varchar2(30),--근무 달1910(년도,달)이런식으로 들어감
    PAY_EMP_NUM NUMBER, --직원번호
    PAY_DATE  DATE, -- 급여지급일
    PAY_TOTALTIME NUMBER, -- 누적시간(시분초에서 시로) 30분은 반올림해서 시에 추가하겟음
    CONSTRAINT COMIC_EMPLOYEE_NUM_FK FOREIGN KEY (PAY_EMP_NUM) 
    REFERENCES COMIC_EMPLOYEE (EMPLOYEE_NUM) ON DELETE CASCADE
);

select*from comic_pay;

commit;

create table tmpdate(
tmp_date date
);
select TO_CHAR(tmp_date, 'hh24:mi:ss')from tmpdate;

INSERT INTO tmpdate(tmp_date) VALUES ( TO_DATE('191123','YYMMDD'));
INSERT INTO tmpdate(tmp_date) VALUES ( TO_DATE('191123','YYMMDD'));
INSERT INTO tmpdate(tmp_date) VALUES ( TO_DATE('191123','YYMMdd'));
INSERT INTO tmpdate(tmp_date) VALUES ( TO_DATE('11-23-2012 10:26:11','MM-DD-YYYY HH24:MI:SS') );

-- 출퇴근 테이블
CREATE TABLE COMIC_WORKINGHOUR(
	WORKINGHOUR_EMP_NUM NUMBER, -- 직원번호
	WORKINGHOUR_STARTTIME DATE, -- 출근시간
	WORKINGHOUR_ENDTIME DATE, -- 퇴근시간
    WORKINGHOUR_workday DATE, -- 출근일
	CONSTRAINT COMIC_EMPLOYEE_NUM_FK_2 FOREIGN KEY (WORKINGHOUR_EMP_NUM)
    REFERENCES COMIC_EMPLOYEE (EMPLOYEE_NUM) ON DELETE CASCADE
);

insert into comic_workinghour (workinghour_emp_num,workinghour_starttime,workinghour_workday) 
values(1001,sysdate,sysdate);

select*from comic_workinghour;

select*from comic_workinghour where workinghour_starttime='19/10/08';
select*from comic_workinghour where workinghour_starttime=sysdate;

SELECT * FROM comic_workinghour 
WHERE TO_CHAR(workinghour_workday, 'YYMMDD') = '191008' and workingHour_emp_num=1001;

SELECT TO_CHAR(workinghour_starttime, 'hh:mi:ss'),TO_CHAR(workinghour_ENDtime, 'hh:mi:ss')
FROM comic_workinghour 
WHERE TO_CHAR(workinghour_workday, 'YYMMDD') = '191008' and workingHour_emp_num=1001;

select*from comic_employee;

select TO_CHAR( workinghour_workday,'yyyymmdd')"workday"
	,TO_CHAR(workinghour_starttime, 'hh24:mi:ss')"starttime"
	,TO_CHAR(workinghour_ENDtime, 'hh24:mi:ss')"endtime"
	from comic_workinghour where workinghour_workday > '191001'
	and workinghour_workday < '191030' and workinghour_emp_num=1001;

select*from comic_employee where employee_num='1001';

update COMIC_EMPLOYEE set employee_name='찬미',employee_pwd=4500
	,employee_phone=1124
	,employee_account=010554,employee_position='신입',
	employee_pay=450 where employee_num=1005;
    
    commit;





update comic_workinghour set workinghour_endtime=sysdate where workingHour_emp_num=1001;

select*from comic_workinghour ;

DELETE FROM comic_workinghour WHERE workingHour_emp_num=1001;

commit;


desc COMIC_WORKINGHOUR;

-- 상품재고테이블
CREATE TABLE COMIC_PRODUCTSTOCK (
	PRODUCT_NUM NUMBER PRIMARY KEY,  -- 상품 번호
	PRODUCT_NAME VARCHAR2(20) NOT NULL, -- 상품이름
	PRODUCT_PRICE NUMBER NOT NULL, -- 상품 판매가
	PRODUCT_QTY NUMBER NOT NULL, -- 상품 수량
	PRODUCT_CATEGORY VARCHAR2(20) NOT NULL -- 상품 종류
);

-- 상품발주테이블
CREATE TABLE COMIC_PRODUCTORDER (
	PRODUCTORDER_NUM NUMBER,  -- 발주번호
	PRODUCTORDER_PRODUCT_NUM NUMBER,  -- 상품번호
	-- productorder_name varchar(20), -- 발주상품이름
	-- productorder_category varchar(20),  -- 발주상품종류
	PRODUCTORDER_COST NUMBER, -- 발주 구매가
	PRODUCTORDER_QTY NUMBER,  -- 발주 수량
	PRODUCT_DATE DATE, -- 발주 날짜
    CONSTRAINT COMIC_PRODUCTSTOCK_NUM_FK FOREIGN KEY (PRODUCTORDER_PRODUCT_NUM )  
    REFERENCES  COMIC_PRODUCTSTOCK (PRODUCT_NUM) ON DELETE CASCADE
);

-- 책 테이블 (api 확인 필요 보류)
CREATE TABLE COMIC_BOOK (
    BOOK_NAME VARCHAR2(50),--책이름
    BOOK_LOC VARCHAR2(50),--책위치
    BOOK_PUBLISHER VARCHAR2(50),--책출판사
    -- book_serialnumber varchar2(50)--책시리얼번호
    BOOK_WRITER VARCHAR2(20),  --책 저자
    BOOK_CONTENT VARCHAR(500) , --책 소개
    BOOK_CATEGORY VARCHAR(50), -- 책 분류
    BOOK_LASTBOOK NUMBER, -- 마지막권
    BOOK_STATUS VARCHAR(20) -- 연재상태
);

select*from comic_order;
-- 방 테이블
CREATE TABLE COMIC_ROOM(
	ROOM_NUM NUMBER PRIMARY KEY, -- 방 번호 
	ROOM_PRICE NUMBER NOT NULL, -- 방 요금 
	ROOM_PPL NUMBER NOT NULL -- 방 인원수 
);

insert into comic_room values (7,200,6);

delete comic_room where room_num=7;

select *from comic_room;

-- 방 사용 테이블
-- 방 사용 off 시 해당 레코드 삭제
CREATE TABLE COMIC_ROOMUSE(
	ROOMUSE_ID VARCHAR2(20), -- 방 사용자 아이디
	ROOMUSE_NUM NUMBER, -- 방 번호
	ROOMUSE_STARTTIME DATE, -- 방 시작시간
	ROOMUSE_ENDTIME DATE, -- 방 종료시간
	ROOMUSE_STATUS VARCHAR(5) DEFAULT 'off',  -- 방 사용상태 on/off
    CONSTRAINT COMIC_ROOM_NUM_FK FOREIGN KEY (ROOMUSE_NUM)  
    REFERENCES COMIC_ROOM(ROOM_NUM) ON DELETE CASCADE--comic_room테이블의 (room_num)이 삭제될때 여기도 삭제됨 
    
);

select*from COMIC_ROOMUSE;

insert into comic_roomuse (ROOMUSE_id,ROOMUSE_num,ROOMUSE_starttime,ROOMUSE_status)
values ('anonymous',7,sysdate,'on');

update comic_roomuse set roomuse_status='off' where roomuse_num=7;

update comic_roomuse set roomuse_status='on' where roomuse_num=7;

delete comic_roomuse where roomuse_num=7;

select*from comic_roomuse order by 2;

select roomuse_starttime from comic_roomuse;

select to_date('mi',roomuse_starttime) from comic_roomuse;

desc comic_roomuse;

commit;

delete comic_roomuse where roomuse_num=1;

select to_char(roomuse_starttime,'yyyy-mm-dd hh24:mi:ss') from comic_roomuse order by 1;

desc comic_roomuse;


select roomuse_id,roomuse_num,roomuse_status,to_char(roomuse_starttime,'hh24:mi:ss')
"starttime" from comic_roomuse;



-- 일별 주문 테이블(실시간)
-- 방 계산시 초기화
CREATE TABLE COMIC_ORDER(
	ORDER_NUM NUMBER , -- 주문 번호
	ORDER_ID VARCHAR2(20), -- 주문 사용자 아이디
	ORDER_ROOMNUM  NUMBER,-- 주문 방 번호
	ORDER_TIME DATE, -- 주문 시간	
   	ORDER_PRODUCT_NUM NUMBER, -- 상품 번호
	ORDER_QTY NUMBER -- 주문 수량
);

SELECT*fROM COMIC_ORDER;

insert into comic_order (order_num,order_id,order_roomnum,order_time)values(
11,'tmehfld',2,sysdate);

insert into comic_order (order_num,order_id,order_roomnum,order_time)values(
11,'tmehfld',2,to_date(sysdate,'yyyy.mm.dd hh24:mi'));

insert into comic_order (order_num,order_id,order_roomnum,order_time)values(
11,'tmehfld',3,sysdate);

select order_id,to_char(order_time,'hh24:mi:ss')"시작시간" from comic_order where order_roomnum=3;
--date타입에서 시간을 가져오는 메서드

select*from comic_order where order_roomnum=2;

SELECT TO_CHAR(SYSDATE, 'RRRR-MM-DD HH24:MI:SS') AS "현재시간" FROM DUAL;

desc comic_order;

-- 매출테이블(상품,방 매출 테이블) 두개로 나누기로 했었음!
-- 상품 매출 테이블
CREATE TABLE COMIC_PRODUCTSALES (
    PRODUCTSALES_ID VARCHAR2(20) NOT NULL, -- 사용자 아이디
    PRODUCTSALES_QTY NUMBER  NOT NULL, -- 수량
    PRODUCTSALES_TIME DATE NOT NULL, -- 시간(결재 되면)
    PRODUCTSALES_PRODUCT VARCHAR2(20) NOT NULL, -- 상품 
    PRODUCTSALES_ORDER_PRICE NUMBER NOT NULL -- 요금
); -- 주문 상품 레코드 하나씩 계속 쌓임


-- 방 매출 테이블
CREATE TABLE COMIC_ROOMSALES(
	-- 방요금 책정만 ...
	ROOMSALES_NUM NUMBER NOT NULL, -- 방번호
	ROOMSALES_TOTALPRICE NUMBER NOT NULL,-- 방요금
	ROOMSALES_TIME DATE NOT NULL-- 시간
);


-- 채팅 테이블
CREATE TABLE COMIC_CHAT (
	CHAT_NUM NUMBER,  -- 채팅 번호 
	CHAT_ID VARCHAR(20),   -- 채팅 아이디 fk(사용자)
	CHAT_TIME DATE,  -- 채팅 시간
	CHAT_CONTENT VARCHAR(500)  -- 채팅내용
);

-- 손실테이블
CREATE TABLE COMIC_LOSS (
    	LOSS_NUM NUMBER  DEFAULT 1, -- 로스 번호
	LOSS_CATEGORY VARCHAR(20), --로스 종류 수입/지출
	LOSS_QTY NUMBER, -- 로스 수량
	LOSS_PAY NUMBER, --로스 가격,
	LOSS_PRODUCT VARCHAR(20), --로스 상품
	LOSS_DATE DATE --로스 날짜
);


-- 댓글 테이블
CREATE TABLE COMIC_COMMENTS(
    CMNT_NUM NUMBER, -- 댓글번호
    CMNT_BOARDNUM NUMBER, -- 글번호
    CMNT_CONTENT VARCHAR2(2000) NOT NULL,
    CMNT_ID VARCHAR2(30),
    CMNT_DATE DATE,
    CONSTRAINT CMNT_FK_ID FOREIGN KEY(CMNT_ID)
    REFERENCES COMIC_MEMBER(MEMBER_ID) ON DELETE CASCADE
);

-- 게시판 테이블
CREATE TABLE COMIC_BOARD(
    BOARD_NUM NUMBER PRIMARY KEY,
    BOARD_ID VARCHAR2(30) NOT NULL,
    BOARD_CONTENT VARCHAR2(2000) NOT NULL,
    BOARD_DATE DATE,
    BOARD_TITLE VARCHAR2(50) NOT NULL,
    CONSTRAINT BOARD_FK_ID FOREIGN KEY(BOARD_ID)
    REFERENCES COMIC_MEMBER(MEMBER_ID) ON DELETE CASCADE	
);

--상품주문 뷰 테이블
CREATE TABLE COMIC_ORDERVIEW(
	ORDERVIEW_NUM NUMBER PRIMARY KEY,
ORDERVIEW_CATEGORY VARCHAR2(30) NOT NULL,
ORDERVIEW_PRODUCT_NUM NUMBER NOT NULL,

);


-- 상품관련테이블
CREATE TABLE COMIC_ORDERVIEW_PRODUCT(
    ORDERVIEW_NUM NUMBER PRIMARY KEY,
	ORDERVIEW_PRODUCT_NUM NUMBER,
    CONSTRAINT COMIC_PRODUCTSTOCK_NUM_FK2 FOREIGN KEY (ORDERVIEW_PRODUCT_NUM)
    REFERENCES  COMIC_PRODUCTSTOCK (PRODUCT_NUM) ON DELETE CASCADE
);



insert into comic_productstock (product_num, product_name, product_price, product_qty, product_category)
values (1, '카페모카', 2200, 9999, '커피');

insert into comic_productstock (product_num, product_name, product_price, product_qty, product_category)
values ((select max(product_num) from comic_productstock)+1, '카페모카', 2200, 9999, '커피');

commit;