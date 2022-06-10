(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/utility/ipFilter/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/utility/ip-filter/index.vue?vue&type=script&lang=js&":
/*!*****************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/utility/ip-filter/index.vue?vue&type=script&lang=js& ***!
  \*****************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _form__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./form */ "./resources/js/views/utility/ip-filter/form.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    ipFilterForm: _form__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      ip_filters: {
        total: 0,
        data: []
      },
      filter: {
        page_length: helper.getConfig('page_length')
      },
      showCreatePanel: false,
      help_topic: ''
    };
  },
  mounted: function mounted() {
    if (!helper.hasPermission('access-configuration')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    if (!helper.featureAvailable('ip_filter')) {
      helper.featureNotAvailableMsg();
      this.$router.push('/dashboard');
    }

    this.getIpFilters();
  },
  methods: {
    getIpFilters: function getIpFilters(page) {
      var _this = this;

      var loader = this.$loading.show();

      if (typeof page !== 'number') {
        page = 1;
      }

      var url = helper.getFilterURL(this.filter);
      axios.get('/api/ip-filter?page=' + page + url).then(function (response) {
        _this.ip_filters = response;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    editIpFilter: function editIpFilter(ip_filter) {
      this.$router.push('/utility/ip-filter/' + ip_filter.id + '/edit');
    },
    confirmDelete: function confirmDelete(ip_filter) {
      var _this2 = this;

      return function (dialog) {
        return _this2.deleteIpFilter(ip_filter);
      };
    },
    deleteIpFilter: function deleteIpFilter(ip_filter) {
      var _this3 = this;

      var loader = this.$loading.show();
      axios["delete"]('/api/ip-filter/' + ip_filter.id).then(function (response) {
        toastr.success(response.message);

        _this3.getIpFilters();

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/utility/ip-filter/index.vue?vue&type=template&id=32be6f0f&":
/*!*********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/utility/ip-filter/index.vue?vue&type=template&id=32be6f0f& ***!
  \*********************************************************************************************************************************************************************************************************************/
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
                _vm._s(_vm.trans("utility.ip_filter")) +
                  "\n                    "
              ),
              _vm.ip_filters.total
                ? _c(
                    "span",
                    { staticClass: "card-subtitle d-none d-sm-inline" },
                    [
                      _vm._v(
                        _vm._s(
                          _vm.trans("general.total_result_found", {
                            count: _vm.ip_filters.total,
                            from: _vm.ip_filters.from,
                            to: _vm.ip_filters.to
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
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "col-12 col-sm-6" }, [
            _c(
              "div",
              { staticClass: "action-buttons pull-right" },
              [
                _c(
                  "button",
                  {
                    staticClass: "btn btn-info btn-sm",
                    on: {
                      click: function($event) {
                        _vm.showCreatePanel = !_vm.showCreatePanel
                      }
                    }
                  },
                  [
                    _c("i", { staticClass: "fas fa-plus" }),
                    _vm._v(" "),
                    _c("span", { staticClass: "d-none d-sm-inline" }, [
                      _vm._v(_vm._s(_vm.trans("utility.add_new_ip_filter")))
                    ])
                  ]
                ),
                _vm._v(" "),
                _c("help-button", {
                  on: {
                    clicked: function($event) {
                      _vm.help_topic = "utility.ip-filter"
                    }
                  }
                })
              ],
              1
            )
          ])
        ])
      ]),
      _vm._v(" "),
      _c(
        "div",
        { staticClass: "container-fluid" },
        [
          _c("transition", { attrs: { name: "fade" } }, [
            _vm.showCreatePanel
              ? _c("div", { staticClass: "card card-form" }, [
                  _c(
                    "div",
                    { staticClass: "card-body" },
                    [
                      _c("h4", { staticClass: "card-title" }, [
                        _vm._v(_vm._s(_vm.trans("utility.add_new_ip_filter")))
                      ]),
                      _vm._v(" "),
                      _c("show-tip", {
                        attrs: { module: "utility", tip: "tip_ip_filter" }
                      }),
                      _vm._v(" "),
                      _c("ip-filter-form", {
                        on: {
                          completed: _vm.getIpFilters,
                          cancel: function($event) {
                            _vm.showCreatePanel = !_vm.showCreatePanel
                          }
                        }
                      })
                    ],
                    1
                  )
                ])
              : _vm._e()
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "card" }, [
            _c(
              "div",
              { staticClass: "card-body" },
              [
                _vm.ip_filters.total
                  ? _c("div", { staticClass: "table-responsive" }, [
                      _c("table", { staticClass: "table table-sm" }, [
                        _c("thead", [
                          _c("tr", [
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("utility.start_ip")))
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("utility.end_ip")))
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("utility.ip_filter_description")
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", { staticClass: "table-option" }, [
                              _vm._v(_vm._s(_vm.trans("general.action")))
                            ])
                          ])
                        ]),
                        _vm._v(" "),
                        _c(
                          "tbody",
                          _vm._l(_vm.ip_filters.data, function(ip_filter) {
                            return _c("tr", [
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(ip_filter.start_ip)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(ip_filter.end_ip)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(ip_filter.description)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", { staticClass: "table-option" }, [
                                _c("div", { staticClass: "btn-group" }, [
                                  _c(
                                    "button",
                                    {
                                      directives: [
                                        {
                                          name: "tooltip",
                                          rawName: "v-tooltip",
                                          value: _vm.trans(
                                            "utility.edit_ip_filter"
                                          ),
                                          expression:
                                            "trans('utility.edit_ip_filter')"
                                        }
                                      ],
                                      staticClass: "btn btn-info btn-sm",
                                      on: {
                                        click: function($event) {
                                          $event.preventDefault()
                                          return _vm.editIpFilter(ip_filter)
                                        }
                                      }
                                    },
                                    [_c("i", { staticClass: "fas fa-edit" })]
                                  ),
                                  _vm._v(" "),
                                  _c(
                                    "button",
                                    {
                                      directives: [
                                        {
                                          name: "confirm",
                                          rawName: "v-confirm",
                                          value: {
                                            ok: _vm.confirmDelete(ip_filter)
                                          },
                                          expression:
                                            "{ok: confirmDelete(ip_filter)}"
                                        },
                                        {
                                          name: "tooltip",
                                          rawName: "v-tooltip",
                                          value: _vm.trans(
                                            "utility.delete_ip_filter"
                                          ),
                                          expression:
                                            "trans('utility.delete_ip_filter')"
                                        }
                                      ],
                                      key: ip_filter.id,
                                      staticClass: "btn btn-danger btn-sm"
                                    },
                                    [_c("i", { staticClass: "fas fa-trash" })]
                                  )
                                ])
                              ])
                            ])
                          }),
                          0
                        )
                      ])
                    ])
                  : _vm._e(),
                _vm._v(" "),
                !_vm.ip_filters.total
                  ? _c("module-info", {
                      attrs: {
                        module: "utility",
                        title: "ip_filter_module_title",
                        description: "ip_filter_module_description",
                        icon: "list"
                      }
                    })
                  : _vm._e(),
                _vm._v(" "),
                _c("pagination-record", {
                  attrs: {
                    "page-length": _vm.filter.page_length,
                    records: _vm.ip_filters
                  },
                  on: {
                    "update:pageLength": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    "update:page-length": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    updateRecords: _vm.getIpFilters
                  },
                  nativeOn: {
                    change: function($event) {
                      return _vm.getIpFilters($event)
                    }
                  }
                })
              ],
              1
            )
          ])
        ],
        1
      ),
      _vm._v(" "),
      _c("right-panel", { attrs: { topic: _vm.help_topic } })
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/utility/ip-filter/index.vue":
/*!********************************************************!*\
  !*** ./resources/js/views/utility/ip-filter/index.vue ***!
  \********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_32be6f0f___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=32be6f0f& */ "./resources/js/views/utility/ip-filter/index.vue?vue&type=template&id=32be6f0f&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/utility/ip-filter/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_32be6f0f___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_32be6f0f___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/utility/ip-filter/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/utility/ip-filter/index.vue?vue&type=script&lang=js&":
/*!*********************************************************************************!*\
  !*** ./resources/js/views/utility/ip-filter/index.vue?vue&type=script&lang=js& ***!
  \*********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/utility/ip-filter/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/utility/ip-filter/index.vue?vue&type=template&id=32be6f0f&":
/*!***************************************************************************************!*\
  !*** ./resources/js/views/utility/ip-filter/index.vue?vue&type=template&id=32be6f0f& ***!
  \***************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_32be6f0f___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=32be6f0f& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/utility/ip-filter/index.vue?vue&type=template&id=32be6f0f&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_32be6f0f___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_32be6f0f___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=5c22305a7aecf6fc2774