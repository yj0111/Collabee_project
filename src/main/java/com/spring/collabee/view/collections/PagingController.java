package com.spring.collabee.view.collections;

import com.spring.collabee.biz.collections.impl.CollectionsDAO;
import com.spring.collabee.biz.common.PagingVO;

public class PagingController {

	private CollectionsDAO collectionsDAO = new CollectionsDAO();
	
	public PagingVO getPaging(String cPage) {
		
		PagingVO vo = null;
		
		vo = new PagingVO();

   		// 1. 전체 게시물 수량 구하기
		vo.setTotalRecord(collectionsDAO.getJsonGoodsListCount());
		vo.setTotalPage();
		vo.setTotalBlock();
   		
   		
   		// 2. 현재 페이지 구하기
   		if(cPage != null) {
    		vo.setNowPage(Integer.parseInt(cPage));
   		}
   		
   		// 3. 현재 페이지 표시할 게시글 시작번호
   		vo.setEnd(vo.getNowPage() * vo.getNumPerPage());
   		vo.setBegin(vo.getEnd() - vo.getNumPerPage() + 1);
   		
   		
   		// 3-1. (선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
   		if(vo.getEnd() > vo.getTotalRecord()) {
   			vo.setEnd(vo.getTotalRecord());
   		}
    		
   		
   		// ---------------- 블록(block) 계산하기 ----------------
   		// 4. 블록 시작페이지, 끝 페이지 구하기(현재페이지 번호 사용)
   		int nowPage = vo.getNowPage();
   		int beginPage = (nowPage - 1) / vo.getNumPerBlock() * vo.getNumPerBlock() + 1;
   		vo.setBeginPage(beginPage);
   		vo.setEndPage(beginPage + vo.getNumPerBlock() - 1);
   		
   		// 끝페이지(endPage)가 전체 페이지 수 (totalPage)보다 크면
   		// 끝페이지를 전체페이지 수로 변경 처리
   		if (vo.getEndPage() > vo.getTotalPage()) {
   			vo.setEndPage(vo.getTotalPage());
   		}
    		
   		
   		// ====================================
   		// DB 데이터 가져오기
   		// 시작번호(begin), 끝번호(end) 사용해서 게시글 조회
   		//List<GuestBookViewVO> glist = GuestBookDAO.getList(p.getBegin(), p.getEnd());
   		
   		//System.out.println(">> 현재페이지 글목록(list) : " + list);
   		
   		// =======================================
   		// EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
   		//pageContext.setAttribute("glist", list);
   		//pageContext.setAttribute("pvo", p);
		
		
		return vo;
	}
	

}