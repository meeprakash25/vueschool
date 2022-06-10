(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/exam/report/analysis/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/report/analysis/index.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/report/analysis/index.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************/
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
/* harmony default export */ __webpack_exports__["default"] = ({
  data: function data() {
    return {
      students: [],
      employee_code: null,
      admission_number: null
    };
  },
  methods: {
    getConfig: function getConfig(config) {
      return helper.getConfig(config);
    },
    hasRole: function hasRole(role) {
      return helper.hasRole(role);
    },
    hasAnyRole: function hasAnyRole(roles) {
      return helper.hasAnyRole(roles);
    }
  },
  mounted: function mounted() {
    var _this = this;

    var loader = this.$loading.show();
    axios.get('/api/exam/report/analysis/pre-requisite').then(function (response) {
      _this.students = response.students;
      _this.employee_code = response.employee_code;
      loader.hide();
    })["catch"](function (error) {
      loader.hide();
      helper.showErrorMsg(error);
    });
  },
  computed: {
    getToken: function getToken() {
      var academic_session = helper.getDefaultAcademicSession();
      var token = '';

      if (helper.hasAnyRole(['student', 'parent'])) {
        token = academic_session.exam_report_analysis_student_token;
      } else {
        token = academic_session.exam_report_analysis_staff_token;
      }

      if (token) {
        var parts = token.split("-");

        if (parts.length > 1) {
          return parts[1];
        }

        return null;
      }

      return null;
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/report/analysis/index.vue?vue&type=template&id=66a7592e&":
/*!************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/report/analysis/index.vue?vue&type=template&id=66a7592e& ***!
  \************************************************************************************************************************************************************************************************************************/
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
        _vm._v(_vm._s(_vm.trans("exam.report_analysis")) + "\n            "),
        _vm.hasRole("admin")
          ? _c(
              "span",
              { staticClass: "card-subtitle d-none d-sm-inline pull-right" },
              [
                _c(
                  "router-link",
                  {
                    staticClass: "btn btn-info btn-sm",
                    attrs: { to: "/exam/report/analysis/export" }
                  },
                  [
                    _vm._v(
                      _vm._s(
                        _vm.trans("general.go_to_link", {
                          link: _vm.trans("exam.export_data_in_excel")
                        })
                      )
                    )
                  ]
                )
              ],
              1
            )
          : _vm._e()
      ])
    ]),
    _vm._v(" "),
    _c("div", { staticClass: "container-fluid container-body" }, [
      _vm.getToken
        ? _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-12" }, [
              _vm.students.length
                ? _c("p", { staticClass: "alert alert-info" }, [
                    _vm._v(
                      _vm._s(_vm.trans("student.select_student_to_get_report"))
                    )
                  ])
                : _vm._e(),
              _vm._v(" "),
              _c(
                "div",
                { staticClass: "row" },
                _vm._l(_vm.students, function(student) {
                  return _c(
                    "div",
                    {
                      key: student.id,
                      staticClass: "col-12 col-sm-4 custom-button",
                      on: {
                        click: function($event) {
                          _vm.admission_number = student.admission_number
                        }
                      }
                    },
                    [
                      _c("p", [
                        _c(
                          "span",
                          {
                            staticStyle: {
                              "font-weight": "bold",
                              "font-size": "120%"
                            }
                          },
                          [_vm._v(_vm._s(student.name))]
                        ),
                        _vm._v(" "),
                        _c("br"),
                        _vm._v(
                          " " +
                            _vm._s(student.batch) +
                            " (" +
                            _vm._s(student.admission_number) +
                            ")\n                        "
                        )
                      ])
                    ]
                  )
                }),
                0
              )
            ]),
            _vm._v(" "),
            _c(
              "div",
              { staticClass: "col-12" },
              [
                _vm.hasAnyRole(["admin", "principal", "manager"])
                  ? [
                      _c("iframe", {
                        staticStyle: { "min-width": "800px" },
                        attrs: {
                          frameborder: "0",
                          width: "100%",
                          height: "800",
                          src:
                            "https://analytics.doodu.io/open-view/" +
                            _vm.getToken
                        }
                      })
                    ]
                  : (_vm.hasRole("student") || _vm.hasRole("parent")) &&
                    _vm.admission_number
                  ? [
                      _c("iframe", {
                        staticStyle: { "min-width": "800px" },
                        attrs: {
                          frameborder: "0",
                          width: "100%",
                          height: "800",
                          src:
                            "https://analytics.doodu.io/open-view/" +
                            _vm.getToken +
                            "?CRITERIA=%22Marks%22.%22ADMISSION%20NO%22=%27" +
                            _vm.admission_number +
                            "%27"
                        }
                      })
                    ]
                  : _vm.hasRole("staff") && _vm.employee_code
                  ? [
                      _c("iframe", {
                        staticStyle: { "min-width": "800px" },
                        attrs: {
                          frameborder: "0",
                          width: "100%",
                          height: "800",
                          src:
                            "https://analytics.doodu.io/open-view/" +
                            _vm.getToken +
                            "?CRITERIA=%22Marks%22.%22EMP%20CODE%22=%27" +
                            _vm.employee_code +
                            "%27"
                        }
                      })
                    ]
                  : _vm._e()
              ],
              2
            )
          ])
        : _c("div", { staticClass: "alert alert-danger" }, [
            _vm._v(_vm._s(_vm.trans("general.invalid_action")))
          ])
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/exam/report/analysis/index.vue":
/*!***********************************************************!*\
  !*** ./resources/js/views/exam/report/analysis/index.vue ***!
  \***********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_66a7592e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=66a7592e& */ "./resources/js/views/exam/report/analysis/index.vue?vue&type=template&id=66a7592e&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/exam/report/analysis/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_66a7592e___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_66a7592e___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/exam/report/analysis/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/exam/report/analysis/index.vue?vue&type=script&lang=js&":
/*!************************************************************************************!*\
  !*** ./resources/js/views/exam/report/analysis/index.vue?vue&type=script&lang=js& ***!
  \************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/report/analysis/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/exam/report/analysis/index.vue?vue&type=template&id=66a7592e&":
/*!******************************************************************************************!*\
  !*** ./resources/js/views/exam/report/analysis/index.vue?vue&type=template&id=66a7592e& ***!
  \******************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_66a7592e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=66a7592e& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/report/analysis/index.vue?vue&type=template&id=66a7592e&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_66a7592e___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_66a7592e___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=09274e4b1eea463a5b06