import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from "../views/Login";
import SystemAdmin from "../views/SystemAdmin";
import DormitoryAdminAdd from "../views/DormitoryAdminAdd";
import DormitoryAdminManager from "../views/DormitoryAdminManager";
import DormitoryAdminUpdate from "../views/DormitoryAdminUpdate";
import StudentAdd from "../views/StudentAdd";
import StudentManager from "../views/StudentManager";
import StudentUpdate from "../views/StudentUpdate";
import BuildingAdd from "../views/BuildingAdd";
import BuildingManager from "../views/BuildingManager";
import BuildingUpdate from "../views/BuildingUpdate";
import DormitoryAdd from "../views/DormitoryAdd";
import DormitoryManager from "../views/DormitoryManager";
import DormitoryUpdate from "../views/DormitoryUpdate";
import MoveoutRegister from "../views/MoveoutRegister";
import MoveRecord from "../views/MoveRecord";
import AbsentRecord from "../views/AbsentRecord";
import DormitoryAdmin from "../views/DormitoryAdmin";
import AbsentRegister from "../views/AbsentRegister";

Vue.use(VueRouter)

const routes = [
  {
    path: '/dormitoryAdmin',
    name: 'Dormitory Admin',
    component: DormitoryAdmin,
    redirect: '/absentRegister',
    children:[
      {
        path: '/absentRecord2',
        name: 'Absent Record',
        component: AbsentRecord
      },
      {
        path: '/absentRegister',
        name: 'Absent Register',
        component: AbsentRegister
      }
      ]
  },
  {
    path: '/systemAdmin',
    name: 'System Admin',
    component: SystemAdmin,
    redirect: '/dormitoryAdminAdd',
    children:[
      {
        path: '/dormitoryAdminManager',
        name: 'Dormitory Admin Management',
        component: DormitoryAdminManager
      },
      {
        path: '/dormitoryAdminAdd',
        name: 'Add Dormitory Admin',
        component: DormitoryAdminAdd
      },
      {
        path: '/dormitoryAdminUpdate',
        name: 'Update Dormitory Admin',
        component: DormitoryAdminUpdate
      },
      {
        path: '/studentAdd',
        name: 'Add Student',
        component: StudentAdd
      },
      {
        path: '/studentManager',
        name: 'Student Management',
        component: StudentManager
      },
      {
        path: '/studentUpdate',
        name: 'Update Student',
        component: StudentUpdate
      },
      {
        path: '/buildingAdd',
        name: 'Add Building',
        component: BuildingAdd
      },
      {
        path: '/buildingManager',
        name: 'Building Management',
        component: BuildingManager
      },
      {
        path: '/buildingUpdate',
        name: 'Update Building',
        component: BuildingUpdate
      },
      {
        path: '/dormitoryAdd',
        name: 'Add Dormitory',
        component: DormitoryAdd
      },
      {
        path: '/dormitoryManager',
        name: 'Dormitory Management',
        component: DormitoryManager
      },
      {
        path: '/dormitoryUpdate',
        name: 'Update Dormitory',
        component: DormitoryUpdate
      },
      {
        path: '/moveoutRegister',
        name: 'Moveout Register',
        component: MoveoutRegister
      },
      {
        path: '/moveoutRecord',
        name: 'Moveout Record',
        component: MoveRecord
      },
      {
        path: '/absentRecord',
        name: 'Absent Record',
        component: AbsentRecord
      }
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
