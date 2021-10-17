
import login from '../components/Login.vue'
import home from '../components/Home.vue'
import register from '../components/Register.vue'
import Advertisement from '../components/Advertisement.vue'
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
    },
      {
      path: '/home',
      component: home,
      props: true
    }, {
      path: '/Advertisement',
      component:Advertisement,
      props: true
    }
   ];
  
   export default routes