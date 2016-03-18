drop table hangeulbot_member cascade constraint;
CREATE TABLE hangeulbot_member (
	member_email            VARCHAR2(30) NOT NULL primary key,
	member_password      VARCHAR2(100) NOT NULL,
	member_name          VARCHAR2(30) NOT NULL,
	member_baby_name          VARCHAR2(30) NOT NULL,
	member_baby_birthday          DATE NOT NULL,
	member_baby_sex          VARCHAR2(10) NOT NULL
);


drop table hangeulbot_study_data cascade constraint;
CREATE TABLE hangeulbot_study_data (
	member_email            VARCHAR2(30) NOT NULL primary key,
	member_password      VARCHAR2(100) NOT NULL,
	member_name          VARCHAR2(30) NOT NULL,
	member_baby_name          VARCHAR2(30) NOT NULL,
	member_baby_birthday          DATE NOT NULL,
	member_baby_sex          VARCHAR2(10) NOT NULL
);



drop table blli_baby cascade constraint;
CREATE TABLE blli_baby (
	baby_name           VARCHAR2(50) NOT NULL ,
	baby_birthday       DATE NOT NULL ,
	baby_sex            VARCHAR2(10) NOT NULL ,
	baby_photo          VARCHAR2(200) NULL ,
	member_id           VARCHAR2(30) NOT NULL ,
	recommending 		NUMBER(1) NOT NULL, --추가됨 0은 현재비추천 1은 현재추천대상
	constraint fk_baby_member_id foreign key(member_id) references blli_member(member_id),
	constraint pk_baby primary key (member_id, baby_name)
);


drop table blli_schedule cascade constraint;
CREATE TABLE blli_schedule (
	schedule_id          NUMBER(10) NOT NULL primary key,
	member_id            VARCHAR2(30) NOT NULL ,
	baby_name            VARCHAR2(50) NOT NULL ,
	baby_color           VARCHAR2(10) NOT NULL , -- 추가
	schedule_date        DATE NOT NULL ,
	schedule_title       VARCHAR2(80) NOT NULL ,
	schedule_content     CLOB NULL ,
	schedule_location    VARCHAR2(100) NULL ,
	schedule_check_state NUMBER(2) default -1 ,
	left_days 			 NUMBER(5) default -1 , -- 추가
	constraint fk_schedule_member_id foreign key(member_id, baby_name) references blli_baby(member_id, baby_name)
);


drop table blli_auto_login cascade constraint;
CREATE TABLE blli_auto_login (
	cookie_id            VARCHAR2(300) NOT NULL primary key,
	member_id            VARCHAR2(30) NOT NULL,
	constraint fk_auto_login_member_id foreign key(member_id) references blli_member(member_id)
);


drop table blli_mid_category cascade constraint;
CREATE TABLE blli_mid_category (
	mid_category_id          VARCHAR2(30) NOT NULL, -- 추가
	mid_category         VARCHAR2(100) NOT NULL, -- VARCHAR2(50)을 VARCHAR2(100)으로 수정
	mid_category_info    VARCHAR2(250) NULL ,
	mid_category_main_photo_link VARCHAR2(300) NOT NULL ,
	mid_category_whentouse_min NUMBER(20) NULL , -- 컬럼명 변경
	mid_category_whentouse_max NUMBER(20) NULL , -- 추가
	big_category         VARCHAR2(50) NOT NULL ,
	small_product_count     NUMBER(5) default 0, -- 추가, NOT NULL을 default 0으로 변경
	constraint pk_mid_category primary key(mid_category_id, mid_category),
	constraint fk_mid_cate_big_cate foreign key(big_category) references blli_big_category(big_category)
);


------------------------------------------------------------------------------------------------------------

drop sequence blli_schedule_seq;
create sequence blli_schedule_seq;

------------------------------------------------------------------------------------------------------------

