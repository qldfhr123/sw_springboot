package com.smhrd.web.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	// 게시글 하나를 표현할 수 있는 나만의 자료형 (VO)
	
	private int bnum;
	private String title;
	private String writer;
	private String content;
	private int bcnt;
	private Date indate;
	
}
