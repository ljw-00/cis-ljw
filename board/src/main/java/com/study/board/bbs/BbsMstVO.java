package com.study.board.bbs;

import java.util.List;

import lombok.Data;

@Data
public class BbsMstVO {

    private int rowCount;               // 게시물의 전체 개수
    private List<BbsTblVO> bbsList;     // 게시물의 리스트 (최대 개수 : 5 ==> rowsPerPage)

}
