<template>
  <footer class="frontend-footer container-fluid">
    <div class="row">
      <div class="col-12 col-md-3 text-center">
        <router-link to="/" class="navbar-brand"><img :src="getLogo" :alt="getConfig('institute_name')" style="max-width:200px;"/></router-link>
      </div>
      <div class="col-12 col-md-3">
        <h3 class="text-white">Important Links</h3>
        <ul class="list">
          <li class="list-item"><a href="http://ctevt.org.np" target="_blank"><i class="fa fa-angle-double-right"></i> CTEVT</a></li>
          <li class="list-item"><a href="http://ctevtp1.org.np" target="_blank"><i class="fa fa-angle-double-right"></i> CTEVT PROVINCE 1</a></li>
          <li class="list-item"><a href="http://P1.gov.np" target="_blank"><i class="fa fa-angle-double-right"></i> PROVINCE 1 OFFICIAL PORTAL</a></li>
          <li class="list-item"><a href="http://thulungdudhkoshimun.gov.np" target="_blank"><i class="fa fa-angle-double-right"></i> THULUNG DUDHKOSHI MUNICIPALITY</a></li>
<!--          <li class="list-item" v-for="item in menus">-->
<!--            <router-link class="footer-nav-link" :key="item.slug" :to="`/page/${item.slug}`" exact>{{ item.name }}</router-link>-->
<!--          </li>-->
        </ul>
      </div>
      <div class="col-12 col-md-3">
        <h3 class="text-white">Follow Us</h3>
        <ul class="footer-link list">
          <li class="list-item" v-if="getConfig('facebook_link')">
            <a target="_blank" :href="getConfig('facebook_link')"><i class="fab fa-facebook"></i> Facebook</a>
          </li>
          <li class="list-item" v-if="getConfig('twitter_link')">
            <a target="_blank" :href="getConfig('twitter_link')"><i class="fab fa-twitter"></i> Twitter</a>
          </li>
          <li class="list-item" v-if="getConfig('google_plus_link')">
            <a target="_blank" :href="getConfig('google_plus_link')"><i class="fab fa-google-plus"></i> Google Plus</a>
          </li>
          <li class="list-item" v-if="getConfig('youtube_link')">
            <a target="_blank" :href="getConfig('youtube_link')"><i class="fab fa-youtube"></i> Youtube</a>
          </li>
          <li class="list-item" v-if="getConfig('linkedin_link')">
            <a target="_blank" :href="getConfig('linkedin_link')"><i class="fab fa-linkedin"></i> Linkedin</a>
          </li>
        </ul>
      </div>
      <div class="col-12 col-md-3 text-white">
        <h3 class="text-white">Contact Us</h3>
        <i class="fas fa-map-marker-alt m-r-5 m-l-30"></i>
        <span>{{ getConfig('address_line_1') }}</span>
        <span v-if="getConfig('address_line_2')" class="comma">{{ getConfig('address_line_2') }}</span>
        <span v-if="getConfig('city')" class="comma">{{ getConfig('city') }}</span>
        <span v-if="getConfig('state')" class="comma">{{ getConfig('state') }}</span>
        <span v-if="getConfig('zipcode')" class="comma">{{ getConfig('zipcode') }}</span>
        <span v-if="getConfig('country')" class="d-block">{{ getConfig('country') }}</span>
        <div class="mb-2 m-l-30" v-if="getConfig('phone')">
          <i class="fa fa-phone"></i> <a href="#">{{ getConfig('phone') }}</a>
        </div>
        <div class="mb-2 m-l-30" v-if="getConfig('fax')">
          <i class="fa fa-fax"></i> <a href="#">{{ getConfig('fax') }}</a>
        </div>
        <div class="mb-2 m-l-30" v-if="getConfig('email')">
          <i class="fa fa-envelope"></i> <a href="#">{{ getConfig('email') }}</a>
        </div>
        <div class="mb-2 m-l-30" v-if="getConfig('website')">
          <i class="fa fa-globe"></i> <a :href="getConfig('website')">{{ getConfig('website') }}</a>
        </div>
      </div>
    </div>
    <div class="py-4">
      <div class="row">
        <div class="col-md-12 mx-5">
          <span>{{ trans('frontend.footer_copyright') }} &copy; {{ getYear() }} <router-link to="/">{{ getConfig('institute_name') }}</router-link></span>
          <span>{{ trans('frontend.footer_all_rights_reserved') }}</span>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  props: ['menus'],
  mounted() {
  },
  methods: {
    getConfig(config) {
      return helper.getConfig(config);
    },
    getYear() {
      return moment().format('Y');
    }
  },
  computed: {
    getLogo() {
      return helper.getIcon();
    }
  }
}
</script>

<style lang="scss">
.comma:before {
  content: ", "
}
.frontend-footer {
  background: #05011d;
  li{
    list-style-type: none;
    margin-bottom:10px;
  }
}
</style>