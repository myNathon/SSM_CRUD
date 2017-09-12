import com.github.pagehelper.PageInfo;
import com.none.crud.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用 Spring 单元测试模拟请求，测试页面请求的准确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
    // Spring MVC 的 IOC 容器
    @Autowired
    WebApplicationContext context;

    // 模拟MVC请求
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        // 模拟请求并获取结果
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1"))
                .andReturn();

        // 取出 PageInfo 进行验证
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("pageInfo");

        System.out.println("当前页码：" + pi.getPageNum());
        System.out.println("总页数：" + pi.getPages());
        System.out.println("总记录数：" + pi.getTotal());
        System.out.println("...：" + pi.getSize());
        System.out.println("页面需要连续现实的页码");
        int[] nums = pi.getNavigatepageNums();
        for(int i: nums) {
            System.out.print(i + " ");
        }
        System.out.println();

        // 获取查询的员工信息
        List<Employee> list = pi.getList();
        for(Employee e: list) {
            System.out.println("ID: " + e.getEmpId());
            System.out.println("name: " + e.getEmpName());
            System.out.println("gender: " + e.getGender());
            System.out.println("email: " + e.getEmail());
            System.out.println("d_ID: " + e.getDepartment().getDeptId());
            System.out.println("d_name: " + e.getDepartment().getDeptName());
        }
    }
}
