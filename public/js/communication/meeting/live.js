(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["js/communication/meeting/live"],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/live.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* WEBPACK VAR INJECTION */(function(process) {/* harmony import */ var rtcmulticonnection__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! rtcmulticonnection */ "./node_modules/rtcmulticonnection/dist/RTCMultiConnection.js");
/* harmony import */ var rtcmulticonnection__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(rtcmulticonnection__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var adapterjs__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! adapterjs */ "./node_modules/adapterjs/publish/adapter.min.js");
/* harmony import */ var adapterjs__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(adapterjs__WEBPACK_IMPORTED_MODULE_1__);
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
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
    RTCMultiConnection: rtcmulticonnection__WEBPACK_IMPORTED_MODULE_0___default.a
  },
  data: function data() {
    return {
      uuid: this.$route.params.uuid,
      meeting: {},
      attachments: [],
      roomId: '',
      is_joined: false,
      is_duplicate: false,
      can_share_screen: false,
      is_screen_shared: false,
      screen_share_stream: {},
      socketURL: 'https://socket.scriptmint.com:9001/',
      enableAudio: true,
      enableVideo: true,
      enableLogs: true,
      autoplay: true,
      cameraHeight: 160,
      rtcmConnection: null,
      localVideo: null,
      screen_width: window.innerWidth,
      videoList: [],
      canvas: null,
      is_owner: false,
      scrollOptions: {
        vuescroll: {
          mode: 'native'
        },
        bar: {
          background: '#171A23'
        }
      }
    };
  },
  mounted: function mounted() {
    if (!helper.hasPermission('list-meeting')) {
      helper.notAccessibleMsg();
      this.$router.push('/dashboard');
    }

    if (window.IsDuplicate()) {
      this.is_duplicate = true;
    }

    var vm = this;
    this.rtcmConnection = new rtcmulticonnection__WEBPACK_IMPORTED_MODULE_0___default.a();
    this.rtcmConnection.socketURL = this.socketURL;
    this.rtcmConnection.autoCreateMediaElement = false;
    this.rtcmConnection.enableLogs = this.enableLogs;
    this.rtcmConnection.session = {
      audio: this.enableAudio,
      video: this.enableVideo
    };
    this.rtcmConnection.iceServers = [];
    this.rtcmConnection.iceServers.push({
      urls: ""
    });
    this.rtcmConnection.iceServers.push({
      urls: "",
      credential: process.env.MIX_TURN_CREDENTIAL,
      username: ""
    });
    this.rtcmConnection.sdpConstraints.mandatory = {
      OfferToReceiveAudio: this.enableAudio,
      OfferToReceiveVideo: this.enableVideo
    };

    this.rtcmConnection.onstream = function (stream) {
      var found = vm.videoList.find(function (video) {
        return video.id === stream.streamid;
      });

      if (found === undefined) {
        var screenSharing = false;

        if (stream.hasOwnProperty('stream')) {
          if (stream.stream.isVideo === false && stream.stream.isAudio === false) {
            screenSharing = true;
          }
        }

        var video = {
          id: stream.streamid,
          muted: stream.type === 'local',
          fullName: stream.extra.fullName,
          userUuid: stream.extra.userUuid,
          screenSharing: screenSharing,
          isOwner: stream.extra.isOwner,
          maximized: vm.videoList.length === 0 ? -1 : stream.extra.maximized
        };
        var idx = vm.videoList.findIndex(function (o) {
          return o.userUuid === video.userUuid && o.screenSharing === video.screenSharing;
        });

        if (idx >= 0) {
          vm.videoList.splice(idx, 1);
        }

        if (video.screenSharing && video.userUuid === helper.getAuthUser('uuid')) {} else {
          if (vm.meeting.audience_video_preference) {
            if (vm.is_owner || !vm.is_owner && (video.isOwner || video.userUuid === helper.getAuthUser('uuid'))) {
              vm.videoList.push(video);
            }
          } else {
            vm.videoList.push(video);
          }
        }

        if (stream.type === 'local') {
          video.maximized = -1;
          vm.localVideo = video;
        }
      }

      setTimeout(function () {
        if (vm.$refs.hasOwnProperty('videos')) {
          for (var i = 0, len = vm.$refs.videos.length; i < len; i++) {
            if (vm.$refs.videos[i].id === stream.streamid) {
              vm.$refs.videos[i].srcObject = stream.stream;
              break;
            }
          }
        }
      }, 1000);
    };

    this.rtcmConnection.onstreamended = function (stream) {
      vm.videoList = vm.videoList.filter(function (o) {
        return o.id != stream.streamid;
      });
    };

    this.getMeeting();
  },
  beforeRouteLeave: function beforeRouteLeave(to, from, next) {
    if (this.is_joined) {
      this.leave();
    }

    next();
  },
  methods: {
    getMeeting: function getMeeting() {
      var _this = this;

      var loader = this.$loading.show();
      axios.get('/api/meeting/' + this.uuid).then(function (response) {
        _this.meeting = response.meeting;
        _this.attachments = response.attachments;

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
    highlight: function highlight(item) {
      this.videoList.forEach(function (v) {
        v.maximized = v.id === item.id ? -1 : 0;
      });
    },
    join: function join() {
      var _this2 = this;

      var loader = this.$loading.show();
      axios.post('/api/meeting/' + this.uuid + '/join').then(function (response) {
        _this2.roomId = response.code;

        if (!_this2.roomId) {
          toastr.error(i18n.general.something_wrong);
          loader.hide();
          return;
        }

        var vm = _this2;
        _this2.rtcmConnection.extra = {
          fullName: helper.getAuthUser('name'),
          userUuid: helper.getAuthUser('uuid'),
          isOwner: _this2.is_owner ? true : false,
          maximized: 0
        };

        _this2.rtcmConnection.openOrJoin(_this2.roomId, function (isRoomExist, roomid) {
          if (isRoomExist === false && vm.rtcmConnection.isInitiator === true) {}

          vm.is_joined = true;

          if (vm.meeting.user_id == helper.getAuthUser('id')) {
            vm.can_share_screen = true;
          }
        });

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    leave: function leave() {
      var _this3 = this;

      var loader = this.$loading.show();
      axios.post('/api/meeting/' + this.uuid + '/leave').then(function (response) {
        if (_this3.is_joined) {
          _this3.rtcmConnection.attachStreams.forEach(function (localStream) {
            localStream.stop();
          });

          _this3.videoList = [];
          _this3.is_joined = false;
        }

        loader.hide();
      })["catch"](function (error) {
        loader.hide();
        helper.showErrorMsg(error);
      });
    },
    share: function share() {
      var vm = this;

      if (navigator.getDisplayMedia || navigator.mediaDevices.getDisplayMedia) {
        var addStreamStopListener = function addStreamStopListener(stream, callback) {
          var streamEndedEvent = 'ended';

          if ('oninactive' in stream) {
            streamEndedEvent = 'inactive';
          }

          stream.addEventListener(streamEndedEvent, function () {
            callback();

            callback = function callback() {};
          }, false);
        };

        var onGettingSteam = function onGettingSteam(stream) {
          stream.screenSharing = true;
          vm.rtcmConnection.addStream(stream);
          vm.screen_share_stream = stream;
          vm.is_screen_shared = true;
          addStreamStopListener(stream, function () {
            vm.rtcmConnection.removeStream(stream.streamid);
            vm.is_screen_shared = false;
          });
        };

        var getDisplayMediaError = function getDisplayMediaError(error) {
          console.log('Media error: ' + JSON.stringify(error));
        };

        if (navigator.mediaDevices.getDisplayMedia) {
          navigator.mediaDevices.getDisplayMedia({
            video: true,
            audio: false
          }).then(function (stream) {
            onGettingSteam(stream);
          }, getDisplayMediaError)["catch"](getDisplayMediaError);
        } else if (navigator.getDisplayMedia) {
          navigator.getDisplayMedia({
            video: true
          }).then(function (stream) {
            onGettingSteam(stream);
          }, getDisplayMediaError)["catch"](getDisplayMediaError);
        }
      }
    },
    logEvent: function logEvent(event) {},
    formatDate: function formatDate(date) {
      return helper.formatDate(date);
    },
    formatTime: function formatTime(date) {
      return helper.formatTime(date);
    },
    fullScreen: function fullScreen(item) {
      var elem = document.getElementById(item.id);

      if (elem.requestFullscreen) {
        elem.requestFullscreen();
      } else if (elem.mozRequestFullScreen) {
        elem.mozRequestFullScreen();
      } else if (elem.webkitRequestFullscreen) {
        elem.webkitRequestFullscreen();
      } else if (elem.msRequestFullscreen) {
        elem.msRequestFullscreen();
      }
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
    },
    maximizeVideoHeight: function maximizeVideoHeight() {
      if (this.screen_width < 400) {
        return 180;
      } else if (this.screen_width < 640) {
        return 220;
      } else if (this.screen_width <= 768) {
        return 360;
      } else {
        return 400;
      }
    },
    minimizeVideoHeight: function minimizeVideoHeight() {
      if (this.screen_width < 400) {
        return 180;
      } else if (this.screen_width < 640) {
        return 220;
      } else if (this.screen_width <= 768) {
        return 360;
      } else {
        return 220;
      }
    },
    orderedVideoList: function orderedVideoList() {
      var arr = this.videoList;
      arr.sort(function (a, b) {
        var keyA = new Date(a.maximized),
            keyB = new Date(b.maximized);
        if (keyA < keyB) return -1;
        if (keyA > keyB) return 1;
        return 0;
      });
      return arr;
    }
  }
});
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! ./../../../../../node_modules/process/browser.js */ "./node_modules/process/browser.js")))

/***/ }),

/***/ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css&":
/*!*****************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css& ***!
  \*****************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "\n.icon[data-v-3f6f6198] {\n    margin-right: 10px;\n}\n@media (max-width: 991px) {\n.col-t-m[data-v-3f6f6198] {\n        margin: 4px 0;\n}\n}\n.video-item[data-v-3f6f6198] {\n    display: flex; \n    flex-direction: column; \n    align-items: center; \n    justify-content: space-around; \n    align-self: stretch;\n    background: #171A23; \n    padding: 10px 20px;\n    margin-top: 0.25rem !important;\n    margin-right: 0.25rem !important;\n}\n.video-maximized[data-v-3f6f6198] {\n    flex: 1 0 49.5%;\n}\n.video-minimized[data-v-3f6f6198] {\n    padding-top: 20px;\n    flex: 0 0 19.7%;\n}\n.maximized[data-v-3f6f6198] {\n    order: -1;\n}\n", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css&":
/*!*********************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader??ref--13-1!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--13-2!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css& ***!
  \*********************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../node_modules/css-loader??ref--13-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--13-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css& */ "./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css&");

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

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=template&id=3f6f6198&scoped=true&":
/*!************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/communication/meeting/live.vue?vue&type=template&id=3f6f6198&scoped=true& ***!
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
    {
      staticStyle: {
        width: "100vw",
        "min-height": "100vh",
        background: "#000000",
        padding: "20px"
      }
    },
    [
      _vm.is_duplicate
        ? _c("div", [
            _c("p", [
              _vm._v(
                "\n              " +
                  _vm._s(_vm.trans("communication.duplicate_tab")) +
                  "\n          "
              )
            ])
          ])
        : _c(
            "div",
            [
              _c("vue-scroll", { attrs: { ops: _vm.scrollOptions } }, [
                _c(
                  "div",
                  {
                    staticStyle: { padding: "10px 20px", background: "#171A23" }
                  },
                  [
                    _c("div", { staticClass: "d-flex" }, [
                      _c(
                        "p",
                        {
                          staticClass: "mr-auto p-1",
                          staticStyle: {
                            color: "#AEB5C0",
                            padding: "0",
                            margin: "0"
                          }
                        },
                        [
                          _vm._v(
                            "\n                          " +
                              _vm._s(_vm.meeting.title) +
                              "\n                          "
                          ),
                          _vm.meeting.is_live
                            ? _c(
                                "span",
                                { staticClass: "ml-2 label label-success" },
                                [
                                  _vm._v(
                                    _vm._s(_vm.trans("communication.live"))
                                  )
                                ]
                              )
                            : _vm._e(),
                          _vm._v(" "),
                          _vm.meeting.is_expired
                            ? _c(
                                "span",
                                { staticClass: "ml-2 label label-danger" },
                                [
                                  _vm._v(
                                    _vm._s(_vm.trans("communication.expired"))
                                  )
                                ]
                              )
                            : _vm._e()
                        ]
                      ),
                      _vm._v(" "),
                      _c("div", { staticClass: "p-1" }),
                      _vm._v(" "),
                      _c("div", { staticClass: "p-1" }, [
                        _c(
                          "span",
                          {
                            directives: [
                              {
                                name: "tooltip",
                                rawName: "v-tooltip",
                                value: _vm.trans(
                                  "communication.back_to_meeting"
                                ),
                                expression:
                                  "trans('communication.back_to_meeting')"
                              }
                            ],
                            staticClass: "icon custom-button",
                            on: {
                              click: function($event) {
                                return _vm.$router.push(
                                  "/communication/meeting/" + _vm.meeting.uuid
                                )
                              }
                            }
                          },
                          [_c("i", { staticClass: "fa fa-arrow-circle-left" })]
                        )
                      ])
                    ])
                  ]
                ),
                _vm._v(" "),
                _c("div", { staticClass: "container-fluid" }, [
                  _vm.meeting.is_live
                    ? _c("div", { staticClass: "row mt-3" }, [
                        !_vm.is_joined
                          ? _c("div", { staticClass: "col" }, [
                              _c(
                                "button",
                                {
                                  staticClass: "btn btn-block btn-success",
                                  on: { click: _vm.join }
                                },
                                [
                                  _vm._v(
                                    _vm._s(
                                      _vm.trans("communication.join_meeting")
                                    )
                                  )
                                ]
                              )
                            ])
                          : _vm._e(),
                        _vm._v(" "),
                        _vm.is_joined && _vm.can_share_screen
                          ? _c("div", { staticClass: "col" }, [
                              !_vm.is_screen_shared
                                ? _c(
                                    "button",
                                    {
                                      staticClass: "btn btn-block btn-info",
                                      on: { click: _vm.share }
                                    },
                                    [
                                      _vm._v(
                                        _vm._s(
                                          _vm.trans(
                                            "communication.share_screen"
                                          )
                                        )
                                      )
                                    ]
                                  )
                                : _vm._e(),
                              _vm._v(" "),
                              _vm.is_screen_shared
                                ? _c(
                                    "button",
                                    {
                                      staticClass: "btn btn-block btn-info",
                                      attrs: { disabled: "" }
                                    },
                                    [
                                      _vm._v(
                                        _vm._s(
                                          _vm.trans(
                                            "communication.stop_share_screen"
                                          )
                                        )
                                      )
                                    ]
                                  )
                                : _vm._e()
                            ])
                          : _vm._e(),
                        _vm._v(" "),
                        _vm.is_joined
                          ? _c("div", { staticClass: "col" }, [
                              _c(
                                "button",
                                {
                                  staticClass: "btn btn-block btn-danger",
                                  on: { click: _vm.leave }
                                },
                                [
                                  _vm._v(
                                    _vm._s(
                                      _vm.trans("communication.leave_meeting")
                                    )
                                  )
                                ]
                              )
                            ])
                          : _vm._e()
                      ])
                    : _vm._e(),
                  _vm._v(" "),
                  _c(
                    "div",
                    {
                      staticStyle: {
                        display: "flex",
                        height: "auto",
                        "flex-wrap": "wrap",
                        "justify-content": "flex-start",
                        "margin-top": "10px"
                      }
                    },
                    [
                      _c(
                        "div",
                        {
                          staticClass: "video-item mr-1",
                          staticStyle: { flex: "1 0 49.5%" }
                        },
                        [
                          _c(
                            "vue-scroll",
                            { attrs: { ops: _vm.scrollOptions } },
                            [
                              _c("p", [
                                _vm._v(
                                  _vm._s(
                                    _vm.trans(
                                      "communication.meeting_start_time"
                                    )
                                  ) +
                                    ": " +
                                    _vm._s(_vm._f("moment")(_vm.meeting.date)) +
                                    " " +
                                    _vm._s(
                                      _vm._f("momentTime")(
                                        _vm.meeting.start_time
                                      )
                                    )
                                )
                              ]),
                              _vm._v(" "),
                              _c("p", [
                                _vm._v(
                                  _vm._s(
                                    _vm.trans("communication.meeting_end_time")
                                  ) +
                                    ": " +
                                    _vm._s(_vm._f("moment")(_vm.meeting.date)) +
                                    " " +
                                    _vm._s(
                                      _vm._f("momentTime")(_vm.meeting.end_time)
                                    )
                                )
                              ]),
                              _vm._v(" "),
                              _vm.attachments.length
                                ? _c("div", [
                                    _c(
                                      "ul",
                                      {
                                        staticClass: "m-t-10 upload-file-list"
                                      },
                                      _vm._l(_vm.attachments, function(
                                        attachment
                                      ) {
                                        return _c(
                                          "li",
                                          {
                                            key: attachment.uuid,
                                            staticClass: "upload-file-list-item"
                                          },
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
                                                      _vm._s(
                                                        attachment.file_info
                                                          .size
                                                      )
                                                    )
                                                  ]
                                                ),
                                                _vm._v(
                                                  " " +
                                                    _vm._s(
                                                      attachment.user_filename
                                                    )
                                                )
                                              ]
                                            )
                                          ]
                                        )
                                      }),
                                      0
                                    )
                                  ])
                                : _vm._e(),
                              _vm._v(" "),
                              _c("div", {
                                domProps: {
                                  innerHTML: _vm._s(_vm.meeting.description)
                                }
                              })
                            ]
                          )
                        ],
                        1
                      ),
                      _vm._v(" "),
                      !_vm.meeting.is_live && !_vm.meeting.is_expired
                        ? [
                            _c(
                              "div",
                              {
                                staticClass: "video-item",
                                staticStyle: { flex: "1 0 49.5%" }
                              },
                              [
                                _c("p", { staticClass: "text-center" }, [
                                  _vm._v(
                                    _vm._s(
                                      _vm.trans(
                                        "communication.meeting_scheduled",
                                        {
                                          date: _vm.formatDate(
                                            _vm.meeting.date
                                          ),
                                          time: _vm.formatTime(
                                            _vm.meeting.start_time
                                          )
                                        }
                                      )
                                    )
                                  )
                                ])
                              ]
                            )
                          ]
                        : _vm._e(),
                      _vm._v(" "),
                      _vm.meeting.is_expired
                        ? [
                            _c(
                              "div",
                              {
                                staticClass: "video-item",
                                staticStyle: { flex: "1 0 49.5%" }
                              },
                              [
                                _c("p", { staticClass: "text-center" }, [
                                  _vm._v(
                                    _vm._s(
                                      _vm.trans("communication.meeting_ended", {
                                        date: _vm.formatDate(_vm.meeting.date),
                                        time: _vm.formatTime(
                                          _vm.meeting.end_time
                                        )
                                      })
                                    )
                                  )
                                ])
                              ]
                            )
                          ]
                        : _vm._e(),
                      _vm._v(" "),
                      _vm.meeting.is_live
                        ? [
                            !_vm.is_joined
                              ? _c(
                                  "div",
                                  {
                                    staticClass: "video-item",
                                    staticStyle: { flex: "1 0 49.5%" }
                                  },
                                  [
                                    _c("p", { staticClass: "text-center" }, [
                                      _vm._v(
                                        _vm._s(
                                          _vm.trans(
                                            "communication.join_meeting_instruction"
                                          )
                                        )
                                      )
                                    ])
                                  ]
                                )
                              : _vm._e(),
                            _vm._v(" "),
                            _vm.is_joined
                              ? _vm._l(_vm.orderedVideoList, function(
                                  item,
                                  index
                                ) {
                                  return _c(
                                    "div",
                                    {
                                      key: item.id,
                                      class: [
                                        "video-item",
                                        index === 0 || _vm.screen_width <= 768
                                          ? "video-maximized"
                                          : "video-minimized",
                                        item.maximized ? "maxmized" : ""
                                      ]
                                    },
                                    [
                                      _c("video", {
                                        ref: "videos",
                                        refInFor: true,
                                        attrs: {
                                          autoplay: "",
                                          height:
                                            index === 0
                                              ? _vm.maximizeVideoHeight
                                              : _vm.minimizeVideoHeight,
                                          playsinline: "",
                                          id: item.id
                                        },
                                        domProps: { muted: item.muted }
                                      }),
                                      _vm._v(" "),
                                      _c("p", { staticClass: "mt-3" }, [
                                        _vm._v(
                                          "\n                                      " +
                                            _vm._s(item.fullName) +
                                            " "
                                        ),
                                        item.screenSharing
                                          ? _c("span", [
                                              _vm._v(
                                                _vm._s(
                                                  _vm.trans(
                                                    "communication.screen"
                                                  )
                                                )
                                              )
                                            ])
                                          : _vm._e(),
                                        _vm._v(" "),
                                        item.maximized != -1
                                          ? _c(
                                              "span",
                                              {
                                                staticClass:
                                                  "ml-2 custom-button",
                                                on: {
                                                  click: function($event) {
                                                    return _vm.highlight(item)
                                                  }
                                                }
                                              },
                                              [
                                                _c("i", {
                                                  staticClass:
                                                    "fas fa-expand-arrows-alt"
                                                })
                                              ]
                                            )
                                          : _vm._e(),
                                        _vm._v(" "),
                                        index === 0
                                          ? _c(
                                              "span",
                                              {
                                                staticClass:
                                                  "ml-2 custom-button",
                                                on: {
                                                  click: function($event) {
                                                    return _vm.fullScreen(item)
                                                  }
                                                }
                                              },
                                              [
                                                _c("i", {
                                                  staticClass: "fas fa-expand"
                                                })
                                              ]
                                            )
                                          : _vm._e()
                                      ])
                                    ]
                                  )
                                })
                              : _vm._e()
                          ]
                        : _vm._e()
                    ],
                    2
                  )
                ])
              ])
            ],
            1
          )
    ]
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/communication/meeting/live.vue":
/*!***********************************************************!*\
  !*** ./resources/js/views/communication/meeting/live.vue ***!
  \***********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _live_vue_vue_type_template_id_3f6f6198_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./live.vue?vue&type=template&id=3f6f6198&scoped=true& */ "./resources/js/views/communication/meeting/live.vue?vue&type=template&id=3f6f6198&scoped=true&");
/* harmony import */ var _live_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./live.vue?vue&type=script&lang=js& */ "./resources/js/views/communication/meeting/live.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _live_vue_vue_type_style_index_0_id_3f6f6198_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css& */ "./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _live_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _live_vue_vue_type_template_id_3f6f6198_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"],
  _live_vue_vue_type_template_id_3f6f6198_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  "3f6f6198",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/communication/meeting/live.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/communication/meeting/live.vue?vue&type=script&lang=js&":
/*!************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/live.vue?vue&type=script&lang=js& ***!
  \************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./live.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css&":
/*!********************************************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css& ***!
  \********************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_style_index_0_id_3f6f6198_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/style-loader!../../../../../node_modules/css-loader??ref--13-1!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--13-2!../../../../../node_modules/vue-loader/lib??vue-loader-options!./live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js?!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=style&index=0&id=3f6f6198&scoped=true&lang=css&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_style_index_0_id_3f6f6198_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_style_index_0_id_3f6f6198_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_style_index_0_id_3f6f6198_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_style_index_0_id_3f6f6198_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_style_loader_index_js_node_modules_css_loader_index_js_ref_13_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_13_2_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_style_index_0_id_3f6f6198_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ "./resources/js/views/communication/meeting/live.vue?vue&type=template&id=3f6f6198&scoped=true&":
/*!******************************************************************************************************!*\
  !*** ./resources/js/views/communication/meeting/live.vue?vue&type=template&id=3f6f6198&scoped=true& ***!
  \******************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_template_id_3f6f6198_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./live.vue?vue&type=template&id=3f6f6198&scoped=true& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/communication/meeting/live.vue?vue&type=template&id=3f6f6198&scoped=true&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_template_id_3f6f6198_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_live_vue_vue_type_template_id_3f6f6198_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);
//# sourceMappingURL=live.js.map?id=6cfca0464d866b9ff74c