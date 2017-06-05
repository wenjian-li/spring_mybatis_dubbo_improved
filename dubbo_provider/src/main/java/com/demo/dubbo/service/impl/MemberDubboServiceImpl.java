package com.demo.dubbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.MemberMapper;
import com.demo.dubbo.service.MemberDubboService;
import com.demo.entity.Member;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("memberDubboServiceImpl")
public class MemberDubboServiceImpl implements MemberDubboService {

	@Autowired
	private MemberMapper memberMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return memberMapper.deleteByPrimaryKey(id);
	}

	public int insert(Member member) {
		// TODO Auto-generated method stub
		return memberMapper.insert(member);
	}

	public int insertSelective(Member member) {
		// TODO Auto-generated method stub
		return memberMapper.insertSelective(member);
	}

	public Member selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return memberMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Member member) {
		// TODO Auto-generated method stub
		return memberMapper.updateByPrimaryKeySelective(member);
	}

	public int updateByPrimaryKey(Member member) {
		// TODO Auto-generated method stub
		return memberMapper.updateByPrimaryKey(member);
	}

	public PageInfo<Member> getPageInfo(Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<Member> list = memberMapper.select();
		return new PageInfo<Member>(list);
	}

}
