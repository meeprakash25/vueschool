<template>
  <header class="topheader">
    <div class="container-fluid pt-0">
      <div class="row">
        <div class="col-md-3 text-center">
          <!-- Logo will be here -->
          <router-link to="/" class="navbar-brand">
            <img :src="getLogo" :alt="getConfig('institute_name')"/>
          </router-link>
        </div>
        <div class="col-md-3 my-auto">
          <p><span class="font-weight-bold">Phone Number</span> <br> <a :href="tel()">{{ getConfig('phone') }}</a></p>
        </div>
        <div class="col-md-3 my-auto">
          <p><span class="font-weight-bold">Email</span> <br> <a :href="mailto()">{{ getConfig('email') }}</a></p>
        </div>
        <div class="col-md-3 my-auto">
          <div>
            <span class="font-weight-bold">Social Links</span>
            <ul class="footer-link list-inline">
              <li class="list-inline-item" v-if="getConfig('facebook_link')"><a target="_blank" :href="getConfig('facebook_link')"><i class="fab fa-facebook"></i></a></li>
              <li class="list-inline-item" v-if="getConfig('twitter_link')"><a target="_blank" :href="getConfig('twitter_link')"><i class="fab fa-twitter"></i></a></li>
              <li class="list-inline-item" v-if="getConfig('google_plus_link')"><a target="_blank" :href="getConfig('google_plus_link')"><i class="fab fa-google-plus"></i></a></li>
              <li class="list-inline-item" v-if="getConfig('youtube_link')"><a target="_blank" :href="getConfig('youtube_link')"><i class="fab fa-youtube"></i></a></li>
              <li class="list-inline-item" v-if="getConfig('linkedin_link')"><a target="_blank" :href="getConfig('linkedin_link')"><i class="fab fa-linkedin"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <nav class="navbar navbar-expand-md navbar-light" style="background-color: #0456a7">
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
              aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
      <!-- This is the navigation menu -->
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto stylish-nav">
          <template v-for="item in menus" v-if="item.page && !item.page.is_draft">

            <li class="nav-item dropdown" v-if="item.hasOwnProperty('children') && item.children.length">
              <a class="nav-link dropdown-toggle" href="" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ item.name }}</a>

              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <router-link class="dropdown-item" v-for="child in item.children" :key="child.slug" :to="`/page/${child.slug}`" exact>{{ child.name }}</router-link>
              </div>
            </li>

            <li class="nav-item" v-else>
              <router-link :to="item.options.is_default ? `/${item.slug}` : `/page/${item.slug}`" exact class="nav-link">{{ item.name }}</router-link>
            </li>

          </template>
        </ul>
        <ul class="navbar-nav ml-auto stylish-nav">
          <li class="nav-item" v-if="getConfig('online_registration')">
            <router-link to="/online-registration" exact class="nav-link">{{ trans('student.online_registration') }}</router-link>
          </li>
          <li class="nav-item dropdown" v-if="isAuth()">
            <router-link to="/dashboard" class="nav-link dropdown-toggle btn nav-btn warning" id="authDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                         aria-expanded="false"><i class="fas fa-home"></i> {{ trans('general.dashboard') }}
            </router-link>

            <div class="dropdown-menu border-0 bg-transparent" aria-labelledby="authDropdownMenuLink">
              <a class="dropdown-item btn nav-btn danger" href="#" @click.prevent="logout"><i class="fas fa-power-off"></i> {{ trans('auth.logout') }}</a>
            </div>
          </li>

          <li class="nav-item" v-else>
            <router-link to="/login" class="nav-link btn nav-btn info">{{ trans('auth.sign_in') }}</router-link>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  props: ['menus'],
  mounted() {
  },
  methods: {
    logout() {
      helper.logout().then(() => {
        this.$router.push('/')
      })
    },
    getConfig(config) {
      return helper.getConfig(config);
    },
    isAuth() {
      return helper.isAuth();
    },
    tel() {
      return `tel:${this.getConfig('phone')}`;
    },
    mailto() {
      return `mailto:${this.getConfig('email')}`;
    },
  },
  computed: {
    getLogo() {
      return helper.getLogo();
    }
  }
}
</script>

<style scoped>

.list-inline-item{
  border: 1px solid grey;
}
.list-inline-item:not(:last-child){
  margin-right:0;
}
</style>