(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/pages/themes/calendar"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=script&lang=js&":
/*!***********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/calendar.vue?vue&type=script&lang=js& ***!
  \***********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _views_pages_partials_row_blocks__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @views/pages/partials/row-blocks */ "./resources/js/views/pages/partials/row-blocks.vue");
/* harmony import */ var _views_pages_partials_row_articles__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @views/pages/partials/row-articles */ "./resources/js/views/pages/partials/row-articles.vue");
/* harmony import */ var vue_full_calendar__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! vue-full-calendar */ "./node_modules/vue-full-calendar/index.js");
//
//
//
//
//
//
//
//
//
//
//
//
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
    RowArticles: _views_pages_partials_row_articles__WEBPACK_IMPORTED_MODULE_1__["default"],
    FullCalendar: vue_full_calendar__WEBPACK_IMPORTED_MODULE_2__["FullCalendar"]
  },
  data: function data() {
    return {
      slug: this.$route.params.page,
      page: {},
      blocks: [],
      articles: {},
      events: [],
      config: {
        defaultView: 'month',
        firstDay: helper.getDayInInteger(this.getConfig('first_day_of_week') || 'monday'),
        isRTL: this.getConfig('direction') == 'rtl' ? true : false,
        eventRender: function eventRender(event, element) {
          $(element).tooltip({
            title: event.title
          });

          if (event.icon) {
            element.find(".fc-title").prepend(" <i class='fas fa-" + event.icon + "'></i> ");
          }
        }
      }
    };
  },
  mounted: function mounted() {
    this.getData();
    this.getEvents();
    helper.showDemoNotification(['frontend_calendar']);
  },
  methods: {
    getData: function getData() {
      var _this = this;

      var loader = this.$loading.show();
      axios.get('/api/frontend/page/calendar/content').then(function (response) {
        _this.page = response.page;
        _this.blocks = response.blocks;
        _this.articles = response.articles;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
        if (error.response.status == 422) _this.$router.push('/');
      });
    },
    getEvents: function getEvents() {
      var _this2 = this;

      axios.get('/api/frontend/calendar/event').then(function (response) {
        response.holidays.forEach(function (holiday) {
          _this2.events.push({
            title: holiday.description,
            start: helper.toDate(holiday.date),
            icon: 'coffee',
            color: 'teal'
          });
        });
        response.events.forEach(function (event) {
          _this2.events.push({
            title: event.title,
            start: helper.toDate(event.start_date),
            end: helper.toDate(event.end_date),
            icon: 'bullhorn',
            color: 'purple'
          });
        });
      })["catch"](function (error) {
        helper.showErrorMsg(error);
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
  }
});

/***/ }),

/***/ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css&":
/*!********************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css& ***!
  \********************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "\n.fc-row .fc-content-skeleton tbody td.fc-event-container {\n  padding: 0 10px;\n}\n.fc-day-grid-event {\n  border-radius: 5px;\n  margin-top: 2px;\n  margin-bottom: 2px;\n}\n.fc-day-grid-event .fc-content {\n  white-space: nowrap;\n  overflow: hidden;\n  text-overflow: ellipsis;\n}\n", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css&":
/*!************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css& ***!
  \************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../../node_modules/css-loader??ref--13-1!../../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../../node_modules/postcss-loader/src??ref--13-2!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./calendar.vue?vue&type=style&index=0&lang=css& */ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css&");

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

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=template&id=4fce1237&":
/*!***************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/pages/themes/default/calendar.vue?vue&type=template&id=4fce1237& ***!
  \***************************************************************************************************************************************************************************************************************************/
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
        ? _c(
            "div",
            { staticClass: "fix-width fix-width-mobile p-t-80" },
            [
              _c("div", {
                staticClass: "page-body",
                domProps: { innerHTML: _vm._s(_vm.page.body) }
              }),
              _vm._v(" "),
              _c("full-calendar", {
                attrs: { events: _vm.events, config: _vm.config }
              })
            ],
            1
          )
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

/***/ "./resources/js/views/pages/themes/default/calendar.vue":
/*!**************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/calendar.vue ***!
  \**************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _calendar_vue_vue_type_template_id_4fce1237___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./calendar.vue?vue&type=template&id=4fce1237& */ "./resources/js/views/pages/themes/default/calendar.vue?vue&type=template&id=4fce1237&");
/* harmony import */ var _calendar_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./calendar.vue?vue&type=script&lang=js& */ "./resources/js/views/pages/themes/default/calendar.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _calendar_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./calendar.vue?vue&type=style&index=0&lang=css& */ "./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _calendar_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _calendar_vue_vue_type_template_id_4fce1237___WEBPACK_IMPORTED_MODULE_0__["render"],
  _calendar_vue_vue_type_template_id_4fce1237___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/pages/themes/default/calendar.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/pages/themes/default/calendar.vue?vue&type=script&lang=js&":
/*!***************************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/calendar.vue?vue&type=script&lang=js& ***!
  \***************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./calendar.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css&":
/*!***********************************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css& ***!
  \***********************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/style-loader!../../../../../../node_modules/css-loader??ref--13-1!../../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../../node_modules/postcss-loader/src??ref--13-2!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./calendar.vue?vue&type=style&index=0&lang=css& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/views/pages/themes/default/calendar.vue?vue&type=template&id=4fce1237&":
/*!*********************************************************************************************!*\
  !*** ./resources/js/views/pages/themes/default/calendar.vue?vue&type=template&id=4fce1237& ***!
  \*********************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_template_id_4fce1237___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./calendar.vue?vue&type=template&id=4fce1237& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/pages/themes/default/calendar.vue?vue&type=template&id=4fce1237&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_template_id_4fce1237___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_calendar_vue_vue_type_template_id_4fce1237___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=calendar.js.map?id=97b99c49e67f104826c5