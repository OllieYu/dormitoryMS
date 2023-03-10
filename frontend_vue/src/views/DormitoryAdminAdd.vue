<template>
    <div style="margin-top: 60px;margin-left:330px;width: 300px;height: 500px;border: 0px solid red;" >
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="username" prop="username">
                <el-input v-model="ruleForm.username"></el-input>
            </el-form-item>
            <el-form-item label="password" prop="password">
                <el-input v-model="ruleForm.password"></el-input>
            </el-form-item>
            <el-form-item label="name" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="gender">
                <div style="width: 170px;height: 30px;">
                    <template>
                        <el-radio v-model="ruleForm.gender" label="male">male</el-radio>
                        <el-radio v-model="ruleForm.gender" label="female">female</el-radio>
                    </template>
                </div>
            </el-form-item>
            <el-form-item label="phone" prop="telephone">
                <el-input v-model.number="ruleForm.telephone"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">confirm</el-button>
                <el-button @click="resetForm('ruleForm')">reset</el-button>
            </el-form-item>
        </el-form>
    </div>

</template>

<script>
    export default {
        data() {
            return {
                category:null,
                ruleForm: {
                    username: '',
                    password: '',
                    name: '',
                    gender: 'male',
                    telephone: ''
                },
                rules: {
                    username: [
                        { required: true, message: 'Please enter username', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: 'Please enter password', trigger: 'blur' }
                    ],
                    name: [
                        { required: true, message: 'Please enter name', trigger: 'blur' }
                    ],
                    telephone: [
                        { required: true, message: 'Please enter phone number', trigger: 'blur' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.post('http://localhost:8181/dormitoryAdmin/save',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert(_this.ruleForm.username+' add succuss', '', {
                                    confirmButtonText: 'confirm',
                                    callback: action => {
                                        _this.$router.push('/dormitoryAdminManager')
                                    }
                                });
                            }
                        })
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            }
        }
    }
</script>
