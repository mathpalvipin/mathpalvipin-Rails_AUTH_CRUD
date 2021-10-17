<template>
	
<ul class="topnav">
  <li><router-link to ='/home' active-class="active" >Home</router-link></li>
  <li><router-link to ='/register' active-class="active">Register</router-link></li>
  <li><router-link to ='/login' active-class="active" >Login</router-link></li>
  <li class="right"><a @click="logout" active-class="active"  v-show="SignedIn()">Logout</a></li>
</ul>

</template>
<script type="text/javascript">
  import axios from 'axios'
  export default {
    data(){
    return {
      error:''
    }
    },
  
      methods:{  
       setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
      SignedIn() {
      return localStorage.signedIn
    },
      async logout(){
           
      this.$http.secured.delete('/api/logout')
        .then(response => {
          delete localStorage.csrf
          delete localStorage.signedIn
          this.$router.replace('/home')
          this.SignedIn();
        })
        .catch(error => this.setError(error, 'Cannot sign out'))
    }
     }
  }
</script>
<style type="text/css">
	ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #57a4cd;
}

ul.topnav li {float: left;}

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

ul.topnav li a:hover:not(.active) {background-color:#1e3343 ;}

ul.topnav li a.active {background-color:#111 ;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right, 
  ul.topnav li {float: none;}
}
</style>