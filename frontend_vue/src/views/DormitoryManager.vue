<template>
    <div style="margin-top: 60px;margin-left:80px;border: 0px solid red;" >
        <el-form style="margin-left: -40px" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="Field:" prop="key">
                <el-select v-model="ruleForm.key" style="width: 160px;float: left" placeholder="Please select field">
                    <el-option label="name" value="name"></el-option>
                    <el-option label="phone" value="telephone"></el-option>
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
                style="width: 1161px;position: relative;top:-30px">
            <el-table-column
                    fixed
                    prop="id"
                    label="ID"
                    width="160">
            </el-table-column>
            <el-table-column
                    prop="buildingName"
                    label="building"
                    width="160">
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="name"
                    width="160">
            </el-table-column>
            <el-table-column
                    prop="type"
                    label="type"
                    width="160">
            </el-table-column>
            <el-table-column
                    prop="available"
                    label="available"
                    width="160">
            </el-table-column>
            <el-table-column
                    prop="telephone"
                    label="phone"
                    width="160">
            </el-table-column>
            <el-table-column label="operation" width="200">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
                            @click="edit(scope.row)">edit</el-button>
                    <el-button
                            size="mini"
                            type="danger"
                            @click="del(scope.row)">delete</el-button>
                </template>
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
                        axios.get('http://localhost:8181/dormitory/search',{params:_this.ruleForm}).then(function (resp) {
                            _this.tableData = resp.data.data.data
                            _this.total = resp.data.data.total
                        })
                    }
                });

            },
            page(currentPage){
                const _this = this
                if(_this.ruleForm.value == ''){
                    axios.get('http://localhost:8181/dormitory/list/'+currentPage+'/'+_this.pageSize).then(function (resp) {
                        _this.tableData = resp.data.data.data
                        _this.total = resp.data.data.total
                    })
                } else {
                    _this.ruleForm.page = _this.currentPage
                    axios.get('http://localhost:8181/dormitory/search',{params:_this.ruleForm}).then(function (resp) {
                        _this.tableData = resp.data.data.data
                        _this.total = resp.data.data.total
                    })
                }

            },
            edit(row){
                this.$router.push('/dormitoryUpdate?id='+row.id)
            },
            del(row) {
                const _this = this
                this.$confirm('confirm delete ['+row.name+'] ?', 'Tip', {
                    confirmButtonText: 'confirm',
                    cancelButtonText: 'cancel',
                    type: 'warning'
                }).then(() => {
                    axios.delete('http://localhost:8181/dormitory/deleteById/'+row.id).then(function (resp) {
                        if(resp.data.code==0){
                            _this.$alert('['+row.name+'] have deleted', '', {
                                confirmButtonText: 'confirm',
                                callback: action => {
                                    location.reload()
                                }
                            });
                        }
                    });
                });
            }
        },
        created() {
            const _this = this
            axios.get('http://localhost:8181/dormitory/list/1/'+_this.pageSize).then(function (resp) {
                _this.tableData = resp.data.data.data
                _this.total = resp.data.data.total
            })
        }
    }
</script>
