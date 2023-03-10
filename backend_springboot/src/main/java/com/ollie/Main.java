package com.ollie;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class Main {
    public static void main(String[] args) {
        AutoGenerator autoGenerator = new AutoGenerator();

        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        dataSourceConfig.setDbType(DbType.MYSQL);
        dataSourceConfig.setDriverName("com.mysql.cj.jdbc.Driver");
        dataSourceConfig.setUrl("jdbc:mysql://localhost:3306/dormitory2");
        dataSourceConfig.setUsername("root");
        dataSourceConfig.setPassword("123456");
        autoGenerator.setDataSource(dataSourceConfig);

        GlobalConfig globalConfig = new GlobalConfig();
        globalConfig.setOutputDir(System.getProperty("user.dir")+"/src/main/java");
        globalConfig.setAuthor("admin");
        globalConfig.setOpen(false);

        globalConfig.setServiceName("%sService");
        autoGenerator.setGlobalConfig(globalConfig);

        PackageConfig packageConfig = new PackageConfig();
        packageConfig.setParent("com.ollie");
        packageConfig.setEntity("entity");
        packageConfig.setMapper("mapper");
        packageConfig.setService("service");
        packageConfig.setServiceImpl("service.impl");
        packageConfig.setController("controller");
        autoGenerator.setPackageInfo(packageConfig);

        StrategyConfig strategyConfig = new StrategyConfig();
        strategyConfig.setInclude("absent","building","dormitory","dormitory_admin","moveout","student","system_admin");
        strategyConfig.setNaming(NamingStrategy.underline_to_camel);
        strategyConfig.setColumnNaming(NamingStrategy.underline_to_camel);
        strategyConfig.setEntityLombokModel(true);
        autoGenerator.setStrategy(strategyConfig);

        autoGenerator.execute();
    }
}
