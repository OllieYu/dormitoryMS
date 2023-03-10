package com.ollie.service;

import com.ollie.entity.SystemAdmin;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ollie.form.RuleForm;
import com.ollie.vo.ResultVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2022-09-01
 */
public interface SystemAdminService extends IService<SystemAdmin> {
    public ResultVO login(RuleForm ruleForm);
}
