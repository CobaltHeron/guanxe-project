/******************STRAT loading*************/
	$(window).load(function() {
		$('.tvcms-loading-overlay').fadeOut('slow');
		$(".tvcmsnewsletterpopup").fadeIn("slow");

		/************ Start To Change Left Column Position in Mobile Size *********************************/
		changePositionLeftColumnMobileView();
		$(window).resize(function(){
			changePositionLeftColumnMobileView();
		});
		function changePositionLeftColumnMobileView()
		{
			if (document.body.clientWidth > mobileViewSize) {
				$('#left-column').insertBefore('#content-wrapper');
			} else {
				$('#left-column').insertAfter('#content-wrapper');
			}
		}
		/************ End To Change Left Column Position in Mobile Size *********************************/


		/****************** Start Default Left Right Panel Hide *********************************************/
		var showCountPanelLeft = 0;
		var showCountPanelRight = 0;

		if ($('.tvcms-left-column-wrapper').html() != undefined) {
			if ($('#left-column').html() != undefined) {
				$('#left-column').addClass('tv-left-right-panel-hide');
				showCountPanelLeft = 1;
			} else {
				$('.tvcms-left-column-wrapper').remove();	
			}
		} else {
			$('.tvcms-left-column-wrapper').remove();
		}

		if ($('.tvcms-right-column-wrapper').html() != undefined) {
			if ($('#right-column').html() != undefined) {
				$('#right-column').addClass('tv-left-right-panel-hide');
				showCountPanelRight = 1;
			} else {
				$('.tvcms-right-column-wrapper').remove();
				$('.tvall-page-shortby').addClass('col-sm-12 col-md-4 col-lg-4');
			}
		} else {
			$('.tvcms-right-column-wrapper').remove();
			$('.tvall-page-shortby').addClass('col-sm-12 col-md-4 col-lg-4');
		}

		if (showCountPanelLeft == 1 || showCountPanelRight == 1) {
			$('#content-wrapper').addClass('tvcontent-full-width');
		}

		/****************** End Default Left Right Panel Hide *********************************************/

		if (TVCMSCUSTOMSETTING_HOVER_IMG  !== undefined && TVCMSCUSTOMSETTING_HOVER_IMG  == '0') {
			$('.tvproduct-hover-img').hide();
		}
	});

	/******************END loading*************/
$(document).ready(function(){
	// "use strict";

	// set Mobile view size 991
	var mobileViewSize = 991;
		
	// check function is defined or not
	function isFunction(fn){
		return typeof fn === 'function';
	}

	/************ Start close dropdown When open other dropdown in mobile view **************/
	$(window).resize(function(){
		removeDefaultDropdown();
	});
	function removeDefaultDropdown()
	{
		// Header My Account Dropdown
		$('#header .tv-account-dropdown').removeClass('open');
		$('#header').find('.tvcms-header-myaccount .tv-myaccount-btn').removeClass('open');
		$('#header').find('.tvcms-header-myaccount .tv-account-dropdown').removeClass('open').hide();

		// Header Search Dropdown
        $('#header .tvcmsheader-search .tvsearch-open').show();
        $('#header .tvcmsheader-search .tvsearch-close').hide();
        $('#header .tvcmsheader-search .tvsearch-header-display-wrappper').removeClass('open');
        $('body').removeClass('tvactive-search');

        // Header My Account Dropdown
		$('#header .tv-account-dropdown').removeClass('open');
		$('#header').find('.tvcms-header-myaccount .tv-myaccount-btn').removeClass('open');
		$('#header').find('.tvcms-header-myaccount .tv-account-dropdown').removeClass('open').hide();

		// language Dropdown
		$('.tvcms-header-language .tv-language-btn').removeClass('open');
		$('.tv-language-dropdown').removeClass('open').hide();

		// Currency Dropdown
		$('.tvcms-header-currency .tv-currency-btn').removeClass('open');
		$('.tv-currency-dropdown').removeClass('open').hide();

		if (document.body.clientWidth <= mobileViewSize) {
			// horizontal menu
			$('#tvcms-mobile-view-header .tvmenu-button').removeClass('open');
			$('#tvcmsmobile-horizontal-menu #tv-top-menu').removeClass('open');
		
			// Cart Dropdown
			$('.hexcms-header-cart .tvcmscart-show-dropdown').removeClass('open');

			// Vertical Menu DropDown
			$('.tvcmsvertical-menu .tvallcategories-wrapper, .tvcmsvertical-menu .tvverticalmenu-dropdown, .tvcmsvertical-menu .overlay-menu').removeClass('open').removeAttr('style');
		} else {
			// Vertical Menu DropDown
			$('.tvcmsvertical-menu .tvallcategories-wrapper').removeClass('open');
            $('.tvcmsvertical-menu .tvverticalmenu-dropdown, .tvcmsvertical-menu .overlay-menu').removeClass('open').stop(false).slideUp(500, "swing").removeAttr('style');
		}
	}
	/************ End close dropdown When open other dropdown in mobile view **************/


	/*********************** Start Product Category page View ******************************/
	// Start Grid View
	function removeClassesOfView(){ 
		$('#products').removeClass('grid grid-2 list list-2 catelog'); 
	}

	$(document).on('click','.tvcmsproduct-grid-list .tvproduct-grid',function(){
		removeClassesOfView();
		$('#products').addClass('grid');
	});
	// End Grid View

	// Start Grid-2 View
	$(document).on('click','.tvcmsproduct-grid-list .tvproduct-grid-2',function(){
		removeClassesOfView();
		$('#products').addClass('grid-2');                              	
	});
	// End Grid-2 View

	// Start List View
	$(document).on('click','.tvcmsproduct-grid-list .tvproduct-list',function(){
		removeClassesOfView();
		$('#products').addClass('list');
	});
	// End List View

	// Start List-2 View
	$(document).on('click','.tvcmsproduct-grid-list .tvproduct-list-2',function(){
		removeClassesOfView();
		$('#products').addClass('list-2');
	});
	// End List-2 View

	// Start Catelog View
	$(document).on('click','.tvcmsproduct-grid-list .tvproduct-catelog',function(){
		removeClassesOfView();
		$('#products').addClass('catelog');
	});
	// End Catelog View

	/*********************** End Product Category page View ******************************/

	/******************** Start Comman Drop-Down Functions *******************************************/
	var dropDownParentClass = '';
	var dropDownClass = '';
	
	// this function is use Toggle dropdown
	function tvDropDown(parentClass, dropdownClass, closeOtherDropdown) {
		$(document).on('click',parentClass,function(e){
			if ($(dropdownClass).hasClass('open')) {
				$(dropdownClass).removeClass('open').stop(false).slideUp(500, "swing");
				$(parentClass).removeClass('open');
			} else {
				if (closeOtherDropdown == true) {
					removeDefaultDropdown();
				}
				$(dropdownClass).addClass('open').stop(false).slideDown(500, "swing");
				$(parentClass).addClass('open');
			}
			e.stopPropagation();
		});
	}
	//tvDropDown

	/******************** End Drop-Down Functions *******************************************/

	/********************* Start Account DropDown js *****************************************/
	dropDownParentClass = '.tvcms-header-myaccount .tv-myaccount-btn';
	dropDownClass = '.tv-account-dropdown';
	$(dropDownClass).hide();
	tvDropDown(dropDownParentClass, dropDownClass, true);
	/********************* End Account DropDown js *****************************************/

	/********************* Start Language DropDown js *****************************************/
	dropDownParentClass = '.tvcms-header-language .tv-language-btn';
	dropDownClass = '.tv-language-dropdown';
	$(dropDownClass).hide();
	tvDropDown(dropDownParentClass, dropDownClass, false);
	/********************* End Language DropDown js *****************************************/

	/********************* Start Currency DropDown js *****************************************/
	dropDownParentClass = '.tvcms-header-currency .tv-currency-btn';
	dropDownClass = '.tv-currency-dropdown';
	$(dropDownClass).hide();
	tvDropDown(dropDownParentClass, dropDownClass, false);
	/********************* End Currency DropDown js *****************************************/

	/********************* Start Mobile View js *****************************************/
	
	function showView(){
		if (document.body.clientWidth <= mobileViewSize) {//for mobile view
			 moveDataInMobileView('#tvcmsdesktop-vertical-menu', '#tvcmsmobile-vertical-menu');
			 moveDataInMobileView('#tvcmsdesktop-main-menu', '#tvcmsmobile-horizontal-menu');
			 moveDataInMobileView('.tvcmsheader-nav-right', '#tvcmsmobile-header-right');
			 moveDataInMobileView('#tvcmsdesktop-logo', '#tvcmsmobile-header-logo');
			 // moveDataInMobileView('.tvsearch-header-display-wrappper', '#tvcmsmobile-vertical-menu');
			 // console.log('moveDataInMobileView');
		}else{//for desktop view
			moveDataInDesktopView('#tvcmsdesktop-vertical-menu', '#tvcmsmobile-vertical-menu');
			moveDataInDesktopView('#tvcmsdesktop-main-menu', '#tvcmsmobile-horizontal-menu');
			moveDataInDesktopView('.tvcmsheader-nav-right', '#tvcmsmobile-header-right');
			moveDataInDesktopView('#tvcmsdesktop-logo', '#tvcmsmobile-header-logo');
			// console.log('moveDataInDesktopView');
		}

		if (document.body.clientWidth <= 575) {//In mobile view
			moveDataInMobileView('.tvmenu-button-wrapper', '#tvcmsmobile-horizontal-menu-left');
		}else{
			moveDataInDesktopView('.tvmenu-button-wrapper', '#tvcmsmobile-horizontal-menu-left');
		}
	}//showView

	function moveDataInMobileView(desktopClass, mobileClass) {    
		if($(desktopClass).html() != ''){
			$(mobileClass).html($(desktopClass).html());
			$(desktopClass).html('');
		}
	}

	function moveDataInDesktopView(desktopClass, mobileClass) {
		//console.log($(mobileClass).html());
		if($(mobileClass).html() !== ''){
			$(desktopClass).html($(mobileClass).html());      
			$(mobileClass).html('');
		}
	}

	showView();//default landing call for mobile view
	$(window).resize(function(){
		showView();
	});

	/********************* End Mobile View js *****************************************/

	/****************** Start Cart Js *******************************************/
	cartDropDownJs();
	$(window).resize(function(){
		cartDropDownJs();
	});
	function cartDropDownJs() {
		$(document).on('click', '#_desktop_cart .tvheader-cart-wrapper a', function(){
			if (document.body.clientWidth <= mobileViewSize) {
				if ($('#_desktop_cart .tvcmscart-show-dropdown').hasClass('open')) {
					$('#_desktop_cart .tvcmscart-show-dropdown').removeClass('open');
				} else {
					removeDefaultDropdown();
					$('#_desktop_cart .tvcmscart-show-dropdown').addClass('open');
				}
			}
		});

		$(document).on('mouseenter','#_desktop_cart .tvheader-cart-wrapper', function(){
			if (document.body.clientWidth > mobileViewSize) {
				removeDefaultDropdown();
				$('#_desktop_cart .tvcmscart-show-dropdown').addClass('open');
			}
		});

		$(document).on('mouseleave','#_desktop_cart .tvheader-cart-wrapper', function(){
			if (document.body.clientWidth > mobileViewSize) {
				$('#_desktop_cart .tvcmscart-show-dropdown').removeClass('open');
			}
		});
	}//cartDropDownJs
	/****************** End Cart Js *******************************************/

	/****************** Start Product Timer Js *******************************************/
	function separateTimerCharactor(data)
	{
		data = data.toString();
		var string  = '';
		for (var i=0, l = data.length; i < l; i++) {
			var strWithTag = "<span>"+"<p>" + data.charAt(i) + "</p>"+"</span>";
            var string = string.concat(strWithTag);
        }
        return string;
	}
	var result = setInterval(function() {
		$('.tvproduct-timer').each(function() {
			var time = $(this).attr('data-end-time');

			var countDownDate = new Date(time.replace(/ /g, "T") + 'Z');
			var now = new Date().getTime();


			var distance = countDownDate - now;

			// console.log(distance);
			
			var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);

			var data = days + '' + hours + '' + minutes + '' + seconds + '';


			var sDay = separateTimerCharactor(days);
			var sHour = separateTimerCharactor(hours);
			var sMinutes = separateTimerCharactor(minutes);
			var sSeconds = separateTimerCharactor(seconds);

			$(this).find('.tvproduct-timer-box .days').html(sDay);
			$(this).find('.tvproduct-timer-box .hours').html(sHour);
			$(this).find('.tvproduct-timer-box .minutes').html(sMinutes);
			$(this).find('.tvproduct-timer-box .seconds').html(sSeconds);
			$(this).find('.complated').hide();

			if (distance < 0) {
				clearInterval(x);
				data = "complate";
				$(this).find('.tvproduct-timer-wrapper').hide();
				$(this).find('.tvproduct-timer-complated').show(data);
			}
		});
	}, 1000);
	/****************** End Product Timer Js *******************************************/

	/********************* Start top-menu js *****************************************/
		
	//*************************start top-menu js *************************/

	$(window).resize(function(){
		$('.tvmain-menu-dropdown').removeClass('open');
	});

	function DesktopMenu(tv){
		if (document.body.clientWidth > mobileViewSize) 
		{
			var obj = tv;
			var extraWidth = 0;
			var new_width_popup = 0;
			var wrapWidthPopup = $(obj).find('.tvmain-menu-sub-menu').outerWidth(true);
			var wrapHeightPopup = $(obj).find('.tvmain-menu-sub-menu').outerHeight(true);				
			var actualWidthPopup = $(obj).find('.tvmain-menu-sub-menu').width();
			extraWidth = wrapWidthPopup - actualWidthPopup;
			var new_width_popup = $(obj).find('.tvmain-menu-sub-menu .top-menu').outerWidth(true);
			var menuWidth = $('.tvcmsmain-menu-wrapper').width();
			var subMenuLiWidth = $(obj).find('.tvmain-menu-sub-menu > ul > li').outerWidth(true);
			var totalSubMenu = $(obj).find('.tvmain-menu-sub-menu > ul > li').length;  
			var popupFinalWidth = (totalSubMenu * subMenuLiWidth)+40;
			var menuTopOffset = $("#header").offset();//menu top margin or other spacing
			var menuLiHeightOffset  = $(obj).offset();//menu inside top position like table
			var menuLiHeight  = $(obj).outerHeight(true);//line height of menu
			var menuPopopTop  = (menuLiHeightOffset.top - menuTopOffset.top) + menuLiHeight;

			var new_outer_width_popup = new_width_popup + extraWidth;
			if(popupFinalWidth > menuWidth){
				popupFinalWidth = menuWidth+40;
			}
			if(popupFinalWidth > new_outer_width_popup){
				new_outer_width_popup = popupFinalWidth;
			}
			if(wrapHeightPopup >= 400){//auto scroll when popup is bigger
				$(obj).find('.tvmain-menu-sub-menu').addClass('tv-auto-scroll');
			}else{
				$(obj).find('.tvmain-menu-sub-menu').removeClass('tv-auto-scroll');
			}
			var wraper = $('.tvcmsmain-menu-wrapper');
			var wWraper = wraper.outerWidth();
			var posWraper = wraper.offset();
			var pos = $(obj).offset();
			var xLeft = pos.left - posWraper.left;
			if ((xLeft + new_outer_width_popup) > wWraper) xLeft = wWraper - new_outer_width_popup;
			$(obj).find('.tvmain-menu-sub-menu').css('left', xLeft);
			$(obj).find('.tvmain-menu-sub-menu').css('top',menuPopopTop);
			$(obj).find('.tvmain-menu-sub-menu').css('width', popupFinalWidth);
			//$(obj).find('.tvmain-menu-sub-menu').stop(true, true).slideDown(500, 'swing');//show popup
			$(obj).find('.tvmain-menu-sub-menu').addClass('tv-desk-open');
			
		}
	}
	$('.tvmenu-toggle-icon').click(function(){
		DesktopMenu($(this).parent().parent());
	});

	$('.tvcmsmain-menu-wrapper > .tv-header-menu > li').hover(function() {
		DesktopMenu(this);
	},function(){
		$(this).find('.tvmain-menu-sub-menu').removeClass('tv-desk-open');//hide popup
	});

	$(document).on('click','#tvcms-mobile-view-header .tvmenu-button', function(e){
		e.preventDefault();
		if ($('#tvcmsmobile-horizontal-menu #tv-top-menu').hasClass('open')) {
			$('#tvcmsmobile-horizontal-menu #tv-top-menu').removeClass('open');
			$('.modal-backdrop.fade.in').remove();
		} else {
			removeDefaultDropdown();
			$('#tvcmsmobile-horizontal-menu #tv-top-menu').addClass('open');
			if ($('body').find('.modal-backdrop.fade').html() === undefined){
	       		$('body').append('<div class="modal-backdrop fade in"></div>');
          	}
			e.stopPropagation();
		}
	});

	$(document).on('click','.modal-backdrop.fade',function(){
		$('#tvcmsmobile-horizontal-menu #tv-top-menu').removeClass('open');
		$(this).remove();
	});
	
	$(document).on('click','#tvcmsmobile-horizontal-menu #tv-top-menu .tvhorizontal-menu-drop-down-icon', function(e){
		$(this).parent().parent().find('.tvmain-menu-mobile-dropdown').css('display','block');
	});

	$(document).on('click', '#tvcmsmobile-horizontal-menu .tv-has-child .tvmenu-link-wrapper .tvmenu-toggle-icon i', function(){
		if ($(this).hasClass('open')) {
			$(this).removeClass('open');
			$(this).parent().parent().next('.tvmain-menu-mobile-dropdown').removeClass('open').stop(false).slideUp(500, "swing");
		} else {					
			$('#tvcmsmobile-horizontal-menu .tvmain-menu-dropdown').css('left', '0').css('top','0').css('width', '100%');
			$(this).addClass('open');
			$(this).parent().parent().next('.tvmain-menu-mobile-dropdown').addClass('open').stop(false).slideDown(500, "swing");
		}
	});


	//************************************end Top-menu js******************************************************/

	//************************************ Start Product Details page slider ***************************************************/
	var swiperClass = [
	  	//['slider className','navigation nextClass','navigation prevClass','paging className']
	  	['.tvcmslike-product .tvlike-product-wrapper','.tvcmslike-next','.tvcmslike-prev','.tvcmslike-product'],
	  	['.tvcmscross-selling-product .tvcross-selling-product-wrapper','.tvcmscross-selling-next','.tvcmscross-selling-prev','.tvcmscross-selling-product'],
	  	['.tvcmssame-category-product .tvsame-category-product-wrapper','.tvcmssame-category-next','.tvcmssame-category-prev','.tvcmssame-category-product'],
	];

	for (var i = 0; i < swiperClass.length; i++) {
	   	$(swiperClass[i][0]).owlCarousel({
		    loop: false,
		    dots: false,
		    nav: false,
		    responsive: {
		      	0: { items: 1},
				320:{ items: 1, slideBy: 1},
				500:{ items: 2, slideBy: 1},
				768:{ items: 3, slideBy: 1},
				992:{ items: 3, slideBy: 1},
				1200:{ items: 4, slideBy: 1},
				1600:{ items: 4, slideBy: 1},
				1800:{ items: 4, slideBy: 1}
		    },
	  	});

	  	$(swiperClass[i][1]).on('click', function(e){
	    	e.preventDefault();
	    	$('.'+$(this).attr('data-parent')+' .owl-nav .owl-next').trigger('click');
	  	});
	  	$(swiperClass[i][2]).on('click', function(e){
		    e.preventDefault();
	    	$('.'+$(this).attr('data-parent')+' .owl-nav .owl-prev').trigger('click');
	  	});
	  	$(swiperClass[i][3]+' .tv-pagination-wrapper').insertAfter(swiperClass[i][3]+' .tvcmsmain-title-wrapper');
	}
	//************************************ End Product Details page slider *****************************************************/

	/**************** Start Catelog Quentity Increment Decrement *************************/
	$(document).on('click', '.tvproduct-wrapper.catelog .tvproduct-catalog-btn-wrapper .tvproduct-cart-quentity-increment', function(){
		var obj = $(this).parent().parent().parent().parent();
		var qty = parseInt(obj.find('.tvproduct-cart-quentity').val()) + 1;
		obj.find('.tvproduct-cart-quentity').val(qty);
		obj.parent().find('.tvproduct-cart-catalog-btn form input[name=qty]').val(qty);
	});

	$(document).on('click', '.tvproduct-wrapper.catelog .tvproduct-catalog-btn-wrapper .tvproduct-cart-quentity-decrement', function(){
		var obj = $(this).parent().parent().parent().parent();
		var qty = parseInt(obj.find('.tvproduct-cart-quentity').val()) - 1;
		if (qty >= 1) {
			obj.find('.tvproduct-cart-quentity').val(qty);
			obj.parent().find('.tvproduct-cart-catalog-btn form input[name=qty]').val(qty);
		}
	});

	$(document).on('blur', '.tvproduct-wrapper.catelog .tvproduct-catalog-btn-wrapper .tvproduct-cart-quentity', function(){
		var obj = $(this).parent().parent().parent().parent();
		var qty = parseInt(obj.find('.tvproduct-cart-quentity').val());
		if (qty > 1 && qty != NaN) {
			obj.find('.tvproduct-cart-quentity').val(qty);
			obj.parent().find('.tvproduct-cart-catalog-btn form input[name=qty]').val(qty);
		} else {
			qty = 1;
			obj.find('.tvproduct-cart-quentity').val(qty);
			obj.parent().find('.tvproduct-cart-catalog-btn form input[name=qty]').val(qty);
		}
	});


	/**************** End Catelog Quentity Increment Decrement *************************/

	/******************* Start Footer Toggle ***********************************************/
	$('.footer-container .tvfooter-title-wrapper').on('click',function(e){
		if (document.body.clientWidth > mobileViewSize) {
			e.stopPropagation();
		}
	});
	/******************* End Footer Toggle ***********************************************/

	/******************* Start Menu Sticky Js ********************************************/
	
	menuStickyJs();
	$(document).on('scroll', function(){
		var menu_sticky =  localStorage.getItem('menu-sticky') || 'true';
		if(menu_sticky == 'true'){
			menuStickyJs();
		}else{
			$('#header').removeClass('sticky');
		}
		bottomTotop();
	});
	
	function menuStickyJs(){
		var checkMenuSticky = $('body').attr('data-menu-sticky');
		if (checkMenuSticky == '1') {
			var startMenuStickyHeight = 450;
			var scrollHeight = $(document).scrollTop();
			if (document.body.clientWidth > mobileViewSize) {
				// Desktop View Sticky
				if (scrollHeight > startMenuStickyHeight) {
					$('#header').addClass('sticky');
					$('#wrapper').css('margin-top', $('#header').height()+'px');
				} else{
					$('#header').removeClass('sticky');
					$('#wrapper').css('margin-top','0px');
				}
			}
		}
	}
	function bottomTotop(){
		var startMenuStickyHeight = 450;
		var scrollHeight = $(document).scrollTop();
		if (scrollHeight > startMenuStickyHeight) {
			$('.tvbottom-to-top').fadeIn('slow');
		} else {
			$('.tvbottom-to-top').fadeOut('slow');
		}
	}
	/******************* End Menu Sticky Js ********************************************/

	/************** Start Filter Search ************************************/
	$(document).on('click','.tv_search_filter_wrapper .tvleft-right-title-wrapper', function(){
		if($('#search_filters_wrapper #search_filters').hasClass('open')) {
			$('#search_filters_wrapper #search_filters').removeClass('open').stop(false).slideUp(500, "swing");
		} else	{
			$('#search_filters_wrapper #search_filters').addClass('open').stop(false).slideDown(500, "swing");
		}
	});
	/************** End Filter Search ************************************/
	/************* Start Filter Search Category Js ***********************************/
	$(document).on('click', '#search_filters .tvfilter-search-types-title', function(){
      	if(document.body.clientWidth <= mobileViewSize){
      		var search_type_id = $(this).attr('data-target');
      		if ($(search_type_id).hasClass('open')) {
      			$(this).removeClass('open');
      			$(search_type_id).removeClass('open').stop(false).slideUp(500, "swing");
      		} else {
      			$(this).addClass('open');
      			$(search_type_id).addClass('open').stop(false).slideDown(500, "swing");
      		}
      	}
	});
	/************* End Filter Search Category Js ***********************************/

	/*************** Start Left Right Column Js *************************************************/

	// Left panel hide show.
	$(document).on('click','.tvcms-left-column-wrapper .tv-left-pannal-btn-wrapper',function(e){
		e.preventDefault();
		if($('#left-column').hasClass('open')) {
			$('#left-column').removeClass('open');
			$('.modal-backdrop.fade.in').remove();
		} else {
			$('#left-column').addClass('open');
			$('body').append('<div class="modal-backdrop fade in"></div>');
			e.stopPropagation();
		}
	});
	
	// Right Panel Hide show
	$(document).on('click','.tvcms-right-column-wrapper .tv-right-pannal-btn-wrapper',function(e){
		e.preventDefault();
		if($('#right-column').hasClass('open')) {
			$('#right-column').removeClass('open');
			$('.modal-backdrop.fade.in').remove();
		} else {
			$('#right-column').addClass('open');
			$('body').append('<div class="modal-backdrop fade in"></div>');
			e.stopPropagation();
		}
	});

	$(document).on('click','#left-column .tvleft-column-close-btn, #right-column .tvright-column-close-btn', function(){
		if ($(this).parent().parent().hasClass('open')) {
			$('.tv-left-right-panel-hide').removeClass('open');
			$('.modal-backdrop.fade.in').remove();
		}
	});

	// Left - right Panel Close. 
	$(document).on('click','.modal-backdrop.fade.in', function(){
		if ($('#left-column.tv-left-right-panel-hide, #right-column.tv-left-right-panel-hide').hasClass('open'))  {
			$('#left-column.tv-left-right-panel-hide, #right-column.tv-left-right-panel-hide').removeClass('open');
			$('.modal-backdrop.fade.in').remove();
		}
	});

	/*************** Start Left Right Column Js *************************************************/

	/************** Start Left Column brand list and supplier toggle ***************************/
	leftRightBrandSupplierTitleToggle();
	$(window).resize(function(){
	    $('.tvfilter-brand-list-wrapper .tvfilter-brand-list, .tvfilter-supplier-list-wrapper .tvfilter-supplier-list').removeClass('open');
  	});
  	function leftRightBrandSupplierTitleToggle()
	{
	    $('.tvfilter-brand-list-wrapper .tvleft-right-title-toggle, .tvfilter-supplier-list-wrapper .tvleft-right-title-toggle, .block-categories .tvleft-right-title-toggle').on('click', function(){
	      	if(document.body.clientWidth <= mobileViewSize){
	        	if($(this).hasClass('open')) {
		          	$(this).removeClass('open');
		          	$(this).parent().parent().find('.tvside-panel-dropdown').removeClass('open').stop(false).slideUp(500, "swing");
	        	} else {
		          	$(this).addClass('open');
		          	$(this).parent().parent().find('.tvside-panel-dropdown').addClass('open').stop(false).slideDown(500, "swing");
		        }
	    	}
	 	});
	}
	/************** End Left Column brand list and supplier toggle ***************************/

	/******** Start Scroll to Top js ***************************/
	$(document).on('click','.tvbottom-to-top .tvbottom-to-top-icon',function() {      // When arrow is clicked
        scrollToTop();
    });

    function scrollToTop()
    {
      $('body,html').animate({
            scrollTop : 0 // Scroll to top of body
        }, 500);
    }
	/******** End Scroll to Top js ***************************/

	/******************************** tooltop ************************/
	$(function(){
	   'use strict';

	    var popoverConfig = {
	        trigger: 'hover',
	        template: [
	            '<div class="popover tvtooltip" role="tooltip">',
	            '<div class="popover-arrow"></div>',
	            '<h3 class="popover-title"></h3>',
	            //'<div class="popover-content"></div>',
	            '</div>'
	        ].join(''),
	        placement: 'top',
	        container: 'body',
	    };

	    initPopovers();
	    function initPopovers()
	    {
	        $('[data-toggle="tvtooltip"]').popover(popoverConfig);
	    }
	});
	/*************** end tooltip***********************/

	// *****************STRAT ZOOM_PRODUCT**************

	 if(document.body.clientWidth  > 768) {
	      $(".product-cover img").elevateZoom({
	        zoomType: "inner",
			    cursor: "crosshair"
	      }); 
	      $('body').on('mouseenter','.product-cover .js-qv-product-cover', function(){
	        // Remove old instance od EZ
	        $('.zoomContainer').remove();
	        $(this).removeData('elevateZoom');
	        // Update source for images
	        // console.log($(this).attr('src'));
	        $(this).attr('src', $(this).attr('data-image-large-src'));
	        $(this).data('zoom-image', $(this).data('zoom-image'));
	    });
	       $('body').on('click',('.js-qv-product-images .js-thumb'),function(e){
	          e.preventDefault();
	        var img_val = $(this).attr('data-image-large-src');
	          $('.product-cover img').attr('src',img_val);
	          $('.zoomContainer img').attr('src',img_val);
	          $('.zoomWindowContainer div').css("background-image","url("+ $(this).attr('data-image-large-src') +")");
	       });
	  }

	// *****************END ZOOM_PRODUCT**************//




	/****************** Start Tooltip Js **************************/
	$(function(){
   'use strict';
	    var popoverConfig = {
	        trigger: 'hover',
	        template: [
	             '<div class="popover tvtooltip" role="tooltip">',
	            '<div class="popover-arrow"></div>',
	            '<h3 class="popover-title"></h3>',
	            '<div class="popover-content"></div>',
	            '</div>'
	        ].join(''),
	        placement: 'top',
	        container: 'body',
	    };

	    initPopovers();
	    function initPopovers()
	    {
	        $('[data-toggle="tvtooltip"]').popover(popoverConfig);
	    }
	});

	/****************** End Tooltip Js **************************/

	/********************* tab title js ***************************/

	// if(document.body.clientWidth <= 991 ){
	//     $('.tvcmstab-title-product .tvtab-pagination-wrapper').insertAfter('.tvtab-product .tvcmsmain-title-wrapper');
 //  	}
 //  	if(document.body.clientWidth <= 575 ){
	//     $('.tvcmstab-title-product .tvtab-pagination-wrapper').insertAfter('.tvtab-product .tvtab-title-wrapper');
 //  	}

 //  	if(document.body.clientWidth <= 768 ){
	//     $('.tvsingle-block-image-info-wrapper .tv-single-block-image-wrapper').insertAfter('.tvsingle-block-info-box');
 //  	}



});//$(document).ready(function(){