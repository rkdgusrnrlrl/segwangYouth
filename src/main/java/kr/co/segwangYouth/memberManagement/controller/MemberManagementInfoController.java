package kr.co.segwangYouth.memberManagement.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sound.midi.SysexMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.segwangYouth.memberManagement.service.MemberManagementInfoService;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class MemberManagementInfoController{
	private static final Logger logger = LoggerFactory.getLogger(MemberManagementInfoController.class);
	
	@Autowired
	private MemberManagementInfoService service;

	
	/**
	 * 청년 회원 조회 상세화면 (상세, 수정)
	 * @param model
	 * @param memberSeq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/memberManagementInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberManagementInfo(
			Model model,
			@RequestParam String memberSeq
			) throws Exception{
		
			Map selectDetail = service.selectMemberDetail(memberSeq);
			model.addAttribute("selectDetail",selectDetail);
			
			return "memberManagement/memberManagementInfo";
	}	
	
	
	@RequestMapping(value = "/memberManagementInfoPUT", method = RequestMethod.POST)
	public String memberManagementInfoPut(
			Model model,
			@RequestParam HashMap<String,String>detailMap) throws Exception{

		System.out.println("detailMap " +  detailMap);

		
		// update 서비스
		service.updateMemberInfo(detailMap);
		
		//TODO: key를 갖고 다시 detail select service태우기 
		
		return "memberManagement/memberManagementInfo";
	}
			
			
	
	
}