(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/configuration/library/bookTopic/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/form.vue?vue&type=script&lang=js&":
/*!*******************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/library/book-topic/form.vue?vue&type=script&lang=js& ***!
  \*******************************************************************************************************************************************************************************************/
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
/* harmony default export */ __webpack_exports__["default"] = ({
  data: function data() {
    return {
      bookTopicForm: new Form({
        name: '',
        description: ''
      })
    };
  },
  props: ['id'],
  mounted: function mounted() {
    if (this.id) this.get();
  },
  methods: {
    proceed: function proceed() {
      if (this.id) this.update();else this.store();
    },
    store: function store() {
      var _this = this;

      var loader = this.$loading.show();
      this.bookTopicForm.post('/api/library/book/topic').then(function (response) {
        toastr.success(response.message);

        _this.$emit('completed');

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    get: function get() {
      var _this2 = this;

      var loader = this.$loading.show();
      axios.get('/api/library/book/topic/' + this.id).then(function (response) {
        _this2.bookTopicForm.name = response.name;
        _this2.bookTopicForm.description = response.description;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);

        _this2.$router.push('/configuration/library/book/topic');
      });
    },
    update: function update() {
      var _this3 = this;

      var loader = this.$loading.show();
      this.bookTopicForm.patch('/api/library/book/topic/' + this.id).then(function (response) {
        toastr.success(response.message);
        loader.hide();

        _this3.$router.push('/configuration/library/book/topic');
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/index.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/library/book-topic/index.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _form__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./form */ "./resources/js/views/configuration/library/book-topic/form.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    bookTopicForm: _form__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      book_topics: {
        total: 0,
        data: []
      },
      filter: {
        sort_by: 'name',
        order: 'asc',
        page_length: helper.getConfig('page_length')
      },
      orderByOptions: [{
        value: 'name',
        translation: i18n.library.book_topic_name
      }],
      showCreatePanel: false,
      help_topic: ''
    };
  },
  mounted: function mounted() {
    if (!helper.hasPermission('access-configuration')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    this.getBookTopics();
  },
  methods: {
    getConfig: function getConfig(config) {
      return helper.getConfig(config);
    },
    getBookTopics: function getBookTopics(page) {
      var _this = this;

      var loader = this.$loading.show();

      if (typeof page !== 'number') {
        page = 1;
      }

      var url = helper.getFilterURL(this.filter);
      axios.get('/api/library/book/topic?page=' + page + url).then(function (response) {
        _this.book_topics = response;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    editBookTopic: function editBookTopic(book_topic) {
      this.$router.push('/configuration/library/book/topic/' + book_topic.id + '/edit');
    },
    confirmDelete: function confirmDelete(book_topic) {
      var _this2 = this;

      return function (dialog) {
        return _this2.deleteBookTopic(book_topic);
      };
    },
    deleteBookTopic: function deleteBookTopic(book_topic) {
      var _this3 = this;

      var loader = this.$loading.show();
      axios["delete"]('/api/library/book/topic/' + book_topic.id).then(function (response) {
        toastr.success(response.message);

        _this3.getBookTopics();

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    print: function print() {
      var loader = this.$loading.show();
      axios.post('/api/library/book/topic/print', {
        filter: this.filter
      }).then(function (response) {
        var print = window.open("/print");
        loader.hide();
        print.document.write(response);
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    pdf: function pdf() {
      var _this4 = this;

      var loader = this.$loading.show();
      axios.post('/api/library/book/topic/pdf', {
        filter: this.filter
      }).then(function (response) {
        loader.hide();
        window.open('/download/report/' + response + '?token=' + _this4.authToken);
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    }
  },
  filters: {
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    }
  },
  watch: {
    'filter.sort_by': function filterSort_by(val) {
      this.getBookTopics();
    },
    'filter.order': function filterOrder(val) {
      this.getBookTopics();
    },
    'filter.page_length': function filterPage_length(val) {
      this.getBookTopics();
    }
  },
  computed: {
    authToken: function authToken() {
      return helper.getAuthToken();
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/form.vue?vue&type=template&id=7ebd40ac&":
/*!***********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/library/book-topic/form.vue?vue&type=template&id=7ebd40ac& ***!
  \***********************************************************************************************************************************************************************************************************************************/
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
    "form",
    {
      on: {
        submit: function($event) {
          $event.preventDefault()
          return _vm.proceed($event)
        },
        keydown: function($event) {
          return _vm.bookTopicForm.errors.clear($event.target.name)
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
                _vm._v(_vm._s(_vm.trans("library.book_topic_name")))
              ]),
              _vm._v(" "),
              _c("input", {
                directives: [
                  {
                    name: "model",
                    rawName: "v-model",
                    value: _vm.bookTopicForm.name,
                    expression: "bookTopicForm.name"
                  }
                ],
                staticClass: "form-control",
                attrs: {
                  type: "text",
                  name: "name",
                  placeholder: _vm.trans("library.book_topic_name")
                },
                domProps: { value: _vm.bookTopicForm.name },
                on: {
                  input: function($event) {
                    if ($event.target.composing) {
                      return
                    }
                    _vm.$set(_vm.bookTopicForm, "name", $event.target.value)
                  }
                }
              }),
              _vm._v(" "),
              _c("show-error", {
                attrs: { "form-name": _vm.bookTopicForm, "prop-name": "name" }
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
                _vm._v(_vm._s(_vm.trans("library.book_topic_description")))
              ]),
              _vm._v(" "),
              _c("input", {
                directives: [
                  {
                    name: "model",
                    rawName: "v-model",
                    value: _vm.bookTopicForm.description,
                    expression: "bookTopicForm.description"
                  }
                ],
                staticClass: "form-control",
                attrs: {
                  type: "text",
                  name: "description",
                  placeholder: _vm.trans("library.book_topic_description")
                },
                domProps: { value: _vm.bookTopicForm.description },
                on: {
                  input: function($event) {
                    if ($event.target.composing) {
                      return
                    }
                    _vm.$set(
                      _vm.bookTopicForm,
                      "description",
                      $event.target.value
                    )
                  }
                }
              }),
              _vm._v(" "),
              _c("show-error", {
                attrs: {
                  "form-name": _vm.bookTopicForm,
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
                  value: _vm.id,
                  expression: "id"
                }
              ],
              staticClass: "btn btn-danger waves-effect waves-light ",
              attrs: { to: "/configuration/library/book/topic" }
            },
            [_vm._v(_vm._s(_vm.trans("general.cancel")))]
          ),
          _vm._v(" "),
          !_vm.id
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
              _vm.id
                ? _c("span", [_vm._v(_vm._s(_vm.trans("general.update")))])
                : _c("span", [_vm._v(_vm._s(_vm.trans("general.save")))])
            ]
          )
        ],
        1
      )
    ]
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/index.vue?vue&type=template&id=80e9edcc&":
/*!************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/library/book-topic/index.vue?vue&type=template&id=80e9edcc& ***!
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
  return _c(
    "div",
    [
      _c("div", { staticClass: "page-titles" }, [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-12 col-sm-6" }, [
            _c("h3", { staticClass: "text-themecolor" }, [
              _vm._v(
                _vm._s(_vm.trans("library.book_topic")) +
                  " \n                    "
              ),
              _vm.book_topics.total
                ? _c(
                    "span",
                    { staticClass: "card-subtitle d-none d-sm-inline" },
                    [
                      _vm._v(
                        _vm._s(
                          _vm.trans("general.total_result_found", {
                            count: _vm.book_topics.total,
                            from: _vm.book_topics.from,
                            to: _vm.book_topics.to
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
                _vm.book_topics.total && !_vm.showCreatePanel
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
                            _vm._s(_vm.trans("library.add_new_book_topic"))
                          )
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
                _c("div", { staticClass: "btn-group" }, [
                  _c(
                    "button",
                    {
                      directives: [
                        {
                          name: "tooltip",
                          rawName: "v-tooltip",
                          value: _vm.trans("general.more_option"),
                          expression: "trans('general.more_option')"
                        }
                      ],
                      staticClass:
                        "btn btn-info btn-sm dropdown-toggle no-caret ",
                      attrs: {
                        type: "button",
                        role: "menu",
                        id: "moreOption",
                        "data-toggle": "dropdown",
                        "aria-haspopup": "true",
                        "aria-expanded": "false"
                      }
                    },
                    [
                      _c("i", { staticClass: "fas fa-ellipsis-h" }),
                      _vm._v(" "),
                      _c("span", { staticClass: "d-none d-sm-inline" })
                    ]
                  ),
                  _vm._v(" "),
                  _c(
                    "div",
                    {
                      class: [
                        "dropdown-menu",
                        _vm.getConfig("direction") == "ltr"
                          ? "dropdown-menu-right"
                          : ""
                      ],
                      attrs: { "aria-labelledby": "moreOption" }
                    },
                    [
                      _c(
                        "button",
                        {
                          staticClass: "dropdown-item custom-dropdown",
                          on: { click: _vm.print }
                        },
                        [
                          _c("i", { staticClass: "fas fa-print" }),
                          _vm._v(" " + _vm._s(_vm.trans("general.print")))
                        ]
                      ),
                      _vm._v(" "),
                      _c(
                        "button",
                        {
                          staticClass: "dropdown-item custom-dropdown",
                          on: { click: _vm.pdf }
                        },
                        [
                          _c("i", { staticClass: "fas fa-file-pdf" }),
                          _vm._v(
                            " " + _vm._s(_vm.trans("general.generate_pdf"))
                          )
                        ]
                      )
                    ]
                  )
                ]),
                _vm._v(" "),
                _c("help-button", {
                  on: {
                    clicked: function($event) {
                      _vm.help_topic = "configuration.library.book-topic"
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
                        _vm._v(_vm._s(_vm.trans("library.add_new_book_topic")))
                      ]),
                      _vm._v(" "),
                      _c("book-topic-form", {
                        on: {
                          completed: _vm.getBookTopics,
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
                _vm.book_topics.total
                  ? _c("div", { staticClass: "table-responsive" }, [
                      _c("table", { staticClass: "table table-sm" }, [
                        _c("thead", [
                          _c("tr", [
                            _c("th", [
                              _vm._v(
                                _vm._s(_vm.trans("library.book_topic_name"))
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("library.book_topic_description")
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
                          _vm._l(_vm.book_topics.data, function(book_topic) {
                            return _c("tr", [
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(book_topic.name)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(book_topic.description)
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
                                            "library.edit_book_topic"
                                          ),
                                          expression:
                                            "trans('library.edit_book_topic')"
                                        }
                                      ],
                                      staticClass: "btn btn-info btn-sm",
                                      on: {
                                        click: function($event) {
                                          $event.preventDefault()
                                          return _vm.editBookTopic(book_topic)
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
                                            ok: _vm.confirmDelete(book_topic)
                                          },
                                          expression:
                                            "{ok: confirmDelete(book_topic)}"
                                        },
                                        {
                                          name: "tooltip",
                                          rawName: "v-tooltip",
                                          value: _vm.trans(
                                            "library.delete_book_topic"
                                          ),
                                          expression:
                                            "trans('library.delete_book_topic')"
                                        }
                                      ],
                                      key: book_topic.id,
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
                !_vm.book_topics.total
                  ? _c(
                      "module-info",
                      {
                        attrs: {
                          module: "library",
                          title: "book_topic_module_title",
                          description: "book_topic_module_description",
                          icon: "list"
                        }
                      },
                      [
                        _c("div", { attrs: { slot: "btn" }, slot: "btn" }, [
                          !_vm.showCreatePanel
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
                    records: _vm.book_topics
                  },
                  on: {
                    "update:pageLength": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    "update:page-length": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    updateRecords: _vm.getBookTopics
                  },
                  nativeOn: {
                    change: function($event) {
                      return _vm.getBookTopics($event)
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

/***/ "./resources/js/views/configuration/library/book-topic/form.vue":
/*!**********************************************************************!*\
  !*** ./resources/js/views/configuration/library/book-topic/form.vue ***!
  \**********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _form_vue_vue_type_template_id_7ebd40ac___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./form.vue?vue&type=template&id=7ebd40ac& */ "./resources/js/views/configuration/library/book-topic/form.vue?vue&type=template&id=7ebd40ac&");
/* harmony import */ var _form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./form.vue?vue&type=script&lang=js& */ "./resources/js/views/configuration/library/book-topic/form.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _form_vue_vue_type_template_id_7ebd40ac___WEBPACK_IMPORTED_MODULE_0__["render"],
  _form_vue_vue_type_template_id_7ebd40ac___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/configuration/library/book-topic/form.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/configuration/library/book-topic/form.vue?vue&type=script&lang=js&":
/*!***********************************************************************************************!*\
  !*** ./resources/js/views/configuration/library/book-topic/form.vue?vue&type=script&lang=js& ***!
  \***********************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./form.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/form.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/configuration/library/book-topic/form.vue?vue&type=template&id=7ebd40ac&":
/*!*****************************************************************************************************!*\
  !*** ./resources/js/views/configuration/library/book-topic/form.vue?vue&type=template&id=7ebd40ac& ***!
  \*****************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_template_id_7ebd40ac___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./form.vue?vue&type=template&id=7ebd40ac& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/form.vue?vue&type=template&id=7ebd40ac&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_template_id_7ebd40ac___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_form_vue_vue_type_template_id_7ebd40ac___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/views/configuration/library/book-topic/index.vue":
/*!***********************************************************************!*\
  !*** ./resources/js/views/configuration/library/book-topic/index.vue ***!
  \***********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_80e9edcc___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=80e9edcc& */ "./resources/js/views/configuration/library/book-topic/index.vue?vue&type=template&id=80e9edcc&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/configuration/library/book-topic/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_80e9edcc___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_80e9edcc___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/configuration/library/book-topic/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/configuration/library/book-topic/index.vue?vue&type=script&lang=js&":
/*!************************************************************************************************!*\
  !*** ./resources/js/views/configuration/library/book-topic/index.vue?vue&type=script&lang=js& ***!
  \************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/configuration/library/book-topic/index.vue?vue&type=template&id=80e9edcc&":
/*!******************************************************************************************************!*\
  !*** ./resources/js/views/configuration/library/book-topic/index.vue?vue&type=template&id=80e9edcc& ***!
  \******************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_80e9edcc___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=80e9edcc& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/library/book-topic/index.vue?vue&type=template&id=80e9edcc&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_80e9edcc___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_80e9edcc___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=1e1a7f25199e98f95d89