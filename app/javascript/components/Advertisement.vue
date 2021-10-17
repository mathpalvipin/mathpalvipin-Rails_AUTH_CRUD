<template>
 <div >
  <div class="text-red" v-if="error">{{ error }}</div>
     <label for="title"><b>title</b></label>
    <input type="text" placeholder="Enter title" v-model="title" required>
  

    <label for="description"><b>description</b></label>
    <input type="text" placeholder="Enter description" v-model="description" required>

 


    <button   @click="add">add</button>
   
    <div  class="ads">
    	<div  class="publishAd-container"> 
    		<h1>Publish</h1>
    		<div class="publishAd-card" v-for="publishAd in publishAds" :key="publishAd.id">
    			<h3>{{publishAd.title}}</h3>
    			<h3>{{publishAd.description}}</h3>
    			<button @click="deletead(publishAd)">delete</button>
    			<button @click="togglepublish(publishAd)">unpublish</button>
    		</div>
    	</div>
    	<div  class="nonpublishAd-container">
    		<h1>NON-Publish</h1>
    		<div class="nonpublishAd-card" v-for="nonpublishAd in nonpublishAds" :key="nonpublishAd.id">
    			<h3>{{nonpublishAd.title}}</h3>
    			<h3>{{nonpublishAd.description}}</h3>
    			<button @click="deletead(nonpublishAd)">delete</button>
    			<button @click="togglepublish(nonpublishAd)">publish</button>
    		</div>
    	</div>

</div>

</div>
</template>
<script type="text/javascript">
	export default {
		data(){
			return {
				 publishAds:[],
				 nonpublishAds:[],
				 title:"",
				 description:"",
				 error:"",
				 image:""
			}
		},
		async mounted(){
      await this.$http.secured.get('/api/userAds')
        .then(response =>{
        	console.log(response);
        	for (var i = response.data.length - 1; i >= 0; i--) {
        		if(response.data[i].publish==true)
        		this.publishAds.push(response.data[i]);
        	    else 
        	    this.nonpublishAds.push(response.data[i]);
        	}
        	console.log(this.publishAds);
        	console.log(this.nonpublishAds);
        } )
        .catch(error =>{
        	console.log(error);
        } )
  },
  methods:{
  	 add(){
  	 	const ad = { title: this.title ,description:this.description ,publish:0};
  	 	console.log(ad);
  	 	this.$http.secured.post('/api/advertisement',ad) .then(response => {

          this.nonpublishAds.unshift(response.data)
         })
        .catch(error => this.Error='Cannot create record')
    },
    deletead(ad){
    	console.log(ad.id);
    	 	this.$http.secured.delete('/api/deleteAds?id='+ad.id) .then(response => {
         console.log(response)
         if(ad.publish==true){
         	this.publishAds.splice(this.publishAds.findIndex(a => a.id === ad.id) , 1)
         }else{
         	this.nonpublishAds.splice(this.publishAds.findIndex(a => a.id === ad.id) , 1)
         }
         })
        .catch(error => {console.log(error)})
    },
    togglepublish(ad){
    	ad.publish =!ad.publish;
    	this.$http.secured.put('/api/togglepublish?id='+ad.id+'&publish='+ad.publish) .then(response => {
         
         if(ad.publish==false){
         	console.log(ad);
         	 this.nonpublishAds.unshift(ad);
         	this.publishAds.splice(this.publishAds.findIndex(a => a.id === ad.id) , 1);
         
         }else{
             this.publishAds.unshift(ad);
         	this.nonpublishAds.splice(this.nonpublishAds.findIndex(a => a.id === ad.id) , 1);
         	

         }
         })
        .catch(error => {console.log(error)})
    }
       

  	 
  }
	}
</script>
<style type="text/css">
	.ads{width: 100%;
		 display: flex;
		 justify-content: space-around;
		
	}
	.publishAd-container,.nonpublishAd-container{
		width: 100%;
		display: flex;
		justify-content: space-around;
		flex-wrap: wrap;


	}.publishAd-container{
		border-right: 1px solid;
	}
	.publishAd-card,.nonpublishAd-card{
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