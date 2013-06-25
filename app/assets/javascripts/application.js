// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {

  $('.header').on('click', function() {
    $('footer').fadeToggle();
  });


  var YTMenu = (function() {

    function init() {

      var el      = document.querySelector( 'nav.hidden-menu' ),
          trigger = document.querySelector( 'a.menu-trigger' ),
          open    = false;

      trigger.addEventListener( 'click', function( event ) {
        event.preventDefault();
        if( !open ) {
            el.className += ' menu-open';
            open = true;
        } else {
          event.stopPropagation();
          open = false;
          el.className = el.className.replace(/\b menu-open\b/,'');
          return false;
        }
      }, false );

    }

    init();

  })();


  });
