import com.none.crud.bean.Department;
import com.none.crud.bean.DepartmentExample;
import com.none.crud.bean.Employee;
import com.none.crud.dao.DepartmentMapper;
import com.none.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * 测试dao层的工作
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    /**
     * 测试department
     */
    @Test
    public void testCRUD() {
        // 1、创建Spring IOC容器
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        // 2、从容器中获取 mapper
//        DepartmentMapper mapper = ioc.getBean(DepartmentMapper.class); // 创建后就可以调用对应的方法
//        System.out.println(mapper);

        // 使用 Spring 的单元测试方式，需要导入 Spring 单元测 jar 包
        // 1、使用注解@ContextConfiguration指定 Spring 配置文件的位置，自动创建 IOC 容器
        // 2、利用JUnit中的注解@RunWith指定运行的测试单元为(SpringJUnit4ClassRunner.class)
        // 3、直接在测试类内使用 @Autowired 自动注入 mapper
        System.out.println("auto: " + departmentMapper);

        // 插入几个部门信息，创建对应的构造函数
//        departmentMapper.insertSelective(new Department("开发部"));
//        departmentMapper.insertSelective(new Department("测试部"));

        // 查询全部门信息
//        List<Department> list = departmentMapper.selectByExample(new DepartmentExample());
//        System.out.println(list.size());
//        for(Department dept: list) {
//            System.out.println(dept.getDeptId() + " : " + dept.getDeptName());
//        }

        // 生成员工信息
//        employeeMapper.insertSelective(new Employee("nathon", "M", "nathon@none.com", 1));

        // 批量生成，使用 sqlSession
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for(int i = 0; i < 1000; i++) {
//            String n = UUID.randomUUID().toString().substring(0, 5) + i;
//            mapper.insertSelective(new Employee(n, "M", n + "@none.com", 1));
//        }

        // 查询
//        Employee e = employeeMapper.selectByPrimaryKeyWithDept(100);
//        System.out.println(e.getEmpId() + ":" + e.getEmpName() + ":" + e.getdId() + ":" + e.getDepartment().getDeptId());
    }
}
