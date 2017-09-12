package com.none.crud.service;

import com.none.crud.bean.Employee;
import com.none.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工信息
     * @return
     */
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null); // 查询所有，没有条件，传 null
    }
}
