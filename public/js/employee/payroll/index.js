(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/employee/payroll/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/employee/payroll/index.vue?vue&type=script&lang=js&":
/*!****************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/employee/payroll/index.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************************************************************************************************/
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
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
  methods: {
    hasPermission: function hasPermission(permission) {
      return helper.hasPermission(permission);
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/employee/payroll/index.vue?vue&type=template&id=f6ef1bf4&":
/*!********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/employee/payroll/index.vue?vue&type=template&id=f6ef1bf4& ***!
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
  return _c("div", [
    _c("div", { staticClass: "page-titles" }, [
      _c("h3", { staticClass: "text-themecolor" }, [
        _vm._v(_vm._s(_vm.trans("employee.payroll")))
      ])
    ]),
    _vm._v(" "),
    _c("div", { staticClass: "container-fluid container-body" }, [
      _c("div", { staticClass: "row" }, [
        _vm.hasPermission("manage-payroll-template")
          ? _c("div", { staticClass: "col-12 col-sm-3" }, [
              _c("div", { staticClass: "card card-box" }, [
                _c(
                  "div",
                  { staticClass: "card-body" },
                  [
                    _c("h4", { staticClass: "card-title" }, [
                      _vm._v(_vm._s(_vm.trans("employee.payroll_template")))
                    ]),
                    _vm._v(" "),
                    _c("p", { staticClass: "card-text font-80pc" }, [
                      _vm._v(
                        _vm._s(
                          _vm.trans(
                            "employee.payroll_template_module_description"
                          )
                        )
                      )
                    ]),
                    _vm._v(" "),
                    _c(
                      "router-link",
                      {
                        staticClass: "btn btn-info btn-sm",
                        attrs: { to: "/employee/payroll/template" }
                      },
                      [
                        _vm._v(
                          _vm._s(
                            _vm.trans("general.go_to_link", {
                              link: _vm.trans("employee.payroll_template")
                            })
                          )
                        )
                      ]
                    )
                  ],
                  1
                )
              ])
            ])
          : _vm._e(),
        _vm._v(" "),
        _vm.hasPermission("define-employee-salary")
          ? _c("div", { staticClass: "col-12 col-sm-3" }, [
              _c("div", { staticClass: "card card-box" }, [
                _c(
                  "div",
                  { staticClass: "card-body" },
                  [
                    _c("h4", { staticClass: "card-title" }, [
                      _vm._v(_vm._s(_vm.trans("employee.salary_structure")))
                    ]),
                    _vm._v(" "),
                    _c("p", { staticClass: "card-text font-80pc" }, [
                      _vm._v(
                        _vm._s(
                          _vm.trans(
                            "employee.salary_structure_module_description"
                          )
                        )
                      )
                    ]),
                    _vm._v(" "),
                    _c(
                      "router-link",
                      {
                        staticClass: "btn btn-info btn-sm",
                        attrs: { to: "/employee/payroll/salary" }
                      },
                      [
                        _vm._v(
                          _vm._s(
                            _vm.trans("general.go_to_link", {
                              link: _vm.trans("employee.salary_structure")
                            })
                          )
                        )
                      ]
                    )
                  ],
                  1
                )
              ])
            ])
          : _vm._e(),
        _vm._v(" "),
        _vm.hasPermission("list-payroll")
          ? _c("div", { staticClass: "col-12 col-sm-3" }, [
              _c("div", { staticClass: "card card-box" }, [
                _c(
                  "div",
                  { staticClass: "card-body" },
                  [
                    _c("h4", { staticClass: "card-title" }, [
                      _vm._v(_vm._s(_vm.trans("employee.payroll")))
                    ]),
                    _vm._v(" "),
                    _c("p", { staticClass: "card-text font-80pc" }, [
                      _vm._v(
                        _vm._s(_vm.trans("employee.payroll_module_description"))
                      )
                    ]),
                    _vm._v(" "),
                    _c(
                      "router-link",
                      {
                        staticClass: "btn btn-info btn-sm",
                        attrs: { to: "/employee/payroll/list" }
                      },
                      [
                        _vm._v(
                          _vm._s(
                            _vm.trans("general.go_to_link", {
                              link: _vm.trans("employee.payroll")
                            })
                          )
                        )
                      ]
                    )
                  ],
                  1
                )
              ])
            ])
          : _vm._e(),
        _vm._v(" "),
        _vm.hasPermission("list-payroll-transaction")
          ? _c("div", { staticClass: "col-12 col-sm-3" }, [
              _c("div", { staticClass: "card card-box" }, [
                _c(
                  "div",
                  { staticClass: "card-body" },
                  [
                    _c("h4", { staticClass: "card-title" }, [
                      _vm._v(_vm._s(_vm.trans("employee.payroll_transaction")))
                    ]),
                    _vm._v(" "),
                    _c("p", { staticClass: "card-text font-80pc" }, [
                      _vm._v(
                        _vm._s(
                          _vm.trans(
                            "employee.payroll_transaction_module_description"
                          )
                        )
                      )
                    ]),
                    _vm._v(" "),
                    _c(
                      "router-link",
                      {
                        staticClass: "btn btn-info btn-sm",
                        attrs: { to: "/employee/payroll/transaction" }
                      },
                      [
                        _vm._v(
                          _vm._s(
                            _vm.trans("general.go_to_link", {
                              link: _vm.trans("employee.payroll_transaction")
                            })
                          )
                        )
                      ]
                    )
                  ],
                  1
                )
              ])
            ])
          : _vm._e()
      ])
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/employee/payroll/index.vue":
/*!*******************************************************!*\
  !*** ./resources/js/views/employee/payroll/index.vue ***!
  \*******************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_f6ef1bf4___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=f6ef1bf4& */ "./resources/js/views/employee/payroll/index.vue?vue&type=template&id=f6ef1bf4&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/employee/payroll/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_f6ef1bf4___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_f6ef1bf4___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/employee/payroll/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/employee/payroll/index.vue?vue&type=script&lang=js&":
/*!********************************************************************************!*\
  !*** ./resources/js/views/employee/payroll/index.vue?vue&type=script&lang=js& ***!
  \********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/employee/payroll/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/employee/payroll/index.vue?vue&type=template&id=f6ef1bf4&":
/*!**************************************************************************************!*\
  !*** ./resources/js/views/employee/payroll/index.vue?vue&type=template&id=f6ef1bf4& ***!
  \**************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_f6ef1bf4___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=f6ef1bf4& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/employee/payroll/index.vue?vue&type=template&id=f6ef1bf4&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_f6ef1bf4___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_f6ef1bf4___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=ddda38bb099e866c520a