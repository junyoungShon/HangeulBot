select * from hangeulbot_member;

select * from hangeulbot_member where member_email = "sk159753@nate.com";
select * from hangeulbot_member where member_password = "whd0fl";
select * from hangeulbot_member where member_nme = "김용호";

select member_email, member_password, member_name, member_baby_name, member_baby_birthday, member_baby_sex 
		from hangeulbot_member
		where member_email = 'sk159753@nate.com';