package com.smhrd.web.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.web.entity.Board;
import com.smhrd.web.entity.SearchCriteria;

@Mapper
public interface BoardMapper {
	
	// 게시글을 전체 조회하는 메소드
	public ArrayList<Board> selectBoard();

	public void insert(Board boardVO);

	@Select("select * from board where bnum = #{bnum}")
	public Board selectOne(int bnum);

	@Update("update board set bcnt=bcnt+1 where bnum = #{bnum}")
	public  void count(int bnum);
	
	// 검색 기능을 위한 메소드
	public ArrayList<Board> searchBoard(SearchCriteria cri);


}
