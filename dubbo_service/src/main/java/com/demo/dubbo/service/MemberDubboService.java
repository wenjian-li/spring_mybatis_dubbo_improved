package com.demo.dubbo.service;

import com.demo.entity.Member;
import com.github.pagehelper.PageInfo;

/**
 * Dubbo业务provide和consumer公用
 * 
 * @author Vincent
 *
 */
public interface MemberDubboService {
	int deleteByPrimaryKey(Integer id);

	int insert(Member member);

	int insertSelective(Member member);

	Member selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Member member);

	int updateByPrimaryKey(Member member);

	PageInfo<Member> getPageInfo(Integer pageNum, Integer pageSize);
}
