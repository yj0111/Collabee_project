package com.spring.collabee.biz.goods.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.goods.GoodsQnAVO;
import com.spring.collabee.biz.goods.GoodsReviewVO;
import com.spring.collabee.biz.goods.GoodsService;
import com.spring.collabee.biz.goods.GoodsVO;
import com.spring.collabee.biz.goods.OrderReviewVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public GoodsServiceImpl() {
		System.out.println(">> GoodsServiceImpl() 객체 생성");
	}
	
	//상품 조회
	@Override
	public GoodsVO getGoods(GoodsVO vo) {
		return goodsDAO.getGoods(vo);
	}
	
	//리뷰 입력
	@Override
	public void insertReview(GoodsReviewVO rvo) {
		goodsDAO.insertReview(rvo);
	}
	
	//리뷰 수정
	@Override
	public void updateReview(GoodsReviewVO rvo) {
		goodsDAO.updateReview(rvo);
	}

	//리뷰 삭제
	@Override
	public void deleteReview(GoodsReviewVO rvo) {
		goodsDAO.deleteReview(rvo);
	}
	
	@Override
	public GoodsReviewVO getReviewCount(GoodsReviewVO rvo) {
		return goodsDAO.getReviewCount(rvo);
	}
	
	//리뷰 1개 조회
	@Override
	public GoodsReviewVO getReview(GoodsReviewVO rvo) {
		return goodsDAO.getReview(rvo);
	}
	
	//리뷰 전체 조회
	@Override
	public List<GoodsReviewVO> getReviewList(GoodsReviewVO rvo) {
		return goodsDAO.getReviewList(rvo);
	}
	
	//리뷰 추천순 조회
	@Override
	public List<GoodsReviewVO> getRecommendList(GoodsReviewVO rvo) {
		return goodsDAO.getRecommendList(rvo);
	}
	
	//리뷰 최신등록순 조회
	@Override
	public List<GoodsReviewVO> getRecentList(GoodsReviewVO rvo) {
		return goodsDAO.getRecentList(rvo);
	}
	
	//리뷰등록시 적립금 
	@Override
	public void updatePoint(GoodsReviewVO rvo) {
		goodsDAO.updatePoint(rvo);
	}
	
	//상품 문의 입력
	@Override
	public void insertQnA(GoodsQnAVO qvo) {
		goodsDAO.insertQnA(qvo);
	}
	
	//문의 수정
	@Override
	public void updateQnA(GoodsQnAVO qvo) {
		goodsDAO.updateQnA(qvo);
	}
	
	//문의 삭제
	@Override
	public void deleteQnA(GoodsQnAVO qvo) {
		goodsDAO.deleteQnA(qvo);
	}
	
	//문의 1개 조회
	@Override
	public GoodsQnAVO getQnA(GoodsQnAVO qvo) {
		return goodsDAO.getQnA(qvo);
	}
	
	//문의 전체 조회
	@Override
	public List<GoodsQnAVO> getQnAList(GoodsQnAVO qvo) {
		return goodsDAO.getQnAList(qvo);
	}

	@Override
	public int reviewDoubleCheck(Map<String, Object> map) {
		return goodsDAO.reviewDoubleCheck(map);
	}

	@Override
	public void updateReviewState(GoodsReviewVO rvo) {
		goodsDAO.updateReviewState(rvo);
	}

	@Override
	public List<OrderReviewVO> checkReviewNotYet(Map<String, Object> rmap) {
		return goodsDAO.checkReviewNotYet(rmap);
	}
	
	//관리자 문의 조회
	@Override
	public List<GoodsQnAVO> getQList(GoodsQnAVO qvo) {
		return goodsDAO.getQList(qvo);
	}
	
	//관리자 문의 답변
	@Override
	public void answerQna(GoodsQnAVO qvo) {
		goodsDAO.answerQna(qvo);
		
	}
}