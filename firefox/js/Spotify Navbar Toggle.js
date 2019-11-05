// ==UserScript==
// @name         Spotify Navbar Hide
// @namespace    http://despecial.de
// @version      1.00
// @description  Hide the nav bar in spotify webapp
// @author       qtpie
// @match        *://*.spotify.com/*
// @require      https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js
// @grant        GM_download
// ==/UserScript==

(function($){

var hidden = 0;

/* function to hide stuff */
function clean() {
    var element = document.getElementsByClassName("Root__nav-bar"), index;
    for (index = element.length - 1; index >= 0; index--) {
        //element[index].parentNode.removeChild(element[index]);
        if( hidden == 0 )
            element[index].style.display = 'none';
        else
            element[index].style.display = 'block';
    }
}

document.onkeydown = function(e){
    e = e || event;
    if(e.ctrlKey)
    {
        clean();
        if (hidden == 0)
            hidden = 1
        else
            hidden = 0
    }
};

})(jQuery);
