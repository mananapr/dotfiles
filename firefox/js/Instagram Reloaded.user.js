// ==UserScript==
// @name         Instagram Reloaded
// @namespace    http://despecial.de
// @homepageURL  https://greasyfork.org/en/scripts/14755-instagram-reloaded
// @version      2.22info
// @description  View or download the full-size Instagram image/video. Super simple: press alt+f or shift & click to view media - alt & click saves file. Read for more options.
// @author       despecial
// @match        *://*.instagram.com/*
// @require      https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js
// @grant        GM_download
// ==/UserScript==

var ig = '#react-root section main article > div [role="button"] div:has(img) + div:empty'; // single photo
    ig+= ', #react-root section main article div div div a[role="button"]'; // single video
    ig+= ', div[role="dialog"] article :not(header) div[role="button"] div:has(img) + div:empty'; // popup photo
    ig+= ', div[role="dialog"] article div div div a[role="button"]'; // popup/carousel video
    ig+= ', div[role="dialog"] article ul div:has(img) + div:empty'; // popup/carousel photo
    ig+= ', #react-root section main article video'; // igtv video
    ig+= ', div[role="dialog"] article video'; // popup igtv video
    ig+= ',.EmbedFrame.EmbedMedia';
var alt_trigger = ig;

(function($){

function despecial_ig(e,$this,a) {
  if(!e) e = window.event;
  if(e.shiftKey || e.altKey || a == "rm") {
	 var p,v;
     e.preventDefault();
    if($('div[role="dialog"] article header + div').length && a == "rm") {
	     v = $this.parent().find('video').attr('src');
	     p = "";
   	} else {
	     v = $this.closest('div').find('video').attr('src');
	     if(!v) p = $this.siblings().find('img').attr('src');
       }
	var ep = $this.find('.efImage').css('background-image'),
	 rplcd = new Array('XXXXXX'),
	     t = (e.altKey) ? '_self' : '_blank',
	    fs = (typeof ep === "string" || ep instanceof String) ? ep.replace(/^url\(['"]?([^'"]+)['"]?\)/,'$1') : p;
	for (var i = 0; i < rplcd.length; ++i) {
	  var r = new RegExp(rplcd[i],'ig');
	  if( r.test(fs) ) fs=fs.replace(r,'');
	}
	var isChrome = !!window.chrome && !!window.chrome.webstore;
   if(isChrome && e.altKey) {
	  if(fs) direct_download(fs);
	   if(v) direct_download(v);
   } else {
    if(v) { e.preventDefault(); window.open(v, t); }
    if(fs) window.open(fs, t);
   }
  }
}

/* dynamic download link */
function direct_download(url) {
    var filename = url.match('[^/]*$')[0];
    var arg = { url: url, name: filename };
    GM_download(arg);
}

/* left-click and hold shift key to open desired item */
$(document).on('click',ig,function(e,a) {
	despecial_ig(e,$(this),a);
});

/* function to hide stuff */
function clean() {
    var element = document.getElementsByTagName("nav"), index;
    for (index = element.length - 1; index >= 0; index--) {
        element[index].parentNode.removeChild(element[index]);
    }
    element = document.getElementsByClassName("fx7hk"), index;
    for (index = element.length - 1; index >= 0; index--) {
        element[index].parentNode.removeChild(element[index]);
    }
    element = document.getElementsByClassName("_4bSq7"), index;
    for (index = element.length - 1; index >= 0; index--) {
        element[index].parentNode.removeChild(element[index]);
    }
}

/* keyboard shortcut alt+f(ullsize) works on video popup, single photo, single video pages */
$(document).delegate(alt_trigger,'ig_press',function(e,a) {
   despecial_ig(e,$(this),a);
});

document.onkeydown = function(e){
    e = e || event;
    if(e.ctrlKey) clean();
    if (e.altKey && e.keyCode==70) $(alt_trigger).trigger('ig_press',['rm']);
};

})(jQuery);
