<template>
	<div>
    <p class="text-center">
      <small>School Management System By <a href="#">NEWTECH</a> {{ trans('general.version') + ' ' + getConfig('v') }}</small>
    </p>
  </div>
</template>

<script>
    export default { 
    	methods: {
    		getConfig(config){
    			return helper.getConfig(config);
    		}
    	}
    }
</script>