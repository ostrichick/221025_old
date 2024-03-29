
/* Drop Tables */

DROP TABLE BLOG_ATTACHMENT CASCADE CONSTRAINTS;
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE BLOG_POST CASCADE CONSTRAINTS;
DROP TABLE BLOG_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE BLOG_INFO CASCADE CONSTRAINTS;
DROP TABLE MEMBER_INFO CASCADE CONSTRAINTS;




/* Create Tables */

-- 첨부파일
CREATE TABLE BLOG_ATTACHMENT
(
	-- 첨부파일 관리 번호
	ATTACHMENT_ID number NOT NULL,
	-- 게시글 관리 번호
	POST_ID number NOT NULL,
	-- 원본 파일명
	ATTACH_ORIGINAL_NAME varchar2(120) NOT NULL,
	-- 서버 파일명
	ATTACH_SERVER_NAME varchar2(120) NOT NULL,
	PRIMARY KEY (ATTACHMENT_ID)
);


-- 블로그 카테고리
CREATE TABLE BLOG_CATEGORY
(
	-- 블로그 주소
	BLOG_URL char(20) NOT NULL UNIQUE,
	-- 카테고리 관리 코드 : 기본 카테고리 (카테고리 없음) = 0001
	CATEGORY_ID number DEFAULT 0001 NOT NULL,
	-- 카테고리 이름
	CATEGORY_NAME varchar2(60) NOT NULL UNIQUE,
	-- 외부 노출용 카테고리 주제 
	CATEGORY_TOPIC varchar2(60),
	PRIMARY KEY (CATEGORY_ID)
);


-- 블로그 정보
CREATE TABLE BLOG_INFO
(
	-- 블로그 주소
	BLOG_URL char(20) NOT NULL UNIQUE,
	-- 기본 제공 템플릿 사용 여부
	BLOG_SKIN char(2) DEFAULT 'N' NOT NULL,
	-- 기본 제공 템플릿 아이디
	BLOG_TEMPLETE_ID number
);


-- 블로그 게시글
CREATE TABLE BLOG_POST
(
	-- 게시글 관리 번호
	POST_ID number NOT NULL,
	-- 카테고리 이름
	CATEGORY_NAME varchar2(60) NOT NULL UNIQUE,
	-- 게시글 제목
	POST_TITLE varchar2(120) NOT NULL,
	-- 게시글 내용
	POST_CONTENT varchar2(3000),
	-- 게시글 공개 여부
	POST_VISIBLE char(2) DEFAULT 'Y' NOT NULL,
	-- 댓글 허용 여부
	POST_ALLOW_COMMENT char(2) DEFAULT 'Y' NOT NULL,
	-- 게시일
	POST_DATE date NOT NULL,
	-- 블로그 주소
	BLOG_URL char(20) NOT NULL UNIQUE,
	PRIMARY KEY (POST_ID)
);


-- 댓글 영역
CREATE TABLE COMMENTS
(
	-- 게시글 관리 번호
	POST_ID number NOT NULL,
	-- 댓글 관리번호
	COMMENT_ID number NOT NULL,
	-- 작성자
	COMMENT_WRITER varchar2(30) NOT NULL,
	-- 댓글 비밀번호
	COMMENT_PW varchar2(30) NOT NULL,
	-- 내용
	COMMENT_CONTENT varchar2(3000),
	-- 비밀댓글 여부
	COMMENT_SECRET char(2) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (COMMENT_ID)
);


-- 회원정보
CREATE TABLE MEMBER_INFO
(
	-- 회원 아이디
	MEMBER_ID char(20) NOT NULL,
	-- 회원 이메일
	MEMBER_EMAIL char(30) NOT NULL UNIQUE,
	-- 블로그 주소
	BLOG_URL char(20) NOT NULL UNIQUE,
	-- 닉네임
	MEMBER_NICKNAME varchar2(30) NOT NULL UNIQUE,
	-- 회원가입일
	REG_DATE date NOT NULL,
	PRIMARY KEY (MEMBER_ID)
);



/* Create Foreign Keys */

ALTER TABLE BLOG_POST
	ADD FOREIGN KEY (CATEGORY_NAME)
	REFERENCES BLOG_CATEGORY (CATEGORY_NAME)
;


ALTER TABLE BLOG_CATEGORY
	ADD FOREIGN KEY (BLOG_URL)
	REFERENCES BLOG_INFO (BLOG_URL)
;


ALTER TABLE BLOG_POST
	ADD FOREIGN KEY (BLOG_URL)
	REFERENCES BLOG_INFO (BLOG_URL)
;


ALTER TABLE BLOG_ATTACHMENT
	ADD FOREIGN KEY (POST_ID)
	REFERENCES BLOG_POST (POST_ID)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (POST_ID)
	REFERENCES BLOG_POST (POST_ID)
;


ALTER TABLE BLOG_INFO
	ADD FOREIGN KEY (BLOG_URL)
	REFERENCES MEMBER_INFO (BLOG_URL)
;



/* Comments */

COMMENT ON TABLE BLOG_ATTACHMENT IS '첨부파일';
COMMENT ON COLUMN BLOG_ATTACHMENT.ATTACHMENT_ID IS '첨부파일 관리 번호';
COMMENT ON COLUMN BLOG_ATTACHMENT.POST_ID IS '게시글 관리 번호';
COMMENT ON COLUMN BLOG_ATTACHMENT.ATTACH_ORIGINAL_NAME IS '원본 파일명';
COMMENT ON COLUMN BLOG_ATTACHMENT.ATTACH_SERVER_NAME IS '서버 파일명';
COMMENT ON TABLE BLOG_CATEGORY IS '블로그 카테고리';
COMMENT ON COLUMN BLOG_CATEGORY.BLOG_URL IS '블로그 주소';
COMMENT ON COLUMN BLOG_CATEGORY.CATEGORY_ID IS '카테고리 관리 코드 : 기본 카테고리 (카테고리 없음) = 0001';
COMMENT ON COLUMN BLOG_CATEGORY.CATEGORY_NAME IS '카테고리 이름';
COMMENT ON COLUMN BLOG_CATEGORY.CATEGORY_TOPIC IS '외부 노출용 카테고리 주제 ';
COMMENT ON TABLE BLOG_INFO IS '블로그 정보';
COMMENT ON COLUMN BLOG_INFO.BLOG_URL IS '블로그 주소';
COMMENT ON COLUMN BLOG_INFO.BLOG_SKIN IS '기본 제공 템플릿 사용 여부';
COMMENT ON COLUMN BLOG_INFO.BLOG_TEMPLETE_ID IS '기본 제공 템플릿 아이디';
COMMENT ON TABLE BLOG_POST IS '블로그 게시글';
COMMENT ON COLUMN BLOG_POST.POST_ID IS '게시글 관리 번호';
COMMENT ON COLUMN BLOG_POST.CATEGORY_NAME IS '카테고리 이름';
COMMENT ON COLUMN BLOG_POST.POST_TITLE IS '게시글 제목';
COMMENT ON COLUMN BLOG_POST.POST_CONTENT IS '게시글 내용';
COMMENT ON COLUMN BLOG_POST.POST_VISIBLE IS '게시글 공개 여부';
COMMENT ON COLUMN BLOG_POST.POST_ALLOW_COMMENT IS '댓글 허용 여부';
COMMENT ON COLUMN BLOG_POST.POST_DATE IS '게시일';
COMMENT ON COLUMN BLOG_POST.BLOG_URL IS '블로그 주소';
COMMENT ON TABLE COMMENTS IS '댓글 영역';
COMMENT ON COLUMN COMMENTS.POST_ID IS '게시글 관리 번호';
COMMENT ON COLUMN COMMENTS.COMMENT_ID IS '댓글 관리번호';
COMMENT ON COLUMN COMMENTS.COMMENT_WRITER IS '작성자';
COMMENT ON COLUMN COMMENTS.COMMENT_PW IS '댓글 비밀번호';
COMMENT ON COLUMN COMMENTS.COMMENT_CONTENT IS '내용';
COMMENT ON COLUMN COMMENTS.COMMENT_SECRET IS '비밀댓글 여부';
COMMENT ON TABLE MEMBER_INFO IS '회원정보';
COMMENT ON COLUMN MEMBER_INFO.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER_INFO.MEMBER_EMAIL IS '회원 이메일';
COMMENT ON COLUMN MEMBER_INFO.BLOG_URL IS '블로그 주소';
COMMENT ON COLUMN MEMBER_INFO.MEMBER_NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER_INFO.REG_DATE IS '회원가입일';



