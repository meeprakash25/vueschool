<template>
    <div class="row light-grey m-t-80 p-t-30 p-b-30">
        <div class="col-md-12">
          <h2 class="display-7">Our Programs</h2>
          <div class="line mb-5"></div>
                <div class="row justify-content-center">
                    <div :class="getClass"  v-if="index>0" v-for="(block,index) in blocks">
                        <featured-block :block="block"></featured-block>
                    </div>
                </div>
            </div>
    </div>
</template>

<script>
    import FeaturedBlock from '@js/widgets/featured-block'

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
            FeaturedBlock
        },
        computed: {
            getClass(){
                return this.blocks.length > 1 ? (this.blocks.length > 2 ? "col-12 col-sm-6 col-md-3" : "col-12 col-sm-4") : "col";
            }
        }
    }
</script>