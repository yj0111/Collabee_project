package com.spring.collabee.view.admingoods;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.collabee.biz.admingoods.AdminGoodsService;
import com.spring.collabee.biz.admingoods.adminPaginationVO;
import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.goods.GoodsVO;


@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	@Autowired
	private CollectionsService collectionsService;
	private int Map;
	
	public AdminGoodsController() {
		System.out.println(">> AdminGoodsController() 객체 생성");
	}
	
	/*@GetMapping("/goodsList.do")
	public String goodsList(PaginationVO vo, Model model
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value = "cntPerPage", required = false)String cntPerPage) {
		
		int total = adminGoodsService.goodsCount();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PaginationVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adminGoodsService.selectList(vo));
		return "/admin/adminGoodsList";
	}*/
	

	//상품등록 페이지로 이동
	@RequestMapping("/adminGoodsInsertPage.do")
	public String adminGoodsInsertPage(HttpServletRequest request, Model model, GoodsVO vo) {
		System.out.println(">> 상품등록 페이지");
		
		model.addAttribute("divisionList", collectionsService.getDivision());
		model.addAttribute("goods", vo);
		return "/admin/adminGoodsInsertPage";
	}
	
	//상품등록하기
	@RequestMapping("/adminGoodsInsert.do")
	public String adminGoodsInsert(GoodsVO vo) throws IllegalStateException, IOException {
		System.out.println(">> 상품 등록 컨트롤러 호출");
		
		System.out.println("받아온 상품등록 데이터 : " + vo);
		
		vo.setDetaileOriFilename(vo.getUploadFileDetailPic().getOriginalFilename());
		vo.setThumOriFilename(vo.getUploadFileMainPic().getOriginalFilename());
		
		vo.setDetaileSysFilename(uploadFile(vo.getUploadFileDetailPic(), vo.getDetaileSysFilename()));
		vo.setThumSysFilename(uploadFile(vo.getUploadFileMainPic(), vo.getThumSysFilename()));
		
		adminGoodsService.adminGoodsInsert(vo);
		return "redirect:/adminGoods/adminGoodsList.do";
	}
		

	//상품 수정 페이지로 이동
	@RequestMapping("/adminGoodsModifyPage.do")
	public String adminGoodsModifyPage(GoodsVO vo, Model model) {
		System.out.println(">> 상품 수정 페이지로 이동");
		System.out.println("vo : " + vo);
		
		model.addAttribute("divisionList", collectionsService.getDivision());
		model.addAttribute("goods", vo);
		
		return "/admin/adminGoodsModify";
	}
		
	
	//상품 수정
	@RequestMapping("/adminGoodsModify.do")
	public String adminGoodsModify(GoodsVO vo) throws IllegalStateException, IOException {
		System.out.println(">> 상품 수정 컨트롤러 호출");
		System.out.println("vo : " + vo);
		
		vo.setThumOriFilename(vo.getUploadFileMainPic().getOriginalFilename());
		vo.setDetaileOriFilename(vo.getUploadFileDetailPic().getOriginalFilename());
		
		vo.setThumSysFilename(uploadFile(vo.getUploadFileMainPic(), vo.getThumSysFilename()));
		vo.setDetaileSysFilename(uploadFile(vo.getUploadFileDetailPic(), vo.getDetaileSysFilename()));
		
		adminGoodsService.adminGoodsModify(vo);
		return "redirect:/adminGoods/adminGoodsList.do";
	}
	
	//상품 삭제
	@RequestMapping("/adminGoodsDelete.do")
	public String adminGoodsDelete(GoodsVO vo) {
		System.out.println(">> 상품 삭제 컨트롤러 호출 ");
		System.out.println("vo : " + vo);
		
		adminGoodsService.adminGoodsDelete(vo);
		
		
//		return "/admin/adminGoodsList";
		return "redirect:/adminGoods/adminGoodsList.do";
	}
	
	//상품 상세조회
	@RequestMapping("/adminGoodsSelect.do")
	public String adminGoodsSelect(GoodsVO vo, Model model) {
		System.out.println(">> 상품 상세 보여주기");
		System.out.println("vo : " + vo);
		
		GoodsVO goods = adminGoodsService.adminGoodsSelect(vo);
		
		model.addAttribute("divisionList", collectionsService.getDivision());
		model.addAttribute("goods", goods);
		System.out.println("goods : " + goods);
		
		return "/admin/adminGoodsSelect";
	}
	
	//상품 목록 페이지로 이동
	@RequestMapping("/adminGoodsList.do")
	public String adminGoodsList(GoodsVO goods, Model model, adminPaginationVO paging
			, @RequestParam(value="nowPage", required = false)String nowPage //현재 페이지 번호
			, @RequestParam(value = "cntPerPage", required = false)String cntPerPage) { //페이지당 상품 개수
		System.out.println(">> 상품목록 페이지");
		System.out.println("goods : " + goods);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNum", goods.getProductNum());
		map.put("goods", goods);
		List<GoodsVO> list = adminGoodsService.adminGoodsList(map);
		
		int total = adminGoodsService.goodsCount();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1"; //현재 페이지
			cntPerPage = "10"; //페이지당 상품 개수
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		paging = new adminPaginationVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("goodsList", list);
		model.addAttribute("paging", paging);
		model.addAttribute("viewAll", adminGoodsService.selectList(paging));
		System.out.println("list : " + list);
		return "/admin/adminGoodsList";
	}
	
	
	
	//상품 리스트에서 상품 검색
	@RequestMapping("/productSearch.do")
	public String goSearch(GoodsVO goods, Model model, String sword) {
		System.out.println(">> 상품목록 페이지에서 상품 검색");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sword", sword);
		map.put("productNum", goods.getProductNum());
		map.put("goods", goods);
		List<GoodsVO> list = adminGoodsService.adminGoodsList(map);
		
		System.out.println("키워드 : " + sword);
		model.addAttribute("sword", sword);
		model.addAttribute("goodsList", list);
		return "/admin/adminGoodsList";
	}
	
	
	
	private String uploadFile(MultipartFile file, String sysFileName) throws IllegalStateException, IOException {
		
		MultipartFile uploadFile = file;
		String saveFileName = null;
		
		if (uploadFile == null) {
			System.out.println("::: uploadFile 파라미터가 전달되지 않았을때~");
		} else if (!uploadFile.isEmpty()) {
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
			saveFileName = sysFileName + "_" + sdf.format(timestamp) + ".jpg";
			uploadFile.transferTo(new File("c:/Users/itwill/git/collabee/src/main/webapp/resources/imgs/goods/" + saveFileName));
			//uploadFile.transferTo(new File("C:/Users/Kwak HyeIn/git/collabee/src/main/webapp/resources/imgs/goods/" + saveFileName));
		}
		return saveFileName;
	}
			
}
