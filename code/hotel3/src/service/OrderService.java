package service;

import java.util.ArrayList;

import dao.OrderDao;
import model.Order;
import model.PageModel;

public class OrderService {
	//分页显示所有订单
	public PageModel findOrderList(PageModel pm){
		OrderDao dao=new OrderDao();
		PageModel p=dao.findOrderList(pm);
		return p;
	}
    //删除订单
	public int del(Order o){
		OrderDao dao=new OrderDao();
		int state = dao.del(o);
		return state;
	}
	//添加订单
	public int add(Order o){
	    OrderDao dao=new OrderDao();
	    int state =dao.add(o);
	    return state;
	}
	//修改订单
	
	//计算全 年订单数量、全年销售额（每年）
	public ArrayList orderStatistics(){
		OrderDao dao=new OrderDao();
	    ArrayList oList =dao.orderStatistics();
	    return oList;
	}
	//通过用户名列出其订单
	public ArrayList findOrderbyName(String uname){
		OrderDao dao=new OrderDao();
	    ArrayList oList =dao.findOrderbyName(uname);
	    return oList;
	}
	//用户修改订单
	public int update(Order o){
	    OrderDao dao=new OrderDao();
	    int state =dao.update(o);
	    return state;
	}
	
	//计算订单数
	public int countOrder(){
	   OrderDao dao=new OrderDao();
	   int c =dao.countOrder();
	   return c;
	}
}
