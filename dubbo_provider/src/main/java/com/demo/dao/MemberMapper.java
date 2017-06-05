package com.demo.dao;

import java.util.List;

import com.demo.entity.Member;

public interface MemberMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_member
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_member
     *
     * @mbg.generated
     */
    int insert(Member member);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_member
     *
     * @mbg.generated
     */
    int insertSelective(Member member);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_member
     *
     * @mbg.generated
     */
    Member selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_member
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Member member);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_member
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Member member);

	List<Member> select();
}