package pj.mvc.dreams_project2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.mvc.dreams_project2.dto.OrderDTO;
import pj.mvc.dreams_project2.dto.OrderDetailDTO;
import pj.mvc.dreams_project2.dto.RefundDTO;



@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 내 주문 조회
	@Override
	public List<OrderDTO> orderDetail(String cust_Id) {
		System.out.println("OrderDAOImpl - orderDetail");
		List<OrderDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.OrderDAO.orderDetail", cust_Id);
		return list;
	}
	
	// 내 주문내역 - 구매확정 버튼
	public int confirmOrder(int order_No) {
		System.out.println(" OrderDAOImpl - confirmOrder ");
		int updateCnt = sqlSession.update("pj.mvc.dreams_project2.dao.OrderDAO.confirmOrder", order_No);
		return updateCnt;
	}
	
	
	// 교환/환불 신청 페이지 - 최근 구매한 상품
	public List<OrderDetailDTO> MyorderDetail(int order_No) {
		System.out.println(" OrderDAOImpl - MyorderDetail ");
		List<OrderDetailDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.OrderDAO.MyorderDetail", order_No);
		return list;
	}
	
	// 환불 신청서 제출
	@Override
	public int submissionRefund(RefundDTO dto) {
		System.out.println(" OrderDAOImpl - submissionRefund ");
		int insertCnt = sqlSession.insert("pj.mvc.dreams_project2.dao.OrderDAO.submissionRefund", dto);
		return insertCnt;
	}
	
	// 교환/환불 신청서 확인 
	public List<RefundDTO> refundDetail(String REF_cust_Id) {
		System.out.println(" OrderDAOImpl - refundDetail ");
		List<RefundDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.OrderDAO.refundDetail", REF_cust_Id);
		return list;
	}
	
}
