-- 유저 테이블
CREATE TABLE USER_TBL
(
    USERID          VARCHAR2(50)    NOT NULL,   -- 아이디
    USERPW          VARCHAR2(50)    NOT NULL,   -- 비밀번호
    NAME            VARCHAR2(50),               -- 이름
    EMAIL           VARCHAR2(100),              -- 이메일
    ADDRESS         VARCHAR2(200),              -- 주소
    PHONENUMBER     VARCHAR2(50),               -- 핸드폰번호
    BIRTHDATE       DATE,                       -- 생년월일
    PRIMARY KEY(USERID)
);

SELECT * FROM USER_TBL;

-- 대출 테이블
CREATE TABLE BORROW_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,  -- 대출코드(ISBN-USERID 형식)
    ISBN        VARCHAR2(50),               -- 북코드
    TITLE       VARCHAR2(300),              -- 책이름
    USERID      VARCHAR2(50)    NOT NULL,   -- 아이디
    BRDATE      DATE,                       -- 대출일
    RTDATE      DATE,                       -- 반납예정일
    BREXTENSION VARCHAR2(20),               -- 대출연장
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);


SELECT * FROM BORROW_TBL;
commit;
-- 예약 테이블
CREATE TABLE RESERVE_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,  -- 대출코드(ISBN-USERID 형식)
    USERID      VARCHAR2(50)     NOT NULL,  -- 아이디
    ISBN        VARCHAR2(50),               -- 북코드
    RSDATE      DATE,                       -- 예약일
    RSSTATUS    VARCHAR2(20),               -- 대기상태(W:반납일까지 대기상태, L:예약자 유예기간 상태(반납일+3))
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);
select * from reserve_tbl;
commit;
insert into reserve_tbl values('9791159488665-ljw', 'ljw', '9791159488665', sysdate, 'W');
delete from reserve_tbl where rsstatus='W';

 -- 독자 서평 테이블 (도서 상세 페이지)
 CREATE TABLE REVIEW_TBL
 (
     REGDATE         DATE,                       -- 등록일
     USERID          VARCHAR2(50)    NOT NULL,   -- 작성자 아이디
     REVIEW          VARCHAR2(500)   NOT NULL,   -- 독자 서평
     ISBN            VARCHAR2(50)    NOT NULL,   -- 해당 도서 ISBN
     PRIMARY KEY(USERID, ISBN),
     FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
 );
SELECT * FROM REVIEW_TBL;
 BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'UPDATE_BRSTATUS_JOB',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN
                               UPDATE BORROW_TBL
                               SET BRSTATUS = ''F''
                               WHERE RTDATE <= SYSDATE;
                           END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=HOURLY; INTERVAL=1',
        enabled         => TRUE
    );
    END;
    
 BEGIN
  DBMS_SCHEDULER.DROP_JOB (
    job_name        => 'UPDATE_BRSTATUS_JOB', -- 삭제하려는 JOB 이름으로 변경해야 함
    force           => TRUE
  );
 END;
 
 SELECT job_name, job_type, enabled, repeat_interval
 FROM dba_scheduler_jobs
 WHERE job_name = 'UPDATE_BRSTATUS_JOB';
 

COMMIT;
SET AUTOCOMMIT ON;