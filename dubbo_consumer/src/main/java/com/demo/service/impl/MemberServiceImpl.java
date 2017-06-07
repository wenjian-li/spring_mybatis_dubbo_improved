package com.demo.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dubbo.service.MemberDubboService;
import com.demo.entity.Member;
import com.demo.service.MemberService;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @Description : MemberService接口实现类
 * @author : liwenjian
 * @version : 1.0
 * @Date : 2016年1月28日 下午3:26:18
 */
@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDubboService")
	private MemberDubboService memberDubboService;

	public List<Member> getMembers() {
		// TODO Auto-generated method stub
		return null;
	}

	public int save(Member member) {
		// TODO Auto-generated method stub
		member.setCreateTime(new Date());
		member.setUpdateTime(new Date());
		return memberDubboService.insert(member);
	}

	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return memberDubboService.updateByPrimaryKeySelective(member);
	}

	public Member findMemberById(Integer id) {
		return memberDubboService.selectByPrimaryKey(id);
	}

	public Member findMemberByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Member> findListByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageInfo<Member> getPageData(Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		return memberDubboService.getPageInfo(pageNum, pageSize);
	}
}
