package com.spring.collabee.biz.goods.impl;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.goods.GoodsQnAVO;
import com.spring.collabee.biz.goods.GoodsReviewVO;
import com.spring.collabee.biz.goods.GoodsVO;
import com.spring.collabee.biz.goods.OrderReviewVO;
@Repository("goodsDAO")
public class GoodsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public GoodsDAO() {
		System.out.println(">> GoodsDAO() 객체 생성 ~");
	}
	
	//상품 조회
	public GoodsVO getGoods(GoodsVO vo) {
		System.out.println("mybatis 사용  getgoods() 실행");
		return mybatis.selectOne("GoodsDAO.getGoods", vo);
	}

	//상품 후기 1개 조회
	public GoodsReviewVO getReview(GoodsReviewVO rvo) {
		System.out.println("===> MyBatis 사용  getReview() 실행");
		return mybatis.selectOne("GoodsDAO.getReview", rvo);
	}

	//상품 후기 전체 보기
	public List<GoodsReviewVO> getReviewList(GoodsReviewVO rvo) {
		System.out.println("--->> mybatis 사용 getReviewList() 실행 ~");
		return mybatis.selectList("GoodsDAO.getReviewList", rvo);
	}
	
	//상품 후기 추천순 보기
	public List<GoodsReviewVO> getRecommendList(GoodsReviewVO rvo) {
		System.out.println(">> getRecommendList() 실행");
		return mybatis.selectOne("GoodsDAO.getRecommendList", rvo);
	}
	
	//상품 후기 최근등록순 보기
	public List<GoodsReviewVO> getRecentList(GoodsReviewVO rvo) {
		System.out.println(">> getRecentList() 실행");
		return mybatis.selectOne("GoodsDAO.getRecentList", rvo);
	}

	//상품 후기 입력
	public void insertReview(GoodsReviewVO rvo) {
		System.out.println("insertReview() 실행 ~");
		mybatis.insert("GoodsDAO.insertReview", rvo);
	}

	//상품 후기 수정
	public void updateReview(GoodsReviewVO rvo) {
		System.out.println("updateReview() 실행 ~");
		mybatis.update("GoodsDAO.updateReview", rvo);
	}
	
	public void updatePoint(GoodsReviewVO rvo) {
		System.out.println("updatePoint() 실행");
		mybatis.update("GoodsDAO.updatePoint", rvo);
	}

	//상품 후기 삭제
	public void deleteReview(GoodsReviewVO rvo) {
		System.out.println("deleteReview() 실행");
		mybatis.delete("GoodsDAO.deleteReview", rvo);
	}

	public GoodsReviewVO getReviewCount(GoodsReviewVO rvo) {
		System.out.println("getReviewCount()실행");
		return mybatis.selectOne("GoodsDAO.getReviewCount", rvo);
	}
	
	//상품 문의 전체조회
	public List<GoodsQnAVO> getQnAList(GoodsQnAVO qvo) {
		System.out.println("--->> mybatis 사용 getQnAList() 실행");
		return mybatis.selectList("GoodsDAO.getQnAList", qvo);
	}

	//상품 문의 1개 조회
	public GoodsQnAVO getQnA(GoodsQnAVO qvo) {
		System.out.println("===> MyBatis 사용  getQnA() 실행");
		return mybatis.selectOne("GoodsDAO.getQnA", qvo);
	}

	//상품 문의 입력
	public void insertQnA(GoodsQnAVO qvo) {
		System.out.println("insertQnA() 실행");
		mybatis.insert("GoodsDAO.insertQnA", qvo);
	}

	//상품 문의 수정
	public void updateQnA(GoodsQnAVO qvo) {
		System.out.println("updateQnA() 실행");
		mybatis.update("GoodsDAO.updateQnA", qvo);
	}

	//상품 문의 삭제
	public void deleteQnA(GoodsQnAVO qvo) {
		System.out.println("deleteQnA() 실행");
		mybatis.delete("GoodsDAO.deleteQnA", qvo);
	}

	public int reviewDoubleCheck(Map<String, Object> map) {
		System.out.println("reviewDoubleCheck() 실행");
		System.out.println("매퍼진입전 map : " + map);
		return mybatis.selectOne("GoodsDAO.reviewDoubleCheck", map);
	}

	public Object updateReviewState(GoodsReviewVO rvo) {
		return mybatis.update("GoodsDAO.updateReviewState", rvo);
	}

	public List<OrderReviewVO> checkReviewNotYet(Map<String, Object> rmap) {
		return mybatis.selectList("GoodsDAO.checkReviewNotYet", rmap);
	}

	//상품 문의 공지
	
	
	//상품 문의 답변(관리자)
	public void answerQna(GoodsQnAVO qvo) {
		System.out.println("answerQna() 실행");
		mybatis.update("GoodsDAO.answerQna", qvo);
	}
	
	//관리자 상품 문의 리스트 조회
	public List<GoodsQnAVO> getQList(GoodsQnAVO qvo) {
		System.out.println("--->> mybatis 사용 getQnAList() 실행");
		return mybatis.selectList("GoodsDAO.getQList", qvo);
	}
	
	
}