import com.kgc.service.IStuService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestALL {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.XML");
        IStuService studentService = (IStuService) ctx.getBean("stuServiceImpl"); //传的值 开头要是小写的才行
        studentService.getStudentByPage(1, 4);
    }
}
