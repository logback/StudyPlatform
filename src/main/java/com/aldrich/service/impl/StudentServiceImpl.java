package com.aldrich.service.impl;

import com.aldrich.mapper.StudentMapper;
import com.aldrich.model.Student;
import com.aldrich.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author aldrich
 * @date 2018/11/26 22:08
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {

    @Resource
    private StudentMapper studentMapper;

    @Override
    public List<Student> selectStudents() {
        return this.studentMapper.selectStudents();
    }

}
