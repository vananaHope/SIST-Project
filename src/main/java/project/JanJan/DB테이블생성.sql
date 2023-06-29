CREATE TABLE MEMBER_INFO(
MEMID varchar2(30) PRIMARY KEY,
PASSWORD varchar2(50),
NAME VARCHAR2(20),
ADDRESS VARCHAR2(50),
CONTACT VARCHAR2(30),
EMAIL VARCHAR2(30)
);

INSERT INTO MEMBER_INFO values('vanana','7777','노현우','서울 강서구','010-1111-2345','ggg1234@naver.com');

CREATE TABLE ALCOHOL(
ALCOHOL_NAME VARCHAR2(50),
TYPE_NAME VARCHAR2(50),
ALCOHOL_DEG NUMBER,
ALCOHOL_PRICE NUMBER,
ALCOHOL_VOL NUMBER,
EXPDATE DATE,
STORAGE_WAY VARCHAR2(30),
ALCOHOL_IMG VARCHAR2(100),
ALCOHOL_DES VARCHAR2(50),
SALE_YN VARCHAR2(10),
CONSTRAINT alcohol_pk PRIMARY KEY (ALCOHOL_NAME),
CONSTRAINT alcohol_fk FOREIGN KEY (type_name) REFERENCES alcohol_type(type_name)
);

CREATE TABLE alcohol_type (
TYPE_NAME VARCHAR2(50) PRIMARY key
);

INSERT INTO alcohol_type values('탁주');
INSERT INTO alcohol_type values('청주');
INSERT INTO alcohol_type values('증류주');
INSERT INTO alcohol_type values('약주');
INSERT INTO alcohol_type values('과실주');
INSERT INTO alcohol_type values('와인');

INSERT ALL
INTO alcohol values('매실원주','과실주',13,6200,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/매실원주.jpg','#달콤한 매실주','Y')
INTO alcohol values('고흥유자주','과실주',8,13000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/고흥유자주.jpg','#달콤한 유자향','N')
INTO alcohol values('신애유자','과실주',5,5900,330,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/신애유자.jpg','#레모네이드에 사과 한 조각','N')
INTO alcohol values('요새로제','과실주',6,17900,750,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/요새로제.jpg','#달콤한 사과향','Y')
INTO alcohol values('댄싱파파','과실주',7,5900,330,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/댄싱파파.jpg','#달지 않고 깔금','Y')
INTO alcohol values('겨울소주','증류주',25,10000,360,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/겨울소주.jpg','#부드러운 곡물향','N')
INTO alcohol values('경복궁소주','증류주',40,29900,350,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/경복궁소주.jpg','#부드러운 곡물향','N')
INTO alcohol values('고운달오크','증류주',52,180000,350,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/고운달오크.jpg','#부드러운 고도수 술','N')
INTO alcohol values('고운달백자','증류주',52,180000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/고운달백자.jpg','#부드러운 고도수 술','N')
INTO alcohol values('아리아리','증류주',40,53000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/아리아리.jpg','#입안 가득 퍼지는 화사함','N')
INTO alcohol values('박재서 명인 안동소주','증류주',35,7500,360,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/박재서명인안동소주.jpg','#식품명인의 술','N')
INTO alcohol values('두레앙','증류주',35,30000,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/두레앙.jpg','#달콤하고 진해요','N')
INTO alcohol values('성산포소주','증류주',25,8500,360,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/성산포소주.jpg','#해산물과 잘 어울려요','N')
INTO alcohol values('미르','증류주',54,35000,360,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/미르.jpg','#쌀 소주 끝판왕','N')
INTO alcohol values('허니문와인','와인',10,35000,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/허니문와인.jpg','#산뜻한 단맛','N')
INTO alcohol values('허니비와인','와인',10,35000,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/허니비와인.jpg','#싱그러운 향','N')
INTO alcohol values('금이산 복숭아 와인','와인',12,16000,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/금이산복숭아와인.jpg','#복숭아로 만든 와인','N')
INTO alcohol values('추사 애플 와인','와인',12,22000,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/추사애플와인.jpg','#사과로 만든 와인','N')
INTO alcohol values('오미로제 결 스파클링 와인 선물 세트','와인',12,200000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/오미로제 결 스파클링 와인 선물 세트.jpg','#한국 와인의 자존심','N')
INTO alcohol values('오미로제 결 스파클링 와인','와인',12,160000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/오미로제 결 스파클링 와인.jpg','#세계최초 오미자 스파클링','N')
INTO alcohol values('길벗 아펠바인 사과와인','와인',7,16000,750,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/길벗아펠바인사과와인.jpg','#레몬주스 마시듯','N')
INTO alcohol values('샤토미소 퀸 아이스 와인','와인',9,22000,750,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/샤토미소 퀸 아이스 와인.jpg','#갓 딴 사과의 싱그러움','N')
INTO alcohol values('고도리 화이트 와인','와인',10,20000,750,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/고도리 화이트 와인.jpg','#거봉으로 만든 와인','N')
INTO alcohol values('배꽃 필 무렵','탁주',9,50000,140,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/배꽃필무렵.jpg','#떠먹는 막걸리','N')
INTO alcohol values('담은','탁주',6,33000,750,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/담은.jpg','#카페라떼처럼 부드러운','N')
INTO alcohol values('나루 생 막걸리','탁주',6,21000,550,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/나루 생 막걸리.jpg','#시원한 참외향','N')
INTO alcohol values('복순도가 손 막걸리','탁주',10,36000,550,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/복순도가 손 막걸리.jpg','#샴페인 막걸리','N')
INTO alcohol values('백련 미스티 막걸리','탁주',7,4500,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/백련 미스티.jpg','#하얀 연꽃이 들어갔어요','N')INTO alcohol values('부자 막걸리','탁주',8,4900,350,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/부자 막걸리.jpg','#구수한 누룩 풍미','N')
INTO alcohol values('벗이랑 버찌','탁주',10,12000,350,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/벗이랑 버찌.jpg','#카레맛 안나요','N')
INTO alcohol values('벗이랑 강황','탁주',10,12000,350,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/벗이랑 강황.jpg','#홍국쌀 버찌 크로스','N')
INTO alcohol values('문삼이공 잣','탁주',9,22000,750,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/문삼이공 잣.jpg','#잣 향 가득','N')
INTO alcohol values('진양주','약주',16,15000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/진양주.jpg','#아몬드의 고소한 풍미','N')
INTO alcohol values('술아 국화주','약주',13,20000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/술아국화주.jpg','#가을에 어울리는 술','N')
INTO alcohol values('면천 두견주','약주',18,52000,700,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/면천두견주.jpg','#고려시대 약주','Y')
INTO alcohol values('천비향 약주','약주',15,32000,700,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/천비향약주.jpg','#연예인도 반한 술','N')
INTO alcohol values('하심당 석탄주','약주',11,20000,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/석탄주.jpg','#삼키기 아쉬운 술','N')
INTO alcohol values('니모메','약주',11,11000,375,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/니모메.jpg','#귤피가 들어간 술','N')
INTO alcohol values('우포','약주',12,7000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/우포.png','#깔끔한 단맛','N')
INTO alcohol values('하타','청주',16,20000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/하타.jpg','#백제에서 일본으로','Y')
INTO alcohol values('우렁이쌀 청주','청주',14,16000,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/우렁이쌀 청주.jpg','#100년 역사 양조장','N')
INTO alcohol values('삼양춘 청주','청주',15,17500,500,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/삼양춘 청주.jpg','#3번 빚은 술','N')
INTO alcohol values('한청','청주',15,20000,700,sysdate + (INTERVAL'2'YEAR),'상온보관','./img/alcohol/한청.jpg','#새콤달콤한 청주','Y')
SELECT * FROM DUAL;

SELECT * FROM alcohol;

SELECT LEVEL, a.*
FROM alcohol a
START WITH type_name = '과실주'
CONNECT BY type_name = alcohol_name;

SELECT * 
FROM ALCOHOL
WHERE ALCOHOL_PRICE BETWEEN 10000 AND 20000;

CREATE SEQUENCE ALCOHOL_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE SNACK (
SNACK_ID VARCHAR2(50),
SNACK_NAME VARCHAR2(50),
CATEGORY_ID VARCHAR2(50),
SNACK_BRAND VARCHAR2(50),
SNACK_PRICE NUMBER,
SNACK_IMG VARCHAR2(50),
SNACK_DES VARCHAR2(50),
CONSTRAINT snack_pk PRIMARY KEY (snack_id),
CONSTRAINT snack_fk FOREIGN KEY (category_id) REFERENCES snack_category(category_id),
CONSTRAINT snack_fk1 FOREIGN KEY (category_id) REFERENCES snack(SNACK_ID)
);

CREATE TABLE SNACK_CATEGORY (
CATEGORY_ID VARCHAR2(50) PRIMARY KEY,
CATEGORY_NAME VARCHAR2(50)
);


INSERT INTO snack values('어묵탕','탕/국/찌개','비비고',10000,'/source','어묵탕입니다.');

CREATE TABLE CART (
CART_NUM VARCHAR2(50) PRIMARY KEY,
CNT NUMBER,
TOTAL_PRICE NUMBER,
SNACK_NAME VARCHAR2(50),
ALCOHOL_NAME VARCHAR2(50),
MEMID varchar2(30),
FOREIGN KEY (SNACK_NAME) REFERENCES SNACK(SNACK_NAME),
FOREIGN KEY (ALCOHOL_NAME) REFERENCES ALCOHOL(ALCOHOL_NAME),
FOREIGN KEY (MEMID) REFERENCES MEMBER_INFO(MEMID)
);

CREATE TABLE SUB_PRODUCT (
SUB_PRODNUM VARCHAR2(50) PRIMARY KEY,
SNACK_NAME VARCHAR2(50),
ALCOHOL_NAME VARCHAR2(50),
FOREIGN KEY (SNACK_NAME) REFERENCES SNACK(SNACK_NAME),
FOREIGN KEY (ALCOHOL_NAME) REFERENCES ALCOHOL(ALCOHOL_NAME)
);

CREATE TABLE SUB_PAY (
SUB_PAYNUM VARCHAR2(50) PRIMARY KEY,
SUB_PAYDATE DATE,
SUB_PAYARRIVE DATE,
SUB_PAYMETHOD VARCHAR2(30),
MEMID varchar2(30),
SUB_PRODNUM VARCHAR2(50),
FOREIGN KEY (MEMID) REFERENCES MEMBER_INFO(MEMID),
FOREIGN KEY (SUB_PRODNUM) REFERENCES SUB_PRODUCT(SUB_PRODNUM)
);

CREATE TABLE SUB_MEM (
SUB_PAYNUM VARCHAR2(50) PRIMARY KEY,
FOREIGN KEY (SUB_PAYNUM) REFERENCES SUB_PAY(SUB_PAYNUM)
);

CREATE TABLE SUB_DELIVERY (
SUB_DEVNUM VARCHAR2(50) PRIMARY KEY,
SUB_PAYNUM VARCHAR2(50),
FOREIGN KEY (SUB_PAYNUM) REFERENCES SUB_PAY(SUB_PAYNUM)
);


CREATE TABLE ORDERS (
ORDERS_NUM VARCHAR2(50) PRIMARY KEY,
CART_NUM VARCHAR2(50),
ORDERS_DATE DATE,
FOREIGN KEY (CART_NUM) REFERENCES CART(CART_NUM)
);

CREATE TABLE STORE_PAY (
ORDERS_NUM VARCHAR2(50) PRIMARY KEY,
PAY_METHOD VARCHAR2(20),
FOREIGN KEY (ORDERS_NUM) REFERENCES ORDERS(ORDERS_NUM)
);

CREATE TABLE STORE_DELIVERY (
DELIVERY_NUM VARCHAR2(50) PRIMARY KEY,
ORDERS_NUM VARCHAR2(50),
FOREIGN KEY (ORDERS_NUM) REFERENCES ORDERS(ORDERS_NUM)
);



DROP TABLE ALCOHOL; 
DROP TABLE ALCOHOL_TYPE; 
DROP TABLE MEMBER_INFO; 
DROP TABLE SNACK ; 
DROP TABLE SNACK_CATEGORY ;
DROP TABLE CART ; 
DROP TABLE SUB_PRODUCT ; 
DROP TABLE SUB_PAY ; 
DROP TABLE SUB_MEM ; 
DROP TABLE SUB_DELIVERY ; 
DROP TABLE ORDERS ; 
DROP TABLE STORE_PAY ; 
DROP TABLE STORE_DELIVERY ; 
DROP TABLE PRICEFILTER ;
DROP TABLE DEGREEFILTER ;


