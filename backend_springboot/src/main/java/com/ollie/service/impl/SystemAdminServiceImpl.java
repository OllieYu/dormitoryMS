package com.ollie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ollie.entity.SystemAdmin;
import com.ollie.form.RuleForm;
import com.ollie.mapper.SystemAdminMapper;
import com.ollie.service.SystemAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ollie.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author admin
 * @since 2022-09-01
 */
@Service
public class SystemAdminServiceImpl extends ServiceImpl<SystemAdminMapper, SystemAdmin> implements SystemAdminService {

    @Autowired
    private SystemAdminMapper systemAdminMapper;

    @Override
    public ResultVO login(RuleForm ruleForm) {
        QueryWrapper<SystemAdmin> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", ruleForm.getUsername());
        SystemAdmin systemAdmin = this.systemAdminMapper.selectOne(queryWrapper);
        ResultVO resultVO = new ResultVO();
        if(systemAdmin == null){
            resultVO.setCode(-1);
        } else {
            if(!systemAdmin.getPassword().equals(ruleForm.getPassword())){
                resultVO.setCode(-2);
            } else {
                resultVO.setCode(0);
                resultVO.setData(systemAdmin);
            }
        }
        return resultVO;
    }
}
