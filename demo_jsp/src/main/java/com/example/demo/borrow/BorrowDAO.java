package com.example.demo.borrow;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BorrowDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insertOneBorrow(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneBorrow", vo);
    }

    public BorrowTblVO selectBorrowData(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBorrowData", vo);
    }

    public Integer getBookCount(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("getBookCount", vo);
    }

    public int deleteOneBorrow(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.delete("deleteOneBorrow", vo);
    }

    public int updateBrStatus(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateBrStatus", vo);
    }
    
}