$(document).ready(function(){
	$(".ham_menu .ham_open_btn").click(function(){
		if($("#header").hasClass("m-active")){
			$("#header").removeClass("m-active");
			$(this).find(".ham_icon").removeClass("ham_close");
			$(this).find(".ham_icon").addClass("ham_open");
		}else{
			$("#header").addClass("m-active");
			$(this).find(".ham_icon").addClass("ham_close");
			$(this).find(".ham_icon").removeClass("ham_open");
		}
		
	})

	$(".family_button").click(function(){
	
		$(".family_site_list").toggleClass("is-block");
	
	})
})


var initPage = function initPage() {
  setupCharacterGrid();
};	


var setupCharacterGrid = function setupCharacterGrid() {
  var PlexCharacter = function PlexCharacter() {
	this.init();
  };

  PlexCharacter.prototype = {
	settings: {
	  categorySelectorClass: "js-plex-character-set-category",
	  characterSelectorClass: "js-plex-character",
	  characterHoverClass: "hover",
	  zoomedCharacterId: "#plex-character-zoomed",
	  zoomedClass: "zoomed",
	  zoomedVisibleClass: "is-visible",
	  offsetY: 25,
	  offsetX: -25
	},
	init: function init() {
	  var self = this;
	  var zoomedCharacter = $(self.settings.zoomedCharacterId);
	  $("." + self.settings.characterSelectorClass).wrapInner("<span/>");
	  $("." + self.settings.characterSelectorClass).on("touchstart mouseover", function (event) {
		var character = $(this).text();
		zoomedCharacter.find("span").text(character);
	  });
	  $(document).on("mousemove", function (event) {
		if ($(event.target).parents(".single-item").hasClass(self.settings.characterSelectorClass)) {
		  var parentOffset = $(event.target).parents(".character-set-category").offset(); //or $(this).offset(); if you really just want the current element's offset

		  var relX = event.pageX - parentOffset.left;
		  var relY = event.pageY - parentOffset.top;
		  self.showZoomedCharacter(event, relX, relY);
		} else {
		  zoomedCharacter.removeClass(self.settings.zoomedVisibleClass);
		}
	  });
	},
	showZoomedCharacter: function showZoomedCharacter(event, x, y) {
	  var self = this;
	  var zoomedCharacter = $(self.settings.zoomedCharacterId); // Move into parent category
	  //var parentCategory = $(event.target).parents('.' + self.settings.categorySelectorClass);
	  //zoomedCharacter.prependTo(parentCategory);

	  var classList = $(event.target).parents(".character-set-box").attr("class");
	  zoomedCharacter.attr("class", classList);
	  zoomedCharacter.addClass(self.settings.zoomedClass + " " + self.settings.zoomedVisibleClass);
	  var left = x + self.settings.offsetX;
	  var top = y + self.settings.offsetY;
	  var width = zoomedCharacter.width();
	  var windowWidth = $(window).width() - 25;
	  var overflowX = windowWidth - (left + width);

	  if (overflowX < 0) {
		left += overflowX;
	  }

	  var screenY = y;
	  var height = zoomedCharacter.outerHeight();
	  var windowHeight = $(".page-section--character-grid").height();
	  var overflowY = windowHeight - (screenY + height) - 50;

	  if (overflowY < 0) {
		top += overflowY;
	  }

	  zoomedCharacter.css({
		left: left,
		top: top,
		display: "block"
	  });
	}
  };
  var character = new PlexCharacter();
};

$(document).ready(function(){
	initPage();
})