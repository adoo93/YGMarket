package test;

import java.util.ArrayList;

import com.yg.dao.MemberDao;
import com.yg.dao.OrderDao;
import com.yg.dao.ProductDao;
import com.yg.dto.OrderBean;
import com.yg.dto.ProductBean;

public class OrderDaoTest {

	public static void main(String[] args) throws Exception {
		OrderDao oDao = OrderDao.getInstance();
		MemberDao mDao = MemberDao.getInstance(); 
		ProductDao pDao = ProductDao.getInstance();
		
		String id = "yg";
		int member_id = mDao.getMemberIdFromId(id);

		//System.out.println("아래는 id:"+id+"의 주문내역:");
		ArrayList<OrderBean> list1 = oDao.getOrderListFromMemberId(member_id);
		for(OrderBean bean : list1) {
			ProductBean bean2 = pDao.selectProduct(bean.getCode());
			System.out.println(bean2.getName() + "("+bean2.getPrice()+"원) : " + bean.getQty() + "개");
		}
		
		boolean search = oDao.searchOrder(member_id, "fruit1");
		System.out.println(search);
		
	}

}
