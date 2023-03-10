package com.ollie.service;

import com.ollie.entity.Dormitory;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ollie.form.SearchForm;
import com.ollie.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2022-09-01
 */
public interface DormitoryService extends IService<Dormitory> {
    public PageVO list(Integer page, Integer size);
    public PageVO search(SearchForm searchForm);
    public Boolean deleteById(Integer id);
}
