(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/configuration/asset/room/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/asset/room/index.vue?vue&type=script&lang=js&":
/*!************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/asset/room/index.vue?vue&type=script&lang=js& ***!
  \************************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _form__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./form */ "./resources/js/views/configuration/asset/room/form.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    roomForm: _form__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      rooms: {
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
        translation: i18n.asset.room_name
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

    this.getRooms();
  },
  methods: {
    getConfig: function getConfig(config) {
      return helper.getConfig(config);
    },
    getRooms: function getRooms(page) {
      var _this = this;

      var loader = this.$loading.show();

      if (typeof page !== 'number') {
        page = 1;
      }

      var url = helper.getFilterURL(this.filter);
      axios.get('/api/asset/room?page=' + page + url).then(function (response) {
        _this.rooms = response;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    editRoom: function editRoom(room) {
      this.$router.push('/configuration/asset/room/' + room.id + '/edit');
    },
    confirmDelete: function confirmDelete(room) {
      var _this2 = this;

      return function (dialog) {
        return _this2.deleteRoom(room);
      };
    },
    deleteRoom: function deleteRoom(room) {
      var _this3 = this;

      var loader = this.$loading.show();
      axios["delete"]('/api/asset/room/' + room.id).then(function (response) {
        toastr.success(response.message);

        _this3.getRooms();

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    print: function print() {
      var loader = this.$loading.show();
      axios.post('/api/asset/room/print', {
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
      axios.post('/api/asset/room/pdf', {
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
      this.getRooms();
    },
    'filter.order': function filterOrder(val) {
      this.getRooms();
    },
    'filter.page_length': function filterPage_length(val) {
      this.getRooms();
    }
  },
  computed: {
    authToken: function authToken() {
      return helper.getAuthToken();
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/asset/room/index.vue?vue&type=template&id=35e804d5&":
/*!****************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/asset/room/index.vue?vue&type=template&id=35e804d5& ***!
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
      _c("div", { staticClass: "page-titles" }, [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-12 col-sm-6" }, [
            _c("h3", { staticClass: "text-themecolor" }, [
              _vm._v(
                _vm._s(_vm.trans("asset.room")) + " \n                    "
              ),
              _vm.rooms.total
                ? _c(
                    "span",
                    { staticClass: "card-subtitle d-none d-sm-inline" },
                    [
                      _vm._v(
                        _vm._s(
                          _vm.trans("general.total_result_found", {
                            count: _vm.rooms.total,
                            from: _vm.rooms.from,
                            to: _vm.rooms.to
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
                _vm.rooms.total && !_vm.showCreatePanel
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
                          _vm._v(_vm._s(_vm.trans("asset.add_new_room")))
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
                      _vm.help_topic = "configuration.asset.room"
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
                        _vm._v(_vm._s(_vm.trans("asset.add_new_room")))
                      ]),
                      _vm._v(" "),
                      _c("room-form", {
                        on: {
                          completed: _vm.getRooms,
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
                _vm.rooms.total
                  ? _c("div", { staticClass: "table-responsive" }, [
                      _c("table", { staticClass: "table table-sm" }, [
                        _c("thead", [
                          _c("tr", [
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("asset.building")))
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(_vm._s(_vm.trans("asset.room_name")))
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(_vm.trans("asset.room_floor_number"))
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(_vm.trans("asset.room_description"))
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
                          _vm._l(_vm.rooms.data, function(room) {
                            return _c("tr", [
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(room.building.name)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", {
                                domProps: { textContent: _vm._s(room.name) }
                              }),
                              _vm._v(" "),
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(room.floor_number)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(room.description)
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
                                          value: _vm.trans("asset.edit_room"),
                                          expression: "trans('asset.edit_room')"
                                        }
                                      ],
                                      staticClass: "btn btn-info btn-sm",
                                      on: {
                                        click: function($event) {
                                          $event.preventDefault()
                                          return _vm.editRoom(room)
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
                                            ok: _vm.confirmDelete(room)
                                          },
                                          expression:
                                            "{ok: confirmDelete(room)}"
                                        },
                                        {
                                          name: "tooltip",
                                          rawName: "v-tooltip",
                                          value: _vm.trans("asset.delete_room"),
                                          expression:
                                            "trans('asset.delete_room')"
                                        }
                                      ],
                                      key: room.id,
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
                !_vm.rooms.total
                  ? _c(
                      "module-info",
                      {
                        attrs: {
                          module: "asset",
                          title: "room_module_title",
                          description: "room_module_description",
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
                    records: _vm.rooms
                  },
                  on: {
                    "update:pageLength": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    "update:page-length": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    updateRecords: _vm.getRooms
                  },
                  nativeOn: {
                    change: function($event) {
                      return _vm.getRooms($event)
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

/***/ "./resources/js/views/configuration/asset/room/index.vue":
/*!***************************************************************!*\
  !*** ./resources/js/views/configuration/asset/room/index.vue ***!
  \***************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_35e804d5___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=35e804d5& */ "./resources/js/views/configuration/asset/room/index.vue?vue&type=template&id=35e804d5&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/configuration/asset/room/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_35e804d5___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_35e804d5___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/configuration/asset/room/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/configuration/asset/room/index.vue?vue&type=script&lang=js&":
/*!****************************************************************************************!*\
  !*** ./resources/js/views/configuration/asset/room/index.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/asset/room/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/configuration/asset/room/index.vue?vue&type=template&id=35e804d5&":
/*!**********************************************************************************************!*\
  !*** ./resources/js/views/configuration/asset/room/index.vue?vue&type=template&id=35e804d5& ***!
  \**********************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_35e804d5___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=35e804d5& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/asset/room/index.vue?vue&type=template&id=35e804d5&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_35e804d5___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_35e804d5___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=346aa571e4bd73718c9b