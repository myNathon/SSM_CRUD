package com.none.crud.bean;

public class Employee {
    private Integer empId;

    private String empName;

    private String gender;

    private String email;

    private Integer dId;

    // 所对应的部门信息
    private Department department;

    public Employee() {
    }

    public Employee(String empName, String gender, String email, Integer dId) {
        this(null, empName, gender, email, dId);
    }

    public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
        this();
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}