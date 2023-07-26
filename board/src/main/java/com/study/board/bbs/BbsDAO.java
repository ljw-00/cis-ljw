package com.study.board.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO {
    // select : vo, list 리턴
    // update, delete, insert : int 리턴

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int selectBbsRowCount() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBbsRowCount");
    }

    public List<BbsTblVO> selectBbsList(BbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectBbsList", vo);
    }

    public BbsTblVO selectBbsContent(BbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBbsContent", vo);
    }

    public int updateBbsContent(BbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateBbsContent", vo);
    }

    public int insertBbsContent(BbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertBbsContent", vo);
    }
}
