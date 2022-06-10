(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/pages/themes/home"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=script&lang=js&":
/*!****************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _js_widgets_featured_block__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @js/widgets/featured-block */ "./resources/js/widgets/featured-block.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    blocks: {
      type: Array,
      "default": function _default() {
        return [];
      }
    },
    bodyClass: String
  },
  components: {
    FeaturedBlock: _js_widgets_featured_block__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  computed: {
    getClass: function getClass() {
      return this.blocks.length > 1 ? this.blocks.length > 2 ? "col-12 col-sm-6 col-md-3" : "col-12 col-sm-4" : "col";
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=script&lang=js&":
/*!******************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=script&lang=js& ***!
  \******************************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _js_widgets_featured_block_01__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @js/widgets/featured-block-01 */ "./resources/js/widgets/featured-block-01.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    blocks: {
      type: Array,
      "default": function _default() {
        return [];
      }
    },
    bodyClass: String
  },
  components: {
    FeaturedBlock01: _js_widgets_featured_block_01__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  computed: {}
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/principle-message.vue?vue&type=script&lang=js&":
/*!**************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/partials/principle-message.vue?vue&type=script&lang=js& ***!
  \**************************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _js_widgets_principle_message_block__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @js/widgets/principle-message-block */ "./resources/js/widgets/principle-message-block.vue");
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    blocks: {
      type: Array,
      "default": function _default() {
        return [];
      }
    },
    bodyClass: String
  },
  components: {
    PrincipleMessageBlock: _js_widgets_principle_message_block__WEBPACK_IMPORTED_MODULE_0__["default"]
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=script&lang=js&":
/*!*******************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/home.vue?vue&type=script&lang=js& ***!
  \*******************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _js_widgets_events_list__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @js/widgets/events-list */ "./resources/js/widgets/events-list.vue");
/* harmony import */ var _views_pages_partials_homepage_row_features__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @views/pages/partials/homepage-row-features */ "./resources/js/views/pages/partials/homepage-row-features.vue");
/* harmony import */ var _views_pages_partials_homepage_row_blocks__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @views/pages/partials/homepage-row-blocks */ "./resources/js/views/pages/partials/homepage-row-blocks.vue");
/* harmony import */ var _views_pages_partials_principle_message__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @views/pages/partials/principle-message */ "./resources/js/views/pages/partials/principle-message.vue");
/* harmony import */ var _js_widgets_latest_news_list__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @js/widgets/latest-news-list */ "./resources/js/widgets/latest-news-list.vue");
/* harmony import */ var _js_widgets_latest_blog_list__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @js/widgets/latest-blog-list */ "./resources/js/widgets/latest-blog-list.vue");
/* harmony import */ var _js_widgets_latest_circular_list__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! @js/widgets/latest-circular-list */ "./resources/js/widgets/latest-circular-list.vue");
/* harmony import */ var vue_carousel_3d__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! vue-carousel-3d */ "./node_modules/vue-carousel-3d/dist/carousel-3d.common.js");
/* harmony import */ var vue_carousel_3d__WEBPACK_IMPORTED_MODULE_7___default = /*#__PURE__*/__webpack_require__.n(vue_carousel_3d__WEBPACK_IMPORTED_MODULE_7__);
/* harmony import */ var _js_widgets_empty_list__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! @js/widgets/empty-list */ "./resources/js/widgets/empty-list.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//









/* harmony default export */ __webpack_exports__["default"] = ({
  components: {
    EmptyList: _js_widgets_empty_list__WEBPACK_IMPORTED_MODULE_8__["default"],
    LatestNewsList: _js_widgets_latest_news_list__WEBPACK_IMPORTED_MODULE_4__["default"],
    LatestBlogList: _js_widgets_latest_blog_list__WEBPACK_IMPORTED_MODULE_5__["default"],
    LatestCircularList: _js_widgets_latest_circular_list__WEBPACK_IMPORTED_MODULE_6__["default"],
    EventsList: _js_widgets_events_list__WEBPACK_IMPORTED_MODULE_0__["default"],
    HomepageRowFeatures: _views_pages_partials_homepage_row_features__WEBPACK_IMPORTED_MODULE_1__["default"],
    HomepageRowBlocks: _views_pages_partials_homepage_row_blocks__WEBPACK_IMPORTED_MODULE_2__["default"],
    PrincipleMessage: _views_pages_partials_principle_message__WEBPACK_IMPORTED_MODULE_3__["default"],
    Carousel3d: vue_carousel_3d__WEBPACK_IMPORTED_MODULE_7__["Carousel3d"],
    Slide: vue_carousel_3d__WEBPACK_IMPORTED_MODULE_7__["Slide"]
  },
  data: function data() {
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
      popup: []
    };
  },
  mounted: function mounted() {
    this.getData();
    helper.showDemoNotification(['frontend_home']);
  },
  methods: {
    getData: function getData() {
      var _this = this;

      var loader = this.$loading.show();
      axios.get('/api/frontend/page/home/content').then(function (response) {
        _this.page = response.page;
        _this.events = response.events;
        _this.blocks = response.blocks;
        _this.features = response.features; // console.log(this.blocks);
        // console.log(this.features);

        _this.articles = response.articles;
        _this.attachments = response.attachments;
        if (_this.articles.News.length) _this.news = _this.articles.News;
        if (_this.articles.Blog.length) _this.blogs = _this.articles.Blog;
        if (_this.articles.Notice.length) _this.circular = _this.articles.Notice;

        if (_this.popup.length) {
          setTimeout(function () {
            $('#myModal').modal('show');
          }, 3000);
        }

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
        if (error.response.status == 422) _this.$router.push('/login');
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/empty-list.vue?vue&type=script&lang=js&":
/*!******************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/empty-list.vue?vue&type=script&lang=js& ***!
  \******************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
//
//
//
//
//
//
//
//
//
//
//
//
//
/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    cardTitleBg: String,
    title: String,
    body: String,
    bodyClass: String,
    source: {
      type: String,
      "default": "dashboard"
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/events-list.vue?vue&type=script&lang=js&":
/*!*******************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/events-list.vue?vue&type=script&lang=js& ***!
  \*******************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _views_calendar_event_show__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @views/calendar/event/show */ "./resources/js/views/calendar/event/show.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    events: {
      type: Array,
      "default": function _default() {
        return [];
      }
    },
    bodyClass: String,
    viewMoreLink: String,
    source: {
      type: String,
      "default": "dashboard"
    }
  },
  components: {
    EventDetail: _views_calendar_event_show__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      showEventModal: false
    };
  },
  methods: {
    showEvent: function showEvent(event) {
      this.showEventUuid = event.uuid;
      this.showEventModal = true;
    }
  },
  filters: {
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    },
    moment: function moment(date) {
      return helper.formatDate(date);
    },
    momentTime: function momentTime(time) {
      return helper.formatTime(time);
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=script&lang=js&":
/*!*************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/featured-block-01.vue?vue&type=script&lang=js& ***!
  \*************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    block: {
      type: Object,
      "default": function _default() {
        return {};
      }
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block.vue?vue&type=script&lang=js&":
/*!**********************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/featured-block.vue?vue&type=script&lang=js& ***!
  \**********************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    block: {
      type: Object,
      "default": function _default() {
        return {};
      }
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-blog-list.vue?vue&type=script&lang=js&":
/*!************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/latest-blog-list.vue?vue&type=script&lang=js& ***!
  \************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _views_post_article_show__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @views/post/article/show */ "./resources/js/views/post/article/show.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    articles: {
      type: Array,
      "default": function _default() {
        return [];
      }
    },
    bodyClass: String,
    viewMoreLink: String,
    source: {
      type: String,
      "default": "dashboard"
    }
  },
  components: {
    ArticleDetail: _views_post_article_show__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      showArticleModal: false
    };
  },
  methods: {
    showArticle: function showArticle(article) {
      this.showArticleUuid = article.uuid;
      this.showArticleModal = true;
    }
  },
  filters: {
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    },
    moment: function moment(date) {
      return helper.formatDate(date);
    },
    momentTime: function momentTime(time) {
      return helper.formatTime(time);
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-circular-list.vue?vue&type=script&lang=js&":
/*!****************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/latest-circular-list.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _views_post_article_show__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @views/post/article/show */ "./resources/js/views/post/article/show.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    articles: {
      type: Array,
      "default": function _default() {
        return [];
      }
    },
    bodyClass: String,
    viewMoreLink: String,
    source: {
      type: String,
      "default": "dashboard"
    }
  },
  components: {
    ArticleDetail: _views_post_article_show__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      showArticleModal: false
    };
  },
  methods: {
    showArticle: function showArticle(article) {
      this.showArticleUuid = article.uuid;
      this.showArticleModal = true;
    }
  },
  filters: {
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    },
    moment: function moment(date) {
      return helper.formatDate(date);
    },
    momentTime: function momentTime(time) {
      return helper.formatTime(time);
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-news-list.vue?vue&type=script&lang=js&":
/*!************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/latest-news-list.vue?vue&type=script&lang=js& ***!
  \************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _views_post_article_show__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @views/post/article/show */ "./resources/js/views/post/article/show.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    articles: {
      type: Array,
      "default": function _default() {
        return [];
      }
    },
    bodyClass: String,
    viewMoreLink: String,
    source: {
      type: String,
      "default": "dashboard"
    }
  },
  components: {
    ArticleDetail: _views_post_article_show__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      showArticleModal: false
    };
  },
  methods: {
    showArticle: function showArticle(article) {
      this.showArticleUuid = article.uuid;
      this.showArticleModal = true;
    }
  },
  filters: {
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    },
    moment: function moment(date) {
      return helper.formatDate(date);
    },
    momentTime: function momentTime(time) {
      return helper.formatTime(time);
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=script&lang=js&":
/*!*******************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/principle-message-block.vue?vue&type=script&lang=js& ***!
  \*******************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
/* harmony default export */ __webpack_exports__["default"] = ({
  props: {
    block: {
      type: Object,
      "default": function _default() {
        return {};
      }
    }
  }
});

/***/ }),

/***/ "./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss&":
/*!********************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--14-2!./node_modules/sass-loader/dist/cjs.js??ref--14-3!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss& ***!
  \********************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, ".frontend-widget {\n  background: #f5f6f7;\n  border: 1px solid #eaebec;\n}\n.frontend-widget.card.widget .card-title {\n  padding: 0.55rem;\n  margin-bottom: 0;\n}\n.frontend-widget .news-list-header {\n  background-color: #d92318;\n  color: #fff;\n}\n.frontend-widget .news-list-header a {\n  color: #fff;\n}\n.frontend-widget .events-list-header {\n  background-color: #005ab3;\n  color: #fff;\n}\n.frontend-widget .events-list-header a {\n  color: #fff;\n}\n.notice-slide {\n  background-color: #d92318;\n  color: white;\n  height: 40px;\n}\n.notice-slide span {\n  font-size: 1.1em;\n  color: white;\n  width: 100%;\n  height: 100%;\n  margin: 0;\n  line-height: 40px;\n  text-align: center;\n  /* Apply animation to this element */\n}\n.highlights {\n  font-size: 1.1em;\n  font-weight: 500;\n  color: white;\n  background: #d92318;\n  text-align: center;\n  margin: auto auto;\n}\n.carousel-3d-slide img {\n  width: auto;\n  height: 100%;\n}\n.line {\n  display: block;\n  width: 60px;\n  height: 3px;\n  background: #d92318;\n  margin: 3px 0 15px 0;\n}\n.card-title {\n  margin-bottom: 0;\n}", ""]);

// exports


/***/ }),

/***/ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css&":
/*!**********************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css& ***!
  \**********************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "\n.feature-icon {\n  font-size: 2rem;\n  color: #007bff;\n}\n.our-features .list-group-item {\n  padding-left: unset;\n  padding-bottom: unset;\n}\n.our-features .h-100 {\n  height: 95%!important;\n}\n.media {\n  border:none;\n  border-bottom: 1px solid rgba(120, 130, 140, 0.13);\n   margin-bottom: 0px;\n   padding: 0px;\n}\na{\n  color: #d92318;\n  font-weight: 500;\n}\n", ""]);

// exports


/***/ }),

/***/ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css&":
/*!****************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css& ***!
  \****************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "\n.featured-block .featured[data-v-34926a48] {\n  background: none;\n  max-height:200px;\n}\n.featured-block .featured img[data-v-34926a48]{\n  height:200px;\n}\na[data-v-34926a48]{\n  color:#d92318;\n  font-weight: 500;\n}\na[data-v-34926a48]:hover{\n  color:#ac1c14;\n}\n", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss&":
/*!************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--14-2!./node_modules/sass-loader/dist/cjs.js??ref--14-3!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss& ***!
  \************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../../node_modules/css-loader!../../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../../node_modules/postcss-loader/src??ref--14-2!../../../../../../node_modules/sass-loader/dist/cjs.js??ref--14-3!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./home.vue?vue&type=style&index=0&lang=scss& */ "./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss&");

if(typeof content === 'string') content = [[module.i, content, '']];

var transform;
var insertInto;



var options = {"hmr":true}

options.transform = transform
options.insertInto = undefined;

var update = __webpack_require__(/*! ../../../../../../node_modules/style-loader/lib/addStyles.js */ "./node_modules/style-loader/lib/addStyles.js")(content, options);

if(content.locals) module.exports = content.locals;

if(false) {}

/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css&":
/*!**************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css& ***!
  \**************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../node_modules/css-loader??ref--13-1!../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../node_modules/postcss-loader/src??ref--13-2!../../../node_modules/vue-loader/lib??vue-loader-options!./featured-block-01.vue?vue&type=style&index=0&lang=css& */ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css&");

if(typeof content === 'string') content = [[module.i, content, '']];

var transform;
var insertInto;



var options = {"hmr":true}

options.transform = transform
options.insertInto = undefined;

var update = __webpack_require__(/*! ../../../node_modules/style-loader/lib/addStyles.js */ "./node_modules/style-loader/lib/addStyles.js")(content, options);

if(content.locals) module.exports = content.locals;

if(false) {}

/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css&":
/*!********************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css& ***!
  \********************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../node_modules/css-loader??ref--13-1!../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../node_modules/postcss-loader/src??ref--13-2!../../../node_modules/vue-loader/lib??vue-loader-options!./principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css& */ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css&");

if(typeof content === 'string') content = [[module.i, content, '']];

var transform;
var insertInto;



var options = {"hmr":true}

options.transform = transform
options.insertInto = undefined;

var update = __webpack_require__(/*! ../../../node_modules/style-loader/lib/addStyles.js */ "./node_modules/style-loader/lib/addStyles.js")(content, options);

if(content.locals) module.exports = content.locals;

if(false) {}

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=template&id=c270cb76&":
/*!********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=template&id=c270cb76& ***!
  \********************************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { staticClass: "row light-grey m-t-80 p-t-30 p-b-30" }, [
    _c("div", { staticClass: "col-md-12" }, [
      _c("h2", { staticClass: "display-7" }, [_vm._v("Our Programs")]),
      _vm._v(" "),
      _c("div", { staticClass: "line mb-5" }),
      _vm._v(" "),
      _c(
        "div",
        { staticClass: "row justify-content-center" },
        _vm._l(_vm.blocks, function(block, index) {
          return index > 0
            ? _c(
                "div",
                { class: _vm.getClass },
                [_c("featured-block", { attrs: { block: block } })],
                1
              )
            : _vm._e()
        }),
        0
      )
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=template&id=68666088&":
/*!**********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=template&id=68666088& ***!
  \**********************************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { staticClass: "row light-grey m-t-80 p-t-30 p-b-30" }, [
    _c("div", { staticClass: "col-md-12" }, [
      _c("h2", { staticClass: "display-7" }, [_vm._v("Our Features")]),
      _vm._v(" "),
      _c("div", { staticClass: "line mb-5" }),
      _vm._v(" "),
      _c("div", { staticClass: "row" }, [
        _c(
          "div",
          { staticClass: "col-md-4" },
          _vm._l(_vm.blocks, function(block, index) {
            return _c(
              "div",
              [_c("featured-block-01", { attrs: { block: block } })],
              1
            )
          }),
          0
        ),
        _vm._v(" "),
        _c("div", { staticClass: "col-md-4 mt-1" }, [
          _vm.blocks.length > 0 && _vm.blocks[0].featured_image
            ? _c("img", {
                staticClass: "w-100 h-100",
                attrs: {
                  src: "/" + _vm.blocks[0].featured_image,
                  alt: _vm.blocks[0].title
                }
              })
            : _c("img", {
                staticClass: "w-100 h-100",
                attrs: { src: "https://via.placeholder.com/400", alt: "" }
              })
        ]),
        _vm._v(" "),
        _c("div", { staticClass: "col-md-4 mt-1 feature-image" }, [
          _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-md-12 pl-0" }, [
              _vm.blocks.length > 1 && _vm.blocks[1].featured_image
                ? _c("img", {
                    staticClass: "w-100",
                    attrs: {
                      src: "/" + _vm.blocks[1].featured_image,
                      alt: _vm.blocks[1].title,
                      height: "200px"
                    }
                  })
                : _c("img", {
                    staticClass: "w-100",
                    attrs: {
                      src: "https://via.placeholder.com/200x100",
                      alt: ""
                    }
                  })
            ])
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-md-12 mt-4 pl-0" }, [
              _vm.blocks.length > 2 && _vm.blocks[2].featured_image
                ? _c("img", {
                    staticClass: "w-100 ",
                    attrs: {
                      src: "/" + _vm.blocks[2].featured_image,
                      alt: _vm.blocks[2].title,
                      height: "200px"
                    }
                  })
                : _c("img", {
                    staticClass: "w-100",
                    attrs: {
                      src: "https://via.placeholder.com/200x100",
                      alt: ""
                    }
                  })
            ])
          ])
        ])
      ])
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/principle-message.vue?vue&type=template&id=c200f5ba&scoped=true&":
/*!******************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/partials/principle-message.vue?vue&type=template&id=c200f5ba&scoped=true& ***!
  \******************************************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { staticClass: "row" }, [
    _vm.blocks.length
      ? _c("div", { staticClass: "col-md-12" }, [
          _c(
            "div",
            { staticClass: "fix-width fix-width-mobile" },
            [
              _c("principle-message-block", { attrs: { block: _vm.blocks[0] } })
            ],
            1
          )
        ])
      : _vm._e()
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=template&id=37f32bd8&":
/*!***********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/home.vue?vue&type=template&id=37f32bd8& ***!
  \***********************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", [
    _vm.page.id
      ? _c("div", { staticClass: "main-banner" }, [
          _c("div", { staticClass: "row highlights" }, [
            _vm._m(0),
            _vm._v(" "),
            _c("div", { staticClass: "col-md-10" }, [
              _vm.circular.length
                ? _c("div", { staticClass: "row notice-slide m-0" }, [
                    _c("div", { staticClass: "col-md-12" }, [
                      _c(
                        "div",
                        { staticClass: "container-fluid p-0 m-0" },
                        [
                          _c(
                            "router-link",
                            { attrs: { to: "notices" } },
                            [
                              _c(
                                "marquee",
                                {
                                  attrs: {
                                    scrollamount: "20",
                                    onmouseover: "this.stop();",
                                    onmouseout: "this.start();"
                                  }
                                },
                                [
                                  _c("span", [
                                    _vm._v(_vm._s(_vm.circular[0].title))
                                  ])
                                ]
                              )
                            ],
                            1
                          )
                        ],
                        1
                      )
                    ])
                  ])
                : _vm._e()
            ])
          ]),
          _vm._v(" "),
          _c(
            "div",
            {
              staticClass: "carousel slide",
              attrs: { id: "sliderCarousel", "data-ride": "carousel" }
            },
            [
              _vm.page.options.has_slider
                ? _c(
                    "div",
                    { staticClass: "carousel-inner" },
                    [
                      _vm._l(_vm.page.options.sliders, function(slider) {
                        return [
                          _c(
                            "div",
                            {
                              class: [
                                "carousel-item",
                                _vm.$first(slider, _vm.page.options.sliders)
                                  ? "active"
                                  : ""
                              ]
                            },
                            [
                              _c("img", {
                                staticClass: "d-block w-100",
                                attrs: { src: slider.image, alt: slider.title }
                              }),
                              _vm._v(" "),
                              _c("div", { staticClass: "carousel-caption" }, [
                                _c("div", { staticClass: "container-fluid" }, [
                                  _c("div", { staticClass: "row" }, [
                                    _c(
                                      "div",
                                      {
                                        staticClass:
                                          "col-12 bg-custom d-none d-md-block py-3 pl-5 text-white text-left"
                                      },
                                      [
                                        _c("h2", [
                                          _vm._v(_vm._s(slider.title))
                                        ]),
                                        _vm._v(" "),
                                        _c("p", [
                                          _vm._v(_vm._s(slider.description))
                                        ])
                                      ]
                                    )
                                  ])
                                ])
                              ])
                            ]
                          )
                        ]
                      })
                    ],
                    2
                  )
                : _vm._e(),
              _vm._v(" "),
              _vm._m(1),
              _vm._v(" "),
              _vm._m(2)
            ]
          )
        ])
      : _vm._e(),
    _vm._v(" "),
    _c(
      "div",
      { staticClass: "container-fluid" },
      [
        _c("div", { staticClass: "p-t-80" }, [
          _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-12 col-md-8" }, [
              _c("div", { staticClass: "card featured-block" }, [
                _c(
                  "div",
                  { staticClass: "card-body p-4" },
                  [
                    _c("h3", { staticClass: "card-title" }, [
                      _vm._v(_vm._s(_vm.page.title))
                    ]),
                    _vm._v(" "),
                    _c("div", { staticClass: "line" }),
                    _vm._v(" "),
                    _c("p", { domProps: { innerHTML: _vm._s(_vm.page.body) } }),
                    _vm._v(" "),
                    _vm._m(3),
                    _vm._v(" "),
                    _c(
                      "router-link",
                      {
                        staticClass: "btn btn-danger",
                        attrs: { to: "page/about" }
                      },
                      [_vm._v(_vm._s(_vm.trans("general.learn_more")))]
                    )
                  ],
                  1
                )
              ])
            ]),
            _vm._v(" "),
            _c(
              "div",
              { staticClass: "col-12 col-md-4 p-0" },
              [
                _vm.page.options
                  ? [_c("principle-message", { attrs: { blocks: _vm.blocks } })]
                  : _vm._e()
              ],
              2
            )
          ])
        ]),
        _vm._v(" "),
        _c("div", { staticClass: "p-t-80" }, [
          _c("div", { staticClass: "row" }, [
            _c(
              "div",
              { staticClass: "col-12 col-md-6 pr-md-0" },
              [
                _vm.news.length
                  ? _c("latest-news-list", {
                      staticClass: "frontend-widget m-b-0",
                      attrs: {
                        articles: _vm.news,
                        "view-more-link": "/articles"
                      }
                    })
                  : _c("empty-list", {
                      staticClass: "frontend-widget m-b-0",
                      attrs: {
                        title: "Latest News",
                        body: "No News",
                        cardTitleBg: "news-list-header"
                      }
                    })
              ],
              1
            ),
            _vm._v(" "),
            _c(
              "div",
              { staticClass: "col-12 col-md-6 pl-md-0" },
              [
                _vm.events.length
                  ? _c("events-list", {
                      staticClass: "frontend-widget m-b-0",
                      attrs: { events: _vm.events, "view-more-link": "/events" }
                    })
                  : _c("empty-list", {
                      staticClass: "frontend-widget m-b-0",
                      attrs: {
                        title: "Upcoming Events",
                        body: "No Upcoming Events",
                        cardTitleBg: "events-list-header"
                      }
                    })
              ],
              1
            )
          ])
        ]),
        _vm._v(" "),
        _vm.page.options
          ? [
              _vm.page.options.show_blocks
                ? _c("homepage-row-blocks", { attrs: { blocks: _vm.blocks } })
                : _vm._e()
            ]
          : _vm._e(),
        _vm._v(" "),
        _vm.page.options
          ? [
              _vm.page.options.show_blocks
                ? _c("homepage-row-features", {
                    attrs: { blocks: _vm.features }
                  })
                : _vm._e()
            ]
          : _vm._e(),
        _vm._v(" "),
        _c("div", { staticClass: "p-t-60" }, [
          _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-12" }, [
              _c("h2", { staticClass: "display-7" }, [_vm._v("Our Gallery")]),
              _vm._v(" "),
              _c("div", { staticClass: "line" }),
              _vm._v(" "),
              _vm.attachments.length
                ? _c(
                    "div",
                    { attrs: { id: "3d-slider" } },
                    [
                      _c(
                        "carousel-3d",
                        {
                          attrs: {
                            "controls-visible": true,
                            autoplay: true,
                            "autoplay-timeout": 5000,
                            display: _vm.attachments.length
                          }
                        },
                        _vm._l(_vm.attachments, function(attachment, index) {
                          return _c("slide", { attrs: { index: index } }, [
                            _c("img", {
                              attrs: { src: "storage/" + attachment.filename }
                            })
                          ])
                        }),
                        1
                      )
                    ],
                    1
                  )
                : _c("h3", { staticClass: "text-center" }, [
                    _vm._v("No Images")
                  ])
            ])
          ])
        ]),
        _vm._v(" "),
        _c("div", { staticClass: "row p-t-60" }, [
          _c("div", { staticClass: "col-md-12" }, [
            _c("div", {}, [
              _c("div", { staticClass: "row justify-content-center" }, [
                _vm._m(4),
                _vm._v(" "),
                _c(
                  "div",
                  { staticClass: "col-md-4" },
                  [
                    _vm.circular.length
                      ? _c("latest-circular-list", {
                          staticClass: "frontend-widget m-b-0",
                          attrs: {
                            articles: _vm.circular,
                            "view-more-link": "/notices"
                          }
                        })
                      : _c("empty-list", {
                          staticClass: "frontend-widget m-b-0",
                          attrs: {
                            title: "Latest Notices",
                            body: "No Notices",
                            cardTitleBg: "news-list-header"
                          }
                        })
                  ],
                  1
                )
              ])
            ])
          ])
        ]),
        _vm._v(" "),
        _vm.popup.length
          ? _c("div", { staticClass: "modal fade", attrs: { id: "myModal" } }, [
              _c("div", { staticClass: "modal-dialog" }, [
                _c("div", { staticClass: "modal-content" }, [
                  _c("div", { staticClass: "modal-header" }, [
                    _c("h4", { staticClass: "modal-title" }, [
                      _vm._v(_vm._s(_vm.popup[0].title))
                    ]),
                    _vm._v(" "),
                    _c(
                      "button",
                      {
                        staticClass: "close",
                        attrs: { type: "button", "data-dismiss": "modal" }
                      },
                      [_vm._v("×")]
                    )
                  ]),
                  _vm._v(" "),
                  _c("div", { staticClass: "modal-body text-center" }, [
                    _vm._v("ç\n            "),
                    _c("div", {
                      domProps: { innerHTML: _vm._s(_vm.popup[0].description) }
                    })
                  ]),
                  _vm._v(" "),
                  _vm._m(5)
                ])
              ])
            ])
          : _vm._e()
      ],
      2
    )
  ])
}
var staticRenderFns = [
  function() {
    var _vm = this
    var _h = _vm.$createElement
    var _c = _vm._self._c || _h
    return _c("div", { staticClass: "col-md-2 highlights" }, [
      _c("span", {}, [_vm._v("HIGHLIGHTS")])
    ])
  },
  function() {
    var _vm = this
    var _h = _vm.$createElement
    var _c = _vm._self._c || _h
    return _c(
      "a",
      {
        staticClass: "carousel-control-prev",
        attrs: { href: "#sliderCarousel", role: "button", "data-slide": "prev" }
      },
      [
        _c("span", {
          staticClass: "carousel-control-prev-icon",
          attrs: { "aria-hidden": "true" }
        }),
        _vm._v(" "),
        _c("span", { staticClass: "sr-only" }, [_vm._v("Previous")])
      ]
    )
  },
  function() {
    var _vm = this
    var _h = _vm.$createElement
    var _c = _vm._self._c || _h
    return _c(
      "a",
      {
        staticClass: "carousel-control-next",
        attrs: { href: "#sliderCarousel", role: "button", "data-slide": "next" }
      },
      [
        _c("span", {
          staticClass: "carousel-control-next-icon",
          attrs: { "aria-hidden": "true" }
        }),
        _vm._v(" "),
        _c("span", { staticClass: "sr-only" }, [_vm._v("Next")])
      ]
    )
  },
  function() {
    var _vm = this
    var _h = _vm.$createElement
    var _c = _vm._self._c || _h
    return _c("div", { staticClass: "row mb-4" }, [
      _c("div", { staticClass: "col-md-3" }, [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-3" }, [
            _c("i", { staticClass: "fa fa-trophy fa-3x" })
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "col-8" }, [
            _c("p", [
              _c("span", { staticClass: "font-weight-bold" }, [
                _vm._v("Achievements")
              ]),
              _vm._v(" "),
              _c("br"),
              _vm._v(" 15")
            ])
          ])
        ])
      ]),
      _vm._v(" "),
      _c("div", { staticClass: "col-md-3" }, [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-3" }, [
            _c("i", { staticClass: "fa fa-book-open fa-3x" })
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "col-8" }, [
            _c("p", [
              _c("span", { staticClass: "font-weight-bold" }, [
                _vm._v("Courses")
              ]),
              _vm._v(" "),
              _c("br"),
              _vm._v(" 20")
            ])
          ])
        ])
      ]),
      _vm._v(" "),
      _c("div", { staticClass: "col-md-3" }, [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-3" }, [
            _c("i", { staticClass: "fa fa-user fa-3x" })
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "col-8" }, [
            _c("p", [
              _c("span", { staticClass: "font-weight-bold" }, [
                _vm._v("Staffs")
              ]),
              _vm._v(" "),
              _c("br"),
              _vm._v(" 200")
            ])
          ])
        ])
      ]),
      _vm._v(" "),
      _c("div", { staticClass: "col-md-3" }, [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-3" }, [
            _c("i", { staticClass: "fa fa-user fa-3x" })
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "col-8" }, [
            _c("p", [
              _c("span", { staticClass: "font-weight-bold" }, [
                _vm._v("Students")
              ]),
              _vm._v(" "),
              _c("br"),
              _vm._v(" 2000")
            ])
          ])
        ])
      ])
    ])
  },
  function() {
    var _vm = this
    var _h = _vm.$createElement
    var _c = _vm._self._c || _h
    return _c("div", { staticClass: "col-md-8" }, [
      _c("iframe", {
        staticStyle: { border: "0" },
        attrs: {
          src:
            "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3531.366368834582!2d86.16455541438533!3d27.7368436308034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ebd10b1a9564ed%3A0xe924c5798cd940f8!2sBigu%20Polytechnic%20Institute!5e0!3m2!1sen!2snp!4v1607828366077!5m2!1sen!2snp",
          width: "100%",
          height: "390",
          frameborder: "0",
          allowfullscreen: "",
          "aria-hidden": "false",
          tabindex: "0"
        }
      })
    ])
  },
  function() {
    var _vm = this
    var _h = _vm.$createElement
    var _c = _vm._self._c || _h
    return _c("div", { staticClass: "modal-footer" }, [
      _c(
        "button",
        {
          staticClass: "btn btn-danger",
          attrs: { type: "button", "data-dismiss": "modal" }
        },
        [_vm._v("Close")]
      )
    ])
  }
]
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/empty-list.vue?vue&type=template&id=2a23e87c&":
/*!**********************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/empty-list.vue?vue&type=template&id=2a23e87c& ***!
  \**********************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { staticClass: "card widget articles-widget" }, [
    _c("div", { class: ["card-body", _vm.bodyClass] }, [
      _c(
        "h4",
        { class: ["card-title", _vm.cardTitleBg] },
        [[_vm._v(_vm._s(_vm.title))]],
        2
      ),
      _vm._v(" "),
      _c("a", { staticClass: "list-item" }, [
        _c("h5", [_vm._v(_vm._s(_vm.body))])
      ])
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/events-list.vue?vue&type=template&id=2cca4b64&":
/*!***********************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/events-list.vue?vue&type=template&id=2cca4b64& ***!
  \***********************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "div",
    { staticClass: "card widget events-widget" },
    [
      _c(
        "div",
        { class: ["card-body", _vm.bodyClass] },
        [
          _c(
            "h4",
            { staticClass: "card-title events-list-header" },
            [
              _vm._v(
                "\n            " +
                  _vm._s(_vm.trans("calendar.upcoming_events")) +
                  "\n            "
              ),
              _vm.viewMoreLink
                ? _c(
                    "router-link",
                    {
                      staticClass: "btn btn-default btn-sm",
                      attrs: { to: _vm.viewMoreLink }
                    },
                    [_vm._v(_vm._s(_vm.trans("general.view_more")))]
                  )
                : _vm._e()
            ],
            1
          ),
          _vm._v(" "),
          _vm._l(_vm.events, function(event) {
            return _c(
              "a",
              {
                staticClass: "list-item",
                on: {
                  click: function($event) {
                    $event.preventDefault()
                    return _vm.showEvent(event)
                  }
                }
              },
              [
                _c("h5", [_vm._v(_vm._s(event.title))]),
                _vm._v(" "),
                _c("div", { staticClass: "meta-data" }, [
                  _c("span", { staticClass: "type" }, [
                    _vm._v(_vm._s(event.event_type.name))
                  ]),
                  _vm._v(" "),
                  _c("span", { staticClass: "location" }, [
                    _c("i", { staticClass: "fas fa-map-marker-alt" }),
                    _vm._v(" " + _vm._s(event.venue))
                  ]),
                  _vm._v(" "),
                  _c(
                    "span",
                    { staticClass: "date" },
                    [
                      _c("i", { staticClass: "far fa-clock" }),
                      _vm._v(
                        " " + _vm._s(_vm._f("moment")(event.start_date)) + " "
                      ),
                      event.start_time
                        ? [
                            _vm._v(
                              _vm._s(_vm._f("momentTime")(event.start_time))
                            )
                          ]
                        : _vm._e(),
                      _vm._v(
                        " " +
                          _vm._s(_vm.trans("general.to")) +
                          " " +
                          _vm._s(_vm._f("moment")(event.end_date)) +
                          " "
                      ),
                      event.end_time
                        ? [_vm._v(_vm._s(_vm._f("momentTime")(event.end_time)))]
                        : _vm._e()
                    ],
                    2
                  )
                ])
              ]
            )
          })
        ],
        2
      ),
      _vm._v(" "),
      _vm.showEventModal
        ? _c("event-detail", {
            attrs: {
              uuid: _vm.showEventUuid,
              url: "/frontend/event/" + _vm.showEventUuid + "/detail"
            },
            on: {
              close: function($event) {
                _vm.showEventModal = false
              }
            }
          })
        : _vm._e()
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=template&id=6a65c3dc&":
/*!*****************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/featured-block-01.vue?vue&type=template&id=6a65c3dc& ***!
  \*****************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("ul", { staticClass: "list-group list-group-flush" }, [
    _c("li", { staticClass: "list-group-item light-grey" }, [
      _c("div", { staticClass: "row" }, [
        _c("div", { staticClass: "col-12" }, [
          _c("div", { staticClass: "media" }, [
            _c("i", {
              staticClass:
                "fas fa-arrow-right my-1 align-self-top mr-4 feature-icon"
            }),
            _vm._v(" "),
            _c("div", { staticClass: "media-body mr-4" }, [
              _c("h5", { staticClass: "mt-0 text-dark" }, [
                _vm._v(_vm._s(_vm.block.title))
              ]),
              _vm._v(" "),
              _c(
                "p",
                { staticClass: "text-justify" },
                [
                  _vm._v(
                    "\n              " +
                      _vm._s(_vm.block.body) +
                      "\n              "
                  ),
                  _vm.block.menu
                    ? _c(
                        "router-link",
                        {
                          attrs: {
                            to:
                              _vm.block.menu.options &&
                              _vm.block.menu.options.is_default
                                ? "/" + _vm.block.menu.slug
                                : "/page/" + _vm.block.menu.slug
                          }
                        },
                        [
                          _vm._v(
                            "\n                " +
                              _vm._s(_vm.trans("general.view_more")) +
                              "\n              "
                          )
                        ]
                      )
                    : _vm._e(),
                  _vm._v(" "),
                  _vm.block.url
                    ? _c(
                        "a",
                        { attrs: { href: _vm.block.url, target: "_blank" } },
                        [_vm._v(_vm._s(_vm.trans("general.view_more")))]
                      )
                    : _vm._e()
                ],
                1
              )
            ])
          ])
        ])
      ])
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block.vue?vue&type=template&id=370d5a8c&":
/*!**************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/featured-block.vue?vue&type=template&id=370d5a8c& ***!
  \**************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { staticClass: "card featured-block" }, [
    _c("div", { staticClass: "featured" }, [
      _vm.block.featured_image
        ? _c("img", {
            attrs: { src: "/" + _vm.block.featured_image, alt: _vm.block.title }
          })
        : _c("i", { staticClass: "fas fa-image" })
    ]),
    _vm._v(" "),
    _c(
      "div",
      { staticClass: "card-body p-4" },
      [
        _c("h3", { staticClass: "card-title" }, [
          _vm._v(_vm._s(_vm.block.title))
        ]),
        _vm._v(" "),
        _c("p", [_vm._v(_vm._s(_vm.block.body))]),
        _vm._v(" "),
        _vm.block.menu
          ? _c(
              "router-link",
              {
                staticClass: "btn btn-danger",
                attrs: {
                  to:
                    _vm.block.menu.options && _vm.block.menu.options.is_default
                      ? "/" + _vm.block.menu.slug
                      : "/page/" + _vm.block.menu.slug
                }
              },
              [_vm._v(_vm._s(_vm.trans("general.view_more")))]
            )
          : _vm._e(),
        _vm._v(" "),
        _vm.block.url
          ? _c(
              "a",
              {
                staticClass: "btn btn-danger",
                attrs: { href: _vm.block.url, target: "_blank" }
              },
              [_vm._v(_vm._s(_vm.trans("general.view_more")))]
            )
          : _vm._e()
      ],
      1
    )
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-blog-list.vue?vue&type=template&id=dfe72cfe&":
/*!****************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/latest-blog-list.vue?vue&type=template&id=dfe72cfe& ***!
  \****************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "div",
    { staticClass: "card widget articles-widget" },
    [
      _c(
        "div",
        { class: ["card-body", _vm.bodyClass] },
        [
          _c(
            "h4",
            { staticClass: "card-title" },
            [
              [_vm._v("Latest Blog")],
              _vm._v(" "),
              _vm.viewMoreLink
                ? _c(
                    "router-link",
                    {
                      staticClass: "btn btn-default btn-sm",
                      attrs: { to: _vm.viewMoreLink }
                    },
                    [_vm._v(_vm._s(_vm.trans("general.view_more")))]
                  )
                : _vm._e()
            ],
            2
          ),
          _vm._v(" "),
          _vm._l(_vm.articles, function(article) {
            return _c(
              "a",
              {
                staticClass: "list-item",
                on: {
                  click: function($event) {
                    $event.preventDefault()
                    return _vm.showArticle(article)
                  }
                }
              },
              [
                _c("h5", [_vm._v(_vm._s(article.title))]),
                _vm._v(" "),
                _c("div", { staticClass: "meta-data" }, [
                  _c("span", { staticClass: "type" }, [
                    _vm._v(_vm._s(article.article_type.name))
                  ]),
                  _vm._v(" "),
                  _c("span", { staticClass: "date" }, [
                    _c("i", { staticClass: "far fa-clock" }),
                    _vm._v(
                      " " + _vm._s(_vm._f("moment")(article.date_of_article))
                    )
                  ])
                ])
              ]
            )
          })
        ],
        2
      ),
      _vm._v(" "),
      _vm.showArticleModal
        ? _c("article-detail", {
            attrs: {
              uuid: _vm.showArticleUuid,
              url: "/frontend/article/" + _vm.showArticleUuid + "/detail"
            },
            on: {
              close: function($event) {
                _vm.showArticleModal = false
              }
            }
          })
        : _vm._e()
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-circular-list.vue?vue&type=template&id=7ba15f24&":
/*!********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/latest-circular-list.vue?vue&type=template&id=7ba15f24& ***!
  \********************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "div",
    { staticClass: "card widget articles-widget" },
    [
      _c(
        "div",
        { class: ["card-body", _vm.bodyClass] },
        [
          _c(
            "h4",
            { staticClass: "card-title news-list-header" },
            [
              [_vm._v("Latest Notices")],
              _vm._v(" "),
              _vm.viewMoreLink
                ? _c(
                    "router-link",
                    {
                      staticClass: "btn btn-default btn-sm",
                      attrs: { to: _vm.viewMoreLink }
                    },
                    [_vm._v(_vm._s(_vm.trans("general.view_more")))]
                  )
                : _vm._e()
            ],
            2
          ),
          _vm._v(" "),
          _vm._l(_vm.articles, function(article) {
            return _c(
              "a",
              {
                staticClass: "list-item",
                on: {
                  click: function($event) {
                    $event.preventDefault()
                    return _vm.showArticle(article)
                  }
                }
              },
              [
                _c("h5", [_vm._v(_vm._s(article.title))]),
                _vm._v(" "),
                _c("div", { staticClass: "meta-data" }, [
                  _c("span", { staticClass: "type" }, [_vm._v("Notice")]),
                  _vm._v(" "),
                  _c("span", { staticClass: "date" }, [
                    _c("i", { staticClass: "far fa-clock" }),
                    _vm._v(
                      " " + _vm._s(_vm._f("moment")(article.date_of_article))
                    )
                  ])
                ])
              ]
            )
          })
        ],
        2
      ),
      _vm._v(" "),
      _vm.showArticleModal
        ? _c("article-detail", {
            attrs: {
              uuid: _vm.showArticleUuid,
              url: "/frontend/article/" + _vm.showArticleUuid + "/detail"
            },
            on: {
              close: function($event) {
                _vm.showArticleModal = false
              }
            }
          })
        : _vm._e()
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-news-list.vue?vue&type=template&id=ba27d520&":
/*!****************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/latest-news-list.vue?vue&type=template&id=ba27d520& ***!
  \****************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "div",
    { staticClass: "card widget articles-widget" },
    [
      _c(
        "div",
        { class: ["card-body", _vm.bodyClass] },
        [
          _c(
            "h4",
            { staticClass: "card-title news-list-header" },
            [
              [_vm._v("Latest News")],
              _vm._v(" "),
              _vm.viewMoreLink
                ? _c(
                    "router-link",
                    {
                      staticClass: "btn btn-default btn-sm",
                      attrs: { to: _vm.viewMoreLink }
                    },
                    [_vm._v(_vm._s(_vm.trans("general.view_more")))]
                  )
                : _vm._e()
            ],
            2
          ),
          _vm._v(" "),
          _vm._l(_vm.articles, function(article) {
            return _c(
              "a",
              {
                staticClass: "list-item",
                on: {
                  click: function($event) {
                    $event.preventDefault()
                    return _vm.showArticle(article)
                  }
                }
              },
              [
                _c("h5", [_vm._v(_vm._s(article.title))]),
                _vm._v(" "),
                _c("div", { staticClass: "meta-data" }, [
                  _c("span", { staticClass: "type" }, [
                    _vm._v(_vm._s(article.article_type.name))
                  ]),
                  _vm._v(" "),
                  _c("span", { staticClass: "date" }, [
                    _c("i", { staticClass: "far fa-clock" }),
                    _vm._v(
                      " " + _vm._s(_vm._f("moment")(article.date_of_article))
                    )
                  ])
                ])
              ]
            )
          })
        ],
        2
      ),
      _vm._v(" "),
      _vm.showArticleModal
        ? _c("article-detail", {
            attrs: {
              uuid: _vm.showArticleUuid,
              url: "/frontend/article/" + _vm.showArticleUuid + "/detail"
            },
            on: {
              close: function($event) {
                _vm.showArticleModal = false
              }
            }
          })
        : _vm._e()
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=template&id=34926a48&scoped=true&":
/*!***********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/widgets/principle-message-block.vue?vue&type=template&id=34926a48&scoped=true& ***!
  \***********************************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { staticClass: "card featured-block" }, [
    _c(
      "div",
      {
        staticClass: "card-body p-4",
        staticStyle: { border: "1px solid grey" }
      },
      [
        _c("h3", { staticClass: "card-title" }, [
          _vm._v(_vm._s(_vm.block.title))
        ]),
        _vm._v(" "),
        _c("div", { staticClass: "line" }),
        _vm._v(" "),
        _c("div", { staticClass: "featured mb-3" }, [
          _vm.block.featured_image
            ? _c("img", {
                staticStyle: { width: "auto" },
                attrs: {
                  src: "/" + _vm.block.featured_image,
                  alt: _vm.block.title
                }
              })
            : _c("i", { staticClass: "fas fa-image" })
        ]),
        _vm._v(" "),
        _c(
          "p",
          { staticStyle: { "text-align": "justify" } },
          [
            _vm._v(_vm._s(_vm.block.body) + "\n    "),
            _vm.block.menu
              ? _c(
                  "router-link",
                  {
                    attrs: {
                      to:
                        _vm.block.menu.options &&
                        _vm.block.menu.options.is_default
                          ? "/" + _vm.block.menu.slug
                          : "/page/" + _vm.block.menu.slug
                    }
                  },
                  [_vm._v("\n      Read More\n    ")]
                )
              : _vm._e()
          ],
          1
        ),
        _vm._v(" "),
        _vm.block.url
          ? _c("a", { attrs: { href: _vm.block.url, target: "_blank" } }, [
              _vm._v("Read More")
            ])
          : _vm._e()
      ]
    )
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/pages/partials/homepage-row-blocks.vue":
/*!*******************************************************************!*\
  !*** ./resources/js/views/pages/partials/homepage-row-blocks.vue ***!
  \*******************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _homepage_row_blocks_vue_vue_type_template_id_c270cb76___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./homepage-row-blocks.vue?vue&type=template&id=c270cb76& */ "./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=template&id=c270cb76&");
/* harmony import */ var _homepage_row_blocks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./homepage-row-blocks.vue?vue&type=script&lang=js& */ "./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _homepage_row_blocks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _homepage_row_blocks_vue_vue_type_template_id_c270cb76___WEBPACK_IMPORTED_MODULE_0__["render"],
  _homepage_row_blocks_vue_vue_type_template_id_c270cb76___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/pages/partials/homepage-row-blocks.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=script&lang=js&":
/*!********************************************************************************************!*\
  !*** ./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_blocks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./homepage-row-blocks.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_blocks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=template&id=c270cb76&":
/*!**************************************************************************************************!*\
  !*** ./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=template&id=c270cb76& ***!
  \**************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_blocks_vue_vue_type_template_id_c270cb76___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./homepage-row-blocks.vue?vue&type=template&id=c270cb76& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-blocks.vue?vue&type=template&id=c270cb76&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_blocks_vue_vue_type_template_id_c270cb76___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_blocks_vue_vue_type_template_id_c270cb76___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/views/pages/partials/homepage-row-features.vue":
/*!*********************************************************************!*\
  !*** ./resources/js/views/pages/partials/homepage-row-features.vue ***!
  \*********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _homepage_row_features_vue_vue_type_template_id_68666088___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./homepage-row-features.vue?vue&type=template&id=68666088& */ "./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=template&id=68666088&");
/* harmony import */ var _homepage_row_features_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./homepage-row-features.vue?vue&type=script&lang=js& */ "./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _homepage_row_features_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _homepage_row_features_vue_vue_type_template_id_68666088___WEBPACK_IMPORTED_MODULE_0__["render"],
  _homepage_row_features_vue_vue_type_template_id_68666088___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/pages/partials/homepage-row-features.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=script&lang=js&":
/*!**********************************************************************************************!*\
  !*** ./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=script&lang=js& ***!
  \**********************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_features_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./homepage-row-features.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_features_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=template&id=68666088&":
/*!****************************************************************************************************!*\
  !*** ./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=template&id=68666088& ***!
  \****************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_features_vue_vue_type_template_id_68666088___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./homepage-row-features.vue?vue&type=template&id=68666088& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/homepage-row-features.vue?vue&type=template&id=68666088&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_features_vue_vue_type_template_id_68666088___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_homepage_row_features_vue_vue_type_template_id_68666088___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/views/pages/partials/principle-message.vue":
/*!*****************************************************************!*\
  !*** ./resources/js/views/pages/partials/principle-message.vue ***!
  \*****************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _principle_message_vue_vue_type_template_id_c200f5ba_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./principle-message.vue?vue&type=template&id=c200f5ba&scoped=true& */ "./resources/js/views/pages/partials/principle-message.vue?vue&type=template&id=c200f5ba&scoped=true&");
/* harmony import */ var _principle_message_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./principle-message.vue?vue&type=script&lang=js& */ "./resources/js/views/pages/partials/principle-message.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _principle_message_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _principle_message_vue_vue_type_template_id_c200f5ba_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"],
  _principle_message_vue_vue_type_template_id_c200f5ba_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  "c200f5ba",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/pages/partials/principle-message.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/pages/partials/principle-message.vue?vue&type=script&lang=js&":
/*!******************************************************************************************!*\
  !*** ./resources/js/views/pages/partials/principle-message.vue?vue&type=script&lang=js& ***!
  \******************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./principle-message.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/principle-message.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/pages/partials/principle-message.vue?vue&type=template&id=c200f5ba&scoped=true&":
/*!************************************************************************************************************!*\
  !*** ./resources/js/views/pages/partials/principle-message.vue?vue&type=template&id=c200f5ba&scoped=true& ***!
  \************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_vue_vue_type_template_id_c200f5ba_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./principle-message.vue?vue&type=template&id=c200f5ba&scoped=true& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/partials/principle-message.vue?vue&type=template&id=c200f5ba&scoped=true&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_vue_vue_type_template_id_c200f5ba_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_vue_vue_type_template_id_c200f5ba_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/views/pages/themes/default/home.vue":
/*!**********************************************************!*\
  !*** ./resources/js/views/pages/themes/default/home.vue ***!
  \**********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _home_vue_vue_type_template_id_37f32bd8___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./home.vue?vue&type=template&id=37f32bd8& */ "./resources/js/views/pages/themes/default/home.vue?vue&type=template&id=37f32bd8&");
/* harmony import */ var _home_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./home.vue?vue&type=script&lang=js& */ "./resources/js/views/pages/themes/default/home.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _home_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./home.vue?vue&type=style&index=0&lang=scss& */ "./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _home_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _home_vue_vue_type_template_id_37f32bd8___WEBPACK_IMPORTED_MODULE_0__["render"],
  _home_vue_vue_type_template_id_37f32bd8___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/pages/themes/default/home.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/pages/themes/default/home.vue?vue&type=script&lang=js&":
/*!***********************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/home.vue?vue&type=script&lang=js& ***!
  \***********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./home.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss&":
/*!********************************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss& ***!
  \********************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/style-loader!../../../../../../node_modules/css-loader!../../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../../node_modules/postcss-loader/src??ref--14-2!../../../../../../node_modules/sass-loader/dist/cjs.js??ref--14-3!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./home.vue?vue&type=style&index=0&lang=scss& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=style&index=0&lang=scss&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/views/pages/themes/default/home.vue?vue&type=template&id=37f32bd8&":
/*!*****************************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/home.vue?vue&type=template&id=37f32bd8& ***!
  \*****************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_template_id_37f32bd8___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./home.vue?vue&type=template&id=37f32bd8& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/home.vue?vue&type=template&id=37f32bd8&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_template_id_37f32bd8___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_home_vue_vue_type_template_id_37f32bd8___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/empty-list.vue":
/*!*********************************************!*\
  !*** ./resources/js/widgets/empty-list.vue ***!
  \*********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _empty_list_vue_vue_type_template_id_2a23e87c___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./empty-list.vue?vue&type=template&id=2a23e87c& */ "./resources/js/widgets/empty-list.vue?vue&type=template&id=2a23e87c&");
/* harmony import */ var _empty_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./empty-list.vue?vue&type=script&lang=js& */ "./resources/js/widgets/empty-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _empty_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _empty_list_vue_vue_type_template_id_2a23e87c___WEBPACK_IMPORTED_MODULE_0__["render"],
  _empty_list_vue_vue_type_template_id_2a23e87c___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/empty-list.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/empty-list.vue?vue&type=script&lang=js&":
/*!**********************************************************************!*\
  !*** ./resources/js/widgets/empty-list.vue?vue&type=script&lang=js& ***!
  \**********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_empty_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./empty-list.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/empty-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_empty_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/empty-list.vue?vue&type=template&id=2a23e87c&":
/*!****************************************************************************!*\
  !*** ./resources/js/widgets/empty-list.vue?vue&type=template&id=2a23e87c& ***!
  \****************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_empty_list_vue_vue_type_template_id_2a23e87c___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./empty-list.vue?vue&type=template&id=2a23e87c& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/empty-list.vue?vue&type=template&id=2a23e87c&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_empty_list_vue_vue_type_template_id_2a23e87c___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_empty_list_vue_vue_type_template_id_2a23e87c___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/events-list.vue":
/*!**********************************************!*\
  !*** ./resources/js/widgets/events-list.vue ***!
  \**********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _events_list_vue_vue_type_template_id_2cca4b64___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./events-list.vue?vue&type=template&id=2cca4b64& */ "./resources/js/widgets/events-list.vue?vue&type=template&id=2cca4b64&");
/* harmony import */ var _events_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./events-list.vue?vue&type=script&lang=js& */ "./resources/js/widgets/events-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _events_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _events_list_vue_vue_type_template_id_2cca4b64___WEBPACK_IMPORTED_MODULE_0__["render"],
  _events_list_vue_vue_type_template_id_2cca4b64___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/events-list.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/events-list.vue?vue&type=script&lang=js&":
/*!***********************************************************************!*\
  !*** ./resources/js/widgets/events-list.vue?vue&type=script&lang=js& ***!
  \***********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_events_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./events-list.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/events-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_events_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/events-list.vue?vue&type=template&id=2cca4b64&":
/*!*****************************************************************************!*\
  !*** ./resources/js/widgets/events-list.vue?vue&type=template&id=2cca4b64& ***!
  \*****************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_events_list_vue_vue_type_template_id_2cca4b64___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./events-list.vue?vue&type=template&id=2cca4b64& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/events-list.vue?vue&type=template&id=2cca4b64&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_events_list_vue_vue_type_template_id_2cca4b64___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_events_list_vue_vue_type_template_id_2cca4b64___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/featured-block-01.vue":
/*!****************************************************!*\
  !*** ./resources/js/widgets/featured-block-01.vue ***!
  \****************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _featured_block_01_vue_vue_type_template_id_6a65c3dc___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./featured-block-01.vue?vue&type=template&id=6a65c3dc& */ "./resources/js/widgets/featured-block-01.vue?vue&type=template&id=6a65c3dc&");
/* harmony import */ var _featured_block_01_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./featured-block-01.vue?vue&type=script&lang=js& */ "./resources/js/widgets/featured-block-01.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _featured_block_01_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./featured-block-01.vue?vue&type=style&index=0&lang=css& */ "./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _featured_block_01_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _featured_block_01_vue_vue_type_template_id_6a65c3dc___WEBPACK_IMPORTED_MODULE_0__["render"],
  _featured_block_01_vue_vue_type_template_id_6a65c3dc___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/featured-block-01.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/featured-block-01.vue?vue&type=script&lang=js&":
/*!*****************************************************************************!*\
  !*** ./resources/js/widgets/featured-block-01.vue?vue&type=script&lang=js& ***!
  \*****************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./featured-block-01.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css&":
/*!*************************************************************************************!*\
  !*** ./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css& ***!
  \*************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/style-loader!../../../node_modules/css-loader??ref--13-1!../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../node_modules/postcss-loader/src??ref--13-2!../../../node_modules/vue-loader/lib??vue-loader-options!./featured-block-01.vue?vue&type=style&index=0&lang=css& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/widgets/featured-block-01.vue?vue&type=template&id=6a65c3dc&":
/*!***********************************************************************************!*\
  !*** ./resources/js/widgets/featured-block-01.vue?vue&type=template&id=6a65c3dc& ***!
  \***********************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_template_id_6a65c3dc___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./featured-block-01.vue?vue&type=template&id=6a65c3dc& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block-01.vue?vue&type=template&id=6a65c3dc&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_template_id_6a65c3dc___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_01_vue_vue_type_template_id_6a65c3dc___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/featured-block.vue":
/*!*************************************************!*\
  !*** ./resources/js/widgets/featured-block.vue ***!
  \*************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _featured_block_vue_vue_type_template_id_370d5a8c___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./featured-block.vue?vue&type=template&id=370d5a8c& */ "./resources/js/widgets/featured-block.vue?vue&type=template&id=370d5a8c&");
/* harmony import */ var _featured_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./featured-block.vue?vue&type=script&lang=js& */ "./resources/js/widgets/featured-block.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _featured_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _featured_block_vue_vue_type_template_id_370d5a8c___WEBPACK_IMPORTED_MODULE_0__["render"],
  _featured_block_vue_vue_type_template_id_370d5a8c___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/featured-block.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/featured-block.vue?vue&type=script&lang=js&":
/*!**************************************************************************!*\
  !*** ./resources/js/widgets/featured-block.vue?vue&type=script&lang=js& ***!
  \**************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./featured-block.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/featured-block.vue?vue&type=template&id=370d5a8c&":
/*!********************************************************************************!*\
  !*** ./resources/js/widgets/featured-block.vue?vue&type=template&id=370d5a8c& ***!
  \********************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_vue_vue_type_template_id_370d5a8c___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./featured-block.vue?vue&type=template&id=370d5a8c& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/featured-block.vue?vue&type=template&id=370d5a8c&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_vue_vue_type_template_id_370d5a8c___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_featured_block_vue_vue_type_template_id_370d5a8c___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/latest-blog-list.vue":
/*!***************************************************!*\
  !*** ./resources/js/widgets/latest-blog-list.vue ***!
  \***************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _latest_blog_list_vue_vue_type_template_id_dfe72cfe___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./latest-blog-list.vue?vue&type=template&id=dfe72cfe& */ "./resources/js/widgets/latest-blog-list.vue?vue&type=template&id=dfe72cfe&");
/* harmony import */ var _latest_blog_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./latest-blog-list.vue?vue&type=script&lang=js& */ "./resources/js/widgets/latest-blog-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _latest_blog_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _latest_blog_list_vue_vue_type_template_id_dfe72cfe___WEBPACK_IMPORTED_MODULE_0__["render"],
  _latest_blog_list_vue_vue_type_template_id_dfe72cfe___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/latest-blog-list.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/latest-blog-list.vue?vue&type=script&lang=js&":
/*!****************************************************************************!*\
  !*** ./resources/js/widgets/latest-blog-list.vue?vue&type=script&lang=js& ***!
  \****************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_blog_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./latest-blog-list.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-blog-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_blog_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/latest-blog-list.vue?vue&type=template&id=dfe72cfe&":
/*!**********************************************************************************!*\
  !*** ./resources/js/widgets/latest-blog-list.vue?vue&type=template&id=dfe72cfe& ***!
  \**********************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_blog_list_vue_vue_type_template_id_dfe72cfe___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./latest-blog-list.vue?vue&type=template&id=dfe72cfe& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-blog-list.vue?vue&type=template&id=dfe72cfe&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_blog_list_vue_vue_type_template_id_dfe72cfe___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_blog_list_vue_vue_type_template_id_dfe72cfe___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/latest-circular-list.vue":
/*!*******************************************************!*\
  !*** ./resources/js/widgets/latest-circular-list.vue ***!
  \*******************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _latest_circular_list_vue_vue_type_template_id_7ba15f24___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./latest-circular-list.vue?vue&type=template&id=7ba15f24& */ "./resources/js/widgets/latest-circular-list.vue?vue&type=template&id=7ba15f24&");
/* harmony import */ var _latest_circular_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./latest-circular-list.vue?vue&type=script&lang=js& */ "./resources/js/widgets/latest-circular-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _latest_circular_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _latest_circular_list_vue_vue_type_template_id_7ba15f24___WEBPACK_IMPORTED_MODULE_0__["render"],
  _latest_circular_list_vue_vue_type_template_id_7ba15f24___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/latest-circular-list.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/latest-circular-list.vue?vue&type=script&lang=js&":
/*!********************************************************************************!*\
  !*** ./resources/js/widgets/latest-circular-list.vue?vue&type=script&lang=js& ***!
  \********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_circular_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./latest-circular-list.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-circular-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_circular_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/latest-circular-list.vue?vue&type=template&id=7ba15f24&":
/*!**************************************************************************************!*\
  !*** ./resources/js/widgets/latest-circular-list.vue?vue&type=template&id=7ba15f24& ***!
  \**************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_circular_list_vue_vue_type_template_id_7ba15f24___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./latest-circular-list.vue?vue&type=template&id=7ba15f24& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-circular-list.vue?vue&type=template&id=7ba15f24&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_circular_list_vue_vue_type_template_id_7ba15f24___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_circular_list_vue_vue_type_template_id_7ba15f24___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/latest-news-list.vue":
/*!***************************************************!*\
  !*** ./resources/js/widgets/latest-news-list.vue ***!
  \***************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _latest_news_list_vue_vue_type_template_id_ba27d520___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./latest-news-list.vue?vue&type=template&id=ba27d520& */ "./resources/js/widgets/latest-news-list.vue?vue&type=template&id=ba27d520&");
/* harmony import */ var _latest_news_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./latest-news-list.vue?vue&type=script&lang=js& */ "./resources/js/widgets/latest-news-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _latest_news_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _latest_news_list_vue_vue_type_template_id_ba27d520___WEBPACK_IMPORTED_MODULE_0__["render"],
  _latest_news_list_vue_vue_type_template_id_ba27d520___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/latest-news-list.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/latest-news-list.vue?vue&type=script&lang=js&":
/*!****************************************************************************!*\
  !*** ./resources/js/widgets/latest-news-list.vue?vue&type=script&lang=js& ***!
  \****************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_news_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./latest-news-list.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-news-list.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_news_list_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/latest-news-list.vue?vue&type=template&id=ba27d520&":
/*!**********************************************************************************!*\
  !*** ./resources/js/widgets/latest-news-list.vue?vue&type=template&id=ba27d520& ***!
  \**********************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_news_list_vue_vue_type_template_id_ba27d520___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./latest-news-list.vue?vue&type=template&id=ba27d520& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/latest-news-list.vue?vue&type=template&id=ba27d520&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_news_list_vue_vue_type_template_id_ba27d520___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_latest_news_list_vue_vue_type_template_id_ba27d520___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/widgets/principle-message-block.vue":
/*!**********************************************************!*\
  !*** ./resources/js/widgets/principle-message-block.vue ***!
  \**********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _principle_message_block_vue_vue_type_template_id_34926a48_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./principle-message-block.vue?vue&type=template&id=34926a48&scoped=true& */ "./resources/js/widgets/principle-message-block.vue?vue&type=template&id=34926a48&scoped=true&");
/* harmony import */ var _principle_message_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./principle-message-block.vue?vue&type=script&lang=js& */ "./resources/js/widgets/principle-message-block.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _principle_message_block_vue_vue_type_style_index_0_id_34926a48_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css& */ "./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _principle_message_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _principle_message_block_vue_vue_type_template_id_34926a48_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"],
  _principle_message_block_vue_vue_type_template_id_34926a48_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  "34926a48",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/widgets/principle-message-block.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/widgets/principle-message-block.vue?vue&type=script&lang=js&":
/*!***********************************************************************************!*\
  !*** ./resources/js/widgets/principle-message-block.vue?vue&type=script&lang=js& ***!
  \***********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/babel-loader/lib??ref--4-0!../../../node_modules/vue-loader/lib??vue-loader-options!./principle-message-block.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css&":
/*!*******************************************************************************************************************!*\
  !*** ./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css& ***!
  \*******************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_style_index_0_id_34926a48_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/style-loader!../../../node_modules/css-loader??ref--13-1!../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../node_modules/postcss-loader/src??ref--13-2!../../../node_modules/vue-loader/lib??vue-loader-options!./principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=style&index=0&id=34926a48&scoped=true&lang=css&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_style_index_0_id_34926a48_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_style_index_0_id_34926a48_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_style_index_0_id_34926a48_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_style_index_0_id_34926a48_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_style_index_0_id_34926a48_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/widgets/principle-message-block.vue?vue&type=template&id=34926a48&scoped=true&":
/*!*****************************************************************************************************!*\
  !*** ./resources/js/widgets/principle-message-block.vue?vue&type=template&id=34926a48&scoped=true& ***!
  \*****************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_template_id_34926a48_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../node_modules/vue-loader/lib??vue-loader-options!./principle-message-block.vue?vue&type=template&id=34926a48&scoped=true& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/widgets/principle-message-block.vue?vue&type=template&id=34926a48&scoped=true&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_template_id_34926a48_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_principle_message_block_vue_vue_type_template_id_34926a48_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=home.js.map?id=8c89bacdffd2c40da4f2