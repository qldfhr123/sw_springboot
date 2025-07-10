package com.smhrd.web.controller;

import java.util.ArrayList;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.web.entity.Board;
import com.smhrd.web.entity.SearchCriteria;
import com.smhrd.web.mapper.BoardMapper;


// ~ Application
// 하위 패키지로 해당하는 파일들을 생성

// FC가 업무를 지시하는 역할을 하는 일반 자바 클래스
// 해당하는 파일을 통해서만 jsp html 문서를 화면에 띄울 수 있다

@Controller
public class BoardController {
	
	// 데이터 흐름을 체크 log 찍는 도구 꺼내오기
	private final Logger logger = org.slf4j.LoggerFactory .getLogger(getClass());
	
	@Autowired
	private BoardMapper board; 

	@GetMapping("/")
	public String board(Model model) {
		ArrayList<Board> boardList = board.selectBoard();
		model.addAttribute("boardList", boardList);
		
		return "board";
		
		// 이동해야 할 페이지 리턴
		// ViewResolver 논리적인 주소값을 물리적인 주소값으로 변환
		// 내가 설정한 prefix + board + suffix
		// * forward 방식으로 이동 : 요청 1번, 응답 1번
		// * redirect 방식으로 이동 : 요청 2번, 응답 2번
	}
	
	
	@GetMapping("/insert_page")
	public String insert(Board boardVO) {
		return "insert";
	}
	
	@PostMapping("/insert_board")
	public String insert_board(Board boardVO) {
		logger.info("데이터 확인 >> "+board);
		board.insert(boardVO);
		return "redirect:/";
	}

	
	@GetMapping("/selectOne/{bnum}")
	public String selectOne(Model model, @PathVariable("bnum") int bnum) {
	    System.out.println("수집 데이터 >> " + bnum);
	    
	    // ArrayList 대신 단일 객체 반환
	    Board boardVO = board.selectOne(bnum);
	    model.addAttribute("boardVO", boardVO);
	    
	    return "selectOne";
	}

	@PostMapping("/count")
	@ResponseBody
	// >>> 페이지 이동하는 메소드가 아니라
	// 비동기 통신을 처리하는 메소드임
	public void selectOne(int bnum) {
		logger.info("데이터 확인 "+bnum);
		board.count(bnum);
	}

	// 게시글 검색기능
	@GetMapping("/search")
	public String search(Model model, SearchCriteria cri) {
		logger.info("검색 수집 기준"+cri);
		ArrayList<Board> boardList_search = board.searchBoard(cri);
		model.addAttribute("boardList", boardList_search);
		return "board";
	}
	
	@GetMapping("/temp")
	public String temp(RedirectAttributes rttr) {
		// redirect 이동했을때 마지막 이동하는 페이지
		// 수집한 데이터를 전송하고 싶으면 rttr 사용가능
		
		// Model  interface를 구형하고 있기 때문에 2번째 저장할 수 있는 매개변수가 Object라고 작성 되어있으나
		// 객체를 보낼수없다, 무조건 문자열로
		
		rttr.addAttribute("temp", "temp");
		return "redirect:/";
	}
	

}
