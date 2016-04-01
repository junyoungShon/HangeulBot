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

		select word_id,spend_time,iscorrect,word,study_date
		from(
			select ceil(rownum/5) as page , word_id,spend_time,iscorrect,word,study_date
			from(
				select hwl.word_id as word_id ,hwl.spend_time as spend_time,hwl.iscorrect as iscorrect,hw.word as word,hwl.study_date as study_date
				from hangeulbot_word_log hwl,hangeulbot_word hw
				where hwl.word_id = hw.word_id and hwl.member_email_id = 'sk159753@nate.com' order by hwl.study_date desc
			)
		)
		where page = 1
		
				select distinct hmc.mid_category as mid_category
		from hangeulbot_word_log hwl, hangeulbot_mid_category hmc, hangeulbot_word hw
		where hwl.member_email_id = #{value} and hwl.word_id = hw.word_id and hw.mid_category_id = hmc.mid_category_id
		
				select distinct hmc.mid_category as mid_category
		from hangeulbot_word_log hwl, hangeulbot_mid_category hmc, hangeulbot_word hw
		where hwl.member_email_id = 'sk159753@nate.com' and hwl.word_id = hw.word_id and hw.mid_category_id = hmc.mid_category_id
		
				
		select count(*)
		from hangeulbot_word_log hwl, hangeulbot_mid_category hmc, hangeulbot_word hw
		where hwl.member_email_id = 'sk159753@nate.com' and hwl.word_id = hw.word_id and hw.mid_category_id = hmc.mid_category_id and hmc.mid_category = '국기'
		
		select count(*)
		from hangeulbot_word_log hwl,hangeulbot_word hw
		where hwl.member_email_id = 'sk159753@nate.com' and hwl.word_id = hw.word_id and hw.word_grade = '4'
		
		select count(*) from hangeulbot_word_log where member_email_id = 'sk159753@nate.com' and study_date >= to_char(sysdate-7,'yyyymmdd') and iscorrect = 0
		
select sum(spend_time) from hangeulbot_word_log where member_email_id = 'sk1597530@gmail.com';
		
select avg(study_word_count) 
from (select to_char(study_date, 'yyyy-mm-dd'), count(*) as study_word_count 
		from hangeulbot_word_log where member_email_id = 'sk1597530@gmail.com' group by to_char(study_date, 'yyyy-mm-dd'));
		
		select avg(study_time) 
		from (select to_char(study_date, 'yyyy-mm-dd'), sum(spend_time) as study_time 
			from hangeulbot_word_log 
			where member_email_id = 'sk1597530@gmail.com' 
			group by to_char(study_date, 'yyyy-mm-dd'));


update hangeulbot_member 
set member_baby_total_study_time = (select sum(spend_time) from hangeulbot_word_log where member_email_id = 'sk1597530@gmail.com')
where member_email_id = 'sk1597530@gmail.com';


select mid_category_id, word_id, word, word_grade
			from hangeulbot_word
			where 2 = word_grade or word_grade = 2 + 1
			
			
update hangeulbot_member set member_baby_grade = 
(select avg(word_grade)
	from (select hw.word_grade 
			from hangeulbot_word hw, (select word_id from hangeulbot_word_log where iscorrect = 1 and member_email_id = 'sk1597530@gmail.com') hwl 
				where hw.word_id = hwl.word_id));
			
			
			
			
			
			
			