package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Classes;
import com.kgc.pojo.PageBean;
import com.kgc.pojo.Student;
import com.kgc.service.Impl.StuServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/con")
public class StuController {

    @Autowired
    private StuServiceImpl service;

    @RequestMapping("/show")
    public ModelAndView SelectAll(ModelAndView mav, PageBean page) {

        List<Student> list = service.SelectAll(page);

        List<Classes> list1 = service.SelectAllClasses();

        mav.addObject("list", list);
        mav.addObject("list1", list1);
        mav.addObject("page", page);
        mav.setViewName("show");


        return mav;
    }

    @RequestMapping("add")
    public String add(Model model) {

        List<Classes> ca = service.SelectAllClasses();

        model.addAttribute("ca", ca);

        return "add";
    }

    @RequestMapping("add1")
    public String add1(Student stu) {


        int i = service.add(stu);

        return "redirect:/con/show";
    }

    @RequestMapping("/del")
    public String Delete(Integer id) {

        int i = service.delete(id);

        return "redirect:/con/show";

    }

    @RequestMapping("/test1")
    @ResponseBody
    public List<Student> Test1() {

        List<Student> list = service.SelectTest();

        return list;

    }

    @RequestMapping("/test2")
    @ResponseBody
    public String Test2() {
        return "[\"张三\",\"李四\",\"王二麻子\"]";
    }

    @RequestMapping("/dell")
    @ResponseBody
    public String dell(Integer id) {

        int i = service.delete(id);

        return "i";

    }


    //分页的服务接口
    @RequestMapping("getDataByPage")
    @ResponseBody
    public HashMap<String, Object> getDataByPage(int page, int rows) {

        //1.查询所有的学生
        PageInfo<Student> pageInfo = service.getStudentByPage(page, rows);
        //2.为了满足datagrid控件实现分，必需total键，rows键。
        HashMap<String, Object> map = new HashMap<>();
        map.put("total", pageInfo.getTotal());
        map.put("rows", pageInfo.getList());


        return map;

    }

}
