<template>


 
  	 <div class="container">
     <div class="text-red" v-if="error">{{ error }}</div>
     <label for="email"><b>Email</b></label>
    <input type="email" placeholder="Enter email" v-model="email" required>
  

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" v-model="password" required>

 
   
    <label for="name"><b>name</b></label>
    <input type="text" placeholder="Enter Name" v-model="name" required>
   

    <button @click="Signup">Signup</button>
   
  </div>


</template>
<script type="text/javascript">
	import axios from 'axios'
	export default{
		data(){
			return { email:"",
			 password:"",
			 name:"",
       error:""
			}
		},
		 created () {
    this.checkedSignedIn()
  },  updated () {
    this.checkedSignedIn()
  },
			methods:{
		async Signup(){
		const user = { email: this.email ,password:this.password,name:this.name};
      
 this.$http.plain.post('/api/sign_up',user)
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
		},
		 signupSuccessful (response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }
       localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/Advertisement')
	},
	   signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkedSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/Advertisement')
      }
    }
	}
}
</script>