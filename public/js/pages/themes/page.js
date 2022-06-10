(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/pages/themes/page"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/page.vue?vue&type=script&lang=js&":
/*!*******************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/page.vue?vue&type=script&lang=js& ***!
  \*******************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _views_pages_partials_row_blocks__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @views/pages/partials/row-blocks */ "./resources/js/views/pages/partials/row-blocks.vue");
/* harmony import */ var _views_pages_partials_row_articles__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @views/pages/partials/row-articles */ "./resources/js/views/pages/partials/row-articles.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    RowBlocks: _views_pages_partials_row_blocks__WEBPACK_IMPORTED_MODULE_0__["default"],
    RowArticles: _views_pages_partials_row_articles__WEBPACK_IMPORTED_MODULE_1__["default"]
  },
  data: function data() {
    return {
      slug: this.$route.params.page,
      page: {},
      attachments: [],
      blocks: [],
      articles: {}
    };
  },
  mounted: function mounted() {
    this.getData();
    helper.showDemoNotification(['frontend_custom']);
  },
  methods: {
    getData: function getData() {
      var _this = this;

      var loader = this.$loading.show();
      axios.get('/api/frontend/page/' + this.$route.params.page + '/content').then(function (response) {
        _this.page = response.page;
        _this.attachments = response.attachments;
        _this.blocks = response.blocks;
        _this.articles = response.articles;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
        if (error.response.status == 422) _this.$router.push('/');
      });
    },
    getConfig: function getConfig(config) {
      return helper.getConfig(config);
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
  computed: {
    authToken: function authToken() {
      return helper.getAuthToken();
    },
    aboutPage: function aboutPage() {
      return this.$route.path === '/page/about' || this.$route.path === '/page/about-us';
    }
  },
  watch: {
    '$route.params.page': function $routeParamsPage(page) {
      this.getData();
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/page.vue?vue&type=template&id=efaf7cf0&":
/*!***********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/page.vue?vue&type=template&id=efaf7cf0& ***!
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
  return _c(
    "div",
    [
      _c("div", { staticClass: "page-title" }, [
        _c("div", { staticClass: "fix-width fix-width-mobile" }, [
          _c("h2", [_vm._v(_vm._s(_vm.page.title))])
        ])
      ]),
      _vm._v(" "),
      _vm.page.body
        ? _c("div", { staticClass: "fix-width fix-width-mobile p-t-80" }, [
            _c("div", {
              staticClass: "page-body",
              domProps: { innerHTML: _vm._s(_vm.page.body) }
            }),
            _vm._v(" "),
            _vm.attachments.length && !_vm.aboutPage
              ? _c("div", [
                  _c(
                    "ul",
                    { staticClass: "m-t-10 upload-file-list" },
                    _vm._l(_vm.attachments, function(attachment) {
                      return _c(
                        "li",
                        { staticClass: "upload-file-list-item" },
                        [
                          _c(
                            "a",
                            {
                              staticClass: "no-link-color",
                              attrs: {
                                href:
                                  "/frontend/page/" +
                                  _vm.page.uuid +
                                  "/attachment/" +
                                  attachment.uuid +
                                  "/download?token=" +
                                  _vm.authToken
                              }
                            },
                            [
                              _c("i", {
                                class: [
                                  "file-icon",
                                  "fas",
                                  "fa-lg",
                                  attachment.file_info.icon
                                ]
                              }),
                              _vm._v(" "),
                              _c(
                                "span",
                                { staticClass: "upload-file-list-item-size" },
                                [_vm._v(_vm._s(attachment.file_info.size))]
                              ),
                              _vm._v(" " + _vm._s(attachment.user_filename))
                            ]
                          )
                        ]
                      )
                    }),
                    0
                  )
                ])
              : _vm._e()
          ])
        : _vm._e(),
      _vm._v(" "),
      _vm.page.options
        ? [
            _vm.page.options.show_blocks && _vm.blocks.length
              ? _c("row-blocks", { attrs: { blocks: _vm.blocks } })
              : _vm._e(),
            _vm._v(" "),
            _vm.page.options.show_latest_articles && _vm.articles.length
              ? _c("row-articles", { attrs: { articles: _vm.articles } })
              : _vm._e()
          ]
        : _vm._e()
    ],
    2
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/pages/themes/default/page.vue":
/*!**********************************************************!*\
  !*** ./resources/js/views/pages/themes/default/page.vue ***!
  \**********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _page_vue_vue_type_template_id_efaf7cf0___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./page.vue?vue&type=template&id=efaf7cf0& */ "./resources/js/views/pages/themes/default/page.vue?vue&type=template&id=efaf7cf0&");
/* harmony import */ var _page_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./page.vue?vue&type=script&lang=js& */ "./resources/js/views/pages/themes/default/page.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _page_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _page_vue_vue_type_template_id_efaf7cf0___WEBPACK_IMPORTED_MODULE_0__["render"],
  _page_vue_vue_type_template_id_efaf7cf0___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/pages/themes/default/page.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/pages/themes/default/page.vue?vue&type=script&lang=js&":
/*!***********************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/page.vue?vue&type=script&lang=js& ***!
  \***********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_page_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./page.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/page.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_page_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/pages/themes/default/page.vue?vue&type=template&id=efaf7cf0&":
/*!*****************************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/page.vue?vue&type=template&id=efaf7cf0& ***!
  \*****************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_page_vue_vue_type_template_id_efaf7cf0___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./page.vue?vue&type=template&id=efaf7cf0& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/page.vue?vue&type=template&id=efaf7cf0&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_page_vue_vue_type_template_id_efaf7cf0___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_page_vue_vue_type_template_id_efaf7cf0___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=page.js.map?id=2d9be105d91c43279f93