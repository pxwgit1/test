package service;

import java.util.ArrayList;

import dao.OrderDao;
import model.Order;
import model.PageModel;

public class OrderService {
	//��ҳ��ʾ���ж���
	public PageModel findOrderList(PageModel pm){
		OrderDao dao=new OrderDao();
		PageModel p=dao.findOrderList(pm);
		return p;
	}
    //ɾ������
	public int del(Order o){
		OrderDao dao=new OrderDao();
		int state = dao.del(o);
		return state;
	}
	//��Ӷ���
	public int add(Order o){
	    OrderDao dao=new OrderDao();
	    int state =dao.add(o);
	    return state;
	}
	//�޸Ķ���
	
	//����ȫ �궩��������ȫ�����۶ÿ�꣩
	public ArrayList orderStatistics(){
		OrderDao dao=new OrderDao();
	    ArrayList oList =dao.orderStatistics();
	    return oList;
	}
	//ͨ���û����г��䶩��
	public ArrayList findOrderbyName(String uname){
		OrderDao dao=new OrderDao();
	    ArrayList oList =dao.findOrderbyName(uname);
	    return oList;
	}
	//�û��޸Ķ���
	public int update(Order o){
	    OrderDao dao=new OrderDao();
	    int state =dao.update(o);
	    return state;
	}
	
	//���㶩����
	public int countOrder(){
	   OrderDao dao=new OrderDao();
	   int c =dao.countOrder();
	   return c;
	}
}
