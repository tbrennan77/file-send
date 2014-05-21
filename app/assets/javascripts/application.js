// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require foundation/foundation.abide
//= require foundation/foundation.reveal
//= require jquery_nested_form

$(document).foundation({
  abide : {
    patterns : {
      password: /(?=^.{8,}$)(?=.*\d)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/
    }
  },
  orbit: {
      bullets: false,
      timer: false,
      slide_number: false,
      timer_speed: 1000
  },
  topbar: {
    is_hover: false
  }
});

function closeModal() {
  $('a.close-reveal-modal').trigger('click');
}

$(document).on('submit', 'form.uploading', function() {
  $('form.uploading').hide();
  $('#ajax-loader').removeClass('hide');
});

$(document).on('nested:fieldRemoved', function(event){    
  var field = event.field;
  $(field).remove();
});

$('a.see-more').on('click', function(event) {
  var hidden_sermons = $('table.hide').slice(0,5);
  if (hidden_sermons.length > 0) {    
    $(hidden_sermons).each(function() {
      $(this).removeClass('hide');
      $(this).addClass('fadeIn');
    });
  } else {
    $(this).fadeOut();
  }
  var hidden_sermons = $('table.hide').slice(0,5);
  if (hidden_sermons.length == 0) {    
    $(this).fadeOut();
  }
  event.preventDefault();
});

var pBar = document.getElementById('p');
var updateProgress = function(value) {
  pBar.value = value;  
};
p = 1;

function fakeUpload() {
  setInterval( function() { 
    updateProgress(p); 
    if (p > 500) {
      p = p+0.5;        
    } else {
      p = p+1;
    }
  }, 100);    
}
