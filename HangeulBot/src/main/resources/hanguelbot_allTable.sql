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
);


