(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/post/feed/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/post/feed/index.vue?vue&type=script&lang=js&":
/*!*********************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/post/feed/index.vue?vue&type=script&lang=js& ***!
  \*********************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _article_show__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../article/show */ "./resources/js/views/post/article/show.vue");
/* harmony import */ var _js_widgets_article_card__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @js/widgets/article-card */ "./resources/js/widgets/article-card.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    ArticleDetail: _article_show__WEBPACK_IMPORTED_MODULE_0__["default"],
    ArticleCard: _js_widgets_article_card__WEBPACK_IMPORTED_MODULE_1__["default"]
  },
  data: function data() {
    return {
      articles: {
        total: 0,
        data: []
      },
      filter: {
        sort_by: 'date_of_article',
        order: 'desc',
        keyword: '',
        article_type_id: [],
        date_of_article_start_date: '',
        date_of_article_end_date: '',
        page_length: helper.getConfig('page_length')
      },
      orderByOptions: [{
        value: 'date_of_article',
        translation: i18n.post.date_of_article
      }, {
        value: 'title',
        translation: i18n.post.article_title
      }],
      article_types: [],
      selected_article_types: null,
      help_topic: '',
      showUuid: '',
      showModal: false
    };
  },
  mounted: function mounted() {
    if (!helper.hasPermission('list-article')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    this.getArticles();
  },
  methods: {
    hasPermission: function hasPermission(permission) {
      return helper.hasPermission(permission);
    },
    showArticle: function showArticle(article) {
      this.showUuid = article.uuid;
      this.showModal = true;
    },
    getArticles: function getArticles(page) {
      var _this = this;

      var loader = this.$loading.show();

      if (typeof page !== 'number') {
        page = 1;
      }

      this.filter.date_of_article_start_date = helper.toDate(this.filter.date_of_article_start_date);
      this.filter.date_of_end_start_date = helper.toDate(this.filter.date_of_end_start_date);
      var url = helper.getFilterURL(this.filter);
      axios.get('/api/article?page=' + page + url).then(function (response) {
        _this.articles = response.articles;
        _this.article_types = response.filters.article_types;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    getConfig: function getConfig(config) {
      return helper.getConfig(config);
    },
    onArticleTypeSelect: function onArticleTypeSelect(selectedOption) {
      this.filter.article_type_id.push(selectedOption.id);
    },
    onArticleTypeRemove: function onArticleTypeRemove(removedOption) {
      this.filter.article_type_id.splice(this.filter.article_type_id.indexOf(removedOption.id), 1);
    }
  },
  filters: {
    moment: function moment(date) {
      return helper.formatDate(date);
    },
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    }
  },
  watch: {
    'filter.sort_by': function filterSort_by(val) {
      this.getArticles();
    },
    'filter.order': function filterOrder(val) {
      this.getArticles();
    },
    'filter.page_length': function filterPage_length(val) {
      this.getArticles();
    }
  },
  computed: {
    authToken: function authToken() {
      return helper.getAuthToken();
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/post/feed/index.vue?vue&type=template&id=5c34e541&":
/*!*************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/post/feed/index.vue?vue&type=template&id=5c34e541& ***!
  \*************************************************************************************************************************************************************************************************************/
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
    [
      _c("div", { staticClass: "page-titles" }, [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-12 col-sm-6" }, [
            _c("h3", { staticClass: "text-themecolor" }, [
              _vm._v(
                _vm._s(_vm.trans("post.feed")) + " \n                    "
              ),
              _vm.articles.total
                ? _c(
                    "span",
                    { staticClass: "card-subtitle d-none d-sm-inline" },
                    [
                      _vm._v(
                        _vm._s(
                          _vm.trans("general.total_result_found", {
                            count: _vm.articles.total,
                            from: _vm.articles.from,
                            to: _vm.articles.to
                          })
                        )
                      )
                    ]
                  )
                : _c(
                    "span",
                    { staticClass: "card-subtitle d-none d-sm-inline" },
                    [_vm._v(_vm._s(_vm.trans("general.no_result_found")))]
                  )
            ])
          ])
        ])
      ]),
      _vm._v(" "),
      _c(
        "div",
        { staticClass: "container-fluid container-body" },
        [
          _vm.articles.total
            ? _c(
                "div",
                { staticClass: "article-feed card-columns" },
                _vm._l(_vm.articles.data, function(article) {
                  return _c(
                    "div",
                    {
                      staticClass: "article-item",
                      on: {
                        click: function($event) {
                          return _vm.showArticle(article)
                        }
                      }
                    },
                    [_c("article-card", { attrs: { article: article } })],
                    1
                  )
                }),
                0
              )
            : _vm._e(),
          _vm._v(" "),
          _c("pagination-record", {
            attrs: {
              "page-length": _vm.filter.page_length,
              records: _vm.articles
            },
            on: {
              "update:pageLength": function($event) {
                return _vm.$set(_vm.filter, "page_length", $event)
              },
              "update:page-length": function($event) {
                return _vm.$set(_vm.filter, "page_length", $event)
              },
              updateRecords: _vm.getArticles
            }
          })
        ],
        1
      ),
      _vm._v(" "),
      _vm.showModal
        ? _c("article-detail", {
            attrs: { uuid: _vm.showUuid },
            on: {
              close: function($event) {
                _vm.showModal = false
              }
            }
          })
        : _vm._e(),
      _vm._v(" "),
      _c("right-panel", { attrs: { topic: _vm.help_topic } })
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/post/feed/index.vue":
/*!************************************************!*\
  !*** ./resources/js/views/post/feed/index.vue ***!
  \************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_5c34e541___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=5c34e541& */ "./resources/js/views/post/feed/index.vue?vue&type=template&id=5c34e541&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/post/feed/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_5c34e541___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_5c34e541___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/post/feed/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/post/feed/index.vue?vue&type=script&lang=js&":
/*!*************************************************************************!*\
  !*** ./resources/js/views/post/feed/index.vue?vue&type=script&lang=js& ***!
  \*************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/post/feed/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/post/feed/index.vue?vue&type=template&id=5c34e541&":
/*!*******************************************************************************!*\
  !*** ./resources/js/views/post/feed/index.vue?vue&type=template&id=5c34e541& ***!
  \*******************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_5c34e541___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=5c34e541& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/post/feed/index.vue?vue&type=template&id=5c34e541&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_5c34e541___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_5c34e541___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=7a74549baac245b853c4