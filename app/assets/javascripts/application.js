// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function() {
	
	$('#toggle-open').on('click tap', function() {
	  $('.gift-extra-data').slideDown(100);
	  $('#toggle-open').addClass('disabled');
	  $('#toggle-closed').removeClass('disabled');
	});
	
	$('#toggle-closed').on('click tap', function() {
	  $('.gift-extra-data').slideUp(100);
	  $('#toggle-closed').addClass('disabled');
	  $('#toggle-open').removeClass('disabled');
	});
	
	$('.gift-list-name').on('click tap', function(){
		$(this).parent().children().closest('.gift-extra-data').slideToggle(100);
	});
	
	$('#toggle-all').on('click tap', function() {
	  $('.remaining-pane').hide();
	  $('.export-default').show();
	  $('#toggle-all').addClass('disabled');
	  $('#toggle-remaining').removeClass('disabled');
	});
	
	$('#toggle-remaining').on('click tap', function() {
	  $('.export-default').hide();
	  $('.remaining-pane').show();
	  $('#toggle-all').removeClass('disabled');
	  $('#toggle-remaining').addClass('disabled');
	});
	
	//Added to help show purchased, non-purchased or all items
	$('#toggle-show-all').on('click tap', function() {
	  $('.gift-list-item-purchased').show();
	  $('.gift-list-item-not-purchased').show();
	  $('#toggle-show-np').removeClass('disabled');
	  $('#toggle-show-p').removeClass('disabled');
	  $('#toggle-show-all').addClass('disabled');
	});
	
	$('#toggle-show-p').on('click tap', function() {
	  $('.gift-list-item-purchased').show();
	  $('.gift-list-item-not-purchased').hide();
	  $('#toggle-show-np').removeClass('disabled');
	  $('#toggle-show-all').removeClass('disabled');
	  $('#toggle-show-p').addClass('disabled');
	});
	
	$('#toggle-show-np').on('click tap', function() {
	  $('.gift-list-item-purchased').hide();
	  $('.gift-list-item-not-purchased').show();
	  $('#toggle-show-p').removeClass('disabled');
	  $('#toggle-show-all').removeClass('disabled');
	  $('#toggle-show-np').addClass('disabled');
	});

});