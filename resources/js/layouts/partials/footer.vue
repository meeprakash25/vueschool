<template>
	<footer class="footer">
        School Management System By <a href="#">NEWTECH</a> {{trans('general.version')+' '+getConfig('v')}}
    </footer>
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