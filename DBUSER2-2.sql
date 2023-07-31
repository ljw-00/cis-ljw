-- ���� ���̺�
CREATE TABLE BORROW_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,  -- �����ڵ�(ISBN-USERID ����)
    ISBN        VARCHAR2(50),               -- ���ڵ�
    TITLE       VARCHAR2(300),              -- å�̸�
    USERID      VARCHAR2(50)     NOT NULL,  -- ���̵�
    BRDATE      DATE,                       -- ������
    DUEDATE     DATE,                       -- �ݳ�������
    RENEW       VARCHAR2(20),               -- ���⿬�� (F > T) ������ �� ���� ����
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);

-- ���� ���̺�
CREATE TABLE RESERVE_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,
    SEQ         NUMBER           NOT NULL,  -- ����
    USERID      VARCHAR2(50)     NOT NULL,  -- ���̵�
    ISBN        VARCHAR2(50)     NOT NULL,  -- ���ڵ�
    RSDATE      DATE,                       -- ������
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);

-- ���� ���̺�
CREATE TABLE USER_TBL
(
    USERID          VARCHAR2(50)    NOT NULL,   -- ���̵�
    USERPW          VARCHAR2(50)    NOT NULL,   -- ��й�ȣ
    NAME            VARCHAR2(50),               -- �̸�
    EMAIL           VARCHAR2(100),              -- �̸���
    ADDRESS         VARCHAR2(200),              -- �ּ�
    PHONENUMBER     VARCHAR2(50),               -- �ڵ�����ȣ
    BIRTHDATE       DATE,                       -- �������
    PRIMARY KEY(USERID)
);
 
 -- ���� ���� ���̺� (���� �� ������)
 CREATE TABLE REVIEW_TBL
 (
     REGDATE         DATE,                    -- �����
     USERID          VARCHAR2(50)    NOT NULL,   -- �ۼ��� ���̵�
     REVIEW          VARCHAR2(500)   NOT NULL,   -- ���� ����
     ISBN            VARCHAR2(50)    NOT NULL,   -- �ش� ���� ISBN
     PRIMARY KEY(USERID, ISBN),
     FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
 );
 
 
 -- �ݳ� ���� ���� �� �ڵ� �ݳ� ó��
 -- 1. ���� �۾��� �����ϴ� PL/SQL ���ν��� ����
 CREATE OR REPLACE PROCEDURE DELETE_BORROW_ROWS AS
 BEGIN
  DELETE FROM BORROW_TBL WHERE RTDATE <= SYSDATE;
  COMMIT; -- ���� ������ Ŀ���Ͽ� ���������� �����͸� �����մϴ�.
 EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK; -- ���� �߻� �� �ѹ��Ͽ� ������ ����մϴ�.
    RAISE; -- ������ �ٽ� ȣ���ڿ��� �����ݴϴ�.
 END;
 
 -- 2. �����췯 �۾� ���� �� job_action �Ķ���Ϳ� ������ ���ν��� ����
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
 
 -- ���� ���� 
 BEGIN
  DBMS_SCHEDULER.DROP_JOB (
    job_name        => 'UPDATE_BRSTATUS_JOB', -- �����Ϸ��� JOB �̸����� �����ؾ� ��
    force           => TRUE
  );
 END;
  
 -- ��ȸ ����
 SELECT job_name, job_type, enabled, repeat_interval
 FROM dba_scheduler_jobs
 WHERE job_name = 'DELETE_BORROW_ROWS_JOB';
 

 COMMIT;
 SET AUTOCOMMIT ON;
 
 INSERT INTO user_tbl VALUES
 ('cis', '1111', '���̼�', 'cis@gmail.com', '����', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('yhs', '2222', '��ȫ��', 'yhs@gmail.com', '����', '000-2222-2222', '2020-07-22');
 
 INSERT INTO user_tbl VALUES
 ('ljw', '3333', '������', 'ljw@gmail.com', '����', '000-3333-3333', '2021-06-03');
 
 INSERT INTO user_tbl VALUES
 ('njs', '4444', '���ؽ�', 'njs@gmail.com', '����', '000-4444-4444', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('jsh', '5555', '������', 'jsh@gmail.com', '����', '000-5555-5555', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('aaa', '6666', '����', 'aaa@gmail.com', '����', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('bbb', '7777', '����', 'bbb@gmail.com', '����', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('ccc', '8888', '�ٴ�', 'ccc@gmail.com', '����', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('ddd', '9999', '���', 'ddd@gmail.com', '����', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('eee', '1010', '����', 'eee@gmail.com', '����', '000-1111-1111', '1996-03-24');
 
 INSERT INTO user_tbl VALUES
 ('fff', '1111', '�ٹ�', 'fff@gmail.com', '����', '000-1111-1111', '1996-03-24');