<template>
  <div>
    <div class="main-banner" v-if="page.id">
      <div class="row highlights">
        <div class="col-md-2 highlights"><span class="">HIGHLIGHTS</span></div>
        <div class="col-md-10">
          <div v-if="circular.length" class="row notice-slide m-0">
            <div class="col-md-12">
              <div class="container-fluid p-0 m-0">
                <router-link to="notices">
                  <marquee scrollamount="20" onmouseover="this.stop();" onmouseout="this.start();"><span>{{ circular[0].title }}</span></marquee>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="sliderCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" v-if="page.options.has_slider">
          <template v-for="slider in page.options.sliders">
            <div :class="['carousel-item', $first(slider, page.options.sliders) ? 'active' : '']">
              <img class="d-block w-100" :src="slider.image" :alt="slider.title">
              <div class="carousel-caption">
                <div class="container-fluid">
                  <div class="row">
                    <div class="col-12 bg-custom d-none d-md-block py-3 pl-5 text-white text-left">
                      <h2>{{ slider.title }}</h2>
                      <p>{{ slider.description }}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </template>
        </div>

        <a class="carousel-control-prev" href="#sliderCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#sliderCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>

    <div class="container-fluid">

      <div class="p-t-80">
        <div class="row">
          <div class="col-12 col-md-8">
            <div class="card featured-block">
              <div class="card-body p-4">
                <h3 class="card-title">{{ page.title }}</h3>
                <div class="line"></div>
                <p v-html="page.body"></p>
                <div class="row mb-4">
                  <div class="col-md-3">
                    <div class="row">
                      <div class="col-3">
                        <i class="fa fa-trophy fa-3x"></i>
                      </div>
                      <div class="col-8">
                        <p><span class="font-weight-bold">Achievements</span> <br> 15</p>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-3">
                    <div class="row">
                      <div class="col-3">
                        <i class="fa fa-book-open fa-3x"></i>
                      </div>
                      <div class="col-8">
                        <p><span class="font-weight-bold">Courses</span> <br> 20</p>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-3">
                    <div class="row">
                      <div class="col-3">
                        <i class="fa fa-user fa-3x"></i>
                      </div>
                      <div class="col-8">
                        <p><span class="font-weight-bold">Staffs</span> <br> 200</p>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-3">
                    <div class="row">
                      <div class="col-3">
                        <i class="fa fa-user fa-3x"></i>
                      </div>
                      <div class="col-8">
                        <p><span class="font-weight-bold">Students</span> <br> 2000</p>
                      </div>
                    </div>
                  </div>

                </div>

                <router-link class="btn btn-danger" :to="'page/about'">{{ trans('general.learn_more') }}</router-link>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-4 p-0">
            <template v-if="page.options">
              <principle-message :blocks="blocks"></principle-message>
            </template>
          </div>
        </div>
      </div>

      <div class="p-t-80">
        <div class="row">
          <div class="col-12 col-md-6 pr-md-0">
            <latest-news-list v-if="news.length" :articles="news" class="frontend-widget m-b-0" view-more-link="/articles"></latest-news-list>
            <empty-list v-else :title="'Latest News'" :body="'No News'" :cardTitleBg="'news-list-header'" class="frontend-widget m-b-0"></empty-list>
          </div>
          <div class="col-12 col-md-6 pl-md-0">
            <events-list v-if="events.length" :events="events" class="frontend-widget m-b-0" view-more-link="/events"></events-list>
            <empty-list v-else :title="'Upcoming Events'" :body="'No Upcoming Events'" :cardTitleBg="'events-list-header'" class="frontend-widget m-b-0"></empty-list>
          </div>
        </div>
      </div>

      <template v-if="page.options">
        <homepage-row-blocks v-if="page.options.show_blocks" :blocks="blocks"></homepage-row-blocks>
      </template>

      <template v-if="page.options">
        <homepage-row-features v-if="page.options.show_blocks" :blocks="features"></homepage-row-features>
      </template>

      <div class="p-t-60">
        <div class="row">
          <div class="col-12">
            <h2 class="display-7">Our Gallery</h2>
            <div class="line"></div>
            <div id="3d-slider" v-if="attachments.length">
              <carousel-3d :controls-visible="true" :autoplay="true" :autoplay-timeout="5000" :display="attachments.length">
                <slide v-for="(attachment, index) in attachments" :index="index">
                  <img :src="'storage/'+attachment.filename">
                </slide>
              </carousel-3d>
            </div>
            <h3 v-else class="text-center">No Images</h3>
          </div>
        </div>
      </div>

      <div class="row p-t-60">
        <div class="col-md-12">
          <div class="">
            <div class="row justify-content-center">
              <div class="col-md-8">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3531.366368834582!2d86.16455541438533!3d27.7368436308034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ebd10b1a9564ed%3A0xe924c5798cd940f8!2sBigu%20Polytechnic%20Institute!5e0!3m2!1sen!2snp!4v1607828366077!5m2!1sen!2snp"
                    width="100%" height="390" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
              </div>
              <div class="col-md-4">
                <latest-circular-list v-if="circular.length" :articles="circular" class="frontend-widget m-b-0" view-more-link="/notices"></latest-circular-list>
                <empty-list v-else :title="'Latest Notices'" :body="'No Notices'" :cardTitleBg="'news-list-header'" class="frontend-widget m-b-0"></empty-list>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="myModal" v-if="popup.length">
        <div class="modal-dialog">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">{{ popup[0].title }}</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body text-center">ç
              <div v-html="popup[0].description"></div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import EventsList from '@js/widgets/events-list'
import HomepageRowFeatures from '@views/pages/partials/homepage-row-features'
import HomepageRowBlocks from '@views/pages/partials/homepage-row-blocks'
import PrincipleMessage from '@views/pages/partials/principle-message'
import LatestNewsList from "@js/widgets/latest-news-list"
import LatestBlogList from "@js/widgets/latest-blog-list"
import LatestCircularList from "@js/widgets/latest-circular-list"
import {Carousel3d, Slide} from "vue-carousel-3d"
import EmptyList from "@js/widgets/empty-list"

export default {
  components: {
    EmptyList,
    LatestNewsList,
    LatestBlogList,
    LatestCircularList,
    EventsList,
    HomepageRowFeatures,
    HomepageRowBlocks,
    PrincipleMessage,
    Carousel3d,
    Slide,
  },
  data() {
    return {
      showEventModal: false,
      page: {},
      events: [],
      blocks: [],
      features: [],
      articles: {},
      news: [],
      blogs: [],
      circular: [],
      attachments: [],
      popup: [],
    }
  },
  mounted() {
    this.getData();

    helper.showDemoNotification(['frontend_home']);
  },
  methods: {
    getData() {
      let loader = this.$loading.show();
      axios.get('/api/frontend/page/home/content')
          .then(response => {
            this.page = response.page;
            this.events = response.events;
            this.blocks = response.blocks;
            this.features = response.features;
            // console.log(this.blocks);
            // console.log(this.features);
            this.articles = response.articles;
            this.attachments = response.attachments;
            if (this.articles.News.length)
              this.news = this.articles.News;
            if (this.articles.Blog.length)
              this.blogs = this.articles.Blog;
            if (this.articles.Notice.length)
              this.circular = this.articles.Notice;
            if (this.popup.length) {
              setTimeout(function () {
                $('#myModal').modal('show');
              }, 3000)
            }
            loader.hide();
          })
          .catch(error => {
            loader.hide();
            helper.showErrorMsg(error);

            if (error.response.status == 422)
              this.$router.push('/login');
          })
    },
  }
}
</script>

<style lang="scss">
.frontend-widget {
  background: #f5f6f7;
  border: 1px solid #eaebec;

  &.card.widget .card-title {
    padding: 0.55rem;
    margin-bottom: 0;
  }

  .news-list-header {
    background-color: #d92318;
    color: #fff;

    a {
      color: #fff;
    }
  }

  .events-list-header {
    background-color: #005ab3;
    color: #fff;

    a {
      color: #fff;
    }
  }
}

.notice-slide {
  background-color: #d92318;
  color: white;
  height: 40px;
}

.notice-slide span {
  font-size: 1.1em;
  color: white;
  width: 100%;
  height: 100%;
  margin: 0;
  line-height: 40px;
  text-align: center;
  /* Apply animation to this element */
  //-moz-animation: rightThenLeft 50s linear;
  //-webkit-animation: rightThenLeft 50s linear;

}

.highlights{
  font-size: 1.1em;
  font-weight: 500;
  color: white;
  background: #d92318;
  text-align: center;
  margin: auto auto;
}

.carousel-3d-slide img {
  width: auto;
  height: 100%;
}

.line {
  display: block;
  width: 60px;
  height: 3px;
  background: #d92318;
  margin: 3px 0 15px 0;
}

.card-title {
  margin-bottom: 0;
}

</style>
