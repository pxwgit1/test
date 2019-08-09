package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LvTargetusertongji;
import model.Targetuserlianjie;
import model.Targetusertongji;
import model.target;
import service.TargetService;
import service.TargetusertjService;

/**
 * Servlet implementation class TargetPsjgServlet
 */
public class TargetPsjgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TargetPsjgServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("rawtypes")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String level = request.getParameter("level");
		System.out.println("level==" + level);

		// HttpSession session=request.getSession();
		target tg = new target();
		tg.setTargetlevel(Integer.parseInt(level));
		TargetService service = new TargetService();
		ArrayList targetList = service.findpsjgTargets(tg);
		// ArrayList childtargetList=service.findchildpsjgTargets(tg);
		System.out.println("targetList3.size()==" + targetList.size());

		if (targetList.size() > 0) {
			int number = 0;// 记录指标只有一个专家打分
			int number2 = 0;
			Double avg = 0.0;// 记录平均值
			int tidi = 0;
			int tidj = 0;
			int leveli = 0;
			int levelj = 0;
			int uidi = 0;
			int uidj = 0;
			Double tcounti = 0.0;
			Double tcountj = 0.0;
			Double sum = 0.0;
			Double tcountonei = 0.0;
			String fatherm = null;
			String fathern = null;
			String father = null;
			int numberm = 0;// 记录指标只有一个专家打分
			int number2m = 0;

			String tidm = null;
			String tidn = null;
			int levelm = 0;
			int leveln = 0;
			int uidm = 0;
			int uidn = 0;
			Double tcountm = 0.0;
			Double tcountn = 0.0;
			Double summ = 0.0;
			Double sumn = 0.0;
			// int num = 0;
			//if(targetList.size()>)
			
			for (int i = 0; i < targetList.size() - 1; i++) {
				for (int j = i + 1; j < targetList.size(); j++) {
				//for (int j = i + 1; ; j++) {
					Targetuserlianjie tui = (Targetuserlianjie) targetList.get(i);
					Targetuserlianjie tuj = (Targetuserlianjie) targetList.get(j);
					tidi = tui.getTutargetid();
					tidj = tuj.getTutargetid();
					//没有获取到13？？？？
					father = tui.getFathertarget();
					System.out.println("tidi==" + tidi + "-tidj==" + tidj + "-father==" + father);
					leveli = tui.getTargetlevel();
					levelj = tuj.getTargetlevel();
					uidi = tui.getTuserid();
					uidj = tuj.getTuserid();
					tcounti = tui.getTargetcount();
					tcountj = tuj.getTargetcount();

					if (tidi == tidj) {
						System.out.println("tcounti=" + tcounti);
						System.out.println("tcountj=" + tcountj);
						// 如果是点击二级指标，总分为二级指标下三级指标的和
						 if (level.equals("2") && father.equals("11")) {
								String fathers[] = { "111", "133", "122" };
								for (int f = 0; f < fathers.length; f++) {
									System.out.println("fathers[f]---" + fathers[f] + "--father==" + father);
									TargetService childservice = new TargetService();
									ArrayList childtargetList = childservice.findchildpsjgTargetsByfatherID(fathers[f]);
									System.out.println("childtargetList===" + childtargetList.size());
									if (childtargetList.size() > 0) {
										if (childtargetList.size() > 1) {
											for (int m = 0; m < childtargetList.size() - 1; m++) {
												for (int n = m + 1; n < childtargetList.size(); n++) {
													LvTargetusertongji tum = (LvTargetusertongji) childtargetList
															.get(m);
													LvTargetusertongji tun = (LvTargetusertongji) childtargetList
															.get(n);
													fatherm = tum.getFathertarget();
													fathern = tun.getFathertarget();
													summ = tum.getSum();
													sumn = tun.getSum();
													sum = summ + sumn;
													System.out.println("fatherm==" + fatherm + "--fathern==" + fathern);
													System.out.println("summ---" + summ + "--sumn==" + sumn);
													System.out.println("sum---" + sum);
												}
											}
										} else if (childtargetList.size() == 1) {
											System.out.println("133=--fatherm--");
											for (int m = 0; m < childtargetList.size(); m++) {
												LvTargetusertongji tum = (LvTargetusertongji) childtargetList.get(m);
												sum = sum + tum.getSum();
												System.out.println("133-sum==" + sum + "-133-avg==" + avg);
											}
										}
									} else {
										System.out.println("tested222");
									}

								}
								// 思路是把某个指标的统计结果重新存入一个统计表，每个相同的指标存入一次，参考SearchsoreServlet
								Targetusertongji targetusertongji = new Targetusertongji();
								targetusertongji.setSum(sum);
								targetusertongji.setTjtargetlevel(leveli);
								targetusertongji.setTjtargetid(tidi);
								TargetusertjService servicetj = new TargetusertjService();
								int state = servicetj.savetj(targetusertongji);
							
						}else if(level.equals("2") && father.equals("13")){
							String fathers[] = { "211", "233", "222", "244"};
							Double sums = 0.0;
							for (int f = 0; f < fathers.length; f++) {
								System.out.println("fathers[f]---" + fathers[f] + "--father==" + father);
								TargetService childservice = new TargetService();
								ArrayList childtargetList = childservice.findchildpsjgTargetsByfatherID(fathers[f]);
								System.out.println("childtargetList===" + childtargetList.size());
								if (childtargetList.size() > 0) {
									int num = 0;
									if (childtargetList.size() > 1) {
										for (int m = 0; m < childtargetList.size() - 1; m++) {
											for (int n = m + 1; n < childtargetList.size(); n++) {
												LvTargetusertongji tum = (LvTargetusertongji) childtargetList
														.get(m);
												LvTargetusertongji tun = (LvTargetusertongji) childtargetList
														.get(n);
												fatherm = tum.getFathertarget();
												fathern = tun.getFathertarget();
												summ = tum.getSum();
												sumn = tun.getSum();
												sums = summ + sumn;
												System.out.println("fatherm==" + fatherm + "--fathern==" + fathern);
												System.out.println("summ---" + summ + "--sumn==" + sumn);
												System.out.println("sum---" + sum + "-num=" + num);
											}
										}
									} else if (childtargetList.size() == 1) {
										System.out.println("133=--fatherm--");
										Double sum4 = 0.0;
										for (int m = 0; m < childtargetList.size(); m++) {
											LvTargetusertongji tum = (LvTargetusertongji) childtargetList.get(m);
											sums = sums + tum.getSum();
											System.out.println("133-num==" + num);
											System.out.println("133-sum==" + sum);
										}
									}
									
								} else {
									System.out.println("tested2333");
								}

							}
							// 思路是把某个指标的统计结果重新存入一个统计表，每个相同的指标存入一次，参考SearchsoreServlet
							Targetusertongji targetusertongji = new Targetusertongji();
							targetusertongji.setSum(sums);
							targetusertongji.setTjtargetlevel(leveli);
							targetusertongji.setTjtargetid(tidi);
							TargetusertjService servicetj = new TargetusertjService();
							int state = servicetj.savetj(targetusertongji);
						}
						else if (level.equals("3")) {
							number2++;
							sum = tcounti + tcountj;
							Targetusertongji targetusertongji = new Targetusertongji();
							targetusertongji.setSum(sum);
							targetusertongji.setTjtargetlevel(leveli);
							targetusertongji.setTjtargetid(tidi);
							TargetusertjService servicetj = new TargetusertjService();
							int state = servicetj.savetj(targetusertongji);
							
						} else if (level.equals("1") && father.equals("1")) {
							String fathers[] = { "11", "13", "12", "14", "16" };
							for (int f = 0; f < fathers.length; f++) {
								System.out.println("fathers[f]---" + fathers[f] + "--father==" + father);
								TargetService childservice = new TargetService();
								ArrayList childtargetList = childservice.findchildpsjgTargetsByfatherID(fathers[f]);
								System.out.println("childtargetList===" + childtargetList.size());
								if (childtargetList.size() > 0) {
									if (childtargetList.size() > 1) {
										for (int m = 0; m < childtargetList.size() - 1; m++) {
											for (int n = m + 1; n < childtargetList.size(); n++) {
												LvTargetusertongji tum = (LvTargetusertongji) childtargetList.get(m);
												LvTargetusertongji tun = (LvTargetusertongji) childtargetList.get(n);
												fatherm = tum.getFathertarget();
												fathern = tun.getFathertarget();
												summ = tum.getSum();
												sumn = tun.getSum();
												sum = summ + sumn;
											}
										}
									} else if (childtargetList.size() == 1) {
										for (int m = 0; m < childtargetList.size(); m++) {
											LvTargetusertongji tum = (LvTargetusertongji) childtargetList.get(m);
											// fatherm = tum.getFathertarget();
											sum = sum + tum.getSum();
											System.out.println("1-sum==" + sum);
										}
									}
									///// 思路是把某个指标的统计结果重新存入一个统计表，每个相同的指标存入一次，参考SearchsoreServlet
									Targetusertongji targetusertongji = new Targetusertongji();
									targetusertongji.setSum(sum);
									targetusertongji.setTjtargetlevel(leveli);
									targetusertongji.setTjtargetid(tidi);
									TargetusertjService servicetj = new TargetusertjService();
									int state = servicetj.savetj(targetusertongji);
								} else {
									System.out.println("tested111");
								}
							}

						}
					} else {

						System.out.println("tested");
						continue;
					}
					target tgtj = new target();
					tgtj.setTargetlevel(Integer.parseInt(level));
					TargetService servicetj = new TargetService();
					ArrayList targetListtj = servicetj.findTargetsgj(tgtj);
					System.out.println("targetListtj.size()==" + targetListtj.size());
					HttpSession session = request.getSession();
					session.setAttribute("targetListpsjg", targetListtj);
				}
			}

		}
		response.sendRedirect("ckpsjd.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
