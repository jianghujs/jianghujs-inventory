!function(t,n){if("object"==typeof exports&&"object"==typeof module)module.exports=n();else if("function"==typeof define&&define.amd)define([],n);else{var e=n();for(var r in e)("object"==typeof exports?exports:t)[r]=e[r]}}(window,(function(){return function(t){var n={};function e(r){if(n[r])return n[r].exports;var o=n[r]={i:r,l:!1,exports:{}};return t[r].call(o.exports,o,o.exports,e),o.l=!0,o.exports}return e.m=t,e.c=n,e.d=function(t,n,r){e.o(t,n)||Object.defineProperty(t,n,{enumerable:!0,get:r})},e.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},e.t=function(t,n){if(1&n&&(t=e(t)),8&n)return t;if(4&n&&"object"==typeof t&&t&&t.__esModule)return t;var r=Object.create(null);if(e.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:t}),2&n&&"string"!=typeof t)for(var o in t)e.d(r,o,function(n){return t[n]}.bind(null,o));return r},e.n=function(t){var n=t&&t.__esModule?function(){return t.default}:function(){return t};return e.d(n,"a",n),n},e.o=function(t,n){return Object.prototype.hasOwnProperty.call(t,n)},e.p="",e(e.s=218)}([function(t,n,e){(function(n){var e=function(t){return t&&t.Math==Math&&t};t.exports=e("object"==typeof globalThis&&globalThis)||e("object"==typeof window&&window)||e("object"==typeof self&&self)||e("object"==typeof n&&n)||function(){return this}()||Function("return this")()}).call(this,e(97))},function(t,n){var e=Function.prototype,r=e.bind,o=e.call,i=r&&r.bind(o);t.exports=r?function(t){return t&&i(o,t)}:function(t){return t&&function(){return o.apply(t,arguments)}}},function(t,n){t.exports=function(t){return"function"==typeof t}},function(t,n){t.exports=function(t){try{return!!t()}catch(t){return!0}}},function(t,n,e){var r=e(0),o=e(34),i=e(6),c=e(36),u=e(46),a=e(62),f=o("wks"),s=r.Symbol,l=s&&s.for,p=a?s:s&&s.withoutSetter||c;t.exports=function(t){if(!i(f,t)||!u&&"string"!=typeof f[t]){var n="Symbol."+t;u&&i(s,t)?f[t]=s[t]:f[t]=a&&l?l(n):p(n)}return f[t]}},function(t,n,e){var r=e(0),o=e(25).f,i=e(16),c=e(15),u=e(42),a=e(68),f=e(73);t.exports=function(t,n){var e,s,l,p,v,d=t.target,h=t.global,y=t.stat;if(e=h?r:y?r[d]||u(d,{}):(r[d]||{}).prototype)for(s in n){if(p=n[s],l=t.noTargetGet?(v=o(e,s))&&v.value:e[s],!f(h?s:d+(y?".":"#")+s,t.forced)&&void 0!==l){if(typeof p==typeof l)continue;a(p,l)}(t.sham||l&&l.sham)&&i(p,"sham",!0),c(e,s,p,t)}}},function(t,n,e){var r=e(1),o=e(14),i=r({}.hasOwnProperty);t.exports=Object.hasOwn||function(t,n){return i(o(t),n)}},function(t,n,e){var r=e(3);t.exports=!r((function(){return 7!=Object.defineProperty({},1,{get:function(){return 7}})[1]}))},function(t,n,e){var r=e(0),o=e(7),i=e(63),c=e(10),u=e(27),a=r.TypeError,f=Object.defineProperty;n.f=o?f:function(t,n,e){if(c(t),n=u(n),c(e),i)try{return f(t,n,e)}catch(t){}if("get"in e||"set"in e)throw a("Accessors not supported");return"value"in e&&(t[n]=e.value),t}},function(t,n,e){var r=e(2);t.exports=function(t){return"object"==typeof t?null!==t:r(t)}},function(t,n,e){var r=e(0),o=e(9),i=r.String,c=r.TypeError;t.exports=function(t){if(o(t))return t;throw c(i(t)+" is not an object")}},function(t,n){var e=Function.prototype.call;t.exports=e.bind?e.bind(e):function(){return e.apply(e,arguments)}},function(t,n,e){var r=e(55),o=e(33);t.exports=function(t){return r(o(t))}},function(t,n,e){var r=e(0),o=e(2),i=function(t){return o(t)?t:void 0};t.exports=function(t,n){return arguments.length<2?i(r[t]):r[t]&&r[t][n]}},function(t,n,e){var r=e(0),o=e(33),i=r.Object;t.exports=function(t){return i(o(t))}},function(t,n,e){var r=e(0),o=e(2),i=e(6),c=e(16),u=e(42),a=e(39),f=e(22),s=e(53).CONFIGURABLE,l=f.get,p=f.enforce,v=String(String).split("String");(t.exports=function(t,n,e,a){var f,l=!!a&&!!a.unsafe,d=!!a&&!!a.enumerable,h=!!a&&!!a.noTargetGet,y=a&&void 0!==a.name?a.name:n;o(e)&&("Symbol("===String(y).slice(0,7)&&(y="["+String(y).replace(/^Symbol\(([^)]*)\)/,"$1")+"]"),(!i(e,"name")||s&&e.name!==y)&&c(e,"name",y),(f=p(e)).source||(f.source=v.join("string"==typeof y?y:""))),t!==r?(l?!h&&t[n]&&(d=!0):delete t[n],d?t[n]=e:c(t,n,e)):d?t[n]=e:u(n,e)})(Function.prototype,"toString",(function(){return o(this)&&l(this).source||a(this)}))},function(t,n,e){var r=e(7),o=e(8),i=e(21);t.exports=r?function(t,n,e){return o.f(t,n,i(1,e))}:function(t,n,e){return t[n]=e,t}},function(t,n,e){var r=e(89);t.exports=function(t){return r(t.length)}},,function(t,n,e){var r=e(1),o=r({}.toString),i=r("".slice);t.exports=function(t){return i(o(t),8,-1)}},,function(t,n){t.exports=function(t,n){return{enumerable:!(1&t),configurable:!(2&t),writable:!(4&t),value:n}}},function(t,n,e){var r,o,i,c=e(99),u=e(0),a=e(1),f=e(9),s=e(16),l=e(6),p=e(41),v=e(30),d=e(24),h=u.TypeError,y=u.WeakMap;if(c||p.state){var m=p.state||(p.state=new y),b=a(m.get),g=a(m.has),x=a(m.set);r=function(t,n){if(g(m,t))throw new h("Object already initialized");return n.facade=t,x(m,t,n),n},o=function(t){return b(m,t)||{}},i=function(t){return g(m,t)}}else{var S=v("state");d[S]=!0,r=function(t,n){if(l(t,S))throw new h("Object already initialized");return n.facade=t,s(t,S,n),n},o=function(t){return l(t,S)?t[S]:{}},i=function(t){return l(t,S)}}t.exports={set:r,get:o,has:i,enforce:function(t){return i(t)?o(t):r(t,{})},getterFor:function(t){return function(n){var e;if(!f(n)||(e=o(n)).type!==t)throw h("Incompatible receiver, "+t+" required");return e}}}},,function(t,n){t.exports={}},function(t,n,e){var r=e(7),o=e(11),i=e(60),c=e(21),u=e(12),a=e(27),f=e(6),s=e(63),l=Object.getOwnPropertyDescriptor;n.f=r?l:function(t,n){if(t=u(t),n=a(n),s)try{return l(t,n)}catch(t){}if(f(t,n))return c(!o(i.f,t,n),t[n])}},function(t,n,e){var r=e(1);t.exports=r({}.isPrototypeOf)},function(t,n,e){var r=e(93),o=e(40);t.exports=function(t){var n=r(t,"string");return o(n)?n:n+""}},,function(t,n){t.exports=!1},function(t,n,e){var r=e(34),o=e(36),i=r("keys");t.exports=function(t){return i[t]||(i[t]=o(t))}},function(t,n,e){var r=e(19);t.exports=Array.isArray||function(t){return"Array"==r(t)}},function(t,n,e){var r=e(0),o=e(43),i=e(2),c=e(19),u=e(4)("toStringTag"),a=r.Object,f="Arguments"==c(function(){return arguments}());t.exports=o?c:function(t){var n,e,r;return void 0===t?"Undefined":null===t?"Null":"string"==typeof(e=function(t,n){try{return t[n]}catch(t){}}(n=a(t),u))?e:f?c(n):"Object"==(r=c(n))&&i(n.callee)?"Arguments":r}},function(t,n,e){var r=e(0).TypeError;t.exports=function(t){if(null==t)throw r("Can't call method on "+t);return t}},function(t,n,e){var r=e(29),o=e(41);(t.exports=function(t,n){return o[t]||(o[t]=void 0!==n?n:{})})("versions",[]).push({version:"3.19.3",mode:r?"pure":"global",copyright:"© 2021 Denis Pushkarev (zloirock.ru)"})},function(t,n,e){var r=e(0),o=e(2),i=e(56),c=r.TypeError;t.exports=function(t){if(o(t))return t;throw c(i(t)+" is not a function")}},function(t,n,e){var r=e(1),o=0,i=Math.random(),c=r(1..toString);t.exports=function(t){return"Symbol("+(void 0===t?"":t)+")_"+c(++o+i,36)}},function(t,n,e){var r=e(66),o=e(47).concat("length","prototype");n.f=Object.getOwnPropertyNames||function(t){return r(t,o)}},function(t,n){var e=Math.ceil,r=Math.floor;t.exports=function(t){var n=+t;return n!=n||0===n?0:(n>0?r:e)(n)}},function(t,n,e){var r=e(1),o=e(2),i=e(41),c=r(Function.toString);o(i.inspectSource)||(i.inspectSource=function(t){return c(t)}),t.exports=i.inspectSource},function(t,n,e){var r=e(0),o=e(13),i=e(2),c=e(26),u=e(62),a=r.Object;t.exports=u?function(t){return"symbol"==typeof t}:function(t){var n=o("Symbol");return i(n)&&c(n.prototype,a(t))}},function(t,n,e){var r=e(0),o=e(42),i=r["__core-js_shared__"]||o("__core-js_shared__",{});t.exports=i},function(t,n,e){var r=e(0),o=Object.defineProperty;t.exports=function(t,n){try{o(r,t,{value:n,configurable:!0,writable:!0})}catch(e){r[t]=n}return n}},function(t,n,e){var r={};r[e(4)("toStringTag")]="z",t.exports="[object z]"===String(r)},function(t,n,e){var r=e(0),o=e(9),i=r.document,c=o(i)&&o(i.createElement);t.exports=function(t){return c?i.createElement(t):{}}},,function(t,n,e){var r=e(51),o=e(3);t.exports=!!Object.getOwnPropertySymbols&&!o((function(){var t=Symbol();return!String(t)||!(Object(t)instanceof Symbol)||!Symbol.sham&&r&&r<41}))},function(t,n){t.exports=["constructor","hasOwnProperty","isPrototypeOf","propertyIsEnumerable","toLocaleString","toString","valueOf"]},,function(t,n,e){var r=e(35);t.exports=function(t,n){var e=t[n];return null==e?void 0:r(e)}},function(t,n,e){var r=e(1),o=e(35),i=r(r.bind);t.exports=function(t,n){return o(t),void 0===n?t:i?i(t,n):function(){return t.apply(n,arguments)}}},function(t,n,e){var r,o,i=e(0),c=e(81),u=i.process,a=i.Deno,f=u&&u.versions||a&&a.version,s=f&&f.v8;s&&(o=(r=s.split("."))[0]>0&&r[0]<4?1:+(r[0]+r[1])),!o&&c&&(!(r=c.match(/Edge\/(\d+)/))||r[1]>=74)&&(r=c.match(/Chrome\/(\d+)/))&&(o=+r[1]),t.exports=o},function(t,n,e){var r=e(38),o=Math.max,i=Math.min;t.exports=function(t,n){var e=r(t);return e<0?o(e+n,0):i(e,n)}},function(t,n,e){var r=e(7),o=e(6),i=Function.prototype,c=r&&Object.getOwnPropertyDescriptor,u=o(i,"name"),a=u&&"something"===function(){}.name,f=u&&(!r||r&&c(i,"name").configurable);t.exports={EXISTS:u,PROPER:a,CONFIGURABLE:f}},function(t,n,e){var r=e(1),o=e(3),i=e(2),c=e(32),u=e(13),a=e(39),f=function(){},s=[],l=u("Reflect","construct"),p=/^\s*(?:class|function)\b/,v=r(p.exec),d=!p.exec(f),h=function(t){if(!i(t))return!1;try{return l(f,s,t),!0}catch(t){return!1}};t.exports=!l||o((function(){var t;return h(h.call)||!h(Object)||!h((function(){t=!0}))||t}))?function(t){if(!i(t))return!1;switch(c(t)){case"AsyncFunction":case"GeneratorFunction":case"AsyncGeneratorFunction":return!1}return d||!!v(p,a(t))}:h},function(t,n,e){var r=e(0),o=e(1),i=e(3),c=e(19),u=r.Object,a=o("".split);t.exports=i((function(){return!u("z").propertyIsEnumerable(0)}))?function(t){return"String"==c(t)?a(t,""):u(t)}:u},function(t,n,e){var r=e(0).String;t.exports=function(t){try{return r(t)}catch(t){return"Object"}}},function(t,n,e){var r=e(50),o=e(1),i=e(55),c=e(14),u=e(17),a=e(69),f=o([].push),s=function(t){var n=1==t,e=2==t,o=3==t,s=4==t,l=6==t,p=7==t,v=5==t||l;return function(d,h,y,m){for(var b,g,x=c(d),S=i(x),w=r(h,y),O=u(S),j=0,E=m||a,P=n?E(d,O):e||p?E(d,0):void 0;O>j;j++)if((v||j in S)&&(g=w(b=S[j],j,x),t))if(n)P[j]=g;else if(g)switch(t){case 3:return!0;case 5:return b;case 6:return j;case 2:f(P,b)}else switch(t){case 4:return!1;case 7:f(P,b)}return l?-1:o||s?s:P}};t.exports={forEach:s(0),map:s(1),filter:s(2),some:s(3),every:s(4),find:s(5),findIndex:s(6),filterReject:s(7)}},,,function(t,n,e){"use strict";var r={}.propertyIsEnumerable,o=Object.getOwnPropertyDescriptor,i=o&&!r.call({1:2},1);n.f=i?function(t){var n=o(this,t);return!!n&&n.enumerable}:r},function(t,n,e){var r=e(43),o=e(15),i=e(101);r||o(Object.prototype,"toString",i,{unsafe:!0})},function(t,n,e){var r=e(46);t.exports=r&&!Symbol.sham&&"symbol"==typeof Symbol.iterator},function(t,n,e){var r=e(7),o=e(3),i=e(44);t.exports=!r&&!o((function(){return 7!=Object.defineProperty(i("div"),"a",{get:function(){return 7}}).a}))},function(t,n){n.f=Object.getOwnPropertySymbols},,function(t,n,e){var r=e(1),o=e(6),i=e(12),c=e(91).indexOf,u=e(24),a=r([].push);t.exports=function(t,n){var e,r=i(t),f=0,s=[];for(e in r)!o(u,e)&&o(r,e)&&a(s,e);for(;n.length>f;)o(r,e=n[f++])&&(~c(s,e)||a(s,e));return s}},,function(t,n,e){var r=e(6),o=e(85),i=e(25),c=e(8);t.exports=function(t,n){for(var e=o(n),u=c.f,a=i.f,f=0;f<e.length;f++){var s=e[f];r(t,s)||u(t,s,a(n,s))}}},function(t,n,e){var r=e(100);t.exports=function(t,n){return new(r(t))(0===n?0:n)}},,,function(t,n,e){var r=e(5),o=e(7);r({target:"Object",stat:!0,forced:!o,sham:!o},{defineProperty:e(8).f})},function(t,n,e){var r=e(3),o=e(2),i=/#|\.prototype\./,c=function(t,n){var e=a[u(t)];return e==s||e!=f&&(o(n)?r(n):!!n)},u=c.normalize=function(t){return String(t).replace(i,".").toLowerCase()},a=c.data={},f=c.NATIVE="N",s=c.POLYFILL="P";t.exports=c},function(t,n){t.exports={CSSRuleList:0,CSSStyleDeclaration:0,CSSValueList:0,ClientRectList:0,DOMRectList:0,DOMStringList:0,DOMTokenList:1,DataTransferItemList:0,FileList:0,HTMLAllCollection:0,HTMLCollection:0,HTMLFormElement:0,HTMLSelectElement:0,MediaList:0,MimeTypeArray:0,NamedNodeMap:0,NodeList:1,PaintRequestList:0,Plugin:0,PluginArray:0,SVGLengthList:0,SVGNumberList:0,SVGPathSegList:0,SVGPointList:0,SVGStringList:0,SVGTransformList:0,SourceBufferList:0,StyleSheetList:0,TextTrackCueList:0,TextTrackList:0,TouchList:0}},function(t,n,e){var r=e(44)("span").classList,o=r&&r.constructor&&r.constructor.prototype;t.exports=o===Object.prototype?void 0:o},,,function(t,n,e){"use strict";var r=e(57).forEach,o=e(86)("forEach");t.exports=o?[].forEach:function(t){return r(this,t,arguments.length>1?arguments[1]:void 0)}},,,function(t,n,e){var r=e(13);t.exports=r("navigator","userAgent")||""},,,,function(t,n,e){var r=e(13),o=e(1),i=e(37),c=e(64),u=e(10),a=o([].concat);t.exports=r("Reflect","ownKeys")||function(t){var n=i.f(u(t)),e=c.f;return e?a(n,e(t)):n}},function(t,n,e){"use strict";var r=e(3);t.exports=function(t,n){var e=[][t];return!!e&&r((function(){e.call(null,n||function(){throw 1},1)}))}},,,function(t,n,e){var r=e(38),o=Math.min;t.exports=function(t){return t>0?o(r(t),9007199254740991):0}},,function(t,n,e){var r=e(12),o=e(52),i=e(17),c=function(t){return function(n,e,c){var u,a=r(n),f=i(a),s=o(c,f);if(t&&e!=e){for(;f>s;)if((u=a[s++])!=u)return!0}else for(;f>s;s++)if((t||s in a)&&a[s]===e)return t||s||0;return!t&&-1}};t.exports={includes:c(!0),indexOf:c(!1)}},,function(t,n,e){var r=e(0),o=e(11),i=e(9),c=e(40),u=e(49),a=e(98),f=e(4),s=r.TypeError,l=f("toPrimitive");t.exports=function(t,n){if(!i(t)||c(t))return t;var e,r=u(t,l);if(r){if(void 0===n&&(n="default"),e=o(r,t,n),!i(e)||c(e))return e;throw s("Can't convert object to primitive value")}return void 0===n&&(n="number"),a(t,n)}},,function(t,n,e){"use strict";var r=e(5),o=e(78);r({target:"Array",proto:!0,forced:[].forEach!=o},{forEach:o})},function(t,n,e){var r=e(0),o=e(74),i=e(75),c=e(78),u=e(16),a=function(t){if(t&&t.forEach!==c)try{u(t,"forEach",c)}catch(n){t.forEach=c}};for(var f in o)o[f]&&a(r[f]&&r[f].prototype);a(i)},function(t,n){var e;e=function(){return this}();try{e=e||new Function("return this")()}catch(t){"object"==typeof window&&(e=window)}t.exports=e},function(t,n,e){var r=e(0),o=e(11),i=e(2),c=e(9),u=r.TypeError;t.exports=function(t,n){var e,r;if("string"===n&&i(e=t.toString)&&!c(r=o(e,t)))return r;if(i(e=t.valueOf)&&!c(r=o(e,t)))return r;if("string"!==n&&i(e=t.toString)&&!c(r=o(e,t)))return r;throw u("Can't convert object to primitive value")}},function(t,n,e){var r=e(0),o=e(2),i=e(39),c=r.WeakMap;t.exports=o(c)&&/native code/.test(i(c))},function(t,n,e){var r=e(0),o=e(31),i=e(54),c=e(9),u=e(4)("species"),a=r.Array;t.exports=function(t){var n;return o(t)&&(n=t.constructor,(i(n)&&(n===a||o(n.prototype))||c(n)&&null===(n=n[u]))&&(n=void 0)),void 0===n?a:n}},function(t,n,e){"use strict";var r=e(43),o=e(32);t.exports=r?{}.toString:function(){return"[object "+o(this)+"]"}},,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,function(t,n,e){"use strict";e.r(n),e.d(n,"SelectionSelect",(function(){return i}));e(95),e(61),e(96),e(72);function r(t,n){for(var e=0;e<n.length;e++){var r=n[e];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(t,r.key,r)}}function o(t,n,e){return n in t?Object.defineProperty(t,n,{value:e,enumerable:!0,configurable:!0,writable:!0}):t[n]=e,t}var i=function(){function t(n){var e=this,r=n.lf;!function(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}(this,t),o(this,"__disabled",!1),o(this,"isDefaultStopMoveGraph",!1),o(this,"isWholeNode",!0),o(this,"isWholeEdge",!0),o(this,"__draw",(function(t){var n=e.lf.getPointByClient(t.clientX,t.clientY).domOverlayPosition,r=n.x,o=n.y;e.endPoint={x:r,y:o};var i=e.startPoint,c=i.x,u=i.y,a=e.wrapper.style,f=c,s=u,l=r-c,p=o-u;r<c&&(f=r,l=c-r),o<u&&(s=o,p=u-o),a.left="".concat(f,"px"),a.top="".concat(s,"px"),a.width="".concat(l,"px"),a.height="".concat(p,"px")})),o(this,"__drawOff",(function(){document.removeEventListener("mousemove",e.__draw),document.removeEventListener("mouseup",e.__drawOff),e.wrapper.oncontextmenu=null,e.__domContainer.removeChild(e.wrapper);var t=e.startPoint,n=t.x,r=t.y,o=e.endPoint,i=o.x,c=o.y;if(!(Math.abs(i-n)<10&&Math.abs(c-r)<10)){var u=[Math.min(n,i),Math.min(r,c)],a=[Math.max(n,i),Math.max(r,c)],f=e.lf.graphModel.getAreaElement(u,a,e.isWholeEdge,e.isWholeNode,!0),s=e.lf.graphModel.group;f.forEach((function(t){s&&s.getNodeGroup(t.id)||e.lf.selectElementById(t.id,!0)})),e.lf.emit("selection:selected",f)}})),this.lf=r;var i=r.getEditConfig().stopMoveGraph;this.isDefaultStopMoveGraph=i,r.openSelectionSelect=function(){e.openSelectionSelect()},r.closeSelectionSelect=function(){e.closeSelectionSelect()}}var n,e,i;return n=t,(e=[{key:"render",value:function(t,n){var e=this;this.__domContainer=n,t.on("blank:mousedown",(function(r){var o=r.e;if(t.getEditConfig().stopMoveGraph&&!e.__disabled){var i=t.getPointByClient(o.clientX,o.clientY).domOverlayPosition,c=i.x,u=i.y;e.startPoint={x:c,y:u},e.endPoint={x:c,y:u};var a=document.createElement("div");a.className="lf-selection-select",a.oncontextmenu=function(t){t.preventDefault()},a.style.top="".concat(e.startPoint.y,"px"),a.style.left="".concat(e.startPoint.x,"px"),n.appendChild(a),e.wrapper=a,document.addEventListener("mousemove",e.__draw),document.addEventListener("mouseup",e.__drawOff)}}))}},{key:"setSelectionSense",value:function(){var t=!(arguments.length>0&&void 0!==arguments[0])||arguments[0],n=!(arguments.length>1&&void 0!==arguments[1])||arguments[1];this.isWholeEdge=t,this.isWholeNode=n}},{key:"openSelectionSelect",value:function(){this.lf.getEditConfig().stopMoveGraph||(this.isDefaultStopMoveGraph=!1,this.lf.updateEditConfig({stopMoveGraph:!0})),this.open()}},{key:"closeSelectionSelect",value:function(){this.isDefaultStopMoveGraph||this.lf.updateEditConfig({stopMoveGraph:!1}),this.close()}},{key:"open",value:function(){this.__disabled=!1}},{key:"close",value:function(){this.__disabled=!0}}])&&r(n.prototype,e),i&&r(n,i),t}();o(i,"pluginName","selectionSelect")}])}));