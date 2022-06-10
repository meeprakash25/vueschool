<template>
  <div class="row light-grey m-t-80 p-t-30 p-b-30">
    <div class="col-md-12">
      <h2 class="display-7">Our Features</h2>
      <div class="line mb-5"></div>
      <div class="row">

        <div class="col-md-4">
          <div v-for="(block,index) in blocks">
            <featured-block-01 :block="block"></featured-block-01>
          </div>
        </div>

        <div class="col-md-4 mt-1">
          <img  v-if="(blocks.length>0) && blocks[0].featured_image" :src="`/${blocks[0].featured_image}`" :alt="blocks[0].title" class="w-100 h-100">
          <img v-else  class="w-100 h-100" src="https://via.placeholder.com/400" alt="">
        </div>

        <div class="col-md-4 mt-1 feature-image">
          <div class="row">
            <div class="col-md-12 pl-0">
              <img v-if="(blocks.length>1) && blocks[1].featured_image" :src="`/${blocks[1].featured_image}`" :alt="blocks[1].title" class="w-100" height="200px">
              <img v-else class="w-100" src="https://via.placeholder.com/200x100" alt="">
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 mt-4 pl-0">
              <img v-if="(blocks.length>2) && blocks[2].featured_image" :src="`/${blocks[2].featured_image}`" :alt="blocks[2].title" class="w-100 " height="200px">
              <img v-else class="w-100" src="https://via.placeholder.com/200x100" alt="">
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>
</template>

<script>
import FeaturedBlock01 from '@js/widgets/featured-block-01'

export default {
  props: {
    blocks: {
      type: Array,
      default() {
        return []
      }
    },
    bodyClass: String
  },
  components: {
    FeaturedBlock01
  },
  computed: {

  }
}
</script>