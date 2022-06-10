(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/exam/online-exam/questions"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/question-form.vue?vue&type=script&lang=js&":
/*!************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/online-exam/question-form.vue?vue&type=script&lang=js& ***!
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
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
  props: ['id', 'onlineExam', 'question'],
  data: function data() {
    return {
      onlineExamQuestionForm: new Form({
        question: '',
        image: '',
        mark: '',
        question_type: 'mcq',
        options: []
      }),
      online_exam_question_types: []
    };
  },
  mounted: function mounted() {
    var _this = this;

    this.getPreRequisite();

    if (this.onlineExam.exam_type == 'mcq') {
      this.onlineExamQuestionForm.question_type = 'mcq';
    }

    if (this.id) {
      this.onlineExamQuestionForm.question = this.question.question;
      this.onlineExamQuestionForm.image = this.question.image;
      this.onlineExamQuestionForm.mark = this.question.mark;
      this.onlineExamQuestionForm.question_type = this.question.question_type;
      this.question.answers.forEach(function (answer) {
        _this.onlineExamQuestionForm.options.push({
          title: answer.title,
          is_correct_answer: answer.is_correct_answer,
          image: answer.image
        });
      });
    }
  },
  methods: {
    getOptionTitle: function getOptionTitle(index) {
      return 'option_title_' + index;
    },
    getOptionId: function getOptionId(index) {
      return 'option_id_' + index;
    },
    getPreRequisite: function getPreRequisite() {
      var _this2 = this;

      axios.get('/api/online-exam/pre-requisite').then(function (response) {
        _this2.online_exam_question_types = response.online_exam_question_types;
      });
    },
    addNewOption: function addNewOption() {
      this.onlineExamQuestionForm.options.push({
        image: '',
        title: '',
        is_correct_option: ''
      });
    },
    confirmDelete: function confirmDelete(index) {
      var _this3 = this;

      return function (dialog) {
        return _this3.deleteOption(index);
      };
    },
    deleteOption: function deleteOption(index) {
      this.onlineExamQuestionForm.options.splice(index, 1);
    },
    proceed: function proceed() {
      if (!this.id) this.submit();else this.update();
    },
    submit: function submit() {
      var _this4 = this;

      var loader = this.$loading.show();
      this.onlineExamQuestionForm.post('/api/online-exam/' + this.onlineExam.uuid + '/question').then(function (response) {
        toastr.success(response.message);

        _this4.$emit('completed');

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    update: function update() {
      var _this5 = this;

      var loader = this.$loading.show();
      this.onlineExamQuestionForm.patch('/api/online-exam/' + this.onlineExam.uuid + '/question/' + this.id).then(function (response) {
        toastr.success(response.message);

        _this5.$emit('completed');

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/questions.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/online-exam/questions.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _detail__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./detail */ "./resources/js/views/exam/online-exam/detail.vue");
/* harmony import */ var _question_form__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./question-form */ "./resources/js/views/exam/online-exam/question-form.vue");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    onlineExamDetail: _detail__WEBPACK_IMPORTED_MODULE_0__["default"],
    questionForm: _question_form__WEBPACK_IMPORTED_MODULE_1__["default"]
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
      question: {},
      showQuestionModal: false
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
      axios.get('/api/online-exam/' + this.uuid).then(function (response) {
        _this.online_exam = response.online_exam;
        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);

        _this.$router.push('/dashboard');
      });
    },
    addQuestion: function addQuestion() {
      this.question = {};
      this.showQuestionModal = true;
    },
    editQuestion: function editQuestion(question) {
      this.question = question;
      this.showQuestionModal = true;
    },
    confirmDelete: function confirmDelete(question) {
      var _this2 = this;

      return function (dialog) {
        return _this2.deleteQuestion(question);
      };
    },
    deleteQuestion: function deleteQuestion(question) {
      var _this3 = this;

      var loader = this.$loading.show();
      axios["delete"]('/api/online-exam/' + this.uuid + '/question/' + question.id).then(function (response) {
        _this3.getOnlineExam();

        toastr.success(response.message);
        loader.hide();
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
    momentTime: function momentTime(time) {
      return helper.formatTime(time);
    },
    momentDateTime: function momentDateTime(date) {
      return helper.formatDateTime(date);
    }
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/question-form.vue?vue&type=template&id=51c44664&":
/*!****************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/online-exam/question-form.vue?vue&type=template&id=51c44664& ***!
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
            return _vm.onlineExamQuestionForm.errors.clear($event.target.name)
          }
        }
      },
      [
        _c("div", { staticClass: "row" }, [
          _c("div", { staticClass: "col-12" }, [
            _c(
              "div",
              { staticClass: "form-group" },
              [
                _c("label", { attrs: { for: "" } }, [
                  _vm._v(_vm._s(_vm.trans("exam.online_exam_question")))
                ]),
                _vm._v(" "),
                _c("autosize-textarea", {
                  attrs: {
                    rows: "1",
                    name: "question",
                    placeholder: _vm.trans("exam.online_exam_question")
                  },
                  model: {
                    value: _vm.onlineExamQuestionForm.question,
                    callback: function($$v) {
                      _vm.$set(_vm.onlineExamQuestionForm, "question", $$v)
                    },
                    expression: "onlineExamQuestionForm.question"
                  }
                }),
                _vm._v(" "),
                _c("show-error", {
                  attrs: {
                    "form-name": _vm.onlineExamQuestionForm,
                    "prop-name": "question"
                  }
                })
              ],
              1
            )
          ]),
          _vm._v(" "),
          _c(
            "div",
            { staticClass: "col-12" },
            [
              _c("upload-image", {
                attrs: {
                  id: "image",
                  "button-text": _vm.trans("general.choose_image"),
                  "upload-path": "/online-exam/question/image",
                  "remove-path": "/online-exam/question/image",
                  "image-source": _vm.onlineExamQuestionForm.image
                },
                on: {
                  uploaded: function($event) {
                    _vm.onlineExamQuestionForm.image = $event
                  },
                  removed: function($event) {
                    _vm.onlineExamQuestionForm.image = ""
                  }
                }
              })
            ],
            1
          ),
          _vm._v(" "),
          _c("div", { staticClass: "col-12 col-sm-4" }, [
            _c(
              "div",
              { staticClass: "form-group" },
              [
                _c("label", { attrs: { for: "" } }, [
                  _vm._v(_vm._s(_vm.trans("exam.online_exam_mark")))
                ]),
                _vm._v(" "),
                _c("input", {
                  directives: [
                    {
                      name: "model",
                      rawName: "v-model",
                      value: _vm.onlineExamQuestionForm.mark,
                      expression: "onlineExamQuestionForm.mark"
                    }
                  ],
                  staticClass: "form-control",
                  attrs: {
                    type: "number",
                    name: "mark",
                    placeholder: _vm.trans("exam.online_exam_mark")
                  },
                  domProps: { value: _vm.onlineExamQuestionForm.mark },
                  on: {
                    input: function($event) {
                      if ($event.target.composing) {
                        return
                      }
                      _vm.$set(
                        _vm.onlineExamQuestionForm,
                        "mark",
                        $event.target.value
                      )
                    }
                  }
                }),
                _vm._v(" "),
                _c("show-error", {
                  attrs: {
                    "form-name": _vm.onlineExamQuestionForm,
                    "prop-name": "mark"
                  }
                })
              ],
              1
            )
          ]),
          _vm._v(" "),
          _vm.onlineExamQuestionForm.question_type == "mcq"
            ? _c(
                "div",
                { staticClass: "col-12" },
                [
                  _vm._l(_vm.onlineExamQuestionForm.options, function(
                    option,
                    index
                  ) {
                    return _c("div", { key: index, staticClass: "row" }, [
                      _c("div", { staticClass: "col-12 col-sm-1" }, [
                        _c(
                          "button",
                          {
                            directives: [
                              {
                                name: "confirm",
                                rawName: "v-confirm",
                                value: { ok: _vm.confirmDelete(index) },
                                expression: "{ok: confirmDelete(index)}"
                              },
                              {
                                name: "tooltip",
                                rawName: "v-tooltip",
                                value: _vm.trans("general.delete"),
                                expression: "trans('general.delete')"
                              }
                            ],
                            key: index,
                            staticClass: "btn btn-danger btn-sm",
                            attrs: { type: "button" }
                          },
                          [_c("i", { staticClass: "fas fa-trash" })]
                        )
                      ]),
                      _vm._v(" "),
                      _c("div", { staticClass: "col-12 col-sm-5" }, [
                        _c(
                          "div",
                          { staticClass: "form-group" },
                          [
                            _c("autosize-textarea", {
                              attrs: {
                                rows: "1",
                                name: "getOptionTitle(index)",
                                placeholder: _vm.trans(
                                  "exam.online_exam_option_number",
                                  { attribute: index + 1 }
                                )
                              },
                              model: {
                                value: option.title,
                                callback: function($$v) {
                                  _vm.$set(option, "title", $$v)
                                },
                                expression: "option.title"
                              }
                            }),
                            _vm._v(" "),
                            _c("show-error", {
                              attrs: {
                                "form-name": _vm.onlineExamQuestionForm,
                                "prop-name": _vm.getOptionTitle(index)
                              }
                            })
                          ],
                          1
                        )
                      ]),
                      _vm._v(" "),
                      _c("div", { staticClass: "col-12 col-sm-1" }, [
                        _c("div", { staticClass: "form-group" }, [
                          _c(
                            "label",
                            {
                              directives: [
                                {
                                  name: "tooltip",
                                  rawName: "v-tooltip",
                                  value: _vm.trans(
                                    "exam.online_exam_is_correct_answer"
                                  ),
                                  expression:
                                    "trans('exam.online_exam_is_correct_answer')"
                                }
                              ],
                              staticClass: "custom-control custom-checkbox"
                            },
                            [
                              _c("input", {
                                directives: [
                                  {
                                    name: "model",
                                    rawName: "v-model",
                                    value: option.is_correct_answer,
                                    expression: "option.is_correct_answer"
                                  }
                                ],
                                staticClass: "custom-control-input",
                                attrs: { type: "checkbox", value: "1" },
                                domProps: {
                                  checked: Array.isArray(
                                    option.is_correct_answer
                                  )
                                    ? _vm._i(option.is_correct_answer, "1") > -1
                                    : option.is_correct_answer
                                },
                                on: {
                                  change: function($event) {
                                    var $$a = option.is_correct_answer,
                                      $$el = $event.target,
                                      $$c = $$el.checked ? true : false
                                    if (Array.isArray($$a)) {
                                      var $$v = "1",
                                        $$i = _vm._i($$a, $$v)
                                      if ($$el.checked) {
                                        $$i < 0 &&
                                          _vm.$set(
                                            option,
                                            "is_correct_answer",
                                            $$a.concat([$$v])
                                          )
                                      } else {
                                        $$i > -1 &&
                                          _vm.$set(
                                            option,
                                            "is_correct_answer",
                                            $$a
                                              .slice(0, $$i)
                                              .concat($$a.slice($$i + 1))
                                          )
                                      }
                                    } else {
                                      _vm.$set(option, "is_correct_answer", $$c)
                                    }
                                  }
                                }
                              }),
                              _vm._v(" "),
                              _c(
                                "span",
                                {
                                  staticClass: "custom-control-label",
                                  staticStyle: { "font-size": "80%" }
                                },
                                [_vm._v(" ")]
                              )
                            ]
                          )
                        ])
                      ]),
                      _vm._v(" "),
                      _c(
                        "div",
                        { staticClass: "col-12 col-sm-5" },
                        [
                          _c("upload-image", {
                            attrs: {
                              id: _vm.getOptionId(index),
                              "button-text": _vm.trans("general.choose_image"),
                              "upload-path": "/online-exam/question/image",
                              "remove-path": "/online-exam/question/image",
                              "image-source": option.image
                            },
                            on: {
                              uploaded: function($event) {
                                option.image = $event
                              },
                              removed: function($event) {
                                option.image = ""
                              }
                            }
                          })
                        ],
                        1
                      )
                    ])
                  }),
                  _vm._v(" "),
                  _c("div", { staticClass: "row" }, [
                    _c("div", { staticClass: "col-12" }, [
                      _c(
                        "button",
                        {
                          staticClass: "btn btn-info btn-sm mx-4 m-b-20",
                          attrs: { type: "button" },
                          on: { click: _vm.addNewOption }
                        },
                        [_vm._v(_vm._s(_vm.trans("exam.add_new_option")))]
                      )
                    ])
                  ])
                ],
                2
              )
            : _vm._e()
        ]),
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
      ]
    )
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/questions.vue?vue&type=template&id=c0ef2634&":
/*!************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/exam/online-exam/questions.vue?vue&type=template&id=c0ef2634& ***!
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
  return _c(
    "div",
    [
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
                      to: "/online-exam/" + _vm.online_exam.uuid + "/records"
                    }
                  },
                  [
                    _c("i", { staticClass: "fas fa-list" }),
                    _vm._v(" "),
                    _c("span", { staticClass: "d-none d-sm-inline" }, [
                      _vm._v(_vm._s(_vm.trans("exam.online_exam_record")))
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
              _c(
                "div",
                { staticClass: "card-boy" },
                [
                  _c("h4", { staticClass: "card-title m-3" }, [
                    _vm._v(
                      _vm._s(_vm.trans("exam.online_exam_instructions")) +
                        "\n                            "
                    ),
                    _c(
                      "div",
                      { staticClass: "action-buttons pull-right mr-2" },
                      [
                        _vm.online_exam.is_editable
                          ? _c(
                              "button",
                              {
                                staticClass: "btn btn-info btn-sm",
                                on: { click: _vm.addQuestion }
                              },
                              [
                                _c("i", { staticClass: "fas fa-plus" }),
                                _vm._v(" "),
                                _c(
                                  "span",
                                  { staticClass: "d-none d-sm-inline" },
                                  [
                                    _vm._v(
                                      _vm._s(_vm.trans("exam.add_new_question"))
                                    )
                                  ]
                                )
                              ]
                            )
                          : _vm._e()
                      ]
                    )
                  ]),
                  _vm._v(" "),
                  _c("div", {
                    staticClass: "border-top",
                    staticStyle: { "font-size": "90%", "padding-top": "10px" },
                    domProps: {
                      innerHTML: _vm._s(_vm.online_exam.instructions)
                    }
                  }),
                  _vm._v(" "),
                  _c("hr"),
                  _vm._v(" "),
                  _c("h4", { staticClass: "card-title m-3" }, [
                    _vm._v(_vm._s(_vm.trans("exam.online_exam_questions")))
                  ]),
                  _vm._v(" "),
                  _vm._l(_vm.online_exam.questions, function(question, index) {
                    return _c(
                      "div",
                      {
                        staticClass: "border-bottom my-2",
                        staticStyle: {
                          "font-size": "90%",
                          "margin-right": "20px",
                          padding: "10px",
                          "background-color": "rgb(241, 243, 244)",
                          "border-radius": "5px",
                          color: "#000"
                        }
                      },
                      [
                        _c("p", [
                          _vm._v(
                            "\n                                (" +
                              _vm._s(index + 1) +
                              ") " +
                              _vm._s(question.question) +
                              " \n                                "
                          ),
                          _c("span", { staticClass: "pull-right" }, [
                            _vm._v("(" + _vm._s(question.mark) + ")")
                          ])
                        ]),
                        _vm._v(" "),
                        question.image
                          ? _c(
                              "div",
                              { staticStyle: { padding: "10px" } },
                              [
                                _c("center", [
                                  _c("img", {
                                    staticStyle: { "max-width": "250px" },
                                    attrs: { src: "/" + question.image }
                                  })
                                ])
                              ],
                              1
                            )
                          : _vm._e(),
                        _vm._v(" "),
                        question.question_type == "mcq"
                          ? _c(
                              "div",
                              {
                                staticClass: "row",
                                staticStyle: { "padding-left": "20px" }
                              },
                              _vm._l(question.answers, function(option, idx) {
                                return _c("div", { staticClass: "col-6" }, [
                                  _c("p", [
                                    _vm._v(
                                      "\n                                        (" +
                                        _vm._s(idx + 1) +
                                        ") " +
                                        _vm._s(option.title) +
                                        "\n                                        "
                                    ),
                                    option.is_correct_answer
                                      ? _c("i", {
                                          staticClass:
                                            "fas fa-check-circle text-success"
                                        })
                                      : _vm._e()
                                  ]),
                                  option.image
                                    ? _c(
                                        "div",
                                        { staticStyle: { padding: "10px" } },
                                        [
                                          _c("center", [
                                            _c("img", {
                                              staticStyle: {
                                                "max-width": "150px"
                                              },
                                              attrs: { src: "/" + option.image }
                                            })
                                          ])
                                        ],
                                        1
                                      )
                                    : _vm._e(),
                                  _vm._v(" "),
                                  _c("p")
                                ])
                              }),
                              0
                            )
                          : _vm._e(),
                        _vm._v(" "),
                        _vm.online_exam.is_editable
                          ? _c("div", { staticClass: "pull-right" }, [
                              _c(
                                "button",
                                {
                                  staticClass: "btn btn-sm btn-info m-r-5",
                                  attrs: { type: "button" },
                                  on: {
                                    click: function($event) {
                                      return _vm.editQuestion(question)
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
                                        ok: _vm.confirmDelete(question)
                                      },
                                      expression:
                                        "{ok: confirmDelete(question)}"
                                    }
                                  ],
                                  key: question.id,
                                  staticClass: "btn btn-sm btn-danger",
                                  attrs: { type: "button" }
                                },
                                [_c("i", { staticClass: "fas fa-times" })]
                              )
                            ])
                          : _vm._e(),
                        _vm._v(" "),
                        _c("div", { staticClass: "clearfix" })
                      ]
                    )
                  })
                ],
                2
              )
            ])
          ])
        ])
      ]),
      _vm._v(" "),
      _vm.hasPermission("edit-online-exam") && _vm.showQuestionModal
        ? _c("transition", { attrs: { name: "modal" } }, [
            _c("div", { staticClass: "modal-mask" }, [
              _c("div", { staticClass: "modal-wrapper" }, [
                _c("div", { staticClass: "modal-container modal-lg" }, [
                  _c(
                    "div",
                    { staticClass: "modal-header" },
                    [
                      _vm._t("header", [
                        _vm._v(
                          "\n                            " +
                            _vm._s(_vm.trans("exam.add_new_question")) +
                            "\n                            "
                        ),
                        _c(
                          "span",
                          {
                            staticClass: "float-right pointer",
                            on: {
                              click: function($event) {
                                _vm.showQuestionModal = false
                              }
                            }
                          },
                          [_vm._v("x")]
                        )
                      ])
                    ],
                    2
                  ),
                  _vm._v(" "),
                  _c(
                    "div",
                    { staticClass: "modal-body" },
                    [
                      _vm._t("body", [
                        _c("question-form", {
                          attrs: {
                            id: _vm.question.id,
                            question: _vm.question,
                            onlineExam: _vm.online_exam
                          },
                          on: {
                            completed: _vm.getOnlineExam,
                            cancel: function($event) {
                              _vm.showQuestionModal = !_vm.showQuestionModal
                            }
                          }
                        })
                      ])
                    ],
                    2
                  )
                ])
              ])
            ])
          ])
        : _vm._e()
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/exam/online-exam/question-form.vue":
/*!***************************************************************!*\
  !*** ./resources/js/views/exam/online-exam/question-form.vue ***!
  \***************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _question_form_vue_vue_type_template_id_51c44664___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./question-form.vue?vue&type=template&id=51c44664& */ "./resources/js/views/exam/online-exam/question-form.vue?vue&type=template&id=51c44664&");
/* harmony import */ var _question_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./question-form.vue?vue&type=script&lang=js& */ "./resources/js/views/exam/online-exam/question-form.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _question_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _question_form_vue_vue_type_template_id_51c44664___WEBPACK_IMPORTED_MODULE_0__["render"],
  _question_form_vue_vue_type_template_id_51c44664___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/exam/online-exam/question-form.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/exam/online-exam/question-form.vue?vue&type=script&lang=js&":
/*!****************************************************************************************!*\
  !*** ./resources/js/views/exam/online-exam/question-form.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_question_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./question-form.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/question-form.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_question_form_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/exam/online-exam/question-form.vue?vue&type=template&id=51c44664&":
/*!**********************************************************************************************!*\
  !*** ./resources/js/views/exam/online-exam/question-form.vue?vue&type=template&id=51c44664& ***!
  \**********************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_question_form_vue_vue_type_template_id_51c44664___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./question-form.vue?vue&type=template&id=51c44664& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/question-form.vue?vue&type=template&id=51c44664&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_question_form_vue_vue_type_template_id_51c44664___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_question_form_vue_vue_type_template_id_51c44664___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ }),

/***/ "./resources/js/views/exam/online-exam/questions.vue":
/*!***********************************************************!*\
  !*** ./resources/js/views/exam/online-exam/questions.vue ***!
  \***********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _questions_vue_vue_type_template_id_c0ef2634___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./questions.vue?vue&type=template&id=c0ef2634& */ "./resources/js/views/exam/online-exam/questions.vue?vue&type=template&id=c0ef2634&");
/* harmony import */ var _questions_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./questions.vue?vue&type=script&lang=js& */ "./resources/js/views/exam/online-exam/questions.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _questions_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _questions_vue_vue_type_template_id_c0ef2634___WEBPACK_IMPORTED_MODULE_0__["render"],
  _questions_vue_vue_type_template_id_c0ef2634___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/exam/online-exam/questions.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/exam/online-exam/questions.vue?vue&type=script&lang=js&":
/*!************************************************************************************!*\
  !*** ./resources/js/views/exam/online-exam/questions.vue?vue&type=script&lang=js& ***!
  \************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_questions_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./questions.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/questions.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_questions_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/exam/online-exam/questions.vue?vue&type=template&id=c0ef2634&":
/*!******************************************************************************************!*\
  !*** ./resources/js/views/exam/online-exam/questions.vue?vue&type=template&id=c0ef2634& ***!
  \******************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_questions_vue_vue_type_template_id_c0ef2634___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./questions.vue?vue&type=template&id=c0ef2634& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/exam/online-exam/questions.vue?vue&type=template&id=c0ef2634&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_questions_vue_vue_type_template_id_c0ef2634___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_questions_vue_vue_type_template_id_c0ef2634___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=questions.js.map?id=9abcb630e5fac0283b76