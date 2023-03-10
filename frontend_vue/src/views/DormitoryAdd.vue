<template>
    <div style="margin-top: 60px;margin-left:330px;width: 300px;height: 500px;border: 0px solid red;" >
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="building" prop="buildingId">
                <el-select v-model="ruleForm.buildingId" placeholder="Please select building">
                    <el-option v-for="item in buildingList" :label="item.name" :value="item.id"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="name" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="type" prop="type">
                <el-select v-model="ruleForm.type" placeholder="Please select type">
                    <el-option label="4 beds" value="4"></el-option>
                    <el-option label="6 beds" value="6"></el-option>
                    <el-option label="8 beds" value="8"></el-option>
                    <el-option label="10 beds" value="10"></el-option>
                </el-select>
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
                    buildingId: '',
                    name: '',
                    type: '',
                    telephone: ''
                },
                buildingList: '',
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
                        { required: true, message: 'Please select type', trigger: 'change' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.post('http://localhost:8181/dormitory/save',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert(_this.ruleForm.name+' add succuss', '', {
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
            axios.get('http://localhost:8181/building/list').then(function (resp) {
                _this.buildingList = resp.data.data
            })
        }
    }
</script>
