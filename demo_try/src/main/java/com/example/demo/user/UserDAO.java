package com.example.demo.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 로그인, 아이디 중복
    public UserTblVO selectOneUser(UserTblVO vo) throws Exception
    {
        // sqlSessionTemplate는 1.select 2.insert 3.update 4.delete 함수를 지원
        // 그 중 select는 1-1. select(selectOne)과 1-2. select(selectList) 사용 가능
        return sqlSessionTemplate.selectOne("selectOneUser", vo);
    }

    // 회원가입
    public int insertOneUser(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneUser", vo);
    }

    // 아이디 찾기
    public UserTblVO selectOneId(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneId", vo);
    }

    // 비밀번호 찾기
    public UserTblVO selectOnePw(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOnePw", vo);
    }
}