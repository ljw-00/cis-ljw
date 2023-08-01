package com.example.demo.borrow;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.reserve.ReserveTblVO;

@Repository
public class BorrowDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insertOneBorrow(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneBorrow", vo);
    }

    public Integer selectBorrowData(BorrowTblVO vo) throws Exception
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

    public Integer selectBorrowCount(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBorrowCount", vo);
    }

    public BorrowTblVO checkBorrowUser(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("checkBorrowUser", vo);
    }

    public List<BorrowTblVO> selectBrList(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectBrList", vo);
    }

    public int updateRenew(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateRenew", vo);
    }
    
    public BorrowTblVO selectBorrowByRenew(BorrowTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBorrowByRenew", vo);
    }    
    
}