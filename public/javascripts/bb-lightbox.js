!function(a,b,c,d){"use strict";var e,f,g=a(window),h=window.setImmediate||function(a){setTimeout(a,0)},i=function(){return"."+arguments[0]},j=function(){return[b].concat(Array.prototype.slice.call(arguments,0)).join(d)},k=function(b,c,d,e){var f,g,h,i,j,k={},l='<div data-tag="$1"$2>$3</div>';return b instanceof a?g=a("<div />").append(b):(b=String(b).replace(/<\!doctype[\S\s]*?>/gi,""),b=b.replace(/<!--[\S\s]*?-->/gi,""),b=b.replace(/<meta([\S\s]*?)>/gi,""),b=b.replace(/<(html)([\S\s]*?)>([\S\s]*?)<\/\1>/gi,l),b=b.replace(/<(head|body)([\S\s]*?)>([\S\s]*?)<\/\1>/gi,l),b=b.replace(/<(title)([\S\s]*?)>([\S\s]*?)<\/\1>/gi,l),f=b.match(/<(script)[\S\s]*?<\/\1>/gi),b=b.replace(/<(script)[\S\s]*?<\/\1>/gi,""),g=a("<div>"+b+"</div>")),h=g.find("link, style"),h.length&&h.detach(),e&&(i=g.find(e)),e&&i.length?k.html=i:(j=g.find('[data-tag="body"]'),k.html=j.length?j.contents():g.contents()),k.css=[],d&&h.each(function(){k.css.push(this)}),k.js=[],c&&f.length&&a.each(f,function(a,b){var c=b.match(/^<script[^>]*?src="([\S\s]*?)"[\S\s]*?>/),d=b.match(/^<script[^>]*?>([\S\s]*?)<\/script>/);c&&c.length&&c[1].length&&k.js.push({src:c[1]}),d&&d.length&&d[1].length&&k.js.push({inline:d[1]})}),k},l=function(b){b&&a.isArray(b)&&a.each(b,function(){a('link[href="'+a(this).attr("href")+'"]').length||a("head").append(this)})},m=function(b){b&&a.isArray(b)&&a.each(b,function(c){if(this.src){var d=a.ajaxSetup().cache;return a.ajaxSetup({cache:!0}),a('script[src="'+this.src+'"]').remove(),a.getScript(this.src,function(){m(b.slice(c+1,b.length))}),a.ajaxSetup({cache:!!d}),!1}this.inline&&a.globalEval(this.inline)})},n=[{type:"image",test:function(a,b){var c=a.data(b+"href")||a[0].href;return c&&c.toLowerCase().match(/\.(png|jpe{0,1}g|gif|webp)$/)},init:function(a,b){var c=this.type;return{src:b.data(a.prefix+"href")||b[0].href,error:a.getOption([t,"error"],c,b),type:this}},content:function(b,c,d){var e=a('<img src="'+d.src+'" class="'+j("media","img")+'" style="background-image:url('+d.src+')">'),f=function(){c.resolve({html:e})},g=function(){c.resolve(b.getError(d))},h=new Image;h.onload=f,h.onerror=g,h.onabort=g,h.src=d.src}},{type:"video",test:function(a,b){var c=a.data(b+"href")||a[0].href;return c&&c.toLowerCase().match(/\.(mp4|webm|ogv|swf)$/)},init:function(a,b){var c=this.type;return{src:b.data(a.prefix+"href")||b[0].href,formats:a.getOption("formats",c,b)||[],preview:a.getOption("preview",c,b),width:a.getOption("width",c,b),height:a.getOption("height",c,b),type:this}},content:function(b,c,d){var e,f=a(),g=!1,h=function(a,b){return'<source src="'+a+'" type="'+b+'" />'};d.formats.unshift(d.src),a.each(d.formats,function(c,e){if(!e.format)switch(e.split(".").pop()){case"mp4":f=f.add(a(h(e,"video/mp4")));break;case"webm":f=f.add(a(h(e,"video/webm")));break;case"ogv":f=f.add(a(h(e,"video/ogg")));break;case"swf":g=a('<a href="'+e+'" />'),g=b.getOption(["tmpl","flash"]).replace(/{{ video }}/g,g[0].href).replace(/{{ preview }}/g,d.preview||"")}}),f.length&&(e=a(b.getOption(["tmpl","video"]).replace("{{ preview }}",d.preview||"")),f.each(function(){e.append(this)})),e=a('<div class="'+j("media","container")+'"></div>').append(e),g&&e.data("flash",g),c.resolve({html:e.css({width:d.width,paddingTop:(""+d.height/d.width*100).substr(0,5)+"%"})})},open:function(a){var b=a.find("video"),c=a.find(i(j("media","container"))),d=c.data("flash");b.length&&b[0].play?(b[0].currentTime&&(b[0].currentTime=0),b[0].play(),d&&b.append(d)):d&&c.append(d)},close:function(a){var b=a.find("video");b.length&&b[0].pause&&b[0].pause(),a.find("object").remove()}},{type:"ajax",test:function(b,c){var d=b.data(c+"href")||b[0].href;return d?a("<a>").attr("href",d)[0].host==location.host:!1},init:function(a,b){var c=this.type;return{src:b.data(a.prefix+"href")||b[0].href,addCSS:a.getOption("loadcss",c,b),addJS:a.getOption("loadjs",c,b),selector:a.getOption("selector",c,b),error:a.getOption([t,"error"],c,b),type:this}},content:function(b,c,d){a.ajax({url:d.src}).done(function(a){a=k(a,d.addJS,d.addCSS,d.selector),c.resolve(a)}).fail(function(){c.resolve(b.getError(d))})}},{type:"iframe",test:function(b,c){var d=b.data(c+"href")||b[0].href;return d?a("<a>").attr("href",d)[0].host!=location.host:!1},init:function(a,b){var c=this.type;return{src:b.data(a.prefix+"href")||b[0].href,width:a.getOption("width",c,b),height:a.getOption("height",c,b),type:this}},content:function(b,c,d){var e=a('<div class="'+j("media","container")+'"><iframe class="'+j("media","iframe")+'" data-src="'+d.src+'" frameborder="0" allowfullscreen></iframe></div>'),f={width:d.width,paddingTop:(""+d.height/d.width*100).substr(0,5)+"%"};c.resolve({html:e.css(f)})},open:function(a){var b=a.find(i(j("media","iframe")));b.attr("src",b.data("src"))},close:function(a){a.find(i(j("media","iframe"))).attr("src","")}},{type:"modal",test:function(){return!1},init:function(a,b){var c,d=this.type,e={type:this,error:a.getOption([t,"error"],d,b)};if(c=a.getOption("alert",d,b))e.kind="alert";else if(c=a.getOption("confirm",d,b))e.kind="confirm";else{if(!(c=a.getOption("prompt",d,b)))return e;e.kind="prompt"}return e.ok=a.getOption([t,e.kind,"ok"]),e.cancel=a.getOption([t,e.kind,"cancel"]),e.message=c,e},content:function(b,c,d){var e,f=b.$el,g=b.getOption(["tmpl",d.kind]);return g?(e=a("<div />").addClass(j("modal")+" "+j(d.kind)).append(g.replace("{{ message }}",d.message).replace("{{ ok }}",d.ok||b.getOption([t,d.kind,"ok"])).replace("{{ cancel }}",d.cancel||b.getOption([t,d.kind,"cancel"]))),"alert"==d.kind&&e.find(i(j(d.kind,"ok"))).on(s,function(){f.trigger("modal",[!0]),b.triggerClose()}),"confirm"==d.kind&&e.find(i(j(d.kind,"ok"))).on(s,function(){f.trigger("modal",[!0]),b.triggerClose()}).end().find(i(j(d.kind,"cancel"))).on(s,function(){f.trigger("modal",[!1]),b.triggerClose()}),"prompt"==d.kind&&e.find(i(j(d.kind,"ok"))).on(s,function(){f.trigger("modal",[e.find(i(j(d.kind,"input"))).val()]),b.triggerClose()}).end().find(i(j(d.kind,"cancel"))).on(s,function(){f.trigger("modal",[null]),b.triggerClose()}),void c.resolve({html:e})):void c.resolve(b.getError(d))}},{type:"html",test:function(){return!0},init:function(a,b){var c=this.type;return{content:b.data(a.prefix+"content")||b.find(i(j("htmlcontent"))),clone:a.getOption("copyevents",c,b),addJS:a.getOption("loadjs",c,b),error:a.getOption([t,"error"],c,b),type:this}},content:function(b,c,d){var e=a(d.content);e.length||c.resolve(b.getError(d));var f=k(e.clone(d.clone),d.addJS);c.resolve(f)}}],o=function(){var a={transition:"transitionend",WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend"};for(var b in a)if(void 0!==document.head.style[b])return a[b];return!1}(),p=function(b){return o?function(c){c.addClass(j(b,"start")+" "+j("in","transition")).one(o,function(){a(this).removeClass(j(b,"start")+" "+j(b,"do")+" "+j("in","transition"))}),h(function(){c.addClass(j(b,"do"))})}:void 0},q=function(a){return o?function(b,c,d,e){b.addClass(j("in","transition")+" "+j(a,"slide")+" "+j(a,e)),c.addClass(j(a,"out","slide","start")).one(o,function(){c.removeClass(j(a,"out","slide","start")+" "+j(a,"out","slide","do")),d.addClass(j(a,"in","slide","do"))}),d.addClass(j(a,"in","slide","start")).one(o,function(){d.removeClass(j(a,"in","slide","start")+" "+j(a,"in","slide","do")),b.removeClass(j("in","transition "+j(a,"slide"))+" "+j(a,e))}),h(function(){c.addClass(j(a,"out","slide","do"))})}:void 0},r={fadein:p("fadein"),fadeout:p("fadeout"),slideintop:p("slideintop"),slideouttop:p("slideouttop"),slideinright:p("slideinright"),slideoutright:p("slideoutright"),slideinbottom:p("slideinbottom"),slideoutbottom:p("slideoutbottom"),slideinleft:p("slideinleft"),slideoutleft:p("slideoutleft"),flipin:p("flipin"),flipout:p("flipout"),flipinv:p("flipinv"),flipoutv:p("flipoutv"),growin:p("growin"),growout:p("growout"),shrinkin:p("shrinkin"),shrinkout:p("shrinkout"),fadeslide:q("fade"),slideslide:q("slide"),slideslidev:q("slidev"),flipslide:q("flip"),flipslidev:q("flipv"),shrinkslide:q("shrink")},defaults={dataprefix:"bblb-",trigger:"click",theme:"standard",contentclose:!0,backgroundclose:!0,removeonclose:!1,tmpl:{lb:'<div class="'+j("wrap")+'"><input type="checkbox" class="'+j("switch")+" "+j("hidden")+'" id="'+j("ID")+'" tabindex="-1"><div class="'+j()+" "+j("js")+'"><div class="'+j("cell")+'"><div class="'+j("bg","close")+" "+j("close")+'" for="'+j("ID")+'"><span class="'+j("hidden")+'">{{ close }}</span></div><div class="'+j("content")+'" tabindex="0" role="dialog"><div class="'+j("slides")+'"><div class="'+j("slide")+" "+j("slide","active")+'"><div class="'+j("slide","content")+'"></div></div></div><span class="'+j("placeholder")+'" data-placeholder="control" /><span class="'+j("placeholder")+'" data-placeholder="pager" /><div class="'+j("options")+'"><span class="'+j("placeholder")+'" data-placeholder="fullscreen-toggle" /><button class="'+j("option-button")+" "+j("content-close")+" "+j("close")+'"><span class="'+j("hidden")+'">{{ close }}</span></button></div></div></div></div></div>',slide:'<div class="'+j("slide")+'"><div class="'+j("slide","content")+'"></div></div>',texts:'<div class="'+j("texts")+'"></div>',loadingerror:'<p class="'+j("error")+'">{{ error }}</p>',fullscreen:'<button class="'+j("option-button")+" "+j("fullscreen")+'"><span class="'+j("hidden")+'">{{ fullscreen }}</span></button>',flash:'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" class="'+j("media","flv")+'" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab"><param name="movie" value="{{ video }}" /><param name="loop" value="false"><param name="bgcolor" value="#ffffff" /><param name="wmode" value="transparent" /> <embed type="application/x-shockwave-flash" class="'+j("media","flv")+'" src="{{ video }}" pluginspage="http://www.macromedia.com/go/getflashplayer" name="Web" bgcolor="#ffffff" wmode="transparent"></embed></object>',video:'<video class="'+j("media","vid")+'" poster="{{ preview }}" preload controls />',alert:'<p class="'+j("modal","message")+" "+j("alert","message")+'">{{ message }}</p><button type="button" class="'+j("modal","ok")+" "+j("alert","ok")+'">{{ ok }}</button>',confirm:'<p class="'+j("modal","message")+" "+j("confirm","message")+'">{{ message }}</p><button type="button" class="'+j("modal","cancel")+" "+j("confirm","cancel")+'">{{ cancel }}</button><button type="button" class="'+j("modal","ok")+" "+j("confirm","ok")+'">{{ ok }}</button>',prompt:'<p class="'+j("modal","message")+" "+j("prompt","message")+'">{{ message }}</p><label class="'+j("prompt","input","container")+'"><input type="text" class="'+j("prompt","input")+'"></label><button type="button" class="'+j("modal","cancel")+" "+j("prompt","cancel")+'">{{ cancel }}</button><button type="button" class="'+j("modal","ok")+" "+j("prompt","ok")+'">{{ ok }}</button>',control:'<div class="'+j("control")+'"><button class="'+j("control","next")+'"><span class="'+j("hidden")+'">{{ next }}</span></button><button class="'+j("control","prev")+'"><span class="'+j("hidden")+'">{{ previous }}</span></button></div>',pager:'<div class="'+j("pager")+'"><ol class="'+j("pager","list")+'"></ol></div>',pagerItem:'<li class="'+j("pager","item")+'"><button type="button" class="'+j("pager","button")+'"><span class="'+j("hidden")+'">{{ count }}</span></button></li>'},inline:!1,width:800,height:600,copyevents:!0,fullscreen:!0,openfullscreen:!1,loop:!0,preload:1,pager:!0,pagergallery:!1,closekeys:[27],prevkeys:[33,37,65,74],nextkeys:[34,39,68,76],enableswipe:!0,maxswipeduration:250,minswipex:200,maxswipey:100,transition:{open:"growin",close:"shrinkout",slide:"slideslide"},translation:{close:"close",fullscreen:"fullscreen",previous:"previous",next:"next",alert:{ok:"ok"},confirm:{ok:"ok",cancel:"cancel"},prompt:{ok:"ok",cancel:"cancel"},error:"Resource could not be loaded."},onbeforeopen:0,onafteropen:0,onbeforeclose:0,onafterclose:0,onslideloaded:0,onslideopen:0,onslideclose:0,onfilter:0},s="click",t="translation",u=function(b,c,d){var e=a(b);e.data(j("active"))||e.data(j("active"),new f(e,c,d))};f=function(b,c,d){this.$el=b,this.el=b[0],this.data=[],this.index=0,this.type=!1,this.prefix=c&&c.dataprefix?c.dataprefix:defaults.dataprefix,this.options=a.extend(!0,{},defaults,c||{},this.$el.data(this.prefix+"options")||{}),d=d||this.getOption("data"),this.init(d)},f.prototype={getState:function(){return this.$cb.is(":checked")},setState:function(a){this.$cb.prop("checked",a)},toggleState:function(){this.setState(!this.getState())},getOption:function(b,c,e,f){var g;return e||(e=this.$el),c||c===!1||(c=this.type),a.isArray(b)||(b=[b]),f||(g=e.data(this.prefix+b.join(d))),null!=g?g:(c&&(g=this.getOption([c].concat(b),!1,e,!0)),null!=g?g:(g=this.options,a.each(b,function(a,b){return g.hasOwnProperty(b)?void(g=g[b]):(g=null,!1)}),g))},execCallback:function(b,c){return(b=this.getOption("on"+b))?a.isFunction(b)?b(c):"string"==a.type(b)&&window[b]?b(c):void 0:void 0},execTransition:function(b,c){var d=this.getOption(["transition",b]);return"string"==jQuery.type(d)&&r[d]&&(d=r[d]),d&&a.isFunction(d)?d.apply(null,c):void 0},getType:function(b,c){var d=!1,e=this.prefix;return a.each(n,function(){return(this.type==c||this.test&&this.test(b,e))&&(d=this,!c||this.type==c)?!1:void 0}),d},init:function(b){var c,d,e;this.$el.is("label")&&(c=this.$el.attr("for")),this.$el.data(this.prefix+"for")&&(c=this.$el.data(this.prefix+"for")),c&&(d=a("#"+c),e=d.next(i(j())),d.length&&d.is('input[type="checkbox"]')&&e.length&&(this.$cb=d,this.$lb=e)),this.setData(b),this.listen(e&&e.length,!(this.$el.is("label")&&d.is("#"+this.$el.attr("for")))),location.hash.substr(1)==this.$el.attr("id")&&this.$el.trigger(this.getOption("trigger"))},setData:function(b){var c,d,e;b?(a.isPlainObject(b)&&this.data.push(b),a.isArray(b)&&(1===b.length?this.data=this.data.concat(b):3===b.length&&a.isArray(b[1])&&a.isArray(b[2])?(this.data=this.data.concat(b[1]),this.data.push(b[0]),this.data=this.data.concat(b[2]),this.index=b[1].length):this.data=this.data.concat(b)),a.each(this.data,a.proxy(function(a,b){"string"==jQuery.type(b.type)&&(b.type=this.getType(this.$el,b.type))},this)),this.type=this.data[this.index].type.type):(c=this.getType(this.$el,this.getOption("force")),d=c.init(this,this.$el),d.$texts=this.getTexts(this.$el),b=d,this.initGroup(),this.$group&&this.$group.length&&(b=[b,[],[]],e=this.$group.index(this.$el),this.index=e,this.$group.each(a.proxy(function(c,d){var f=a(d),g=this.getType(f,this.getOption("force",null,f)),h=!1;e>c?h=1:c>e&&(h=2),d=g.init(this,f),d.$texts=this.getTexts(f),h&&b[h].push(d)},this))),this.setData(b))},getTexts:function(b){var c,d,e=this.getOption("texts",null,b)||{},f=[];return this.getOption("title",null,b)&&(c=b.attr("title"),c&&(e.title=c)),a.each(e,function(a,b){b&&(d=b.tag?b.tag:"p",c=b.text?b.text:b,f.push("<"+d+' class="'+a+'">'+c+"</"+d+">"))}),f},create:function(c){var e;this.$group&&this.$group.length&&(a.each(this.$group,a.proxy(function(b,c){var d=a(c).data(j("active"));return d&&d.$lb&&d.$lb.length?(this.$cb=d.$cb,this.$lb=d.$lb,this.unlisten(),this.listen(!0,!0),d.setSlide(this.$group.index(this.$el),!0),this.toggle(),!1):void 0},this)),this.$lb&&this.$lb.length)||(this.id=b+d+ +new Date,e=a(this.getOption(["tmpl","lb"]).replace(/ID/g,this.id).replace(/\{\{ close \}\}/g,this.getOption([t,"close"]))),this.getOption("inline")?e.insertAfter(c||this.$el):e.appendTo("body"),this.$wrap=e,this.$cb=e.find(i(j("switch"))),this.$lb=e.find(i(j())),this.$lb.addClass(this.getOption("theme")),this.initFullscreen(),this.initSlide(e.find(i(j("slide"))),this.data[this.index],!0,!0),this.toggle(),this.unlisten(),this.listen(!0,!0))},initSlide:function(b,c,d,e){var f=this.getContent(c);b.addClass(j("slide",c.type.type)),f.done(a.proxy(function(a){this.setContent(b,a,c),d&&this.openLoaded(),e&&this.initGroupView()},this))},listen:function(c,d){var e=this,f=this.getOption("trigger"),g=this.getOption("backgroundclose");c?(d&&this.$el.on(f+"."+b,function(a){a.preventDefault(),e.getSlides().length>1&&e.setSlide(e.$group?e.$group.index(e.$el):0,!0),e.toggle()}),this.$cb.on("change."+b,function(){e.update()}),this.$lb.on("click."+b,i(j("close")),function(b){(g||!a(b.target).hasClass(j("bg","close")))&&e.triggerClose()})):this.$el.on(f+"."+b,function(b){b.preventDefault(),e.create(a(b.target))})},unlisten:function(){this.$el.off(this.getOption("trigger")+"."+b),this.$cb.off("change."+b)},toggle:function(){this.toggleState(),this.update()},update:function(){this.getState()?this.execCallback("beforeopen")===!1?this.toggleState():this.open():this.execCallback("beforeclose")===!1?this.toggleState():this.close()},open:function(){this.scrollTop=a(document).scrollTop(),this.activeElement=document.activeElement,e.addClass(j("open")),this.$lb.find(i(j("slide","active"))+">"+i(j("slide","content"))).is(":empty")||this.openLoaded()},openLoaded:function(){this.getOption("openfullscreen")&&this.$lb.addClass(j("mode","fullscreen")),this.getOption("contentclose")||this.$lb.addClass(j("no","content","close")),this.initMaxHeight(),this.$lb.addClass(j("show")),this.execTransition("open",[this.$lb]),this.execSlideAction("open"),this.initKeyboardControl(),this.initTouchControl(),this.$lb.find(i(j("content"))).focus(),this.execCallback("afteropen")},close:function(){o?this.$lb.one(o,a.proxy(this.afterClose,this)):this.afterClose(),this.execSlideAction("close"),this.execTransition("close",[this.$lb]),this.endMaxHeight(),this.endKeyboardControl(),this.endTouchControl(),this.$lb.removeClass(j("show")),a("html, body").scrollTop(this.scrollTop)},afterClose:function(){this.$lb.removeClass(j("mode","fullscreen")),e.removeClass(j("open")),a(this.activeElement).focus(),this.getOption("removeonclose")&&this.$wrap.remove(),this.execCallback("afterclose")},triggerClose:function(){this.setState(!1),this.update()},execSlideAction:function(a,b){var c;c=this.data[this.index],c.type[a]&&(b||(b=this.$lb.find(i(j("slide","active")))),c.type[a](b)),this.execCallback("slide"+a,b)},getContent:function(b){var c,d=a.Deferred();return d.promise(c),b.type.content(this,d,b),d},setContent:function(b,c,d){this.execCallback("filter",c),b.children(i(j("slide","content"))).append(c.html),d.$texts&&d.$texts.length&&b.append(a(this.getOption(["tmpl","texts"])).append(d.$texts)),this.setMaxHeight(b),l(c.css),m(c.js),this.execSlideAction("loaded",b)},getError:function(a){return{html:this.getOption(["tmpl","loadingerror"]).replace(/\{\{ error \}\}/g,a.error||this.getOption([t,"error"],a.type.type)),error:!0}},initMaxHeight:function(){var c,d=function(b){return function(c){b.getSlides().each(function(){b.setMaxHeight(a(this),c)})}}(this);g.on("resize."+b,function(){clearTimeout(c),c=setTimeout(function(){d(a(window).height())},200)})},setMaxHeight:function(b,c){var d,e=b.children(),f=b.css("maxHeight"),g=parseInt(b.css("paddingTop"),10)+parseInt(b.css("paddingBottom"),10)+parseInt(e.css("paddingTop"),10)+parseInt(e.css("paddingBottom"),10);(!f||f.indexOf("%")<0)&&(d=b.clone().removeAttr("style").hide().insertAfter(b),f=d.css("maxHeight"),d.remove()),f=(c||a(window).height())*parseInt(f,10)/100,b.css("maxHeight",f),b.find(i(j("media","img"))).css("maxHeight",f-g)},endMaxHeight:function(){g.off("resize."+b)},initFullscreen:function(){this.getOption("fullscreen")&&this.$lb.find(i(j("placeholder"))+'[data-placeholder="fullscreen-toggle"]').replaceWith(a(this.getOption(["tmpl","fullscreen"]).replace(/\{\{ fullscreen \}\}/g,this.getOption([t,"fullscreen"]))).on("click",a.proxy(this.toggleFullscreen,this)))},toggleFullscreen:function(){this.$lb.toggleClass(j("mode","fullscreen"))},initKeyboardControl:function(){var c=this.$lb,d=a.proxy(this.setSlide,this),f=a.proxy(this.triggerClose,this),g=this.getOption("nextkeys"),h=this.getOption("prevkeys"),i=this.getOption("closekeys"),j="input, select, textarea, [contenteditable]",k=this.getOption("backgroundclose");e.on("keydown."+b,function(b){var e,l;9==b.keyCode&&(e=c.find(j+", button, [tabindex]").filter(":visible").filter(function(b,c){var d=a(c);return!d.is("[tabindex]")||d.attr("tabindex")>-1}),l=e.index(document.activeElement),b.shiftKey&&1>l&&(e.last().focus(),b.preventDefault()),!b.shiftKey&&(0>l||l>=e.length-1)&&(e.first().focus(),b.preventDefault())),a(b.target).is(j)||(a.inArray(b.keyCode,h)>-1&&(d("-"),b.preventDefault()),a.inArray(b.keyCode,g)>-1&&(d("+"),b.preventDefault()),k&&a.inArray(b.keyCode,i)>-1&&f())})},endKeyboardControl:function(){e.off("keydown."+b)},initTouchControl:function(){var c,d,f,g=a.proxy(this.setSlide,this),h=this.getOption("enableswipe");h&&(c=this.getOption("maxswipeduration"),d=this.getOption("minswipex"),f=this.getOption("maxswipey"),this.$lb.find(i(j("content"))).on("touchstart."+b,function(){var a,h=!1,i=!1;e.on("touchmove."+b,function(a){var c=a.originalEvent.touches;c.length<2?(i={x:c[0].screenX,y:c[0].screenY},h||(h=i)):e.trigger("touchend."+b)}).on("touchend."+b,function(c){h&&i&&c.originalEvent&&0===c.originalEvent.touches.length&&Math.abs(h.x-i.x)>d&&Math.abs(h.y-i.y)<f&&g(h.x>i.x?"+":"-"),e.off("touchmove."+b+" touchend."+b),clearTimeout(a)}),a=setTimeout(function(){e.trigger("touchend."+b)},c)}))},endTouchControl:function(){this.$lb.find(i(j("content"))).off("touchstart."+b)},initGroup:function(){var b=this.$el.data(this.prefix+"group"),c=[],d=this.prefix;b&&(c=a("[data-"+d+'group="'+b+'"]'),c.length<2&&(c=[])),this.$group=c},initGroupView:function(){this.data.length>1&&(this.initSlides(),this.initControl(),this.initPager())},initSlides:function(){var b,c,d=this.$lb.find(i(j("slide"))),e=this.index,f=a(this.getOption(["tmpl","slide"])),g=this.getOption("preload");a.isNumeric(g)?b=c=g:a.isArray(g)?(b=a.isNumeric(g[0])?g[0]:1,c=a.isNumeric(g[1])?g[1]:b):b=c=1,this.loadPrev=b,this.loadNext=c,this.loop=this.getOption("loop"),a.each(this.data,function(a,b){var c="after",g=f.clone().addClass(j("slide",b.type.type));a!=e&&(e>a&&(c="before"),d[c](g),a>e&&(d=g))}),this.preload(e)},getSlides:function(){return this.$lb.find(i(j("slide")))},preload:function(b){var b,c=this.data,d=a.proxy(this.getContent,this),e=a.proxy(this.setContent,this),f=b-this.loadPrev,g=b+this.loadNext,h=this.getSlides(),k=[];for(f+h.length<0&&(f=-(h.length-1)),g-h.length>=h.length&&(g=h.length);g>=f;f++){if(b=f,0>b){if(!this.loop)continue;b=h.length+b}if(b>=h.length){if(!this.loop)continue;b-=h.length}-1==k.indexOf(b)&&k.push(b)}a.each(k,function(a,b){var f=h.eq(b),g=c[b];f.children(i(j("slide","content"))).is(":empty")&&!f.hasClass(j("loading"))&&(f.addClass(j("loading")),function(a){var b=d(g);b.done(function(b){a.removeClass(j("loading")),e(a,b,g)})}(f,b))})},initControl:function(){var b=a.proxy(this.setSlide,this),c=a(this.getOption(["tmpl","control"]).replace("{{ previous }}",this.getOption([t,"previous"])).replace("{{ next }}",this.getOption([t,"next"])));c.find(i(j("control","prev"))).on("click",function(){b("-")}).end().find(i(j("control","next"))).on("click",function(){b("+")}),this.$lb.find(i(j("placeholder"))+'[data-placeholder="control"]').replaceWith(c)},initPager:function(){if(this.getOption("pager")){var b=a(this.getOption(["tmpl","pager"])),c=b.children(i(j("pager","list"))),d=this.getOption(["tmpl","pagerItem"]),e=this.getOption("pagergallery"),f=a.proxy(this.setSlide,this);this.data.length<2||(e?(this.$lb.addClass(j("has","pager","gallery")),b.addClass(j("pager","gallery"))):this.$lb.addClass(j("has","pager")),a.each(this.data,a.proxy(function(b){var f,g=a(d.replace("{{ count }}",b+1));this.index==b&&g.addClass(j("pager","active")),e&&(f="url("+(this.data[b].pagerimage||this.getOption("pagerimage",this.type.type,this.$group.eq(b)))+")",g.css({backgroundImage:f})),c.append(g)},this)),b.on("click",i(j("pager","item")),function(){f(a(this).index())}),this.$lb.find(i(j("placeholder"))+'[data-placeholder="pager"]').replaceWith(b),this.$pager=b,this.$pagerList=c)}},setSlide:function(a,b){var a,c,d,e,f,g,h;if("+"==a?a=this.index+1:"-"==a&&(a=this.index-1),c=this.index<a?"next":"prev",b||a!=this.index&&!this.$lb.hasClass(j("in","transition"))){if(f=this.getSlides(),0>a){if(!this.loop)return;a=f.length-1}if(a>=f.length){if(!this.loop)return;a=0}d=j("slide","active"),this.index=a,e=j("pager","active"),this.$pager&&(g=this.$pagerList.children().removeClass(e).eq(a).addClass(e),this.$pagerList.animate({scrollLeft:"+="+(g.position().left-this.$pager.width()/2+parseInt(g.css("marginLeft"),10)+g.outerWidth()/2)})),g=f.filter(i(d)),h=f.eq(a),h.is(":empty")&&this.initSlide(h,this.data[a],b),b||this.execTransition("slide",[this.$lb,g,h,c]),this.execSlideAction("close",g),this.execSlideAction("open",h),g.removeClass(d),h.addClass(d),this.preload(a)}}},a.fn[c]=function(b,d){if(!e){if(!document.body)return a.error("The initialization was called before the body tag was available."),this;e=a("body")}return this.each(function(){f[b]?f[b](Array.prototype.slice.call(arguments,1)):"object"!=typeof b&&b?a.error("Method "+b+" does not exist on jQuery."+c):u(this,b,d)})},a[c]=function(b,d){return a.isPlainObject(d)||(d={}),d.inline=!1,d.removeonclose=!0,a("<span />")[c](d,b).trigger(d.trigger||"click")}}(jQuery,"bb-lightbox","bbLightbox","-");