<template>
    <div style="margin-top: 60px;margin-left:80px;border: 0px solid red;" >
        <el-form style="margin-left: -40px" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="Field:" prop="key">
                <el-select v-model="ruleForm.key" style="width: 160px;float: left" placeholder="Please select field">
                    <el-option label="student" value="studentName"></el-option>
                    <el-option label="dormitory" value="dormitoryName"></el-option>
                </el-select>
            </el-form-item>
            <div style="border: 0px solid red;width: 400px;height: 60px;position: relative;top: -64px;left: 270px">
                <el-form-item label="Keyword:">
                    <el-input v-model="ruleForm.value" placeholder="Please enter keyword" style="width: 160px;"></el-input>
                    <el-button type="primary" icon="el-icon-search" style="position: relative;left: 10px;" @click="submitForm('ruleForm')">search</el-button>
                </el-form-item>
            </div>
        </el-form>

        <el-table
                :data="tableData"
                border
                stripe
                style="width: 1150px;position: relative;top:-30px">
            <el-table-column
                    fixed
                    prop="id"
                    label="ID"
                    width="230">
            </el-table-column>
            <el-table-column
                    prop="studentName"
                    label="student"
                    width="230">
            </el-table-column>
            <el-table-column
                    prop="dormitoryName"
                    label="dormitory"
                    width="230">
            </el-table-column>
            <el-table-column
                    prop="reason"
                    label="reason"
                    width="230">
            </el-table-column>
            <el-table-column
                    prop="createDate"
                    label="date"
                    width="230">
            </el-table-column>
        </el-table>
        <el-pagination style="margin-top: 20px;float: right"
                       background
                       layout="prev, pager, next"
                       :page-size="pageSize"
                       :total="total"
                       :current-page.sync="currentPage"
                       @current-change="page">
        </el-pagination>
    </div>

</template>

<script>
    export default {
        data() {
            return {
                tableData: null,
                currentPage: 1,
                pageSize: 3,
                total: null,
                key: '',
                value: '',
                ruleForm: {
                    key: '',
                    value: '',
                    page: '',
                    size: 3
                },
                rules: {
                    key: [
                        { required: true, message: 'Please select field', trigger: 'change' }
                    ]
                }
            }
        },
        methods:{
            submitForm(formName) {
                const _this = this
                _this.currentPage=1
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        const _this = this
                        _this.ruleForm.page = _this.currentPage
                        axios.get('http://localhost:8181/moveout/moveoutSearch',{params:_this.ruleForm}).then(function (resp) {
                            _this.tableData = resp.data.data.data
                            _this.total = resp.data.data.total
                        })
                    }
                });

            },
            page(currentPage){
                const _this = this
                if(_this.ruleForm.value == ''){
                    axios.get('http://localhost:8181/moveout/moveoutList/'+currentPage+'/'+_this.pageSize).then(function (resp) {
                        _this.tableData = resp.data.data.data
                        _this.total = resp.data.data.total
                    })
                } else {
                    _this.ruleForm.page = _this.currentPage
                    axios.get('http://localhost:8181/moveout/moveoutSearch',{params:_this.ruleForm}).then(function (resp) {
                        _this.tableData = resp.data.data.data
                        _this.total = resp.data.data.total
                    })
                }

            }
        },
        created() {
            const _this = this
            axios.get('http://localhost:8181/moveout/moveoutList/1/'+_this.pageSize).then(function (resp) {
                _this.tableData = resp.data.data.data
                _this.total = resp.data.data.total
            })
        }
    }
</script>
