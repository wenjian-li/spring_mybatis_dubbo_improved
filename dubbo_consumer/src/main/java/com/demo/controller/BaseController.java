package com.demo.controller;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * @author Vincent
 *
 */
public class BaseController {

	private final String SUCCESS_MSG = "success";
	private final String ERROR_MSG = "error";
	private final String SUCCESS_CODE = "000";
	private final String ERROR_CODE = "001";

	/**
	 * 成功提示
	 * 
	 * @return
	 */
	protected String success() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", SUCCESS_CODE);
		resultMap.put("msg", SUCCESS_MSG);
		return JSONObject.toJSONString(resultMap);
	}

	/**
	 * 成功提示（自定义提示信息）
	 * 
	 * @param msg
	 *            自定义提示信息
	 * @return
	 */
	protected String success(String msg) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", SUCCESS_CODE);
		resultMap.put("msg", msg);
		return JSONObject.toJSONString(resultMap);
	}

	/**
	 * 成功提示（返回resResult数据对象）
	 * 
	 * @param resResult
	 *            返回resResult数据对象
	 * @return
	 */
	protected String success(Object result) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", SUCCESS_CODE);
		resultMap.put("msg", SUCCESS_MSG);
		resultMap.put("result", result);
		return JSONObject.toJSONString(resultMap);
	}

	/**
	 * 错误提示
	 * 
	 * @return
	 */
	protected String error() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", ERROR_CODE);
		resultMap.put("msg", ERROR_MSG);
		return JSONObject.toJSONString(resultMap);
	}

	/**
	 * 错误提示
	 * 
	 * @param msg
	 *            自定义提示信息
	 * @return
	 */
	protected String error(String msg) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", ERROR_CODE);
		resultMap.put("msg", msg);
		return JSONObject.toJSONString(resultMap);
	}

	/**
	 * 错误提示（返回result数据对象）
	 * 
	 * @param result
	 *            返回result数据对象
	 * @return
	 */
	protected String error(Object result) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", ERROR_CODE);
		resultMap.put("msg", ERROR_MSG);
		resultMap.put("result", result);
		return JSONObject.toJSONString(resultMap);
	}

}
