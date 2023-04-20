package com.spring.collabee.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.collabee.biz.board.BoardService;
import com.spring.collabee.biz.board.BoardVO;


@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	public BoardController() {
		System.out.println(">>BoardController() 객체 생성");
	}
	
	@RequestMapping("/notice.do")
	public String notice(BoardVO vo, Model model) {
		System.out.println(">>공지사항 페이지");
		
		List<BoardVO> list = boardService.getNoticeList(vo);
		System.out.println("vo:" + vo);
		model.addAttribute("noticeList",list);
		return "/board/notice";
	}
	
	@RequestMapping("/notice_view.do")
	public String notice_view(BoardVO vo, Model model) {
		System.out.println(">>공지사항 페이지 글조회 페이지");
		BoardVO notice = boardService.getNotice(vo);
		model.addAttribute("notice", notice);
		System.out.println("notice : " + notice);
		
		return "/board/notice_view";
	}
	
	@RequestMapping("/notice_write.do")
	public String notice_write() {
		System.out.println(">>공지사항 페이지 작성 페이지");
		return "/board/notice_write";
	}
	
	@RequestMapping(value = "/insertNotice.do", method = RequestMethod.POST)
	public String insertNotice(BoardVO vo) {
		System.out.println("===> 공지사항 입력");
		System.out.println("vo : " + vo);
		
		boardService.insertNotice(vo);
		
		return "redirect:/board/notice.do";
	}
	
	@RequestMapping("/notice_modify.do")
	public String notice_modify(BoardVO vo, Model model) {
		System.out.println(">>공지사항 페이지 수정 페이지");
		BoardVO notice = boardService.getNotice(vo);
		model.addAttribute("notice", notice);
		System.out.println("notice : " + notice);
		return "/board/notice_modify";
	}
	
	@RequestMapping(value = "/updateNotice.do", method = RequestMethod.POST)
	public String updateNotice(BoardVO vo, int noticeNum) {
		System.out.println("===> 공지사항 수정");
		System.out.println(noticeNum);
		boardService.updateNotice(vo);
		System.out.println("vo : " + vo);
		
		return "redirect:/board/notice.do";
	}
	
	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(BoardVO vo) {
		System.out.println(">> 게시글 삭제");
		
		System.out.println("vo : " + vo);
		
		boardService.deletNotice(vo);
		
		return "redirect:/board/notice.do";
	}

	
}
