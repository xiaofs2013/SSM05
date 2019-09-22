package com.kgc.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.mapper.ClassesMapper;
import com.kgc.mapper.StudentMapper;
import com.kgc.pojo.Classes;
import com.kgc.pojo.PageBean;
import com.kgc.pojo.Student;
import com.kgc.pojo.StudentExample;
import com.kgc.service.IStuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StuServiceImpl implements IStuService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ClassesMapper classesMapper;

    public List<Student> SelectAll(PageBean page) {
        //1  条件查询块
        StudentExample s = new StudentExample();
        StudentExample.Criteria c = s.createCriteria();

        int size = page.getSize();
        int count = (int) studentMapper.countByExample(s);
        int total = (count % size == 0) ? (count / size) : (count / size + 1);
        page.setCount(count);
        page.setTotalPage(total);
        int StratRow = (page.getCurrPage() - 1) * size;
        s.limit(StratRow, size);

        List<Student> list = studentMapper.selectByExample(s);
        for (Student stu : list) {
            stu.setClasses(classesMapper.selectByPrimaryKey(stu.getClassid()));
        }


        return list;
    }

    public List<Classes> SelectAllClasses() {

        List<Classes> list = classesMapper.selectByExample(null);

        return list;
    }

    public int add(Student stu) {

        int i = studentMapper.insertSelective(stu);

        System.out.println("添加了" + i + "条数据");

        return i;
    }

    public int delete(Integer id) {

        int i = studentMapper.deleteByPrimaryKey(id);

        return i;
    }

    public List<Student> SelectTest() {

        List<Student> list = studentMapper.selectByExample(null);

        return list;
    }


    @Override
    public PageInfo<Student> getStudentByPage(int page, int pagesize) {

        //1 开启分页
        PageHelper.startPage(page, pagesize); //里面传页码与每页显示数即可
        //2.查询所有的信息
        List<Student> list = studentMapper.selectByExample(null);
        //3.获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }
}
