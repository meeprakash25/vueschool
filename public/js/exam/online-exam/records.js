(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/exam/online-exam/records"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/records.vue?vue&type=script&lang=js&":
/*!******************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/online-exam/records.vue?vue&type=script&lang=js& ***!
  \******************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _detail__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./detail */ "./resources/js/views/exam/online-exam/detail.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    onlineExamDetail: _detail__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      uuid: this.$route.params.uuid,
      online_exam: {
        batch: {
          course: {}
        },
        subject: {},
        records: [],
        questions: []
      },
      students: []
    };
  },
  mounted: function mounted() {
    if (!helper.hasPermission('edit-online-exam')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    this.getOnlineExam();
  },
  methods: {
    hasPermission: function hasPermission(permission) {
      return helper.hasPermission(permission);
    },
    getOnlineExam: function getOnlineExam() {
      var _this = this;

      this.showQuestionModal = false;
      var loader = this.$loading.show();
      axios.get('/api/online-exam/' + this.uuid + '?student=1').then(function (response) {
        _this.online_exam = response.online_exam;
        _this.students = response.students;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);

        _this.$router.push('/dashboard');
      });
    },
    getStudentName: function getStudentName(student) {
      return helper.getStudentName(student);
    },
    getRollNumber: function getRollNumber(student_record) {
      return helper.getRollNumber(student_record);
    }
  },
  filters: {
    moment: function moment(date) {
      return helper.formatDate(date);
    },
    momentTime: function momentTime(time) {
      return helper.formatTime(time);
    },
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/records.vue?vue&type=template&id=88c298ca&":
/*!**********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/online-exam/records.vue?vue&type=template&id=88c298ca& ***!
  \**********************************************************************************************************************************************************************************************************************/
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
      _c("div", { staticClass: "row" }, [
        _c("div", { staticClass: "col-12 col-sm-6" }, [
          _c("h3", { staticClass: "text-themecolor" }, [
            _vm._v(
              _vm._s(_vm.trans("exam.online_exam")) + "\n                    "
            ),
            _vm.online_exam
              ? _c(
                  "span",
                  { staticClass: "card-subtitle d-none d-sm-inline" },
                  [_vm._v(_vm._s(_vm.online_exam.name))]
                )
              : _vm._e()
          ])
        ]),
        _vm._v(" "),
        _c("div", { staticClass: "col-12 col-sm-6" }, [
          _c(
            "div",
            { staticClass: "action-buttons pull-right" },
            [
              _c(
                "router-link",
                {
                  staticClass: "btn btn-info btn-sm",
                  attrs: { to: "/online-exam" }
                },
                [
                  _c("i", { staticClass: "fas fa-list" }),
                  _vm._v(" "),
                  _c("span", { staticClass: "d-none d-sm-inline" }, [
                    _vm._v(_vm._s(_vm.trans("exam.online_exam")))
                  ])
                ]
              ),
              _vm._v(" "),
              _c(
                "router-link",
                {
                  staticClass: "btn btn-info btn-sm",
                  attrs: {
                    to: "/online-exam/" + _vm.online_exam.uuid + "/questions"
                  }
                },
                [
                  _c("i", { staticClass: "fas fa-list" }),
                  _vm._v(" "),
                  _c("span", { staticClass: "d-none d-sm-inline" }, [
                    _vm._v(_vm._s(_vm.trans("exam.online_exam_questions")))
                  ])
                ]
              )
            ],
            1
          )
        ])
      ])
    ]),
    _vm._v(" "),
    _c("div", { staticClass: "container-fluid" }, [
      _c("div", { staticClass: "row" }, [
        _c(
          "div",
          { staticClass: "col-12 col-sm-4" },
          [
            _c("online-exam-detail", {
              attrs: { onlineExam: _vm.online_exam },
              on: { updateExam: _vm.getOnlineExam }
            })
          ],
          1
        ),
        _vm._v(" "),
        _c("div", { staticClass: "col-12 col-sm-8 p-0" }, [
          _c("div", { staticClass: "card" }, [
            _c("div", { staticClass: "card-boy" }, [
              _c("h4", { staticClass: "card-title m-3" }, [
                _vm._v(_vm._s(_vm.trans("exam.online_exam_records")))
              ]),
              _vm._v(" "),
              _vm.students.length
                ? _c("div", { staticClass: "table-responsive p-2" }, [
                    _c(
                      "table",
                      { staticClass: "table table-bordered table-sm" },
                      [
                        _c("thead", [
                          _c("tr", [
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("exam.online_exam_rank")))
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("student.student")))
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("student.roll_number")))
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(_vm.trans("exam.online_exam_start_time"))
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(_vm.trans("exam.online_exam_end_time"))
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("exam.obtained_mark")))
                            ])
                          ])
                        ]),
                        _vm._v(" "),
                        _c(
                          "thead",
                          _vm._l(_vm.students, function(student, index) {
                            return _c("tr", [
                              _c("td", [_vm._v(_vm._s(index + 1))]),
                              _vm._v(" "),
                              _c("td", [
                                student.record_id
                                  ? _c(
                                      "span",
                                      [
                                        _c(
                                          "router-link",
                                          {
                                            attrs: {
                                              to:
                                                "/online-exam/" +
                                                _vm.uuid +
                                                "/records/" +
                                                student.record_id +
                                                "/report"
                                            }
                                          },
                                          [_vm._v(_vm._s(student.name))]
                                        )
                                      ],
                                      1
                                    )
                                  : _c("span", [_vm._v(_vm._s(student.name))])
                              ]),
                              _vm._v(" "),
                              _c("td", [_vm._v(_vm._s(student.roll_number))]),
                              _vm._v(" "),
                              _c("td", [
                                _vm._v(
                                  _vm._s(
                                    _vm._f("momentDateTime")(student.start)
                                  )
                                )
                              ]),
                              _vm._v(" "),
                              _c("td", [
                                _vm._v(
                                  _vm._s(_vm._f("momentDateTime")(student.end))
                                )
                              ]),
                              _vm._v(" "),
                              _c("td", [_vm._v(_vm._s(student.mark))])
                            ])
                          }),
                          0
                        )
                      ]
                    )
                  ])
                : _vm._e()
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

/***/ "./resources/js/views/exam/online-exam/records.vue":
/*!*********************************************************!*\
  !*** ./resources/js/views/exam/online-exam/records.vue ***!
  \*********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _records_vue_vue_type_template_id_88c298ca___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./records.vue?vue&type=template&id=88c298ca& */ "./resources/js/views/exam/online-exam/records.vue?vue&type=template&id=88c298ca&");
/* harmony import */ var _records_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./records.vue?vue&type=script&lang=js& */ "./resources/js/views/exam/online-exam/records.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _records_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _records_vue_vue_type_template_id_88c298ca___WEBPACK_IMPORTED_MODULE_0__["render"],
  _records_vue_vue_type_template_id_88c298ca___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/exam/online-exam/records.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/exam/online-exam/records.vue?vue&type=script&lang=js&":
/*!**********************************************************************************!*\
  !*** ./resources/js/views/exam/online-exam/records.vue?vue&type=script&lang=js& ***!
  \**********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_records_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./records.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/records.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_records_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/exam/online-exam/records.vue?vue&type=template&id=88c298ca&":
/*!****************************************************************************************!*\
  !*** ./resources/js/views/exam/online-exam/records.vue?vue&type=template&id=88c298ca& ***!
  \****************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_records_vue_vue_type_template_id_88c298ca___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./records.vue?vue&type=template&id=88c298ca& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/records.vue?vue&type=template&id=88c298ca&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_records_vue_vue_type_template_id_88c298ca___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_records_vue_vue_type_template_id_88c298ca___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=records.js.map?id=e9c100fccafeca9acdeb