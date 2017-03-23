package kr.co.segwangYouth.checkYouth.controller;

import com.google.gson.Gson;
import kr.co.segwangYouth.memberManagement.service.MemberManagementInfoService;
import kr.co.segwangYouth.memberManagement.service.MemberManagementService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class CheckYouthController {
	private static final Logger logger = LoggerFactory.getLogger(CheckYouthController.class);
	/**
	 * 청년 회원 조회
	 */
	@RequestMapping(value = "/check", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberManagementSearch(
			Model model, @RequestParam HashMap<String, String>searchMap) throws Exception{
			logger.info("POST METHOD");
			
			//TODO: client에서 server로 param을 전달 할 때마다 공통적으로 사용 될
			// requestMap을 Map형태로 변환하는 모듈이필요하다.

			
		return "check/check";
	}
}
