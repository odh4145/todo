SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */
DROP TABLE IF EXISTS todo;
DROP TABLE IF EXISTS member;

/* Create Tables */
CREATE TABLE member
(
	mid int NOT NULL AUTO_INCREMENT,
	id varchar(15) NOT NULL,
	pw varchar(15) NOT NULL,
	PRIMARY KEY (mid)
);

CREATE TABLE todo
(
	tid int NOT NULL AUTO_INCREMENT,
	title varchar(30) NOT NULL,
	img varchar(100),
	tdate datetime NOT NULL default now(),
	act int NOT NULL default 0,
	mid int NOT NULL,
	PRIMARY KEY (tid)
);

/* Create Foreign Keys */
ALTER TABLE todo
	ADD FOREIGN KEY (mid)
	REFERENCES member (mid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

/* Insert Data */
insert into member(id, pw) values
('user1', '1234'),
('user2', '1234'),
('user3', '1234');

insert into todo(title, mid) values
('슬리퍼 사기', 1),
('화장실 청소하기', 1),
('주방세제 사기', 2),
('빨래 돌리기', 3);
