package com.example.demo.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.borrow.BorrowTblVO;
import com.example.demo.user.UserTblVO;

@Repository
public class ReviewDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insertOneReview(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneReview", vo);
    }

    public List<ReviewTblVO> selectReview(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectReview", vo);
    }

    public ReviewTblVO selectOneReviewById(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneReviewById", vo);
    }
    
}