package com.comic.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.comic.model.CommentsVO;
import com.comic.service.CommentsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/Cmnts/")
@RestController
@Log4j
@AllArgsConstructor
public class CommentsController {

	private CommentsService service;

	// , consumes="application/json", produces = { MediaType.TEXT_PLAIN_VALUE }
	/*
	 * @PostMapping(value="/new", consumes="application/json")
	 */
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody CommentsVO vo) {

		log.info("\r\n####Comments register Controller : " + vo.toString());

		int insertCount = service.register(vo);

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@GetMapping(value = "/{board_num}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<CommentsVO>> getList(@PathVariable("board_num") Long board_num) {
		System.out.println(board_num);
		log.info("\r\n####Comments getList Controller");

		return new ResponseEntity<List<CommentsVO>>(service.getList(board_num), HttpStatus.OK);

	}

	@DeleteMapping(value = "/{cmnt_num}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("cmnt_num") int cmnt_num) {

		log.info("\r\n####Comments remove Controller: " + cmnt_num);

		return service.remove(cmnt_num) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{cmnt_num}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody CommentsVO vo, @PathVariable("cmnt_num") int cmnt_num) {

		vo.setCmnt_num(cmnt_num);

		log.info("\r\n####Comments modify Controller-- cmnt_num: "+ cmnt_num+" modify: " + vo);

		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

}
