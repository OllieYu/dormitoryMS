<template>
    <div style="margin-top: 60px;margin-left:330px;width: 300px;height: 500px;border: 0px solid red;" >
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="Building" prop="buildingId">
                <el-select v-model="ruleForm.buildingId" placeholder="Please select building" @change="buildingChange">
                    <el-option v-for="item in buildingList" :label="item.name" :value="item.id"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="Dormitory" prop="dormitoryId">
                <el-select v-model="ruleForm.dormitoryId" placeholder="Please select dormitory" @change="dormitoryChange">
                    <el-option v-for="item in dormitoryList" :label="item.name" :value="item.id"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="Student" prop="studentId">
                <el-select v-model="ruleForm.studentId" placeholder="Please select student">
                    <el-option v-for="item in studentList" :label="item.name" :value="item.id"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="Reason" prop="reason">
                <el-input v-model="ruleForm.reason"></el-input>
            </el-form-item>
            <el-form-item label="Date" prop="createDate">
                <el-date-picker
                        style="width: 200px"
                        v-model="ruleForm.createDate"
                        type="date"
                        placeholder="Please select date">
                </el-date-picker>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">Submit</el-button>
                <el-button @click="resetForm('ruleForm')">Reset</el-button>
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
                    buildingId: '',
                    dormitoryId: '',
                    studentId: '',
                    reason: '',
                    createDate: '',
                    dormitoryAdminId: ''
                },
                buildingList: '',
                dormitoryList: '',
                studentList: '',
                rules: {
                    buildingId: [
                        { required: true, message: 'Please select building', trigger: 'change' }
                    ],
                    dormitoryId: [
                        { required: true, message: 'Please select dormitory', trigger: 'change' }
                    ],
                    studentId: [
                        { required: true, message: 'Please select student', trigger: 'change' }
                    ],
                    reason: [
                        { required: true, message: 'Please enter reason', trigger: 'blur' }
                    ],
                    createDate: [
                        { required: true, message: 'Please select date', trigger: 'blur' }
                    ]
                }
            };
        },
        methods: {
            buildingChange(){
                const _this = this
                axios.get('http://localhost:8181/absent/findDormitoryByBuildingId/'+_this.ruleForm.buildingId).then(function (resp) {
                    _this.dormitoryList = resp.data.data
                    _this.ruleForm.dormitoryId = ''
                    _this.ruleForm.studentId = ''
                })
            },
            dormitoryChange(){
                const _this = this
                axios.get('http://localhost:8181/absent/findStudentByDormitoryId/'+_this.ruleForm.dormitoryId).then(function (resp) {
                    _this.studentList = resp.data.data
                    _this.ruleForm.studentId = ''
                })
            },
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let admin = _this.$store.state.admin
                        _this.ruleForm.dormitoryAdminId = admin.id
                        console.log(_this.ruleForm)
                        axios.post('http://localhost:8181/absent/save',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert('Success', '', {
                                    confirmButtonText: 'Confirm',
                                    callback: action => {
                                        _this.$router.push('/absentRecord2')
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
            axios.get('http://localhost:8181/absent/buildingList').then(function (resp) {
                _this.buildingList = resp.data.data
            })
        }
    }
</script>
