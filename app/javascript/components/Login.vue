<template>
	
	


  <div class="container">
    <div class="text-red" v-if="error">{{ error }}</div>
     <label for="email"><b>Username</b></label>
    <input type="text" placeholder="Enter email" v-model="email" required>
  

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" v-model="password" required>

    <button   @click="signin">Login</button>
   
  </div>

  
</template>
<script type="text/javascript">
	import axios from 'axios'
	export default{
		data(){
			return { email:"",
			 password:""
			}
		},
		  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
			methods:{
		async signin(){
		const user = { email: this.email ,password:this.password };
       
        this.$http.plain.post('/api/sign_in',user)
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error))

		},
		signinSuccessful (response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/records')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/records')
      }

	}
}
	}
</script>