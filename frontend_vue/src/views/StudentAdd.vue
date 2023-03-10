<template>
    <div style="margin-top: 60px;margin-left:330px;width: 300px;height: 500px;border: 0px solid red;" >
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="number" prop="number">
                <el-input v-model="ruleForm.number"></el-input>
            </el-form-item>
            <el-form-item label="name" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="gender" prop="gender">
                <div style="width: 170px;height: 30px;">
                    <template>
                        <el-radio v-model="ruleForm.gender" label="male">male</el-radio>
                        <el-radio v-model="ruleForm.gender" label="female">female</el-radio>
                    </template>
                </div>
            </el-form-item>
            <el-form-item label="dormitory" prop="dormitoryId">
                <el-select v-model="ruleForm.dormitoryId" placeholder="Please select dormitory">
                    <el-option v-for="item in dormitoryList" :label="item.name" :value="item.id"></el-option>
                </el-select>
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
                    number: '',
                    name: '',
                    gender: 'male',
                    dormitoryId: ''
                },
                dormitoryList: '',
                rules: {
                    number: [
                        { required: true, message: 'Please enter number', trigger: 'blur' }
                    ],
                    name: [
                        { required: true, message: 'Please enter name', trigger: 'blur' }
                    ],
                    gender: [
                        { required: true, message: 'Please enter gender', trigger: 'blur' }
                    ],
                    dormitoryId: [
                        { required: true, message: 'Please select dormitory', trigger: 'change' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.post('http://localhost:8181/student/save',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert(_this.ruleForm.name+' add succuss', '', {
                                    confirmButtonText: 'confirm',
                                    callback: action => {
                                        _this.$router.push('/studentManager')
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
            axios.get('http://localhost:8181/dormitory/availableList').then(function (resp) {
                _this.dormitoryList = resp.data.data
            })
        }
    }
</script>
