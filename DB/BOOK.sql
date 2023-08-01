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

SELECT * FROM USER_TBL;

-- ���� ���̺�
CREATE TABLE BORROW_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,  -- �����ڵ�(ISBN-USERID ����)
    ISBN        VARCHAR2(50),               -- ���ڵ�
    TITLE       VARCHAR2(300),              -- å�̸�
    USERID      VARCHAR2(50)    NOT NULL,   -- ���̵�
    BRDATE      DATE,                       -- ������
    RTDATE      DATE,                       -- �ݳ�������
    BREXTENSION VARCHAR2(20),               -- ���⿬��
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);


SELECT * FROM BORROW_TBL;
commit;
-- ���� ���̺�
CREATE TABLE RESERVE_TBL
(
    BRCODE      VARCHAR2(100)    NOT NULL,  -- �����ڵ�(ISBN-USERID ����)
    USERID      VARCHAR2(50)     NOT NULL,  -- ���̵�
    ISBN        VARCHAR2(50),               -- ���ڵ�
    RSDATE      DATE,                       -- ������
    RSSTATUS    VARCHAR2(20),               -- ������(W:�ݳ��ϱ��� ������, L:������ �����Ⱓ ����(�ݳ���+3))
    PRIMARY KEY(BRCODE),
    FOREIGN KEY(USERID) REFERENCES USER_TBL(USERID)
);
select * from reserve_tbl;
commit;
insert into reserve_tbl values('9791159488665-ljw', 'ljw', '9791159488665', sysdate, 'W');
delete from reserve_tbl where rsstatus='W';

 -- ���� ���� ���̺� (���� �� ������)
 CREATE TABLE REVIEW_TBL
 (
     REGDATE         DATE,                       -- �����
     USERID          VARCHAR2(50)    NOT NULL,   -- �ۼ��� ���̵�
     REVIEW          VARCHAR2(500)   NOT NULL,   -- ���� ����
     ISBN            VARCHAR2(50)    NOT NULL,   -- �ش� ���� ISBN
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
    job_name        => 'UPDATE_BRSTATUS_JOB', -- �����Ϸ��� JOB �̸����� �����ؾ� ��
    force           => TRUE
  );
 END;
 
 SELECT job_name, job_type, enabled, repeat_interval
 FROM dba_scheduler_jobs
 WHERE job_name = 'UPDATE_BRSTATUS_JOB';
 

COMMIT;
SET AUTOCOMMIT ON;