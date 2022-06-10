(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/configuration/transport/vehicle/documentType/index"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=script&lang=js&":
/*!*********************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=script&lang=js& ***!
  \*********************************************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _form__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./form */ "./resources/js/views/configuration/transport/vehicle/document-type/form.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    documentTypeForm: _form__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  data: function data() {
    return {
      document_types: {
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
        translation: i18n.transport.vehicle_document_type_name
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

    this.getDocumentTypes();
  },
  methods: {
    getConfig: function getConfig(config) {
      return helper.getConfig(config);
    },
    getDocumentTypes: function getDocumentTypes(page) {
      var _this = this;

      var loader = this.$loading.show();

      if (typeof page !== 'number') {
        page = 1;
      }

      var url = helper.getFilterURL(this.filter);
      axios.get('/api/transport/vehicle/document/type?page=' + page + url).then(function (response) {
        _this.document_types = response;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    editDocumentType: function editDocumentType(document_type) {
      this.$router.push('/configuration/transport/vehicle/document/type/' + document_type.id + '/edit');
    },
    confirmDelete: function confirmDelete(document_type) {
      var _this2 = this;

      return function (dialog) {
        return _this2.deleteDocumentType(document_type);
      };
    },
    deleteDocumentType: function deleteDocumentType(document_type) {
      var _this3 = this;

      var loader = this.$loading.show();
      axios["delete"]('/api/transport/vehicle/document/type/' + document_type.id).then(function (response) {
        toastr.success(response.message);

        _this3.getDocumentTypes();

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    print: function print() {
      var loader = this.$loading.show();
      axios.post('/api/transport/vehicle/document/type/print', {
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
      axios.post('/api/transport/vehicle/document/type/pdf', {
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
      this.getDocumentTypes();
    },
    'filter.order': function filterOrder(val) {
      this.getDocumentTypes();
    },
    'filter.page_length': function filterPage_length(val) {
      this.getDocumentTypes();
    }
  },
  computed: {
    authToken: function authToken() {
      return helper.getAuthToken();
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=template&id=114d165e&":
/*!*************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=template&id=114d165e& ***!
  \*************************************************************************************************************************************************************************************************************************************************/
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
                _vm._s(_vm.trans("transport.vehicle_document_type")) +
                  " \n                    "
              ),
              _vm.document_types.total
                ? _c(
                    "span",
                    { staticClass: "card-subtitle d-none d-sm-inline" },
                    [
                      _vm._v(
                        _vm._s(
                          _vm.trans("general.total_result_found", {
                            count: _vm.document_types.total,
                            from: _vm.document_types.from,
                            to: _vm.document_types.to
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
                _vm.document_types.total && !_vm.showCreatePanel
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
                            _vm._s(
                              _vm.trans(
                                "transport.add_new_vehicle_document_type"
                              )
                            )
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
                      _vm.help_topic =
                        "configuration.transport.vehicle.document-type"
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
                        _vm._v(
                          _vm._s(
                            _vm.trans("transport.add_new_vehicle_document_type")
                          )
                        )
                      ]),
                      _vm._v(" "),
                      _c("document-type-form", {
                        on: {
                          completed: _vm.getDocumentTypes,
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
                _vm.document_types.total
                  ? _c("div", { staticClass: "table-responsive" }, [
                      _c("table", { staticClass: "table table-sm" }, [
                        _c("thead", [
                          _c("tr", [
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans(
                                    "transport.vehicle_document_type_name"
                                  )
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans(
                                    "transport.vehicle_document_type_description"
                                  )
                                )
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(_vm.trans("transport.has_expiry_date"))
                              )
                            ]),
                            _vm._v(" "),
                            _c("th", [
                              _vm._v(
                                _vm._s(
                                  _vm.trans("transport.is_insurance_document")
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
                          _vm._l(_vm.document_types.data, function(
                            document_type
                          ) {
                            return _c("tr", [
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(document_type.name)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", {
                                domProps: {
                                  textContent: _vm._s(document_type.description)
                                }
                              }),
                              _vm._v(" "),
                              _c("td", [
                                document_type.has_expiry_date
                                  ? _c("i", { staticClass: "fas fa-check" })
                                  : _c("i", { staticClass: "fas fa-times" })
                              ]),
                              _vm._v(" "),
                              _c("td", [
                                document_type.is_insurance_document
                                  ? _c("i", { staticClass: "fas fa-check" })
                                  : _c("i", { staticClass: "fas fa-times" })
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
                                            "transport.edit_vehicle_document_type"
                                          ),
                                          expression:
                                            "trans('transport.edit_vehicle_document_type')"
                                        }
                                      ],
                                      staticClass: "btn btn-info btn-sm",
                                      on: {
                                        click: function($event) {
                                          $event.preventDefault()
                                          return _vm.editDocumentType(
                                            document_type
                                          )
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
                                            ok: _vm.confirmDelete(document_type)
                                          },
                                          expression:
                                            "{ok: confirmDelete(document_type)}"
                                        },
                                        {
                                          name: "tooltip",
                                          rawName: "v-tooltip",
                                          value: _vm.trans(
                                            "transport.delete_vehicle_document_type"
                                          ),
                                          expression:
                                            "trans('transport.delete_vehicle_document_type')"
                                        }
                                      ],
                                      key: document_type.id,
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
                !_vm.document_types.total
                  ? _c(
                      "module-info",
                      {
                        attrs: {
                          module: "transport",
                          title: "vehicle_document_type_module_title",
                          description:
                            "vehicle_document_type_module_description",
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
                    records: _vm.document_types
                  },
                  on: {
                    "update:pageLength": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    "update:page-length": function($event) {
                      return _vm.$set(_vm.filter, "page_length", $event)
                    },
                    updateRecords: _vm.getDocumentTypes
                  },
                  nativeOn: {
                    change: function($event) {
                      return _vm.getDocumentTypes($event)
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

/***/ "./resources/js/views/configuration/transport/vehicle/document-type/index.vue":
/*!************************************************************************************!*\
  !*** ./resources/js/views/configuration/transport/vehicle/document-type/index.vue ***!
  \************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_114d165e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=114d165e& */ "./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=template&id=114d165e&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_114d165e___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_114d165e___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/configuration/transport/vehicle/document-type/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=script&lang=js&":
/*!*************************************************************************************************************!*\
  !*** ./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=script&lang=js& ***!
  \*************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=template&id=114d165e&":
/*!*******************************************************************************************************************!*\
  !*** ./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=template&id=114d165e& ***!
  \*******************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_114d165e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=114d165e& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/configuration/transport/vehicle/document-type/index.vue?vue&type=template&id=114d165e&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_114d165e___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_114d165e___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=index.js.map?id=e20ccddbdd5713d869c0