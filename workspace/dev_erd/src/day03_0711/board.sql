
/* Drop Tables */

DROP TABLE ATTACH CASCADE CONSTRAINTS;
DROP TABLE COMMENT_section CASCADE CONSTRAINTS;
DROP TABLE Board CASCADE CONSTRAINTS;
DROP TABLE MEMBER_INFO CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ATTACH
(
	ATTACH_ID number NOT NULL,
	ORIGINAL_FILE_NAME varchar2(300) NOT NULL,
	SYSTEM_FILE_NAME varchar2(300) NOT NULL,
	-- 
	-- 
	-- 
	BOARD_ID number NOT NULL,
	COMMENT_ID number NOT NULL,
	PRIMARY KEY (ATTACH_ID)
);


CREATE TABLE Board
(
	-- 
	-- 
	-- 
	BOARD_ID number NOT NULL,
	TITLE varchar2(90) NOT NULL,
	MEMBER_NICKNAME varchar2(60) NOT NULL UNIQUE,
	CONTENT varchar2(3000),
	WRITE_DATE date NOT NULL,
	-- 1=YES
	-- 0=NO
	Hidden_post char(1) DEFAULT '0',
	PRIMARY KEY (BOARD_ID)
);


CREATE TABLE COMMENT_section
(
	COMMENT_ID number NOT NULL,
	-- 
	-- 
	-- 
	BOARD_ID number NOT NULL,
	COMMENT_CONTENT varchar2(1500),
	COMMENT_AUTHOR varchar2(30) NOT NULL,
	COMMENT_DATE date NOT NULL,
	PRIMARY KEY (COMMENT_ID, BOARD_ID)
);


CREATE TABLE MEMBER_INFO
(
	MEMBER_KEY number NOT NULL,
	MEMBER_ID varchar2(60) NOT NULL UNIQUE,
	MEMBER_NAME varchar2(21) NOT NULL,
	MEMBER_NICKNAME varchar2(60) UNIQUE,
	MEMBER_PHONE char(15) UNIQUE,
	MEMBER_REGDATE date NOT NULL,
	-- 1=YES
	-- 0=NO
	DELEDE_AUTH char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (MEMBER_KEY)
);



/* Create Foreign Keys */

ALTER TABLE COMMENT_section
	ADD FOREIGN KEY (BOARD_ID)
	REFERENCES Board (BOARD_ID)
;


ALTER TABLE ATTACH
	ADD FOREIGN KEY (BOARD_ID, COMMENT_ID)
	REFERENCES COMMENT_section (BOARD_ID, COMMENT_ID)
;


ALTER TABLE Board
	ADD FOREIGN KEY (MEMBER_NICKNAME)
	REFERENCES MEMBER_INFO (MEMBER_NICKNAME)
;



/* Comments */

COMMENT ON COLUMN ATTACH.BOARD_ID IS '

';
COMMENT ON COLUMN Board.BOARD_ID IS '

';
COMMENT ON COLUMN Board.Hidden_post IS '1=YES
0=NO';
COMMENT ON COLUMN COMMENT_section.BOARD_ID IS '

';
COMMENT ON COLUMN MEMBER_INFO.DELEDE_AUTH IS '1=YES
0=NO';



