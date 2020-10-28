package com.project.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BbsController {

	@RequestMapping("/bbs")
	public ModelAndView bbsList() {
		ModelAndView mv = new ModelAndView();
	
		// 화면을 표혀날 뷰페이지를 설정
		mv.setViewName("bbs/list");
		return mv;
	}
	
	
}
