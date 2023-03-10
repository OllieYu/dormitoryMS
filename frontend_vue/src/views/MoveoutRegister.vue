<template>
    <div style="margin-top: 60px;margin-left:80px;border: 0px solid red;" >
        <el-form style="margin-left: -40px" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="Field:" prop="key">
                <el-select v-model="ruleForm.key" style="width: 160px;float: left" placeholder="Please select field">
                    <el-option label="number" value="number"></el-option>
                    <el-option label="name" value="name"></el-option>
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
                style="width: 1190px;position: relative;top:-30px">
            <el-table-column
                    fixed
                    prop="id"
                    label="ID"
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="dormitoryName"
                    label="dormitory"
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="number"
                    label="number"
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="name"
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="gender"
                    label="gender"
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="state"
                    label="state"
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="createDate"
                    label="date"
                    width="180">
            </el-table-column>
            <el-table-column label="operation" width="230">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
                            type="danger"
                            @click="moveout(scope.row)">moveout</el-button>
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
                pageSize: 5,
                total: null,
                key: '',
                value: '',
                ruleForm: {
                    key: '',
                    value: '',
                    page: '',
                    size: 5
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
                //让翻页复原
                _this.currentPage=1
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        const _this = this
                        _this.ruleForm.page = _this.currentPage
                        axios.get('http://localhost:8181/moveout/search',{params:_this.ruleForm}).then(function (resp) {
                            _this.tableData = resp.data.data.data
                            _this.total = resp.data.data.total
                        })
                    }
                });

            },
            page(currentPage){
                const _this = this
                if(_this.ruleForm.value == ''){
                    axios.get('http://localhost:8181/moveout/list/'+currentPage+'/'+_this.pageSize).then(function (resp) {
                        _this.tableData = resp.data.data.data
                        _this.total = resp.data.data.total
                    })
                } else {
                    _this.ruleForm.page = _this.currentPage
                    axios.get('http://localhost:8181/moveout/search',{params:_this.ruleForm}).then(function (resp) {
                        _this.tableData = resp.data.data.data
                        _this.total = resp.data.data.total
                    })
                }

            },
            moveout(row) {
                const _this = this
                this.$prompt('Please enter moving out reason', 'Tip', {
                    confirmButtonText: 'confirm',
                    cancelButtonText: 'cancel',
                    inputPattern: /^[\s\S]*.*[^\s][\s\S]*$/,
                    inputErrorMessage: 'moving out reason cannot be empty'
                }).then(({ value }) => {
                    this.$confirm('confirm move out ['+row.name+'] ?', 'Tip', {
                        confirmButtonText: 'confirm',
                        cancelButtonText: 'cancel',
                        type: 'warning'
                    }).then(() => {
                        axios.put('http://localhost:8181/moveout/moveout/'+row.id+"/"+value).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert('['+row.name+'] have moved out', '', {
                                    confirmButtonText: 'confirm',
                                    callback: action => {
                                        location.reload()
                                    }
                                });
                            }
                        });
                    });
                });
            }
        },
        created() {
            const _this = this
            axios.get('http://localhost:8181/moveout/list/1/'+_this.pageSize).then(function (resp) {
                _this.tableData = resp.data.data.data
                _this.total = resp.data.data.total
            })
        }
    }
</script>
