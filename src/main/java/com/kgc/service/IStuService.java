package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Student;

public interface IStuService {


    //查询学生实现分页
    public PageInfo<Student> getStudentByPage(int page, int pagesize);
}
