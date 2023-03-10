<template>
    <div style="margin-top: 60px;margin-left:330px;width: 300px;height: 500px;border: 0px solid red;" >
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="ID">
                <el-input v-model="ruleForm.id"></el-input>
            </el-form-item>
            <el-form-item label="name" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="phone" prop="telephone">
                <el-input v-model="ruleForm.telephone"></el-input>
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
                    id: '',
                    buildingId: '',
                    name: '',
                    type: '',
                    telephone: ''
                },
                rules: {
                    buildingId: [
                        { required: true, message: 'Please select building', trigger: 'change' }
                    ],
                    name: [
                        { required: true, message: 'Please enter name', trigger: 'blur' }
                    ],
                    telephone: [
                        { required: true, message: 'Please enter phone number', trigger: 'blur' }
                    ],
                    type: [
                        { required: true, message: 'Please select building', trigger: 'change' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.put('http://localhost:8181/dormitory/update',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert(_this.ruleForm.name+'update success', '', {
                                    confirmButtonText: 'confirm',
                                    callback: action => {
                                        _this.$router.push('/dormitoryManager')
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
            axios.get('http://localhost:8181/dormitory/findById/'+_this.$route.query.id).then(function (resp) {
                _this.ruleForm = resp.data.data
            })
        }
    }
</script>
