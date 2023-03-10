<template>
    <el-container class="home_container">
        <el-header class="home_header">
            <div class="home_title">Dormitory Admin</div>
            <div class="home_userinfoContainer">
                <el-dropdown>
                  <span class="el-dropdown-link home_userinfo">
                    {{admin.name}}<i class="el-icon-arrow-down el-icon--right home_userinfo"></i>
                  </span>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item @click.native="logout">Logout</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>
        </el-header>
        <el-container>

            <el-aside class="home_aside" width="200px">

                <el-menu router>
                    <el-menu-item index="/absentRegister" :class="$route.path=='/absentRegister'?'is-active':''">
                        <i class="el-icon-s-order"></i>
                        <span slot="title">Absent Register</span>
                    </el-menu-item>

                    <el-menu-item index="/absentRecord2">
                        <i class="el-icon-error"></i>
                        <span slot="title">Absent Record</span>
                    </el-menu-item>
                </el-menu>

            </el-aside>

            <el-container>
                <el-main>
                    <el-breadcrumb separator-class="el-icon-arrow-right">
                        <el-breadcrumb-item :to="{ path: '/' }">Home</el-breadcrumb-item>
                        <el-breadcrumb-item v-text="this.$router.currentRoute.name"></el-breadcrumb-item>
                    </el-breadcrumb>
                    <router-view></router-view>
                </el-main>
            </el-container>

        </el-container>

    </el-container>
</template>
<script>
    export default{
        methods: {
            logout(){
                let _this = this;
                this.$confirm('Log out?', 'Tip', {
                    confirmButtonText: 'Confirm',
                    cancelButtonText: 'Cancel',
                    type: 'warning'
                }).then(function () {
                    localStorage.removeItem('access-admin')
                    _this.$router.replace({path: '/login'})
                })
            }
        },
        data(){
            return {
                admin:''
            }
        },
        created() {
            let admin = JSON.parse(window.localStorage.getItem('dormitoryAdmin'))
            this.admin = admin
            this.$store.state.admin = admin
        }
    }
</script>
<style>
    .home_container {
        height: 100%;
        position: absolute;
        top: 0px;
        left: 0px;
        width: 100%;
    }

    .home_header {
        background-color: #2B2B2B;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .home_title {
        color: #C2C2C2;
        font-size: 22px;
        display: inline;
    }

    .home_userinfo {
        color: #fff;
        cursor: pointer;
    }

    .home_userinfoContainer {
        display: inline;
        margin-right: 20px;
    }

    .home_aside {
        background-color: #FFFFFF;
    }

    .home_footer {
        background-color: #FFFFFF;
        color: #000000;
        font-size: 18px;
        line-height: 60px;
        text-align: center;
    }
</style>
