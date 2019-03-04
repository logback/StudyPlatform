package com.aldrich.mapper;

import com.aldrich.model.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author aldrich
 * @date 2018/11/26 22:07
 */
@Repository
public interface StudentMapper {

    /**
     * 返回所有的学生
    * @return list
    * */
    List<Student> selectStudents();

}
