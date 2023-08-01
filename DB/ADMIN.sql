 CREATE USER dbuser IDENTIFIED BY 1234;
 GRANT CONNECT, RESOURCE to dbuser; -- 접속 + 테이블 생성 권한 부여
 commit;