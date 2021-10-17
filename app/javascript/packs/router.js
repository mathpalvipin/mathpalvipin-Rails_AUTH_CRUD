
import login from '../components/Login.vue'
import home from '../components/Home.vue'
import register from '../components/Register.vue'
 const routes = [
    {
      path: '/login',
      component: login,
      props: true
    },
     {
      path: '/',
      component: home,
      props: true
    },
    {
      path: '/register',
      component: register,
      props: true
    }
   ];
  
   export default routes