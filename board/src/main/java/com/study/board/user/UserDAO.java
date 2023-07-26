package com.study.board.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
    // select : vo, list 리턴
    // update, delete, insert : int 리턴

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public UserTblVO selectOneUser(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUser", vo);
    }

    public int insertOneUser(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneUser", vo);
    }

    public UserTblVO selectOneId(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneId", vo);
    }

    public UserTblVO selectOnePw(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOnePw", vo);
    }
}
