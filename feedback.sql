SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS administrator(
	 username varchar(10) not null,
	 password varchar(16) not null,
	 name varchar(200) not null,
	email_id varchar(50) not null,
	mobile_no int(10) not null,
	 PRIMARY KEY(username)
	);


CREATE TABLE IF NOT EXISTS Branch(
	 branch varchar(100) not null,
	 PRIMARY KEY(branch)
	);

CREATE TABLE IF NOT EXISTS Department(
	 department varchar(100) not null,
	 PRIMARY KEY(department)
	);

CREATE TABLE IF NOT EXISTS Course(
	Course_id varchar(6) not null,
	Course_name varchar(200) not null,
	department varchar(100) not null,
	PRIMARY KEY(Course_id)
	);

CREATE TABLE IF NOT EXISTS facultystudentmapping(
	SID varchar(10) not null,
	EID varchar(10) not null,
	semester int(1) not null,
	Course_id varchar(200) not null,
	feedbackflag varchar(1) not null,
	name varchar(200) not null
	);
	

CREATE TABLE IF NOT EXISTS feedback(
	EID varchar(10) not null,
	name varchar(200) not null,
	feed1 int(1) not null,
	feed2 int(1) not null,
	feed3 int(1) not null,
	feed4 int(1) not null,
	feed5 int(1) not null,
	feed6 int(1) not null,
	feed7 int(1) not null,
	feed8 int(1) not null,
	feed9 int(1) not null,
	feed10 int(1) not null,
	feed11 int(1) not null,
	feed12 int(1) not null
	);


CREATE TABLE IF NOT EXISTS student(
	SID varchar(10) not null,
	name varchar(200) not null,
	branch varchar(100) not null,
	email_id varchar(50) not null,
	mobile_no int(10) not null,
	password varchar(16) not null,
	status varchar(15) not null,
	semester int(1) not null,
	image varchar(100) not null,
	PRIMARY KEY(SID)
	);




CREATE TABLE IF NOT EXISTS teacher(
	EID varchar(10) not null,
	Name varchar(200) not null,
	department varchar(100) not null,
	email_id varchar(50) not null,
	mobile_no int(10) not null,
	password varchar(16) not null,
	image varchar(100) not null,
	PRIMARY KEY(EID))
	;

ALTER TABLE course ADD FOREIGN KEY (department) REFERENCES department(department);

ALTER TABLE facultystudentmapping ADD FOREIGN KEY (Course_id) REFERENCES course(Course_id);

ALTER TABLE facultystudentmapping ADD FOREIGN KEY (EID) REFERENCES teacher(EID);

	
ALTER TABLE facultystudentmapping ADD FOREIGN KEY (SID) REFERENCES student(SID);

	
ALTER TABLE feedback ADD FOREIGN KEY (EID) REFERENCES teacher(EID);

ALTER TABLE student ADD FOREIGN KEY (branch) REFERENCES branch(branch);

ALTER TABLE teacher ADD FOREIGN KEY (department) REFERENCES department(department);



	





