package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entity.Member;
import com.demo.service.MemberService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/member")
public class MemberController extends BaseController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		try {
			// Member member = memberService.findMemberById(1);
			// System.out.println("输出：" + member.getUsername());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "member/list";
	}

	@RequestMapping(value = "getPageData", method = RequestMethod.POST)
	@ResponseBody
	public Object getPageData(@RequestParam("pageNum") Integer pageNum, @RequestParam("pageSize") Integer pageSize) {
		PageInfo<Member> pageInfo = memberService.getPageData(pageNum, pageSize);
		Object o = super.success(pageInfo);
		System.out.println(o.toString());
		return super.success(pageInfo);
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "/member/add";
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public Object save(Member member) {
		memberService.save(member);
		return super.success("保存成功");
	}
	
	@RequestMapping(value = "checkUsername", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Object checkUsername(@RequestParam String username) {
		return "true";
	}

}
