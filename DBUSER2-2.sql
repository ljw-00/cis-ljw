-- 대출 테이블
CREATE TABLE BORROW_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,  -- 대출코드(ISBN-USERID 형식)
    ISBN        VARCHAR2(50),               -- 북코드
    TITLE       VARCHAR2(300),              -- 책이름
    USERID      VARCHAR2(50)     NOT NULL,  -- 아이디
    BRDATE      DATE,                       -- 대출일
    DUEDATE     DATE,                       -- 반납예정일
    RENEW       VARCHAR2(20),               -- 대출연장 (F > T) 연장은 한 번만 가능
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);

-- 예약 테이블
CREATE TABLE RESERVE_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,
    SEQ         NUMBER           NOT NULL,  -- 순번
    USERID      VARCHAR2(50)     NOT NULL,  -- 아이디
    ISBN        VARCHAR2(50)     NOT NULL,  -- 북코드
    RSDATE      DATE,                       -- 예약일
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);

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
 
 -- 독자 서평 테이블 (도서 상세 페이지)
 CREATE TABLE REVIEW_TBL
 (
     REGDATE         DATE,                    -- 등록일
     USERID          VARCHAR2(50)    NOT NULL,   -- 작성자 아이디
     REVIEW          VARCHAR2(500)   NOT NULL,   -- 독자 서평
     ISBN            VARCHAR2(50)    NOT NULL,   -- 해당 도서 ISBN
     PRIMARY KEY(USERID, ISBN),
     FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
 );
 
 
 -- 반납 기한 지날 시 자동 반납 처리
 -- 1. 삭제 작업을 수행하는 PL/SQL 프로시저 생성
 CREATE OR REPLACE PROCEDURE DELETE_BORROW_ROWS AS
 BEGIN
  DELETE FROM BORROW_TBL WHERE RTDATE <= SYSDATE;
  COMMIT; -- 변경 사항을 커밋하여 영구적으로 데이터를 삭제합니다.
 EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK; -- 오류 발생 시 롤백하여 삭제를 취소합니다.
    RAISE; -- 오류를 다시 호출자에게 던져줍니다.
 END;
 
 -- 2. 스케쥴러 작업 생성 후 job_action 파라미터에 생성한 프로시저 지정
 BEGIN
  DBMS_SCHEDULER.CREATE_JOB(
    job_name        => 'DELETE_BORROW_ROWS_JOB',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN DELETE_BORROW_ROWS; END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=MINUTELY; INTERVAL=1',
    enabled         => TRUE
  );
 END;
 
 -- 삭제 문법 
 BEGIN
  DBMS_SCHEDULER.DROP_JOB (
    job_name        => 'UPDATE_BRSTATUS_JOB', -- 삭제하려는 JOB 이름으로 변경해야 함
    force           => TRUE
  );
 END;
  
 -- 조회 문법
 SELECT job_name, job_type, enabled, repeat_interval
 FROM dba_scheduler_jobs
 WHERE job_name = 'DELETE_BORROW_ROWS_JOB';
 

 COMMIT;
 SET AUTOCOMMIT ON;
 
 INSERT INTO user_tbl VALUES
 ('cis', '1111', '최이서', 'cis@gmail.com', '서울', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('yhs', '2222', '연홍시', 'yhs@gmail.com', '서울', '000-2222-2222', '2020-07-22');
 
 INSERT INTO user_tbl VALUES
 ('ljw', '3333', '이지우', 'ljw@gmail.com', '서울', '000-3333-3333', '2021-06-03');
 
 INSERT INTO user_tbl VALUES
 ('njs', '4444', '나준식', 'njs@gmail.com', '서울', '000-4444-4444', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('jsh', '5555', '정성훈', 'jsh@gmail.com', '서울', '000-5555-5555', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('aaa', '6666', '가가', 'aaa@gmail.com', '서울', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('bbb', '7777', '나나', 'bbb@gmail.com', '서울', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('ccc', '8888', '다다', 'ccc@gmail.com', '서울', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('ddd', '9999', '라라', 'ddd@gmail.com', '서울', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('eee', '1010', '마마', 'eee@gmail.com', '서울', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('fff', '1111', '바바', 'fff@gmail.com', '서울', '000-1111-1111', '1996-03-24');