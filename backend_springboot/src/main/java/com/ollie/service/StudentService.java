package com.ollie.service;

import com.ollie.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ollie.form.SearchForm;
import com.ollie.form.StudentForm;
import com.ollie.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2022-09-01
 */
public interface StudentService extends IService<Student> {
    public Boolean saveStudent(Student student);
    public PageVO list(Integer page, Integer size);
    public PageVO search(SearchForm searchForm);
    public Boolean update(StudentForm studentForm);
    public Boolean deleteById(Integer id);
}
