<template>
  <div class="card featured-block">
    <div class="card-body p-4"  style="border:1px solid grey">
      <h3 class="card-title">{{ block.title }}</h3>
      <div class="line"></div>
      <div class="featured mb-3">
        <img v-if="block.featured_image" :src="`/${block.featured_image}`" :alt="block.title" style="width:auto">
        <i v-else class="fas fa-image"></i>
      </div>
      <p style="text-align:justify;">{{ block.body }}
      <router-link class="" v-if="block.menu" :to="block.menu.options && block.menu.options.is_default ? '/' + block.menu.slug : '/page/' + block.menu.slug">
        Read More
      </router-link>
      </p>
      <a v-if="block.url" :href="block.url" target="_blank">Read More</a>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    block: {
      type: Object,
      default: function () {
        return {}
      }
    }
  },
}
</script>

<style scoped>
.featured-block .featured {
  background: none;
  max-height:200px;
}
.featured-block .featured img{
  height:200px;
}

a{
  color:#d92318;
  font-weight: 500;
}

a:hover{
  color:#ac1c14;
}
</style>