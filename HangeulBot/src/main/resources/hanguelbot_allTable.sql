drop table hangeulbot_member cascade constraint;
CREATE TABLE hangeulbot_member (
	member_email_id            VARCHAR2(60) NOT NULL primary key,
	member_password      VARCHAR2(100) NOT NULL,
	member_name          VARCHAR2(30) NOT NULL,
	member_baby_name          VARCHAR2(30) NOT NULL,
	member_baby_birthday          DATE NOT NULL,
	member_baby_sex          VARCHAR2(10) NOT NULL,
	member_baby_grade number(2,1),
	member_total_study_time NUMBER(6)
);

drop table hangeulbot_big_category cascade constraint;
CREATE TABLE hangeulbot_big_category(
	big_category_id varchar2(3) not null primary key,
	big_category varchar2(30) not null
);


drop table hangeulbot_mid_category cascade constraint;
CREATE TABLE hangeulbot_mid_category(
	big_category_id varchar2(2) not null,
	mid_category_id varchar2(6) not null primary key,
	mid_category varchar2(30) not null,
	constraint fk_big_category_id foreign key(big_category_id) references hangeulbot_big_category(big_category_id)
);
	
	
drop table hangeulbot_word cascade constraint;
CREATE TABLE hangeulbot_word(
	word varchar2(20) not null,
	word_id varchar2(20) not null primary key,
	mid_category_id varchar2(6),
	word_grade number(1),
	constraint fk_mid_category_id foreign key(mid_category_id) references hangeulbot_mid_category(mid_category_id)
);

drop table hangeulbot_word_log cascade constraint;
CREATE TABLE hangeulbot_word_log (
	member_email_id varchar2(60) not null ,
	word_id varchar2(20) not null,
	study_date date not null,
	spend_time number(3) not null,
	iscorrect number(1) not null,
	constraint pk_member foreign key(member_email_id) references hangeulbot_member(member_email_id),
	constraint pk_word primary key (member_email_id, word_id,study_date)
);

drop table hangeulbot_initial_sound cascade constraint;
CREATE TABLE hangeulbot_initial_sound (
	initial_sound_id varchar2(5) not null primary key,
	initial_sound_index number(2) not null ,
	initail_sound varchar2(6) not null
);

drop table hangeulbot_vowel cascade constraint;
CREATE TABLE hangeulbot_vowel (
	vowel_id varchar2(5) not null primary key,
	vowel_index number(2) not null ,
	vowel varchar2(6) not null
);

drop table hangeulbot_final_consonant cascade constraint;
CREATE TABLE hangeulbot_final_consonant (
	final_consonant_id varchar2(5) not null primary key,
	final_consonant_index number(2) not null ,
	final_consonant varchar2(6) not null
);

drop table hangeulbot_phonics_initial_log cascade constraint;
CREATE TABLE hangeulbot_phonics_initial_log (
	initial_sound_id varchar2(5) not null ,
	member_email_id varchar2(60) not null,
	last_update date not null,
	total_study number(4) not null,
	total_wrong_answer number(4) not null,
	total_correct_answer number(4) not null,
	constraint fk_hangeulbot_initial_sound foreign key(initial_sound_id) references hangeulbot_initial_sound(initial_sound_id),
	constraint fk_hangeulbot_member1 foreign key(member_email_id) references hangeulbot_member(member_email_id),
	constraint pk_hangeulbot_phonics_i_log primary key (initial_sound_id, member_email_id)
);

drop table hangeulbot_phonics_vowel_log cascade constraint;
CREATE TABLE hangeulbot_phonics_vowel_log (
	vowel_id varchar2(5) not null ,
	member_email_id varchar2(60) not null,
	last_update date not null,
	total_study number(4) not null,
	total_wrong_answer number(4) not null,
	total_correct_answer number(4) not null,
	constraint fk_hangeulbot_vowel foreign key(vowel_id) references hangeulbot_vowel(vowel_id),
	constraint fk_hangeulbot_member foreign key(member_email_id) references hangeulbot_member(member_email_id),
	constraint pk_hangeulbot_phonics_v_id_log primary key (vowel_id, member_email_id)
);

drop table hangeulbot_phonics_final_log cascade constraint;
CREATE TABLE hangeulbot_phonics_final_log (
	final_consonant_id varchar2(5) not null ,
	member_email_id varchar2(60) not null,
	last_update date not null,
	total_study number(4) not null,
	total_wrong_answer number(4) not null,
	total_correct_answer number(4) not null,
	constraint fk_hangeulbot_final foreign key(final_consonant_id) references hangeulbot_final_consonant(final_consonant_id),
	constraint fk_hangeulbot_member2 foreign key(member_email_id) references hangeulbot_member(member_email_id),
	constraint pk_hangeulbot_phonics_f_id_log primary key (final_consonant_id, member_email_id)
);

