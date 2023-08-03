package com.mycompany.postella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinController {

	/* 회원관련 */
	@GetMapping("/join")
	public String joinForm() {
		return "join/join";
	}

	/*@PostMapping("/join")
	public String join(Ch13Member member, Model model) {
		JoinResult result = memberService.join(member);
		Ch13Member dbMember = memberService.getMember(member.getMid());
		if(result == JoinResult.FAIL_DUPLICATED_MID) {
			String error = "중복된 ID가 존재합니다.";
			model.addAttribute("error", error);
			return "ch13/joinForm";
		} else {
			memberService.join(member);
			return "redirect:/ch13/content";						
		}
	}*/

}
