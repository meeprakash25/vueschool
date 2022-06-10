<template>
  <div class="row">
    <div class="col-md-12" v-if="blocks.length">
      <div class="fix-width fix-width-mobile">
        <principle-message-block :block="blocks[0]"></principle-message-block>
      </div>
    </div>
  </div>
</template>

<script>
import PrincipleMessageBlock from '@js/widgets/principle-message-block'

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
    PrincipleMessageBlock
  },
}
</script>

<style scoped>

</style>