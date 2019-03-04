package com.aldrich.service;

import com.aldrich.model.Student;

import java.util.List;

/**
 * @author aldrich
 * @date 2018/11/26 22:07
 */
public interface StudentService {

    /**
     * 返回所有的学生
     * @return list
     * */
    List<Student> selectStudents();
}
