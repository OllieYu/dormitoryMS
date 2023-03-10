<template>
    <div style="margin-top: 60px;margin-left:330px;width: 300px;height: 500px;border: 0px solid red;" >
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="name" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="introduction" prop="introduction">
                <el-input v-model="ruleForm.introduction"></el-input>
            </el-form-item>
            <el-form-item label="admin" prop="adminId">
                <el-select v-model="ruleForm.adminId" placeholder="Please select admin">
                    <el-option v-for="item in dormitoryAdminList" :label="item.name" :value="item.id"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">submit</el-button>
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
                    name: '',
                    introduction: '',
                    adminId: ''
                },
                dormitoryAdminList: '',
                rules: {
                    name: [
                        { required: true, message: 'Please enter name', trigger: 'blur' }
                    ],
                    introduction: [
                        { required: true, message: 'Please enter introduction', trigger: 'blur' }
                    ],
                    adminId: [
                        { required: true, message: 'Please select admin', trigger: 'change' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.post('http://localhost:8181/building/save',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert(_this.ruleForm.name+' add succuss', '', {
                                    confirmButtonText: 'confirm',
                                    callback: action => {
                                        _this.$router.push('/buildingManager')
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
        },
        created() {
            const _this = this
            axios.get('http://localhost:8181/dormitoryAdmin/list').then(function (resp) {
                _this.dormitoryAdminList = resp.data.data
            })
        }
    }
</script>
