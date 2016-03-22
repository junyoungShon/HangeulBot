select * from hangeulbot_member;

select * from hangeulbot_member where member_email = "sk159753@nate.com";
select * from hangeulbot_member where member_password = "whd0fl";
select * from hangeulbot_member where member_nme = "김용호";

select member_email, member_password, member_name, member_baby_name, member_baby_birthday, member_baby_sex 
		from hangeulbot_member
		where member_email = 'sk159753@nate.com';
		
		
		insert into hangeulbot_word_log (word_id,member_email_id,spend_time,iscorrect,study_date) values ('a00001','sk159753@nate.com',60,0,to_date(sysdate,'YYYY/MM/DD'))
		
		
		
		
select * from hangeulbot_big_category;
select * from hangeulbot_mid_category;
select * from hangeulbot_word;

insert into hangeulbot_member(member_email_id, member_password, member_name, member_regist_date, member_baby_name,
								member_baby_birthday, member_baby_sex)
values('sk1597530@gmail.com', '1234', '김용호', sysdate, '똘기', '2015-03-07', 'male');