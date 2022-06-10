(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/communication/meeting/index"],{

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

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/index.vue?vue&type=script&lang=js&":
/*!*********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/index.vue?vue&type=script&lang=js& ***!
  \*********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _form__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./form */ "./resources/js/views/communication/meeting/form.vue");
/* harmony import */ var _audience__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./audience */ "./resources/js/views/communication/meeting/audience.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    meetingForm: _form__WEBPACK_IMPORTED_MODULE_0__["default"],
    meetingAudience: _audience__WEBPACK_IMPORTED_MODULE_1__["default"]
  },
  data: function data() {
    return {
      meetings: {
        total: 0,
        data: []
      },
      filter: {
        sort_by: 'date',
        order: 'desc',
        keyword: '',
        course_id: [],
        batch_id: [],
        department_id: [],
        employee_category_id: [],
        page_length: helper.getConfig('page_length')
      },
      orderByOptions: [{
        value: 'created_at',
        translation: i18n.general.created_at
      }, {
        value: 'date',
        translation: i18n.communication.meeting_date
      }, {
        value: 'title',
        translation: i18n.communication.meeting_title
      }],
      courses: [],
      selected_courses: null,
      batches: [],
      selected_batches: null,
      departments: [],
      selected_departments: null,
      employee_categories: [],
      selected_employee_categories: null,
      showFilterPanel: false,
      showCreatePanel: false,
      help_topic: ''
    };
  },
  mounted: function mounted() {
    if (!helper.hasPermission('list-meeting')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    this.getMeetings();
    helper.showDemoNotification(['communication']);
  },
  methods: {
    hasPermission: function hasPermission(permission) {
      return helper.hasPermission(permission);
    },
    getEmployeeName: function getEmployeeName(employee) {
      return helper.getEmployeeName(employee);
    },
    getEmployeeDesignationOnDate: function getEmployeeDesignationOnDate(employee, date) {
      return helper.getEmployeeDesignationOnDate(employee, date);
    },
    getMeetings: function getMeetings(page) {
      var _this = this;

      var loader = this.$loading.show();

      if (typeof page !== 'number') {
        page = 1;
      }

      var url = helper.getFilterURL(this.filter);
      axios.get('/api/meeting?page=' + page + url).then(function (response) {
        _this.meetings = response.meetings;
        _this.courses = response.filters.courses;
        _this.batches = response.filters.batches;
        _this.departments = response.filters.departments;
        _this.employee_categories = response.filters.employee_categories;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    showMeeting: function showMeeting(meeting) {
      this.$router.push('/communication/meeting/' + meeting.uuid);
    },
    editMeeting: function editMeeting(meeting) {
      this.$router.push('/communication/meeting/' + meeting.uuid + '/edit');
    },
    confirmDelete: function confirmDelete(meeting) {
      var _this2 = this;

      return function (dialog) {
        return _this2.deleteMeeting(meeting);
      };
    },
    deleteMeeting: function deleteMeeting(meeting) {
      var _this3 = this;

      var loader = this.$loading.show();
      axios["delete"]('/api/meeting/' + meeting.uuid).then(function (response) {
        toastr.success(response.message);

        _this3.getMeetings();

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    getConfig: function getConfig(config) {
      return helper.getConfig(config);
    },
    onCourseSelect: function onCourseSelect(selectedOption) {
      this.filter.course_id.push(selectedOption.id);
    },
    onCourseRemove: function onCourseRemove(removedOption) {
      this.filter.course_id.splice(this.filter.course_id.indexOf(removedOption.id), 1);
    },
    onBatchSelect: function onBatchSelect(selectedOption) {
      this.filter.batch_id.push(selectedOption.id);
    },
    onBatchRemove: function onBatchRemove(removedOption) {
      this.filter.batch_id.splice(this.filter.batch_id.indexOf(removedOption.id), 1);
    },
    onDepartmentSelect: function onDepartmentSelect(selectedOption) {
      this.filter.department_id.push(selectedOption.id);
    },
    onDepartmentRemove: function onDepartmentRemove(removedOption) {
      this.filter.department_id.splice(this.filter.department_id.indexOf(removedOption.id), 1);
    },
    onEmployeeCategorySelect: function onEmployeeCategorySelect(selectedOption) {
      this.filter.employee_category_id.push(selectedOption.id);
    },
    onEmployeeCategoryRemove: function onEmployeeCategoryRemove(removedOption) {
      this.filter.employee_category_id.splice(this.filter.employee_category_id.indexOf(removedOption.id), 1);
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
  watch: {
    'filter.sort_by': function filterSort_by(val) {
      this.getMeetings();
    },
    'filter.order': function filterOrder(val) {
      this.getMeetings();
    },
    'filter.page_length': function filterPage_length(val) {
      this.getMeetings();
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

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/index.vue?vue&type=template&id=44d750d6&":
/*!*************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/index.vue?vue&type=template&id=44d750d6& ***!
  \*************************************************************************************************************************************************************************************************************************/
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
                _vm._s(_vm.trans("communication.meeting")) +
                  " \n                    "
              ),
              _vm.meetings.total
                ? _c(
                    "span",
                    { staticClass: "card-subtitle d-none d-sm-inline" },
                    [
                      _vm._v(
                        _vm._s(
                          _vm.trans("general.total_result_found", {
                            count: _vm.meetings.total,
                            from: _vm.meetings.from,
                            to: _vm.meetings.to
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
                _vm.meetings.total &&
                !_vm.showCreatePanel &&
                _vm.hasPermission("create-meeting")
                  ? _c(
                      "button",
                      {
                        directives: [
                          {
                            name: "tooltip",
                            rawName: "v-tooltip",
                            value: _vm.trans("general.add_new"),
                            expression: "trans('general.add_new')"
                          }
                        ],
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
                          _vm._v(
                            _vm._s(_vm.trans("communication.add_new_meeting"))
                          )
                        ])
                      ]
                    )
                  : _vm._e(),
                _vm._v(" "),
                !_vm.showFilterPanel
                  ? _c(
                      "button",
                      {
                        staticClass: "btn btn-info btn-sm",
                        on: {
                          click: function($event) {
                            _vm.showFilterPanel = !_vm.showFilterPanel
                          }
                        }
                      },
                      [
                        _c("i", { staticClass: "fas fa-filter" }),
                        _vm._v(" "),
                        _c("span", { staticClass: "d-none d-sm-inline" }, [
                          _vm._v(_vm._s(_vm.trans("general.filter")))
                        ])
                      ]
                    )
                  : _vm._e(),
                _vm._v(" "),
                _c("sort-by", {
                  attrs: {
                    "order-by-options": _vm.orderByOptions,
                    "sort-by": _vm.filter.sort_by,
                    order: _vm.filter.order
                  },
                  on: {
                    updateSortBy: function(value) {
                      _vm.filter.sort_by = value
                    },
                    updateOrder: function(value) {
                      _vm.filter.order = value
                    }
                  }
                }),
                _vm._v(" "),
                _c("help-button", {
                  on: {
                    clicked: function($event) {
                      _vm.help_topic = "meeting"
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
            _vm.showFilterPanel
              ? _c("div", { staticClass: "card card-form" }, [
                  _c("div", { staticClass: "card-body" }, [
                    _c("h4", { staticClass: "card-title" }, [
                      _vm._v(
                        _vm._s(_vm.trans("general.filter")) +
                          "\n                    "
                      )
                    ]),
                    _vm._v(" "),
                    _c("div", { staticClass: "row" }, [
                      _c("div", { staticClass: "col-12 col-sm-3" }, [
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
                                  placeholder: _vm.trans(
                                    "academic.select_course"
                                  ),
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
                                          "\n                                        " +
                                            _vm._s(
                                              _vm.trans(
                                                "general.no_option_found"
                                              )
                                            ) +
                                            "\n                                    "
                                        )
                                      ]
                                    )
                                  : _vm._e()
                              ]
                            )
                          ],
                          1
                        )
                      ]),
                      _vm._v(" "),
                      _c("div", { staticClass: "col-12 col-sm-3" }, [
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
                                  placeholder: _vm.trans(
                                    "academic.select_batch"
                                  ),
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
                                          "\n                                        " +
                                            _vm._s(
                                              _vm.trans(
                                                "general.no_option_found"
                                              )
                                            ) +
                                            "\n                                    "
                                        )
                                      ]
                                    )
                                  : _vm._e()
                              ]
                            )
                          ],
                          1
                        )
                      ]),
                      _vm._v(" "),
                      _c("div", { staticClass: "col-12 col-sm-3" }, [
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
                                          "\n                                        " +
                                            _vm._s(
                                              _vm.trans(
                                                "general.no_option_found"
                                              )
                                            ) +
                                            "\n                                    "
                                        )
                                      ]
                                    )
                                  : _vm._e()
                              ]
                            )
                          ],
                          1
                        )
                      ]),
                      _vm._v(" "),
                      _c("div", { staticClass: "col-12 col-sm-3" }, [
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
                                          "\n                                        " +
                                            _vm._s(
                                              _vm.trans(
                                                "general.no_option_found"
                                              )
                                            ) +
                                            "\n                                    "
                                        )
                                      ]
                                    )
                                  : _vm._e()
                              ]
                            )
                          ],
                          1
                        )
                      ]),
                      _vm._v(" "),
                      _c("div", { staticClass: "col-12 col-sm-3" }, [
                        _c("div", { staticClass: "form-group" }, [
                          _c("label", { attrs: { for: "" } }, [
                            _vm._v(
                              _vm._s(_vm.trans("communication.meeting_keyword"))
                            )
                          ]),
                          _vm._v(" "),
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.filter.keyword,
                                expression: "filter.keyword"
                              }
                            ],
                            staticClass: "form-control",
                            attrs: { name: "keyword" },
                            domProps: { value: _vm.filter.keyword },
                            on: {
                              input: function($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(
                                  _vm.filter,
                                  "keyword",
                                  $event.target.value
                                )
                              }
                            }
                          })
                        ])
                      ])
                    ]),
                    _vm._v(" "),
                    _c("div", { staticClass: "card-footer text-right" }, [
                      _c(
                        "button",
                        {
                          staticClass: "btn btn-danger",
                          attrs: { type: "button" },
                          on: {
                            click: function($event) {
                              _vm.showFilterPanel = false
                            }
                          }
                        },
                        [_vm._v(_vm._s(_vm.trans("general.cancel")))]
                      ),
                      _vm._v(" "),
                      _c(
                        "button",
                        {
                          staticClass: "btn btn-info waves-effect waves-light",
                          attrs: { type: "button" },
                          on: { click: _vm.getMeetings }
                        },
                        [_vm._v(_vm._s(_vm.trans("general.filter")))]
                      )
                    ])
                  ])
                ])
              : _vm._e()
          ]),
          _vm._v(" "),
          _vm.hasPermission("create-meeting")
            ? _c("transition", { attrs: { name: "fade" } }, [
                _vm.showCreatePanel
                  ? _c("div", { staticClass: "card card-form" }, [
                      _c(
                        "div",
                        { staticClass: "card-body" },
                        [
                          _c("h4", { staticClass: "card-title" }, [
                            _vm._v(
                              _vm._s(_vm.trans("communication.add_new_meeting"))
                            )
                          ]),
                          _vm._v(" "),
                          _c("meeting-form", {
                            on: {
                              completed: _vm.getMeetings,
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
              ])
            : _vm._e(),
          _vm._v(" "),
          _c("div", { staticClass: "card" }, [
            _c(
              "div",
              { staticClass: "card-body" },
              [
                _vm.isDemo
                  ? _c("p", { staticClass: "alert alert-info m-4" }, [
                      _vm._v(
                        _vm._s(
                          _vm.trans(
                            "communication.demo_mode_meeting_description"
                          )
                        )
                      )
                    ])
                  : _vm._e(),
                _vm._v(" "),
                _vm.meetings.total
                  ? _c("div", { staticClass: "table-responsive" }, [
                      _c("table", { staticClass: "table table-sm" }, [
                        _c("thead", [
                          _c("tr", [
                            _c("th", [
                              _vm._v(
                                _vm._s(_vm.trans("communication.meeting_title"))
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("communication.meeting_duration")
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("communication.meeting_audience")
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("communication.meeting_created_by")
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("general.created_at")))
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
                          _vm._l(_vm.meetings.data, function(meeting) {
                            return _c("tr", [
                              _c("td", [
                                _vm._v(
                                  "\n                                    " +
                                    _vm._s(meeting.title) +
                                    "\n                                    "
                                ),
                                meeting.is_live
                                  ? _c(
                                      "span",
                                      { staticClass: "badge badge-success" },
                                      [
                                        _vm._v(
                                          _vm._s(
                                            _vm.trans("communication.live")
                                          )
                                        )
                                      ]
                                    )
                                  : _vm._e(),
                                _vm._v(" "),
                                meeting.is_expired
                                  ? _c(
                                      "span",
                                      { staticClass: "badge badge-danger" },
                                      [
                                        _vm._v(
                                          _vm._s(
                                            _vm.trans("communication.expired")
                                          )
                                        )
                                      ]
                                    )
                                  : _vm._e()
                              ]),
                              _vm._v(" "),
                              _c("td", [
                                _vm._v(
                                  "\n                                    " +
                                    _vm._s(_vm._f("moment")(meeting.date)) +
                                    " "
                                ),
                                meeting.start_time
                                  ? _c("span", [
                                      _vm._v(
                                        _vm._s(
                                          _vm._f("momentTime")(
                                            meeting.start_time
                                          )
                                        )
                                      )
                                    ])
                                  : _vm._e(),
                                _vm._v(" "),
                                meeting.end_time
                                  ? _c("span", [
                                      _vm._v(
                                        " " +
                                          _vm._s(_vm.trans("general.to")) +
                                          " \n                                    " +
                                          _vm._s(
                                            _vm._f("momentTime")(
                                              meeting.end_time
                                            )
                                          )
                                      )
                                    ])
                                  : _vm._e()
                              ]),
                              _vm._v(" "),
                              _c(
                                "td",
                                [
                                  _c("meeting-audience", {
                                    attrs: { meeting: meeting }
                                  })
                                ],
                                1
                              ),
                              _vm._v(" "),
                              _c("td", [
                                _vm._v(
                                  _vm._s(
                                    _vm.getEmployeeName(meeting.user.employee)
                                  ) + " "
                                ),
                                _c("br"),
                                _vm._v(
                                  " " +
                                    _vm._s(
                                      _vm.getEmployeeDesignationOnDate(
                                        meeting.user.employee,
                                        meeting.date
                                      )
                                    )
                                )
                              ]),
                              _vm._v(" "),
                              _c("td", [
                                _vm._v(
                                  _vm._s(
                                    _vm._f("momentDateTime")(meeting.created_at)
                                  )
                                )
                              ]),
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
                                            "general.view_detail"
                                          ),
                                          expression:
                                            "trans('general.view_detail')"
                                        }
                                      ],
                                      staticClass: "btn btn-success btn-sm",
                                      on: {
                                        click: function($event) {
                                          $event.preventDefault()
                                          return _vm.showMeeting(meeting)
                                        }
                                      }
                                    },
                                    [
                                      _c("i", {
                                        staticClass: "fas fa-arrow-circle-right"
                                      })
                                    ]
                                  ),
                                  _vm._v(" "),
                                  _vm.hasPermission("edit-meeting")
                                    ? _c(
                                        "button",
                                        {
                                          directives: [
                                            {
                                              name: "tooltip",
                                              rawName: "v-tooltip",
                                              value: _vm.trans(
                                                "communication.edit_meeting"
                                              ),
                                              expression:
                                                "trans('communication.edit_meeting')"
                                            }
                                          ],
                                          staticClass: "btn btn-info btn-sm",
                                          on: {
                                            click: function($event) {
                                              $event.preventDefault()
                                              return _vm.editMeeting(meeting)
                                            }
                                          }
                                        },
                                        [
                                          _c("i", {
                                            staticClass: "fas fa-edit"
                                          })
                                        ]
                                      )
                                    : _vm._e(),
                                  _vm._v(" "),
                                  _vm.hasPermission("delete-meeting")
                                    ? _c(
                                        "button",
                                        {
                                          directives: [
                                            {
                                              name: "confirm",
                                              rawName: "v-confirm",
                                              value: {
                                                ok: _vm.confirmDelete(meeting)
                                              },
                                              expression:
                                                "{ok: confirmDelete(meeting)}"
                                            },
                                            {
                                              name: "tooltip",
                                              rawName: "v-tooltip",
                                              value: _vm.trans(
                                                "communication.delete_meeting"
                                              ),
                                              expression:
                                                "trans('communication.delete_meeting')"
                                            }
                                          ],
                                          key: meeting.id,
                                          staticClass: "btn btn-danger btn-sm"
                                        },
                                        [
                                          _c("i", {
                                            staticClass: "fas fa-trash"
                                          })
                                        ]
                                      )
                                    : _vm._e()
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
                !_vm.meetings.total
                  ? _c(
                      "module-info",
                      {
                        attrs: {
                          module: "communication",
                          title: "meeting_module_title",
                          description: "meeting_module_description",
                          icon: "list"
                        }
                      },
                      [
                        _c("div", { attrs: { slot: "btn" }, slot: "btn" }, [
                          !_vm.showCreatePanel &&
                          _vm.hasPermission("create-meeting")
                            ? _c(
                                "button",
                                {
                                  staticClass: "btn btn-info btn-md",
                                  on: {
                                    click: function($event) {
                                      _vm.showCreatePanel = !_vm.showCreatePanel
                                    }
                                  }
                                },
                                [
                                  _c("i", { staticClass: "fas fa-plus" }),
                                  _vm._v(
                                    " " + _vm._s(_vm.trans("general.add_new"))
                                  )
                                ]
                              )
                            : _vm._e()
                        ])
                      ]
                    )
                  : _vm._e(),
                _vm._v(" "),
                _c("pagination-record", {
                  attrs: {
                    "page-length": _vm.filter.page_length,
                    records: _vm.meetings
                  },
                  on: {
                    "update:pageLength": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    "update:page-length": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    updateRecords: _vm.getMeetings
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

/***/ "./resources/js/views/communication/meeting/index.vue":
/*!************************************************************!*\
  !*** ./resources/js/views/communication/meeting/index.vue ***!
  \************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_44d750d6___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=44d750d6& */ "./resources/js/views/communication/meeting/index.vue?vue&type=template&id=44d750d6&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/communication/meeting/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_44d750d6___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_44d750d6___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/communication/meeting/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/communication/meeting/index.vue?vue&type=script&lang=js&":
/*!*************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/index.vue?vue&type=script&lang=js& ***!
  \*************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/index.vue?vue&type=template&id=44d750d6&":
/*!*******************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/index.vue?vue&type=template&id=44d750d6& ***!
  \*******************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_44d750d6___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=44d750d6& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/index.vue?vue&type=template&id=44d750d6&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_44d750d6___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_44d750d6___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=53feae2b375f98478300