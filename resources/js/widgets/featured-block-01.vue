<template>
    <ul class="list-group list-group-flush">
      <li class="list-group-item light-grey">
        <div class="row">
          <div class="col-12">
            <div class="media">
              <i class="fas fa-arrow-right my-1 align-self-top mr-4 feature-icon"></i>
              <div class="media-body mr-4">
                <h5 class="mt-0 text-dark">{{ block.title }}</h5>
                <p class="text-justify">
                  {{ block.body }}
                  <router-link class="" v-if="block.menu" :to="block.menu.options && block.menu.options.is_default ? '/' + block.menu.slug : '/page/' + block.menu.slug">
                    {{ trans('general.view_more') }}
                  </router-link>
                  <a v-if="block.url" :href="block.url" target="_blank" class="">{{ trans('general.view_more') }}</a>
                </p>
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
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

<style>
.feature-icon {
  font-size: 2rem;
  color: #007bff;
}
.our-features .list-group-item {
  padding-left: unset;
  padding-bottom: unset;
}

.our-features .h-100 {
  height: 95%!important;
}
.media {
  border:none;
  border-bottom: 1px solid rgba(120, 130, 140, 0.13);
   margin-bottom: 0px;
   padding: 0px;
}
a{
  color: #d92318;
  font-weight: 500;
}
</style>