<template>
	<div class="container">
	
     <div  class="publishAd-container"> 
    		<h1>Publish</h1>
    		<div class="publishAd-card" v-for="publishAd in publishAds" :key="publishAd.id">
    			<h2>{{publishAd.title}}</h2>
    			<h3>{{publishAd.description}}</h3>
    		</div>
    	</div>
	</div>
</div>
</template>
<script type="text/javascript">
	export default{
		data(){
			return {
            publishAds:[],    
			 }
		},
		async mounted(){
      await this.$http.plain.get('/allads')
        .then(response =>{
        	this.publishAds=response.data;
        	
        	console.log(this.publishAds);
        } )
        .catch(error =>{
        	console.log(error);
        } )
  },
	}
</script>
<style type="text/css">
	.publishAd-container{
		width: 100%;
		display: flex;
		justify-content: space-around;
		flex-wrap: wrap;
		border-right: 1px solid;
	}
	.publishAd-card{
		 width: 100%;
		 height: 30vh;
max-width:15rem; 
min-width: 10rem;
		 border-radius: 2%;
		 margin: 15px;
		 padding: 10px;
		 background-color: #908a8a;
		 -webkit-box-shadow: 9px 6px 37px 4px rgba(0,0,0,0.75);
-moz-box-shadow: 9px 6px 37px 4px rgba(0,0,0,0.75);
box-shadow: 9px 6px 37px 4px rgba(0,0,0,0.75);


	}
</style>