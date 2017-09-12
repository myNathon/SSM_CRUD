package com.none.crud.bean;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用数据返回
 */
public class GeneralMsg {
    // 状态码 100 -- success; 200 -- fail
    private int code;
    // 提示信息
    private String msg;

    private Map<String, Object> extend = new HashMap<String, Object>();

    public static GeneralMsg success() {
        GeneralMsg msg = new GeneralMsg();
        msg.setCode(100);
        msg.setMsg("处理成功！");
        return msg;
    }

    public static GeneralMsg fail() {
        GeneralMsg msg = new GeneralMsg();
        msg.setCode(200);
        msg.setMsg("处理失败！");
        return msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    /**
     * 添加信息
     * @param key  值
     * @param val  对象
     * @return
     */
    public GeneralMsg add(String key, Object val) {
        this.getExtend().put(key, val);
        return this;
    }
}
