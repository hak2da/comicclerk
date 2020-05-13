package com.comic.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.EmployeeAttachVO;
import com.comic.model.EmployeeVO;
import com.comic.model.RoomuseVO;
import com.comic.model.TodaycommuteVO;
import com.comic.model.WorkrecordVO;
import com.comic.service.impl.ManagementServiceImpl;
import com.comic.service.impl.ManagerPosServiceImpl;
import com.comic.service.impl.MemberServiceImpl;
import com.comic.service.impl.MngCalendarServiceImpl;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("/managerpos/")
@AllArgsConstructor // 생성자함수
public class ManagerposController {
	// ManagerController managerController;

	private ManagerPosServiceImpl managerposService;// 매니저포스화면(포스화면관리)
	private ManagementServiceImpl managementService;// 매니저(직원관리)
	private MngCalendarServiceImpl mngCalendarService;// 캘린더(직원관리)
	private MemberServiceImpl MemberService;

	/* =new ManagerPosServiceImpl(); */
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = { "/managerpos", "/Managerpos" }, method = RequestMethod.GET)
	public String younghakpos(Locale locale, Model model, HttpSession session) {
		session.removeAttribute("roomNum");
		session.setAttribute("admin", "admin");
		
		return "/younghak/Managerpos";
	}

	@RequestMapping(value = { "/Manager_management" }, method = RequestMethod.GET)
	public String managermanagerment(Model model) {
		model.addAttribute("managerList", managementService.managerList()); // 재고테이블
		
		return "younghak/Manager_management";
	}

	@GetMapping("importdetail")
	public String younghakimportdetail(Model model) {
		return "/younghak/importdetail";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String younghakworklogin(Model model) {

		return "younghak/login";
	}

	@ResponseBody
	@RequestMapping(value = "room_start2", method = { RequestMethod.GET, RequestMethod.POST })
	public  Map<String, String> room_start(@RequestBody HashMap<String, Object> map// 배열 받기 traditional: true
	) {
		JSONArray jsonArray = new JSONArray(); // object 타입
		// roomuse_id, roomuse_num,roomuse_status
		String roomuse_id = jsonArray.fromObject(map.get("list")).get(0).toString();
		String roomuse_num = jsonArray.fromObject(map.get("list")).get(1).toString();
		String roomuse_status = jsonArray.fromObject(map.get("list")).get(2).toString();

		try {

			System.out.println("room_id = " + roomuse_id);
			System.out.println("room_num = " + roomuse_num);
			System.out.println("room_status = " + roomuse_status);

			if (roomuse_status.equals("on")) {
				managerposService.start_room(roomuse_id, roomuse_num, roomuse_status);
			} else if (roomuse_status.equals("off")) {
				managerposService.stop_room(roomuse_num);
			}

			System.out.println("데이터가 들어옴!");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		Map<String, String> map1 = new HashMap<>();
		map1.put("OK", "OK");
		return map1;
	}

	@ResponseBody
	@RequestMapping(value = "get_room_uselist", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Object> get_room_uselist(HttpSession session) {
		//session.setAttribute("admin", "admin");
		//session.removeAttribute("roomNum");

		List<RoomuseVO> list = managerposService.roomuselist();
		// List<RoomuseVO> list = managerposService.roomuselist2();

		JSONArray replydataArray = new JSONArray();// json으로 보내기 위한 작업

		for (int i = 0; i < list.size(); i++) {

			JSONObject replydata = new JSONObject(); // json으로 보내기위한작업

			String starttime = list.get(i).getStarttime();

			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			String currenttime = format.format(System.currentTimeMillis());
			
			String starttimearr[] = starttime.split(":");
			String curtimearr[] = currenttime.split(":");
			int usetimearr[] = new int[3];

			int time = 0;
			for (int j = 0; j < curtimearr.length; j++) {
				usetimearr[j] = (Integer.parseInt(curtimearr[j])) - (Integer.parseInt(starttimearr[j]));
			}
			if (usetimearr[0] < 0) {
				usetimearr[0] += 24;// 시작시간보다 끝난시간이 적으면 24시간 추가해서 계산
			}

			time += usetimearr[0] * 3600;// 시
			time += usetimearr[1] * 60;// 분
			time += usetimearr[2];// 초
			list.get(i).setStarttime(String.valueOf(time));

			replydata.put("roomuse_id", list.get(i).getRoomuse_id());
			replydata.put("roomuse_num", list.get(i).getRoomuse_num());
			replydata.put("starttime", list.get(i).getStarttime());
			replydata.put("roomuse_status", list.get(i).getRoomuse_status());
			replydata.put("currenttime", currenttime);
			replydataArray.add(replydata);

		}
		return replydataArray;

	}

	@PostMapping("EmployeeDelete")
	public String employeeDelete(Model model, @RequestParam("EMPLOYEE_PWD") String emppwd,
			@RequestParam("EMPLOYEE_mngnum") String mngnum) {
		List<EmployeeAttachVO> attachList = MemberService.getAttachList(Integer.parseInt(mngnum));
		
		System.out.println("emppwd = "+emppwd+"\nmngnum = "+mngnum);
		/* managementService.deletemng(emppwd,mngnum); */
		if(managementService.deletemng(emppwd,mngnum) == 1) {
			deleteFiles(attachList);
		}
		
		model.addAttribute("managerList", managementService.managerList()); // 재고테이블
		return "/younghak/Manager_management";
	}

	@PostMapping("workonoff")
	public String workonoff(Model model, @RequestParam("employeenum") String empnum,
			@RequestParam("employeepwd") String emppwd,HttpSession session) {
		
		int logincount = managementService.managerlogin(empnum,emppwd);

		if (logincount == 0) {// 1이 아니면 에러
			model.addAttribute("errormsg", "아이디와 비밀번호가 일치하지 않습니다."); // 재고테이블

			return "/younghak/login";
		}
		
		SimpleDateFormat format = new SimpleDateFormat ("yyMMdd");
		String format_time = format.format (System.currentTimeMillis()); 
		//만약 19년4월 11일이면 190411로 출력이된다.
		
		int recordcount =managementService.managerloginrecord(empnum,emppwd,format_time);
		List<EmployeeVO> empdata = managementService.getempdata(empnum); //출근한사람의 기록을 가져옴
		if(recordcount==0) {
			managementService.managerattendance(empnum); //출근
			System.out.println("출근 완료");
			
			
			if(empdata.get(0).getEMPLOYEE_POSITION().equals("사장")) {
				//session.setAttribute("EMPNAME", "사장");//로그인 세션추가
				//session.setAttribute("EMPPOSITION", "사장");//로그인 세션추가
			}else {
				session.setAttribute("EMPNAME", empdata.get(0).getEMPLOYEE_NAME());//로그인 세션추가
				session.setAttribute("EMPPOSITION", empdata.get(0).getEMPLOYEE_POSITION());
			}
			
			
			session.setAttribute("EMPID", empnum);//로그인 세션추가
			//session.setAttribute("EMPPOSITION", "사장");//로그인 세션추가
			model.addAttribute("succecssmsg", "출근완료"); // 재고테이블
			return "/younghak/Managerpos";
		}else if(recordcount==1){
			managementService.managerleavework(empnum,format_time); //퇴근
			System.out.println("퇴근 완료");
			/*
			 * session.invalidate();//로그인 세션추가
			 */
			
			session.setAttribute("EMPPRENAME", empdata.get(0).getEMPLOYEE_NAME());//로그인 세션추가
			session.setAttribute("EMPNAME", "현재 공석");//로그인 세션추가
			session.setAttribute("EMPID", "tmp");//로그인 세션추가
			//session.setAttribute("EMPPOSITION", "사장");//로그인 세션추가
			makecomic_pay(empnum);//퇴근기록으로 comic_pay테이블에 누적시간넣는 함수
			model.addAttribute("succecssmsg", "퇴근완료"); // 재고테이블
			return "/younghak/Managerpos";
		}

		return "/younghak/login";
	}

	private void makecomic_pay(String empnum) {
		SimpleDateFormat format = new SimpleDateFormat("yyMM");
		String workmonth = format.format(System.currentTimeMillis());
		System.out.println("workmonth = "+workmonth+"empnum = "+empnum);
		int data = managementService.selectworkmonth(empnum, workmonth);

		if (data == 0) {// 오늘날짜를 기준으로 해당 달의 데이터가 없으면 월급지급일이랑 해당달의 데이터넣기

			DateFormat df = new SimpleDateFormat("yyMM10");
			Calendar cal = Calendar.getInstance();
			cal.add(cal.MONTH, +1); // 다음달
			// cal.add ( cal.MONTH, -1 ); 이전달
			// cal.set(Calendar.DAY_OF_MONTH,1); 해당 월의 1일로 변경
			// System.out.println(df.format(cal.getTime()));
			String payday = df.format(cal.getTime());

			managementService.insertworkmonth(empnum, workmonth, payday);

			cmltv_time(empnum, workmonth);// 사번으로 근무달의 누적시간구하는함수

		} else if (data == 1) {// 오늘날짜를 기준으로 해당 달의 데이터가 있으면 누적시간구하기

			cmltv_time(empnum, workmonth);// 사번으로 근무달의 누적시간구하는함수

		}

	}

	private void cmltv_time(String empnum, String workmonth) {// 누적시간이라는뜻
		// 누적시간구하는메서드
		DateFormat df = new SimpleDateFormat("yyMMdd");

		Calendar cal = Calendar.getInstance();

		cal.add(cal.MONTH, 0); // 이번달
		cal.set(Calendar.DAY_OF_MONTH, 1); // 해당 월의 1일로 변경(ex.191001)
		String firstday = df.format(cal.getTime());// thismonthfirstday

		cal.add(cal.MONTH, +1); // 다음달
		cal.set(Calendar.DAY_OF_MONTH, 1); // 다음 달의 첫번째 일로 변경(ex.191101)
		String lastday = df.format(cal.getTime());// String thismonthlastday

		List<WorkrecordVO> list = mngCalendarService.workrecordmonth(firstday, lastday, empnum); // 해당달의 출근기록을 list로 가져옴

		int worktimearr[] = new int[3];
		// worktimearr[0]=시
		// worktimearr[1]=분
		// worktimearr[2]=초

		for (int i = 0; i < list.size(); i++) {
			String starttime = list.get(i).getStarttime();

			if (list.get(i).getEndtime() != null) {// 퇴근기록이 없을수잇으므로 null인지 아닌지 처리를 해준다.

				String endtime = list.get(i).getEndtime();

				String starttimearr[] = starttime.split(":");
				String endtimearr[] = endtime.split(":");

				int time = 0;
				for (int j = 0; j < endtimearr.length; j++) {
					worktimearr[j] += Integer.parseInt(endtimearr[j]) - Integer.parseInt(starttimearr[j]);
				}
			}
		}
		System.out.println("worktimearr[0] = " + worktimearr[0] + "   sworktimearr[1] = " + worktimearr[1] + "   worktimearr[2] = " + worktimearr[2]);
		int second = worktimearr[0] * 3600 + worktimearr[1] * 60 + worktimearr[2];
		System.out.println("total sec=" + second);

		worktimearr[0] = second / 3600;// 시
		worktimearr[1] = second % 3600 / 60;// 분
		worktimearr[2] = second % 60;// 초

		System.out.println("worktimearr[0] = " + worktimearr[0] + "  worktimearr[1] = " + worktimearr[1] + "  worktimearr[2] = " + worktimearr[2]);
		int hour = worktimearr[0];
		if (worktimearr[1] / 30 >= 1) {
			hour++;
		}
		managementService.setmonthlypay(empnum, workmonth, hour);
	}

	@RequestMapping(value = "workhourcalendar", method = { RequestMethod.GET, RequestMethod.POST })
	public String workhourcalendar(@RequestParam("empname") String empname, @RequestParam("empnum") String empnum, Model model) {

		System.out.println("empname = " + empname + "\nempnum" + empnum);

		model.addAttribute("empname", empname);
		model.addAttribute("empnum", empnum);// empnum으로 계속하려다 그냥 empname

		return "/younghak/WorkhourCalendar";

	}

	@ResponseBody
	@RequestMapping(value = "getempdata", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Object> getempdata(@RequestBody HashMap<String, Object> map, Model model// 배열 받기 traditional: true
	) {

		JSONArray jsonArray = new JSONArray(); // object 타입

		String empnum = jsonArray.fromObject(map.get("list")).get(0).toString();
		System.out.println("empnum = " + empnum);

		List<EmployeeVO> empdata = managementService.getempdata(empnum); // 해당달의 출근기록을 list로 가져옴

		JSONArray replydataArray = new JSONArray();// json으로 보내기 위한 작업
		for (int i = 0; i < empdata.size(); i++) {

			JSONObject emp = new JSONObject(); // json으로 보내기위한작업

			emp.put("employee_name", empdata.get(i).getEMPLOYEE_NAME());
			emp.put("employee_phone", empdata.get(i).getEMPLOYEE_PHONE());
			emp.put("employee_account", empdata.get(i).getEMPLOYEE_ACCOUNT());
			emp.put("employee_position", empdata.get(i).getEMPLOYEE_POSITION());
			emp.put("employee_pay", empdata.get(i).getEMPLOYEE_PAY());
			emp.put("employee_pwd", empdata.get(i).getEMPLOYEE_PWD());

			replydataArray.add(emp);
		}
		System.out.println(replydataArray);
		return replydataArray;
	}

	@ResponseBody
	@RequestMapping(value = "getempworkrecord", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Object> getempworkrecord(@RequestBody HashMap<String, Object> map, Model model// 배열 받기 traditional: true
	) {
		System.out.println("getempworkrecord오긴옴");
		JSONArray jsonArray = new JSONArray(); // object 타입
		// roomuse_id, roomuse_num,roomuse_status
		String startday = jsonArray.fromObject(map.get("list")).get(0).toString();
		// jsp ajax에서 통신에서 받아온 값
		String endday = jsonArray.fromObject(map.get("list")).get(1).toString();
		String empnum = jsonArray.fromObject(map.get("list")).get(2).toString();

		System.out.println("startday = " + startday + "\nendday = " + endday + "\nempnum = " + empnum);
		List<WorkrecordVO> list = mngCalendarService.workrecordmonth(startday, endday, empnum); // 해당달의 출근기록을 list로 가져옴
		// model.addAttribute("list",list);

		JSONArray replydataArray = new JSONArray();// json으로 보내기 위한 작업
		for (int i = 0; i < list.size(); i++) {

			JSONObject workinghour = new JSONObject(); // json으로 보내기위한작업

			workinghour.put("starttime", list.get(i).getStarttime());

			if (list.get(i).getEndtime() == null) {
				// 출근데이터가 찍혀잇을수잇으나 퇴근을 안했을수 있기 때문에 퇴근을 안했을 경우 데이터 처리를 해줘야한다.
				workinghour.put("endtime", "퇴근 미체크");
			} else {
				workinghour.put("endtime", list.get(i).getEndtime());
			}

			workinghour.put("workingday", list.get(i).getWorkday());

			int worksecond = 0;
			if (null != list.get(i).getEndtime()) {
				worksecond = timesecondparsing(list.get(i).getStarttime(), list.get(i).getEndtime());
				workinghour.put("worksecond", worksecond);
			} else {
				workinghour.put("worksecond", 0);
			}

			// 출근시간과 퇴근시간의 차를 구해서 초단위로 리턴하는 메서드

			replydataArray.add(workinghour);

		}
		System.out.println(replydataArray);
		return replydataArray;
	}

	private int timesecondparsing(String starttime, String endtime) {
		// 시간을 초로 계산해서 반환
		System.out.println("endtime = " + endtime);
		System.out.println("starttime = " + starttime);
		String starttimearr[] = starttime.split(":");
		String endtimearr[] = endtime.split(":");
		int usetimearr[] = new int[3];

		int time = 0;
		for (int j = 0; j < endtimearr.length; j++) {
			usetimearr[j] = Integer.parseInt(endtimearr[j]) - Integer.parseInt(starttimearr[j]);
		}

		time += usetimearr[0] * 3600;// 시
		time += usetimearr[1] * 60;// 분
		time += usetimearr[2];// 초

		return time;
	}

	@ResponseBody
	@RequestMapping(value = "gettodaycommute", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Object> gettodaycommute() {

		SimpleDateFormat todaycommuteformat = new SimpleDateFormat("yyMMdd");
		String todayformat = todaycommuteformat.format(System.currentTimeMillis());

		List<TodaycommuteVO> list = managerposService.todaycommutelist(todayformat);
		// List<RoomuseVO> list = managerposService.roomuselist2();

		JSONArray replydataArray = new JSONArray();// json으로 보내기 위한 작업

		System.out.println("list size is = " + list.size());

		for (int i = 0; i < list.size(); i++) {

			JSONObject replydata = new JSONObject(); // json으로 보내기위한작업

			// list.get(i).setStarttime(String.valueOf(time));

			replydata.put("starttime", list.get(i).getStarttime());

			if (list.get(i).getEndtime() == null) { // 퇴근시간은 없을수있으므로 처리를 해줘야함
				replydata.put("endtime", "퇴근 무기록");
			} else {
				replydata.put("endtime", list.get(i).getEndtime());
			}

			replydata.put("empnum", list.get(i).getEmpnum());
			replydata.put("empname", list.get(i).getEmpname());

			replydataArray.add(replydata);

		}
		System.out.println(replydataArray);
		return replydataArray;

	}
	
	 @PostMapping("/EmployeeModify")
	   public String EmployeeRegister(EmployeeVO vo,Model model) {
		 List<EmployeeAttachVO> attachList = MemberService.getAttachList(vo.getEMPLOYEE_NUM());
		 managementService.employeeModify(vo);
		 if(!attachList.get(0).getUuid().equals(vo.getAttachList().get(0).getUuid())) {
	          deleteFiles(attachList);
	     }
		 model.addAttribute("managerList", managementService.managerList()); // 재고테이블
		 return "redirect:/managerpos/Manager_management";
	      
	   }
	 
	 @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<EmployeeAttachVO>> getAttachList(@RequestParam("employee_num") int employee_num) {
		 	System.out.println("여기오옴");
			return new ResponseEntity<List<EmployeeAttachVO>>(MemberService.getAttachList(employee_num), HttpStatus.OK);
		}
	 
	 private void deleteFiles(List<EmployeeAttachVO> attachList) {
			
			if(attachList == null || attachList.size() == 0) {
				return;
			}
			
			attachList.forEach(attach -> {
				try {
					Path file = Paths.get("/home/ubuntu/upload/comic_employee/" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.deleteIfExists(file);
					
					if(Files.probeContentType(file).startsWith("image")) {
						
						Path thumbNail = Paths.get("/home/ubuntu/upload/comic_employee/" + attach.getUploadPath() + "/s_" + attach.getUuid() + "_" + attach.getFileName());
						
						Files.delete(thumbNail);
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			});
			
		}
	 
}
