package com.comic.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.comic.model.OrderProductViewVO;
import com.comic.model.OrderVO;
import com.comic.model.OrderViewVO;
import com.comic.service.UserOrderManegerService;

import lombok.AllArgsConstructor;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/sangju/")
@AllArgsConstructor
public class SangjuController {
	private UserOrderManegerService userOrderManegerService;

	@GetMapping("/popup")
	public void popupView() {
		
	}
	
	@GetMapping("/admin")
	public void adminView(Model model) {
		model.addAttribute("OrderViewVO_List", userOrderManegerService.readCategory());
	}

	@PostMapping("/admin/categoryAdd")
	public String categoryAdd(@RequestParam("category") String category) {
		System.out.println("categoryAdd....category " + category);

		OrderViewVO vo = new OrderViewVO();
		vo.setOrderview_category(category);
		userOrderManegerService.registerCategory(vo);

		return "redirect:/sangju/admin";
	}

	@PostMapping("/admin/categoryUpdate")
	public String categoryUpdate(@RequestParam("category") String category, @RequestParam("number") int number) {
		System.out.println("categoryUpdate....category " + category);
		System.out.println("categoryUpdate....number " + number);

		OrderViewVO vo = new OrderViewVO();
		vo.setOrderview_num(number);
		vo.setOrderview_category(category);

		userOrderManegerService.productCategoryUpdate(vo);
		userOrderManegerService.updateCategory(vo);

		return "redirect:/sangju/admin";
	}

	@PostMapping("/admin/categoryDelete")
	public String categoryDelete(@RequestParam("number") int number) {
		System.out.println("categoryDelete....number " + number);

		userOrderManegerService.porductCateoryAllDelete(number);
		userOrderManegerService.deleteCategory(number);

		return "redirect:/sangju/admin";
	}

	@PostMapping(value = "/productDelete", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> productDelete(@RequestBody Map<String, String> number) {
		System.out.println("productDelete....number " + number);
		System.out.println(number.get("number"));

		String categoryValue = userOrderManegerService.getCategoryValue(Integer.parseInt(number.get("number")));
		userOrderManegerService.porductCateoryDelete(Integer.parseInt(number.get("number")));

		return new ResponseEntity<String>(categoryValue, HttpStatus.OK);

	}

	// ajax
	@GetMapping(value = "/productRead/{category}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Map<String, Object>>> getAjaxList(@PathVariable("category") String category) {
		return new ResponseEntity<List<Map<String, Object>>>(userOrderManegerService.readProduct(category), HttpStatus.OK);
	}

	@PostMapping(value = "/productCheck", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> productCheck(@RequestBody Map<String, String> productName) {
		System.out.println(productName.get("productName").toString());
		int result = userOrderManegerService.productCheck(productName.get("productName").toString());
		return result >= 1 ? new ResponseEntity<String>("OK", HttpStatus.OK) : new ResponseEntity<String>("NULL", HttpStatus.OK);
	}

	@PostMapping(value = "/productAdd", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String> productAdd(MultipartHttpServletRequest request) {
		OrderProductViewVO vo = new OrderProductViewVO();
		MultipartFile uploadFile = request.getFile("uploadFile");

		String uploadFolder = "/home/ubuntu/upload";
		String uploadFolderPath = getFolder();
		// make folder --------S
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		String uploadFileName = uploadFile.getOriginalFilename();

		// IE has file path uploadFileName =
		uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);

		UUID uuid = UUID.randomUUID();
		vo.setOrderview_filename(uploadFileName);
		uploadFileName = uuid.toString() + "_" + uploadFileName;

		try {
			File saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile);

		} catch (Exception e) {
			e.printStackTrace();
		}
		vo.setOrderview_category(request.getParameter("productCategory"));
		vo.setOrderview_uploadpath(uploadPath.toString());
		vo.setOrderview_uuid(uuid.toString());
		userOrderManegerService.productInsert(request.getParameter("productName"), vo);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

	// 여기부터 사용자뷰

	@GetMapping("/start")
	public void startView() {

	}

	@PostMapping("/main")
	public void mainView(@RequestParam("roomNum") int roomNum, final HttpSession session) {
		session.setAttribute("roomNum", roomNum);
	} 
	@GetMapping("/main")
	public void mainViewGet() {
	}

	@GetMapping("/order")
	public void orderView(Model model, final HttpSession session) {
		System.out.println(session.getAttribute("roomNum"));
		model.addAttribute("OrderViewVO_List", userOrderManegerService.readCategory());
	}

	@PostMapping(value = "/resultOrder", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> resultOrder(@RequestBody Map<Integer, Map<String, String>> orderJsonData, HttpSession session) {
		System.out.println(orderJsonData);
		List<OrderVO> orderList = new ArrayList<OrderVO>();

		orderJsonData.forEach((k, v) -> {
			OrderVO ordervo = new OrderVO();
			ordervo.setOrder_id("user123");
			ordervo.setOrder_product_num(Integer.parseInt(orderJsonData.get(k).get("productNum")));
			ordervo.setOrder_roomnum(Integer.parseInt(session.getAttribute("roomNum").toString()));
			ordervo.setOrder_qty(Integer.parseInt(orderJsonData.get(k).get("qty")));
			ordervo.setOrder_time(new Date());
			orderList.add(ordervo);
		});

		userOrderManegerService.realTimeOrderAdd(orderList);

		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

	// 파일 업로드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	@PostMapping(value = "/uploadFile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String> uploadFile(MultipartHttpServletRequest request) throws IOException {
		System.out.println(request.getFile("uploadFile"));
		MultipartFile uploadFile = request.getFile("uploadFile");
		System.out.println(request.getParameter("productName"));
		System.out.println(request.getParameter("productCategory"));

		System.out.println(uploadFile.getName());
		System.out.println(uploadFile);
		System.out.println(uploadFile.getContentType());

		String uploadFolder = "/home/ubuntu/upload";
		String uploadFolderPath = getFolder();
		// make folder --------S
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		String uploadFileName = uploadFile.getOriginalFilename();

		// IE has file path uploadFileName =
		uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;

		try {
			File saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

}
