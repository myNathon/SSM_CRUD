package com.none.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.none.crud.bean.Employee;
import com.none.crud.bean.GeneralMsg;
import com.none.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理员工信息的请求
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/emps")
    @ResponseBody
    public GeneralMsg getEmps(@RequestParam(name="pn", defaultValue="1") Integer pn) {
        // 使用 PageHelper 进行分页
        PageHelper.startPage(pn, 5);

        List<Employee> emps = employeeService.getAll();

        // 使用 PageInfo 包装查询得结果，还可以传入需要连续显示的页数
        PageInfo info = new PageInfo(emps, 5);

        return GeneralMsg.success().add("pageInfo", info);
    }

    /**
     * 员工信息查询（分页查询）
     * @return
     */
//    @RequestMapping("/emps")  // 处理的请求
    public String getEmps(@RequestParam(name="pn", defaultValue="1") Integer pn, Model model) {
        // 使用 PageHelper 进行分页
        PageHelper.startPage(pn, 5);

        List<Employee> emps = employeeService.getAll();

        // 使用 PageInfo 包装查询得结果，还可以传入需要连续显示的页数
        PageInfo info = new PageInfo(emps, 5);

        // 将数据放到 model 中
        model.addAttribute("pageInfo", info);

        return "list";  // 返回请求的页面
    }
}
