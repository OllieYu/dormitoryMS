package com.ollie.service;

import com.ollie.entity.DormitoryAdmin;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ollie.form.RuleForm;
import com.ollie.form.SearchForm;
import com.ollie.vo.PageVO;
import com.ollie.vo.ResultVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2022-09-01
 */
public interface DormitoryAdminService extends IService<DormitoryAdmin> {
    public ResultVO login(RuleForm ruleForm);
    public PageVO list(Integer page,Integer size);
    public PageVO search(SearchForm searchForm);
}
