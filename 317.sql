use choose;
create table teacher(
teacher_no char(10) primary key,
teacher_name char(10) not null,			#��ʦ����������Ϊ��
teacher_contact char(20) not null			#��ʦ��ϵ��ʽ��������Ϊ��
)engine=InnoDB default charset=gbk;
create table classes(
class_no int auto_increment primary key,
class_name char(20) not null unique,		#�༶��������Ϊ�ա��Ҳ������ظ�
department_name char(20) not null		#Ժϵ��������Ϊ��
)engine=InnoDB default charset=gbk;
create table course(
course_no int auto_increment primary key,
course_name char(10) not null, 			#�γ��������ظ�
up_limit int default 60,					#�γ���������Ĭ��ֵΪ60
description text not null,					#�γ̵�������ϢΪ�ı��ַ���text���Ҳ���Ϊ��
status char(6) default 'δ���',			#�γ�״̬��Ĭ��ֵΪ��δ��ˡ�
teacher_no char(10) not null unique,		#Ψһ��Լ��ʵ�ֽ�ʦ��γ�֮��1:1��ϵ
constraint course_teacher_fk foreign key(teacher_no) references teacher(teacher_no)
)engine=InnoDB default charset=gbk;
create table student(
student_no char(11) primary key,			#ѧ�Ų������ظ�
student_name char(10) not null,			#ѧ������������Ϊ��
student_contact char(20) not null,			#ѧ����ϵ��ʽ������Ϊ��
class_no int ,							#ѧ���İ༶����Ϊ��
constraint student_class_fk foreign key (class_no) references classes(class_no)
)engine=InnoDB default charset=gbk;
create table choose(
choose_no int auto_increment primary key,
student_no char(11) not null,				#ѧ��ѧ�Ų�����Ϊ��
course_no int not null, 					#�γ̺Ų�����Ϊ��
score tinyint unsigned,
choose_time datetime not null,			#ѡ��ʱ�����now()�����Զ�����
constraint choose_student_fk foreign key(student_no) references student(student_no),
constraint choose_course_fk foreign key(course_no) references course(course