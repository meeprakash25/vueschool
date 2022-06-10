(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/communication/meeting/show"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/audience.vue?vue&type=script&lang=js&":
/*!************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/audience.vue?vue&type=script&lang=js& ***!
  \************************************************************************************************************************************************************************************/
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
  props: ['meeting']
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/show.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _audience__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./audience */ "./resources/js/views/communication/meeting/audience.vue");
/* harmony import */ var _components_user_search__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @components/user-search */ "./resources/js/components/user-search.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    meetingAudience: _audience__WEBPACK_IMPORTED_MODULE_0__["default"],
    userSearch: _components_user_search__WEBPACK_IMPORTED_MODULE_1__["default"]
  },
  data: function data() {
    return {
      uuid: this.$route.params.uuid,
      meeting: {},
      attachments: [],
      is_editable: false,
      is_owner: false,
      additionalAudienceForm: new Form({
        individual_students: [],
        individual_employees: []
      }),
      searchResults: [],
      individual_audiences: []
    };
  },
  mounted: function mounted() {
    if (!helper.hasPermission('list-meeting')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    this.getMeeting();
  },
  methods: {
    getMeeting: function getMeeting() {
      var _this = this;

      var loader = this.$loading.show();
      axios.get('/api/meeting/' + this.uuid + '?individual_audiences=true').then(function (response) {
        _this.meeting = response.meeting;
        _this.attachments = response.attachments;
        _this.is_editable = response.is_editable;
        _this.individual_audiences = response.individual_audiences;

        if (_this.meeting.user_id === helper.getAuthUser('id')) {
          _this.is_owner = true;
        }

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);

        _this.$router.push('/communication/meeting');
      });
    },
    hasPermission: function hasPermission(permission) {
      return helper.hasPermission(permission);
    },
    getEmployeeName: function getEmployeeName(employee) {
      return helper.getEmployeeName(employee);
    },
    getEmployeeDesignationOnDate: function getEmployeeDesignationOnDate(employee, date) {
      return helper.getEmployeeDesignationOnDate(employee, date);
    },
    addToSearchResult: function addToSearchResult(result) {
      var existing_result = this.searchResults.findIndex(function (o) {
        return o.type === result.type && o.id === result.id;
      });

      if (existing_result < 0) {
        this.searchResults.push(result);
      }
    },
    deleteResult: function deleteResult(result) {
      var idx = this.searchResults.findIndex(function (o) {
        return o.type === result.type && o.id === result.id;
      });
      this.searchResults.splice(idx, 1);
    },
    addAudience: function addAudience() {
      var _this2 = this;

      var loader = this.$loading.show();
      this.additionalAudienceForm.individual_students = [];
      this.additionalAudienceForm.individual_employees = [];
      this.searchResults.forEach(function (result) {
        if (result.type === 'student') {
          _this2.additionalAudienceForm.individual_students.push(result.id);
        } else {
          _this2.additionalAudienceForm.individual_employees.push(result.id);
        }
      });
      this.additionalAudienceForm.post('/api/meeting/' + this.meeting.uuid + '/audience').then(function (response) {
        toastr.success(response.message);
        _this2.searchResults = [];
        loader.hide();

        _this2.getMeeting();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    confirmDelete: function confirmDelete(result) {
      var _this3 = this;

      return function (dialog) {
        return _this3.deleteAudience(result);
      };
    },
    deleteAudience: function deleteAudience(result) {
      var _this4 = this;

      var loader = this.$loading.show();
      axios["delete"]('/api/meeting/' + this.meeting.uuid + '/audience/' + result.type + '/' + result.id).then(function (response) {
        toastr.success(response.message);
        loader.hide();

        _this4.getMeeting();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    }
  },
  filters: {
    moment: function moment(date) {
      return helper.formatDate(date);
    },
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    },
    momentTime: function momentTime(time) {
      return helper.formatTime(time);
    }
  },
  computed: {
    authToken: function authToken() {
      return helper.getAuthToken();
    },
    isDemo: function isDemo() {
      return !helper.getConfig('mode') ? true : false;
    }
  }
});

/***/ }),

/***/ "./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true&":
/*!*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--14-2!./node_modules/sass-loader/dist/cjs.js??ref--14-3!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true& ***!
  \*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, ".video-list[data-v-5285c9ae] {\n  display: flex;\n  background-color: blue;\n}\n.video-item[data-v-5285c9ae] {\n  margin: 10px;\n  height: 150px;\n  min-width: 150px;\n  background: white;\n}", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true&":
/*!*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--14-2!./node_modules/sass-loader/dist/cjs.js??ref--14-3!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true& ***!
  \*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../node_modules/css-loader!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--14-2!../../../../../node_modules/sass-loader/dist/cjs.js??ref--14-3!../../../../../node_modules/vue-loader/lib??vue-loader-options!./show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true& */ "./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true&");

if(typeof content === 'string') content = [[module.i, content, '']];

var transform;
var insertInto;



var options = {"hmr":true}

options.transform = transform
options.insertInto = undefined;

var update = __webpack_require__(/*! ../../../../../node_modules/style-loader/lib/addStyles.js */ "./node_modules/style-loader/lib/addStyles.js")(content, options);

if(content.locals) module.exports = content.locals;

if(false) {}

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/audience.vue?vue&type=template&id=b67db6a0&":
/*!****************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/audience.vue?vue&type=template&id=b67db6a0& ***!
  \****************************************************************************************************************************************************************************************************************************/
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
      _vm.meeting.audience == "selected_course"
        ? [
            _vm._v("\n        " + _vm._s(_vm.trans("academic.course")) + " "),
            _c("br"),
            _vm._v(" "),
            _c(
              "ul",
              {
                staticStyle: { "list-style": "none", padding: "0", margin: "0" }
              },
              _vm._l(_vm.meeting.courses, function(course) {
                return _c("li", [
                  _vm._v(
                    _vm._s(course.name + "(" + course.course_group.name + ")")
                  )
                ])
              }),
              0
            )
          ]
        : _vm.meeting.audience == "selected_batch"
        ? [
            _vm._v("\n        " + _vm._s(_vm.trans("academic.batch")) + " "),
            _c("br"),
            _vm._v(" "),
            _c(
              "ul",
              {
                staticStyle: { "list-style": "none", padding: "0", margin: "0" }
              },
              _vm._l(_vm.meeting.batches, function(batch) {
                return _c("li", [
                  _vm._v(_vm._s(batch.name + "(" + batch.course.name + ")"))
                ])
              }),
              0
            )
          ]
        : _vm.meeting.audience == "selected_department"
        ? [
            _vm._v(
              "\n        " + _vm._s(_vm.trans("employee.department")) + " "
            ),
            _c("br"),
            _vm._v(" "),
            _c(
              "ul",
              {
                staticStyle: { "list-style": "none", padding: "0", margin: "0" }
              },
              _vm._l(_vm.meeting.departments, function(department) {
                return _c("li", [_vm._v(_vm._s(department.name))])
              }),
              0
            )
          ]
        : _vm.meeting.audience == "selected_employee_category"
        ? [
            _vm._v("\n        " + _vm._s(_vm.trans("employee.category")) + " "),
            _c("br"),
            _vm._v(" "),
            _c(
              "ul",
              {
                staticStyle: { "list-style": "none", padding: "0", margin: "0" }
              },
              _vm._l(_vm.meeting.employee_categorys, function(
                employee_category
              ) {
                return _c("li", [_vm._v(_vm._s(employee_category.name))])
              }),
              0
            )
          ]
        : _vm._e(),
      _vm._v(" "),
      _vm.meeting.options.individual_students &&
      _vm.meeting.options.individual_students.length
        ? [
            _c(
              "ul",
              {
                staticStyle: { "list-style": "none", padding: "0", margin: "0" }
              },
              [
                _c("li", [
                  _vm._v(
                    _vm._s(
                      _vm.trans("communication.count_individual_students", {
                        attribute:
                          _vm.meeting.options.individual_students.length
                      })
                    )
                  )
                ])
              ]
            )
          ]
        : _vm._e(),
      _vm._v(" "),
      _vm.meeting.options.individual_employees &&
      _vm.meeting.options.individual_employees.length
        ? [
            _c(
              "ul",
              {
                staticStyle: { "list-style": "none", padding: "0", margin: "0" }
              },
              [
                _c("li", [
                  _vm._v(
                    _vm._s(
                      _vm.trans("communication.count_individual_employees", {
                        attribute:
                          _vm.meeting.options.individual_employees.length
                      })
                    )
                  )
                ])
              ]
            )
          ]
        : _vm._e()
    ],
    2
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=template&id=5285c9ae&scoped=true&":
/*!************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/show.vue?vue&type=template&id=5285c9ae&scoped=true& ***!
  \************************************************************************************************************************************************************************************************************************************/
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
            _vm._v(_vm._s(_vm.trans("communication.meeting")))
          ])
        ]),
        _vm._v(" "),
        _c("div", { staticClass: "col-12 col-sm-6" }, [
          _c("div", { staticClass: "action-buttons pull-right" }, [
            _c(
              "button",
              {
                staticClass: "btn btn-info btn-sm",
                on: {
                  click: function($event) {
                    return _vm.$router.go(-1)
                  }
                }
              },
              [
                _c("i", { staticClass: "fas fa-list" }),
                _vm._v(" "),
                _c("span", { staticClass: "d-none d-sm-inline" }, [
                  _vm._v(_vm._s(_vm.trans("general.back")))
                ])
              ]
            )
          ])
        ])
      ])
    ]),
    _vm._v(" "),
    _c("div", { staticClass: "container-fluid" }, [
      _vm.isDemo
        ? _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-12" }, [
              _c("p", { staticClass: "alert alert-info m-4" }, [
                _vm._v(
                  _vm._s(
                    _vm.trans("communication.demo_mode_meeting_description")
                  )
                )
              ])
            ])
          ])
        : _vm._e(),
      _vm._v(" "),
      _vm.meeting.uuid
        ? _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-12 col-sm-6" }, [
              _c("div", { staticClass: "card border-right" }, [
                _c("div", { staticClass: "card-body" }, [
                  _c("h4", { staticClass: "card-title m-3" }, [
                    _c("span", { staticClass: "d-none d-sm-inline" }, [
                      _vm._v(_vm._s(_vm.trans("communication.meeting_detail")))
                    ]),
                    _vm._v(" "),
                    _vm.meeting.is_live
                      ? _c("span", { staticClass: "badge badge-success" }, [
                          _vm._v(_vm._s(_vm.trans("communication.live")))
                        ])
                      : _vm._e(),
                    _vm._v(" "),
                    _vm.meeting.is_expired
                      ? _c("span", { staticClass: "badge badge-danger" }, [
                          _vm._v(_vm._s(_vm.trans("communication.expired")))
                        ])
                      : _vm._e()
                  ]),
                  _vm._v(" "),
                  _c("div", { staticClass: "table-responsive" }, [
                    _c(
                      "table",
                      { staticClass: "table table-sm custom-show-table" },
                      [
                        _c("tbody", [
                          _c("tr", [
                            _c("td", [
                              _vm._v(
                                _vm._s(_vm.trans("communication.meeting_title"))
                              )
                            ]),
                            _vm._v(" "),
                            _c("td", [_vm._v(_vm._s(_vm.meeting.title))])
                          ]),
                          _vm._v(" "),
                          _c("tr", [
                            _c("td", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("communication.meeting_duration")
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("td", [
                              _vm._v(
                                "\n                                            " +
                                  _vm._s(_vm._f("moment")(_vm.meeting.date)) +
                                  " "
                              ),
                              _vm.meeting.start_time
                                ? _c("span", [
                                    _vm._v(
                                      _vm._s(
                                        _vm._f("momentTime")(
                                          _vm.meeting.start_time
                                        )
                                      )
                                    )
                                  ])
                                : _vm._e(),
                              _vm._v(" "),
                              _vm.meeting.end_time
                                ? _c("span", [
                                    _vm._v(
                                      " " +
                                        _vm._s(_vm.trans("general.to")) +
                                        " \n                                            " +
                                        _vm._s(
                                          _vm._f("momentTime")(
                                            _vm.meeting.end_time
                                          )
                                        )
                                    )
                                  ])
                                : _vm._e()
                            ])
                          ]),
                          _vm._v(" "),
                          _c("tr", [
                            _c("td", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("communication.meeting_audience")
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c(
                              "td",
                              [
                                _c("meeting-audience", {
                                  attrs: { meeting: _vm.meeting }
                                })
                              ],
                              1
                            )
                          ]),
                          _vm._v(" "),
                          _c("tr", [
                            _c("td", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("communication.meeting_created_by")
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("td", [
                              _vm._v(
                                "\n                                            " +
                                  _vm._s(
                                    _vm.getEmployeeName(
                                      _vm.meeting.user.employee
                                    )
                                  ) +
                                  " "
                              ),
                              _c("br"),
                              _vm._v(
                                " " +
                                  _vm._s(
                                    _vm.getEmployeeDesignationOnDate(
                                      _vm.meeting.user.employee,
                                      _vm.meeting.date
                                    )
                                  ) +
                                  "\n                                        "
                              )
                            ])
                          ]),
                          _vm._v(" "),
                          _c("tr", [
                            _c("td", [
                              _vm._v(_vm._s(_vm.trans("general.created_at")))
                            ]),
                            _vm._v(" "),
                            _c("td", [
                              _vm._v(
                                _vm._s(
                                  _vm._f("momentDateTime")(
                                    _vm.meeting.created_at
                                  )
                                )
                              )
                            ])
                          ]),
                          _vm._v(" "),
                          _c("tr", [
                            _c("td", [
                              _vm._v(_vm._s(_vm.trans("general.updated_at")))
                            ]),
                            _vm._v(" "),
                            _c("td", [
                              _vm._v(
                                _vm._s(
                                  _vm._f("momentDateTime")(
                                    _vm.meeting.updated_at
                                  )
                                )
                              )
                            ])
                          ])
                        ])
                      ]
                    ),
                    _vm._v(" "),
                    _c("div", { staticClass: "p-3" }, [
                      _c("div", {
                        staticClass: "m-t-20 html-view",
                        domProps: { innerHTML: _vm._s(_vm.meeting.description) }
                      }),
                      _vm._v(" "),
                      _vm.attachments.length
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
                                            "/communication/meeting/" +
                                            _vm.meeting.uuid +
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
                                          {
                                            staticClass:
                                              "upload-file-list-item-size"
                                          },
                                          [
                                            _vm._v(
                                              _vm._s(attachment.file_info.size)
                                            )
                                          ]
                                        ),
                                        _vm._v(
                                          " " + _vm._s(attachment.user_filename)
                                        )
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
                  ])
                ])
              ])
            ]),
            _vm._v(" "),
            _c(
              "div",
              { staticClass: "col-12 col-sm-6 p-r-40" },
              [
                _c(
                  "div",
                  {
                    staticClass: "mt-4 btn btn-block btn-success btn-sm",
                    on: {
                      click: function($event) {
                        return _vm.$router.push(
                          "/communication/meeting/" + _vm.meeting.uuid + "/live"
                        )
                      }
                    }
                  },
                  [_vm._v(_vm._s(_vm.trans("communication.join_meeting")))]
                ),
                _vm._v(" "),
                _vm.is_editable
                  ? [
                      _c("h4", { staticClass: "card-title m-3" }, [
                        _vm._v(_vm._s(_vm.trans("communication.audience")))
                      ]),
                      _vm._v(" "),
                      _c("user-search", {
                        on: { searched: _vm.addToSearchResult }
                      }),
                      _vm._v(" "),
                      _c("div", { staticClass: "form-group" }, [
                        _c(
                          "ul",
                          { staticClass: "font-80pc" },
                          _vm._l(_vm.searchResults, function(result) {
                            return _c("li", { key: result.key }, [
                              _vm._v(
                                "\n                                " +
                                  _vm._s(
                                    result.name + " " + result.description_1
                                  ) +
                                  " "
                              ),
                              _c(
                                "span",
                                {
                                  staticClass: "text-right text-danger",
                                  on: {
                                    click: function($event) {
                                      return _vm.deleteResult(result)
                                    }
                                  }
                                },
                                [
                                  _c("i", {
                                    staticClass: "fas fa-times-circle"
                                  })
                                ]
                              ),
                              _vm._v(" "),
                              _c("span", { staticClass: "d-block" }, [
                                _vm._v(
                                  _vm._s(result.description_2) +
                                    " " +
                                    _vm._s(result.contact_number)
                                )
                              ])
                            ])
                          }),
                          0
                        )
                      ]),
                      _vm._v(" "),
                      _vm.searchResults.length
                        ? _c(
                            "button",
                            {
                              staticClass:
                                "btn btn-info waves-effect waves-light",
                              attrs: { type: "button" },
                              on: { click: _vm.addAudience }
                            },
                            [
                              _vm._v(
                                _vm._s(_vm.trans("communication.add_audience"))
                              )
                            ]
                          )
                        : _vm._e(),
                      _vm._v(" "),
                      _c("hr")
                    ]
                  : _vm._e(),
                _vm._v(" "),
                _c("h4", { staticClass: "card-title m-3" }, [
                  _vm._v(
                    _vm._s(_vm.trans("communication.individual_audiences"))
                  )
                ]),
                _vm._v(" "),
                _c(
                  "ol",
                  { staticClass: "font-80pc" },
                  _vm._l(_vm.individual_audiences, function(result) {
                    return _c("li", { key: result.key }, [
                      _vm._v(
                        "\n                        " +
                          _vm._s(result.name + " " + result.description_1) +
                          " "
                      ),
                      _vm.is_editable
                        ? _c(
                            "span",
                            {
                              directives: [
                                {
                                  name: "confirm",
                                  rawName: "v-confirm",
                                  value: { ok: _vm.confirmDelete(result) },
                                  expression: "{ok: confirmDelete(result)}"
                                }
                              ],
                              key: result.key,
                              staticClass:
                                "text-right text-danger custom-button"
                            },
                            [_c("i", { staticClass: "fas fa-times-circle" })]
                          )
                        : _vm._e(),
                      _vm._v(" "),
                      _c("span", { staticClass: "d-block" }, [
                        _vm._v(
                          _vm._s(result.description_2) +
                            " " +
                            _vm._s(result.contact_number)
                        )
                      ])
                    ])
                  }),
                  0
                )
              ],
              2
            )
          ])
        : _vm._e()
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/communication/meeting/audience.vue":
/*!***************************************************************!*\
  !*** ./resources/js/views/communication/meeting/audience.vue ***!
  \***************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _audience_vue_vue_type_template_id_b67db6a0___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./audience.vue?vue&type=template&id=b67db6a0& */ "./resources/js/views/communication/meeting/audience.vue?vue&type=template&id=b67db6a0&");
/* harmony import */ var _audience_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./audience.vue?vue&type=script&lang=js& */ "./resources/js/views/communication/meeting/audience.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _audience_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _audience_vue_vue_type_template_id_b67db6a0___WEBPACK_IMPORTED_MODULE_0__["render"],
  _audience_vue_vue_type_template_id_b67db6a0___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/communication/meeting/audience.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/communication/meeting/audience.vue?vue&type=script&lang=js&":
/*!****************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/audience.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_audience_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./audience.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/audience.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_audience_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/audience.vue?vue&type=template&id=b67db6a0&":
/*!**********************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/audience.vue?vue&type=template&id=b67db6a0& ***!
  \**********************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_audience_vue_vue_type_template_id_b67db6a0___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./audience.vue?vue&type=template&id=b67db6a0& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/audience.vue?vue&type=template&id=b67db6a0&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_audience_vue_vue_type_template_id_b67db6a0___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_audience_vue_vue_type_template_id_b67db6a0___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/views/communication/meeting/show.vue":
/*!***********************************************************!*\
  !*** ./resources/js/views/communication/meeting/show.vue ***!
  \***********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _show_vue_vue_type_template_id_5285c9ae_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./show.vue?vue&type=template&id=5285c9ae&scoped=true& */ "./resources/js/views/communication/meeting/show.vue?vue&type=template&id=5285c9ae&scoped=true&");
/* harmony import */ var _show_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./show.vue?vue&type=script&lang=js& */ "./resources/js/views/communication/meeting/show.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _show_vue_vue_type_style_index_0_id_5285c9ae_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true& */ "./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _show_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _show_vue_vue_type_template_id_5285c9ae_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"],
  _show_vue_vue_type_template_id_5285c9ae_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  "5285c9ae",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/communication/meeting/show.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/communication/meeting/show.vue?vue&type=script&lang=js&":
/*!************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/show.vue?vue&type=script&lang=js& ***!
  \************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./show.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true&":
/*!*********************************************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true& ***!
  \*********************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_style_index_0_id_5285c9ae_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/style-loader!../../../../../node_modules/css-loader!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--14-2!../../../../../node_modules/sass-loader/dist/cjs.js??ref--14-3!../../../../../node_modules/vue-loader/lib??vue-loader-options!./show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=style&index=0&id=5285c9ae&lang=scss&scoped=true&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_style_index_0_id_5285c9ae_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_style_index_0_id_5285c9ae_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_style_index_0_id_5285c9ae_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_style_index_0_id_5285c9ae_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_14_2_node_modules_sass_loader_dist_cjs_js_ref_14_3_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_style_index_0_id_5285c9ae_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/show.vue?vue&type=template&id=5285c9ae&scoped=true&":
/*!******************************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/show.vue?vue&type=template&id=5285c9ae&scoped=true& ***!
  \******************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_template_id_5285c9ae_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./show.vue?vue&type=template&id=5285c9ae&scoped=true& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/show.vue?vue&type=template&id=5285c9ae&scoped=true&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_template_id_5285c9ae_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_show_vue_vue_type_template_id_5285c9ae_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=show.js.map?id=3334aefd7299bfc83b2b