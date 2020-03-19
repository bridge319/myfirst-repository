use choose;
create table teacher(
teacher_no char(10) primary key,
teacher_name char(10) not null,			#教师姓名不允许为空
teacher_contact char(20) not null			#教师联系方式名不允许为空
)engine=InnoDB default charset=gbk;
create table classes(
class_no int auto_increment primary key,
class_name char(20) not null unique,		#班级名不允许为空、且不允许重复
department_name char(20) not null		#院系名不允许为空
)engine=InnoDB default charset=gbk;
create table course(
course_no int auto_increment primary key,
course_name char(10) not null, 			#课程名允许重复
up_limit int default 60,					#课程上限设置默认值为60
description text not null,					#课程的描述信息为文本字符串text，且不能为空
status char(6) default '未审核',			#课程状态的默认值为“未审核”
teacher_no char(10) not null unique,		#唯一性约束实现教师与课程之间1:1关系
constraint course_teacher_fk foreign key(teacher_no) references teacher(teacher_no)
)engine=InnoDB default charset=gbk;
create table student(
student_no char(11) primary key,			#学号不允许重复
student_name char(10) not null,			#学生姓名不允许为空
student_contact char(20) not null,			#学生联系方式不允许为空
class_no int ,							#学生的班级允许为空
constraint student_class_fk foreign key (class_no) references classes(class_no)
)engine=InnoDB default charset=gbk;
create table choose(
choose_no int auto_increment primary key,
student_no char(11) not null,				#学生学号不允许为空
course_no int not null, 					#课程号不允许为空
score tinyint unsigned,
choose_time datetime not null,			#选课时间可由now()函数自动生成
constraint choose_student_fk foreign key(student_no) references student(student_no),
constraint choose_course_fk foreign key(course_no) references course(course