(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/communication/meeting/edit~js/communication/meeting/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/form.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _components_user_search__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @components/user-search */ "./resources/js/components/user-search.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    userSearch: _components_user_search__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      meetingForm: new Form({
        title: '',
        date: '',
        start_time: '',
        end_time: '',
        owner_video_preference: 0,
        audience_video_preference: 0,
        audience: null,
        course_id: [],
        batch_id: [],
        department_id: [],
        employee_category_id: [],
        description: '',
        upload_token: '',
        individual_students: [],
        individual_employees: []
      }),
      start_time: {
        hour: '',
        minute: '',
        meridiem: 'am'
      },
      end_time: {
        hour: '',
        minute: '',
        meridiem: 'am'
      },
      audiences: [],
      courses: [],
      selected_courses: null,
      batches: [],
      selected_batches: null,
      departments: [],
      selected_departments: null,
      employee_categories: [],
      selected_employee_categories: null,
      module_id: '',
      clearAttachment: true,
      searchResults: []
    };
  },
  props: ['uuid'],
  mounted: function mounted() {
    if (!helper.hasPermission('create-meeting') && !helper.hasPermission('edit-meeting')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    this.getPreRequisite();
  },
  methods: {
    hasPermission: function hasPermission(permission) {
      return helper.hasPermission(permission);
    },
    getPreRequisite: function getPreRequisite() {
      var _this = this;

      var loader = this.$loading.show();
      axios.get('/api/meeting/pre-requisite').then(function (response) {
        _this.audiences = response.audiences;
        _this.courses = response.courses;
        _this.batches = response.batches;
        _this.departments = response.departments;
        _this.employee_categories = response.employee_categories;
        if (_this.uuid) _this.get();else _this.meetingForm.upload_token = _this.$uuid.v4();
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    proceed: function proceed() {
      if (this.uuid) this.update();else this.store();
    },
    store: function store() {
      var _this2 = this;

      this.meetingForm.individual_students = [];
      this.meetingForm.individual_employees = [];
      this.searchResults.forEach(function (result) {
        if (result.type === 'student') {
          _this2.meetingForm.individual_students.push(result.id);
        } else {
          _this2.meetingForm.individual_employees.push(result.id);
        }
      });
      this.meetingForm.start_time = helper.toTime(this.start_time);
      this.meetingForm.end_time = helper.toTime(this.end_time);
      var loader = this.$loading.show();
      this.meetingForm.post('/api/meeting').then(function (response) {
        toastr.success(response.message);
        _this2.clearAttachment = !_this2.clearAttachment;
        _this2.meetingForm.upload_token = _this2.$uuid.v4();
        _this2.selected_courses = null;
        _this2.selected_batches = null;
        _this2.selected_departments = null;
        _this2.selected_employee_categories = null;
        _this2.meetingForm.individual_students = [];
        _this2.meetingForm.individual_employees = [];
        _this2.searchResults = [];

        _this2.$emit('completed');

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    get: function get() {
      var _this3 = this;

      var loader = this.$loading.show();
      axios.get('/api/meeting/' + this.uuid).then(function (response) {
        if (!response.is_editable) {
          toastr.error(i18n.user.permission_denied);
          loader.hide();

          _this3.$router.push('/communication/meeting');
        }

        _this3.meetingForm.title = response.meeting.title;
        _this3.meetingForm.date = response.meeting.date;
        _this3.meetingForm.end_date = response.meeting.end_date;
        _this3.meetingForm.description = response.meeting.description;
        _this3.meetingForm.audience = response.meeting.audience;
        _this3.selected_courses = response.meeting.audience == 'selected_course' ? response.selected_audience : [];
        _this3.meetingForm.course_id = response.meeting.audience == 'selected_course' ? _this3.setMultiSelect(response.selected_audience) : [];
        _this3.selected_batches = response.meeting.audience == 'selected_batch' ? response.selected_audience : [];
        _this3.meetingForm.batch_id = response.meeting.audience == 'selected_batch' ? _this3.setMultiSelect(response.selected_audience) : [];
        _this3.selected_departments = response.meeting.audience == 'selected_department' ? response.selected_audience : [];
        _this3.meetingForm.department_id = response.meeting.audience == 'selected_department' ? _this3.setMultiSelect(response.selected_audience) : [];
        _this3.selected_employee_categories = response.meeting.audience == 'selected_employee_category' ? response.selected_audience : [];
        _this3.meetingForm.employee_category_id = response.meeting.audience == 'selected_employee_category' ? _this3.setMultiSelect(response.selected_audience) : [];
        _this3.start_time = response.start_time;
        _this3.end_time = response.end_time;
        _this3.meetingForm.upload_token = response.meeting.upload_token;
        _this3.module_id = response.meeting.id;
        _this3.meetingForm.owner_video_preference = response.meeting.owner_video_preference;
        _this3.meetingForm.audience_video_preference = response.meeting.audience_video_preference;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);

        _this3.$router.push('/communication/meeting');
      });
    },
    update: function update() {
      var _this4 = this;

      this.meetingForm.individual_students = [];
      this.meetingForm.individual_employees = [];
      this.searchResults.forEach(function (result) {
        if (result.type === 'student') {
          _this4.meetingForm.individual_students.push(result.id);
        } else {
          _this4.meetingForm.individual_employees.push(result.id);
        }
      });
      this.meetingForm.start_time = helper.toTime(this.start_time);
      this.meetingForm.end_time = helper.toTime(this.end_time);
      var loader = this.$loading.show();
      this.meetingForm.patch('/api/meeting/' + this.uuid).then(function (response) {
        toastr.success(response.message);
        loader.hide();

        _this4.$router.push('/communication/meeting');
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    onCourseSelect: function onCourseSelect(selectedOption) {
      this.meetingForm.errors.clear('course_id');
      this.meetingForm.course_id.push(selectedOption.id);
    },
    onCourseRemove: function onCourseRemove(removedOption) {
      this.meetingForm.course_id.splice(this.meetingForm.course_id.indexOf(removedOption.id), 1);
    },
    onBatchSelect: function onBatchSelect(selectedOption) {
      this.meetingForm.errors.clear('batch_id');
      this.meetingForm.batch_id.push(selectedOption.id);
    },
    onBatchRemove: function onBatchRemove(removedOption) {
      this.meetingForm.batch_id.splice(this.meetingForm.batch_id.indexOf(removedOption.id), 1);
    },
    onDepartmentSelect: function onDepartmentSelect(selectedOption) {
      this.meetingForm.errors.clear('department_id');
      this.meetingForm.department_id.push(selectedOption.id);
    },
    onDepartmentRemove: function onDepartmentRemove(removedOption) {
      this.meetingForm.department_id.splice(this.meetingForm.department_id.indexOf(removedOption.id), 1);
    },
    onEmployeeCategorySelect: function onEmployeeCategorySelect(selectedOption) {
      this.meetingForm.errors.clear('employee_category_id');
      this.meetingForm.employee_category_id.push(selectedOption.id);
    },
    onEmployeeCategoryRemove: function onEmployeeCategoryRemove(removedOption) {
      this.meetingForm.employee_category_id.splice(this.meetingForm.employee_category_id.indexOf(removedOption.id), 1);
    },
    setMultiSelect: function setMultiSelect(options) {
      var data = [];
      options.forEach(function (option) {
        data.push(option.id);
      });
      return data;
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
    }
  }
});

/***/ }),

/***/ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css&":
/*!*****************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css& ***!
  \*****************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "\n.loading-overlay.is-full-page{\n    z-index: 1060;\n}\n", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css&":
/*!*********************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css& ***!
  \*********************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../node_modules/css-loader??ref--13-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--13-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./form.vue?vue&type=style&index=0&lang=css& */ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css&");

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

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=template&id=072b1170&":
/*!************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/form.vue?vue&type=template&id=072b1170& ***!
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
    _c(
      "form",
      {
        on: {
          submit: function($event) {
            $event.preventDefault()
            return _vm.proceed($event)
          },
          keydown: function($event) {
            return _vm.meetingForm.errors.clear($event.target.name)
          }
        }
      },
      [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-12 col-sm-6" }, [
            _c(
              "div",
              { staticClass: "form-group" },
              [
                _c("label", { attrs: { for: "" } }, [
                  _vm._v(_vm._s(_vm.trans("communication.meeting_title")))
                ]),
                _vm._v(" "),
                _c("input", {
                  directives: [
                    {
                      name: "model",
                      rawName: "v-model",
                      value: _vm.meetingForm.title,
                      expression: "meetingForm.title"
                    }
                  ],
                  staticClass: "form-control",
                  attrs: {
                    type: "text",
                    name: "title",
                    placeholder: _vm.trans("communication.meeting_title")
                  },
                  domProps: { value: _vm.meetingForm.title },
                  on: {
                    input: function($event) {
                      if ($event.target.composing) {
                        return
                      }
                      _vm.$set(_vm.meetingForm, "title", $event.target.value)
                    }
                  }
                }),
                _vm._v(" "),
                _c("show-error", {
                  attrs: { "form-name": _vm.meetingForm, "prop-name": "title" }
                })
              ],
              1
            ),
            _vm._v(" "),
            _c("div", { staticClass: "row" }, [
              _c("div", { staticClass: "col-12 col-sm-6" }, [
                _c(
                  "div",
                  { staticClass: "form-group" },
                  [
                    _c("label", { attrs: { for: "" } }, [
                      _vm._v(_vm._s(_vm.trans("communication.meeting_date")))
                    ]),
                    _vm._v(" "),
                    _c("datepicker", {
                      attrs: {
                        bootstrapStyling: true,
                        placeholder: _vm.trans("communication.meeting_date")
                      },
                      on: {
                        selected: function($event) {
                          return _vm.meetingForm.errors.clear("date")
                        }
                      },
                      model: {
                        value: _vm.meetingForm.date,
                        callback: function($$v) {
                          _vm.$set(_vm.meetingForm, "date", $$v)
                        },
                        expression: "meetingForm.date"
                      }
                    }),
                    _vm._v(" "),
                    _c("show-error", {
                      attrs: {
                        "form-name": _vm.meetingForm,
                        "prop-name": "date"
                      }
                    })
                  ],
                  1
                )
              ]),
              _vm._v(" "),
              _c("div", { staticClass: "col-12 col-sm-6" }, [
                _c(
                  "div",
                  { staticClass: "form-group" },
                  [
                    _c("label", { attrs: { for: "" } }, [
                      _vm._v(
                        _vm._s(_vm.trans("communication.meeting_start_time"))
                      )
                    ]),
                    _vm._v(" "),
                    _c("timepicker", {
                      attrs: {
                        hour: _vm.start_time.hour,
                        minute: _vm.start_time.minute,
                        meridiem: _vm.start_time.meridiem
                      },
                      on: {
                        "update:hour": function($event) {
                          return _vm.$set(_vm.start_time, "hour", $event)
                        },
                        "update:minute": function($event) {
                          return _vm.$set(_vm.start_time, "minute", $event)
                        },
                        "update:meridiem": function($event) {
                          return _vm.$set(_vm.start_time, "meridiem", $event)
                        }
                      }
                    })
                  ],
                  1
                )
              ])
            ]),
            _vm._v(" "),
            _c("div", { staticClass: "row" }, [
              _c("div", { staticClass: "col-12 col-sm-6" }, [
                _c(
                  "div",
                  { staticClass: "form-group" },
                  [
                    _c("label", { attrs: { for: "" } }, [
                      _vm._v(
                        _vm._s(_vm.trans("communication.meeting_end_time"))
                      )
                    ]),
                    _vm._v(" "),
                    _c("timepicker", {
                      attrs: {
                        hour: _vm.end_time.hour,
                        minute: _vm.end_time.minute,
                        meridiem: _vm.end_time.meridiem
                      },
                      on: {
                        "update:hour": function($event) {
                          return _vm.$set(_vm.end_time, "hour", $event)
                        },
                        "update:minute": function($event) {
                          return _vm.$set(_vm.end_time, "minute", $event)
                        },
                        "update:meridiem": function($event) {
                          return _vm.$set(_vm.end_time, "meridiem", $event)
                        }
                      }
                    })
                  ],
                  1
                )
              ]),
              _vm._v(" "),
              _c("div", { staticClass: "col-12 col-sm-6" }, [
                _c("div", { staticClass: "form-group" }, [
                  _c(
                    "label",
                    { staticClass: "custom-control custom-checkbox" },
                    [
                      _c("input", {
                        directives: [
                          {
                            name: "model",
                            rawName: "v-model",
                            value: _vm.meetingForm.audience_video_preference,
                            expression: "meetingForm.audience_video_preference"
                          }
                        ],
                        staticClass: "custom-control-input",
                        attrs: { type: "checkbox", value: "1" },
                        domProps: {
                          checked: Array.isArray(
                            _vm.meetingForm.audience_video_preference
                          )
                            ? _vm._i(
                                _vm.meetingForm.audience_video_preference,
                                "1"
                              ) > -1
                            : _vm.meetingForm.audience_video_preference
                        },
                        on: {
                          change: function($event) {
                            var $$a = _vm.meetingForm.audience_video_preference,
                              $$el = $event.target,
                              $$c = $$el.checked ? true : false
                            if (Array.isArray($$a)) {
                              var $$v = "1",
                                $$i = _vm._i($$a, $$v)
                              if ($$el.checked) {
                                $$i < 0 &&
                                  _vm.$set(
                                    _vm.meetingForm,
                                    "audience_video_preference",
                                    $$a.concat([$$v])
                                  )
                              } else {
                                $$i > -1 &&
                                  _vm.$set(
                                    _vm.meetingForm,
                                    "audience_video_preference",
                                    $$a.slice(0, $$i).concat($$a.slice($$i + 1))
                                  )
                              }
                            } else {
                              _vm.$set(
                                _vm.meetingForm,
                                "audience_video_preference",
                                $$c
                              )
                            }
                          }
                        }
                      }),
                      _vm._v(" "),
                      _c("span", { staticClass: "custom-control-label" }, [
                        _c("small", [
                          _vm._v(
                            _vm._s(
                              _vm.trans(
                                "communication.audience_video_preference"
                              )
                            )
                          )
                        ])
                      ])
                    ]
                  )
                ])
              ])
            ]),
            _vm._v(" "),
            _c("div", { staticClass: "row" }, [
              _c("div", { staticClass: "col-12 col-sm-6" }, [
                _c(
                  "div",
                  { staticClass: "form-group" },
                  [
                    _c("label", { attrs: { for: "" } }, [
                      _vm._v(
                        _vm._s(_vm.trans("communication.meeting_audience"))
                      )
                    ]),
                    _vm._v(" "),
                    _c(
                      "select",
                      {
                        directives: [
                          {
                            name: "model",
                            rawName: "v-model",
                            value: _vm.meetingForm.audience,
                            expression: "meetingForm.audience"
                          }
                        ],
                        staticClass: "custom-select col-12",
                        attrs: { name: "audience" },
                        on: {
                          change: [
                            function($event) {
                              var $$selectedVal = Array.prototype.filter
                                .call($event.target.options, function(o) {
                                  return o.selected
                                })
                                .map(function(o) {
                                  var val = "_value" in o ? o._value : o.value
                                  return val
                                })
                              _vm.$set(
                                _vm.meetingForm,
                                "audience",
                                $event.target.multiple
                                  ? $$selectedVal
                                  : $$selectedVal[0]
                              )
                            },
                            function($event) {
                              return _vm.meetingForm.errors.clear("audience")
                            }
                          ]
                        }
                      },
                      [
                        _c(
                          "option",
                          { attrs: { value: "null", selected: "" } },
                          [_vm._v(_vm._s(_vm.trans("general.select_one")))]
                        ),
                        _vm._v(" "),
                        _vm._l(_vm.audiences, function(option) {
                          return _c(
                            "option",
                            { domProps: { value: option.value } },
                            [
                              _vm._v(
                                "\n                                " +
                                  _vm._s(option.text) +
                                  "\n                              "
                              )
                            ]
                          )
                        })
                      ],
                      2
                    ),
                    _vm._v(" "),
                    _c("show-error", {
                      attrs: {
                        "form-name": _vm.meetingForm,
                        "prop-name": "audience"
                      }
                    })
                  ],
                  1
                )
              ]),
              _vm._v(" "),
              _vm.meetingForm.audience == "selected_course"
                ? _c("div", { staticClass: "col-12 col-sm-6" }, [
                    _c(
                      "div",
                      { staticClass: "form-group" },
                      [
                        _c("label", { attrs: { for: "" } }, [
                          _vm._v(_vm._s(_vm.trans("academic.course")))
                        ]),
                        _vm._v(" "),
                        _c(
                          "v-select",
                          {
                            attrs: {
                              label: "name",
                              "track-by": "id",
                              "group-values": "courses",
                              "group-label": "course_group",
                              "group-select": false,
                              name: "course_id",
                              id: "course_id",
                              options: _vm.courses,
                              placeholder: _vm.trans("academic.select_course"),
                              multiple: true,
                              "close-on-select": false,
                              "clear-on-select": false,
                              "hide-selected": true,
                              selected: _vm.selected_courses
                            },
                            on: {
                              select: _vm.onCourseSelect,
                              remove: _vm.onCourseRemove
                            },
                            model: {
                              value: _vm.selected_courses,
                              callback: function($$v) {
                                _vm.selected_courses = $$v
                              },
                              expression: "selected_courses"
                            }
                          },
                          [
                            !_vm.courses.length
                              ? _c(
                                  "div",
                                  {
                                    staticClass: "multiselect__option",
                                    attrs: { slot: "afterList" },
                                    slot: "afterList"
                                  },
                                  [
                                    _vm._v(
                                      "\n                                    " +
                                        _vm._s(
                                          _vm.trans("general.no_option_found")
                                        ) +
                                        "\n                                "
                                    )
                                  ]
                                )
                              : _vm._e()
                          ]
                        ),
                        _vm._v(" "),
                        _c("show-error", {
                          attrs: {
                            "form-name": _vm.meetingForm,
                            "prop-name": "course_id"
                          }
                        })
                      ],
                      1
                    )
                  ])
                : _vm._e(),
              _vm._v(" "),
              _vm.meetingForm.audience == "selected_batch"
                ? _c("div", { staticClass: "col-12 col-sm-6" }, [
                    _c(
                      "div",
                      { staticClass: "form-group" },
                      [
                        _c("label", { attrs: { for: "" } }, [
                          _vm._v(_vm._s(_vm.trans("academic.batch")))
                        ]),
                        _vm._v(" "),
                        _c(
                          "v-select",
                          {
                            attrs: {
                              label: "name",
                              "track-by": "id",
                              "group-values": "batches",
                              "group-label": "course_group",
                              "group-select": false,
                              name: "batch_id",
                              id: "batch_id",
                              options: _vm.batches,
                              placeholder: _vm.trans("academic.select_batch"),
                              multiple: true,
                              "close-on-select": false,
                              "clear-on-select": false,
                              "hide-selected": true,
                              selected: _vm.selected_batches
                            },
                            on: {
                              select: _vm.onBatchSelect,
                              remove: _vm.onBatchRemove
                            },
                            model: {
                              value: _vm.selected_batches,
                              callback: function($$v) {
                                _vm.selected_batches = $$v
                              },
                              expression: "selected_batches"
                            }
                          },
                          [
                            !_vm.batches.length
                              ? _c(
                                  "div",
                                  {
                                    staticClass: "multiselect__option",
                                    attrs: { slot: "afterList" },
                                    slot: "afterList"
                                  },
                                  [
                                    _vm._v(
                                      "\n                                    " +
                                        _vm._s(
                                          _vm.trans("general.no_option_found")
                                        ) +
                                        "\n                                "
                                    )
                                  ]
                                )
                              : _vm._e()
                          ]
                        ),
                        _vm._v(" "),
                        _c("show-error", {
                          attrs: {
                            "form-name": _vm.meetingForm,
                            "prop-name": "batch_id"
                          }
                        })
                      ],
                      1
                    )
                  ])
                : _vm._e(),
              _vm._v(" "),
              _vm.meetingForm.audience == "selected_department"
                ? _c("div", { staticClass: "col-12 col-sm-6" }, [
                    _c(
                      "div",
                      { staticClass: "form-group" },
                      [
                        _c("label", { attrs: { for: "" } }, [
                          _vm._v(_vm._s(_vm.trans("employee.department")))
                        ]),
                        _vm._v(" "),
                        _c(
                          "v-select",
                          {
                            attrs: {
                              label: "name",
                              "track-by": "id",
                              name: "department_id",
                              id: "department_id",
                              options: _vm.departments,
                              placeholder: _vm.trans(
                                "employee.select_department"
                              ),
                              multiple: true,
                              "close-on-select": false,
                              "clear-on-select": false,
                              "hide-selected": true,
                              selected: _vm.selected_departments
                            },
                            on: {
                              select: _vm.onDepartmentSelect,
                              remove: _vm.onDepartmentRemove
                            },
                            model: {
                              value: _vm.selected_departments,
                              callback: function($$v) {
                                _vm.selected_departments = $$v
                              },
                              expression: "selected_departments"
                            }
                          },
                          [
                            !_vm.departments.length
                              ? _c(
                                  "div",
                                  {
                                    staticClass: "multiselect__option",
                                    attrs: { slot: "afterList" },
                                    slot: "afterList"
                                  },
                                  [
                                    _vm._v(
                                      "\n                                    " +
                                        _vm._s(
                                          _vm.trans("general.no_option_found")
                                        ) +
                                        "\n                                "
                                    )
                                  ]
                                )
                              : _vm._e()
                          ]
                        ),
                        _vm._v(" "),
                        _c("show-error", {
                          attrs: {
                            "form-name": _vm.meetingForm,
                            "prop-name": "department_id"
                          }
                        })
                      ],
                      1
                    )
                  ])
                : _vm._e(),
              _vm._v(" "),
              _vm.meetingForm.audience == "selected_employee_category"
                ? _c("div", { staticClass: "col-12 col-sm-6" }, [
                    _c(
                      "div",
                      { staticClass: "form-group" },
                      [
                        _c("label", { attrs: { for: "" } }, [
                          _vm._v(_vm._s(_vm.trans("employee.category")))
                        ]),
                        _vm._v(" "),
                        _c(
                          "v-select",
                          {
                            attrs: {
                              label: "name",
                              "track-by": "id",
                              name: "employee_category_id",
                              id: "employee_category_id",
                              options: _vm.employee_categories,
                              placeholder: _vm.trans(
                                "employee.select_category"
                              ),
                              multiple: true,
                              "close-on-select": false,
                              "clear-on-select": false,
                              "hide-selected": true,
                              selected: _vm.selected_employee_categories
                            },
                            on: {
                              select: _vm.onEmployeeCategorySelect,
                              remove: _vm.onEmployeeCategoryRemove
                            },
                            model: {
                              value: _vm.selected_employee_categories,
                              callback: function($$v) {
                                _vm.selected_employee_categories = $$v
                              },
                              expression: "selected_employee_categories"
                            }
                          },
                          [
                            !_vm.employee_categories.length
                              ? _c(
                                  "div",
                                  {
                                    staticClass: "multiselect__option",
                                    attrs: { slot: "afterList" },
                                    slot: "afterList"
                                  },
                                  [
                                    _vm._v(
                                      "\n                                    " +
                                        _vm._s(
                                          _vm.trans("general.no_option_found")
                                        ) +
                                        "\n                                "
                                    )
                                  ]
                                )
                              : _vm._e()
                          ]
                        ),
                        _vm._v(" "),
                        _c("show-error", {
                          attrs: {
                            "form-name": _vm.meetingForm,
                            "prop-name": "employee_category_id"
                          }
                        })
                      ],
                      1
                    )
                  ])
                : _vm._e(),
              _vm._v(" "),
              !_vm.uuid
                ? _c(
                    "div",
                    { staticClass: "col-12" },
                    [
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
                                "\n                                    " +
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
                      ])
                    ],
                    1
                  )
                : _vm._e()
            ]),
            _vm._v(" "),
            _c(
              "div",
              { staticClass: "form-group" },
              [
                _c("file-upload-input", {
                  attrs: {
                    "button-text": _vm.trans("general.upload_document"),
                    token: _vm.meetingForm.upload_token,
                    module: "meeting",
                    "clear-file": _vm.clearAttachment,
                    "module-id": _vm.module_id
                  }
                })
              ],
              1
            )
          ]),
          _vm._v(" "),
          _c("div", { staticClass: "col-12 col-sm-6" }, [
            _c(
              "div",
              { staticClass: "form-group" },
              [
                _c("html-editor", {
                  attrs: {
                    name: "description",
                    model: _vm.meetingForm.description,
                    height: "300",
                    isUpdate: _vm.uuid ? true : false
                  },
                  on: {
                    "update:model": function($event) {
                      return _vm.$set(_vm.meetingForm, "description", $event)
                    },
                    clearErrors: function($event) {
                      return _vm.meetingForm.errors.clear("description")
                    }
                  }
                }),
                _vm._v(" "),
                _c("show-error", {
                  attrs: {
                    "form-name": _vm.meetingForm,
                    "prop-name": "description"
                  }
                })
              ],
              1
            )
          ])
        ]),
        _vm._v(" "),
        _c(
          "div",
          { staticClass: "card-footer text-right" },
          [
            _c(
              "router-link",
              {
                directives: [
                  {
                    name: "show",
                    rawName: "v-show",
                    value: _vm.uuid,
                    expression: "uuid"
                  }
                ],
                staticClass: "btn btn-danger waves-effect waves-light ",
                attrs: { to: "/communication/meeting" }
              },
              [_vm._v(_vm._s(_vm.trans("general.cancel")))]
            ),
            _vm._v(" "),
            !_vm.uuid
              ? _c(
                  "button",
                  {
                    staticClass: "btn btn-danger waves-effect waves-light ",
                    attrs: { type: "button" },
                    on: {
                      click: function($event) {
                        return _vm.$emit("cancel")
                      }
                    }
                  },
                  [_vm._v(_vm._s(_vm.trans("general.cancel")))]
                )
              : _vm._e(),
            _vm._v(" "),
            _c(
              "button",
              {
                staticClass: "btn btn-info waves-effect waves-light",
                attrs: { type: "submit" }
              },
              [
                _vm.uuid
                  ? _c("span", [_vm._v(_vm._s(_vm.trans("general.update")))])
                  : _c("span", [_vm._v(_vm._s(_vm.trans("general.save")))])
              ]
            )
          ],
          1
        )
      ]
    )
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/communication/meeting/form.vue":
/*!***********************************************************!*\
  !*** ./resources/js/views/communication/meeting/form.vue ***!
  \***********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _form_vue_vue_type_template_id_072b1170___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./form.vue?vue&type=template&id=072b1170& */ "./resources/js/views/communication/meeting/form.vue?vue&type=template&id=072b1170&");
/* harmony import */ var _form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./form.vue?vue&type=script&lang=js& */ "./resources/js/views/communication/meeting/form.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _form_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./form.vue?vue&type=style&index=0&lang=css& */ "./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _form_vue_vue_type_template_id_072b1170___WEBPACK_IMPORTED_MODULE_0__["render"],
  _form_vue_vue_type_template_id_072b1170___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/communication/meeting/form.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/communication/meeting/form.vue?vue&type=script&lang=js&":
/*!************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/form.vue?vue&type=script&lang=js& ***!
  \************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./form.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css&":
/*!********************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css& ***!
  \********************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/style-loader!../../../../../node_modules/css-loader??ref--13-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--13-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./form.vue?vue&type=style&index=0&lang=css& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=style&index=0&lang=css&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_style_index_0_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/form.vue?vue&type=template&id=072b1170&":
/*!******************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/form.vue?vue&type=template&id=072b1170& ***!
  \******************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_template_id_072b1170___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./form.vue?vue&type=template&id=072b1170& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/form.vue?vue&type=template&id=072b1170&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_template_id_072b1170___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_template_id_072b1170___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=2f75315d007f77b48dc1