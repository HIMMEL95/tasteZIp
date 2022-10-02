var slide_idx = 0;
var tmp_scrollTop = 0;
var is_animate = false;
var is_mobile = false;

var winwidth = $(window).width();
var winheight = $(window).height();
if(winwidth > 845){
	is_mobile = false;
	var topFixedPosition = 50;
}else{
	is_mobile = true;
	var topFixedPosition = 20;
}
$(window).resize(function(){
	var winwidth = $(window).width();
	if(winwidth > 845){
		is_mobile = false;
		var topFixedPosition = 50;
	}else{
		is_mobile = true;
		var topFixedPosition = 20;
	}
})
$(document).ready(function(){
	var navScroll = false;
	var rbotVideoWidth = $(window).innerWidth();
	//비디오 개수//
	var rbotlen = $("#rbotVideoWr .rbotVideo .rbotVideo_wrap video").length;
	
	
	if(is_mobile){
		$(".intro_video").get(0).play();
	}

	//비디오 가로 사이즈 변경//
	$(".rbotVideo video").attr("width", rbotVideoWidth+"px");
	var rbotvidHeight = $("#rbotVideo1").height();
	var rbotvidTimesHeight = rbotlen * rbotvidHeight;
	$("#rbotVideoWr").css("height", rbotvidTimesHeight+"px");
	
	setTimeout(function(){
		rbotvidHeight = $("#rbotVideo1").height();
		//비디오 높이 와 갯수 곱//
		rbotvidTimesHeight = rbotlen * rbotvidHeight;
		
		$("#rbotVideoWr").css("height", rbotvidTimesHeight+"px");
	},500)

	$("#header .hd nav ul").on('click', 'li a', function(){
		
		$(this).parent().toggleClass("subMenu");
		
	})

	$(".hd nav > ul").on('click', ' > li', function() {
		navScroll = true;
		$(".hd nav ul").removeClass("is__active");
		$(".ham_menu a span").removeClass("ham_close");
		$(".ham_menu a span").addClass("ham_open");
		$(this).addClass("is__active");
		$("#header").removeClass("m-active");
		var divid = $(this).find('a').data('id');
		$('html, body').animate({
			scrollTop: $("#"+divid).offset().top - 35
		}, 500, function(){
			navScroll = false;
		});
	});

	$(".hd nav > ul > li > ul").on('click', ' > li', function(e) {
		navScroll = true;
		/*부모제외 클릭*/
		e.preventDefault();
		e.stopPropagation();
		$(".hd nav ul li ul li").removeClass("is__active");
		$(this).addClass("is__active");
		$("#header").removeClass("m-active");
		var divid = $(this).find('a').data('id');
		$('html, body').animate({
			scrollTop: $("#"+divid).offset().top - 35
		}, 500, function(){
			navScroll = false;
		});
	});


	$('#header .hd nav ul').on('click', 'li a', function() {
		
		if($(this).parent().hasClass('subMenu')){
			$(this).parent().removeClass("subMenu");
		}else{
			$('#header .hd nav ul li a').removeClass("subMenu");
			$(this).parent().addClass("subMenu");
		}
	});


	/***해더 메뉴 스크롤**/
	

	$(window).scroll(function(){
		var winHeight = $(window).height();
		var scrolltop = $(window).scrollTop();

		
		/***해더 메뉴 스크롤**/
		if(scrolltop > topFixedPosition){
			$("body").addClass("headerFixed");
		}else{
			$("body").removeClass("headerFixed");		
		}
		
		/***해더 메뉴 스크롤 글씨 액티브**/

		var introTop = $("#intro").offset().top-40;
		var overviewTop = $("#overview").offset().top-125;
		var recordingTop = $("#recording").offset().top-125;
		
		if(scrolltop >= introTop && overviewTop > scrolltop){
			$(".hd nav > ul > li > a").removeClass("active");
			$("#intro_menu").addClass("active");
			
		}else if(scrolltop >= overviewTop && recordingTop > scrolltop){
			$(".hd nav > ul > li > a").removeClass("active");
			$("#overview_menu").addClass("active");
		}else if(scrolltop >= recordingTop){
			$(".hd nav > ul > li > a").removeClass("active");
			$("#recording_menu").addClass("active");
		}


		var introText = introTop - 60;
		var overflowText = overviewTop - 60;

		if(scrolltop >= introText && overflowText > scrolltop){
			$("#intro .introVideo h1").addClass("textFixed");
		}else if(scrolltop < introText){
			$("#intro .introVideo h1").removeClass("textFixed");
		}


		/* if(scrolltop >= detailTop && specTop > scrolltop){
			$(".hd nav > ul > li > a").removeClass("active");
			$(".hd nav > ul > li > ul > li > a").removeClass("active");
			$("#family_menu").addClass("active");
		}else if(scrolltop >= specTop && featureTop > scrolltop){
			$(".hd nav > ul > li > ul > li > a").removeClass("active");
			$("#spec_menu").addClass("active");
		}else if(scrolltop >= featureTop && characterTop > scrolltop){
			$(".hd nav > ul > li > ul > li > a").removeClass("active");
			$("#feature_menu").addClass("active");
		}else if(scrolltop >= characterTop){
			$(".hd nav > ul > li > ul > li > a").removeClass("active");
			$("#character_menu").addClass("active");
		} */

		if($(window).innerWidth() <= 845) {
			var intVideo =  $(".intro_video").offset().top + $(".intro_video").height() - $(".introVideo h1").height() - 20;
		}else{
			var intVideo =  $(".intro_video").offset().top + $(".intro_video").height() - $(".introVideo h1").height() - 60;
		}


		if(scrolltop >= intVideo - 60){
			$("#intro .introVideo h1").addClass("textAbsolute");
		}else{
			$("#intro .introVideo h1").removeClass("textAbsolute");
		}

		 if(scrolltop >= detailTop){
			$("#detail_menu").addClass("active");
			$("#header .hd nav ul li:last-child").addClass("subMenu");
		 }else{
			
			$("#detail_menu").removeClass("active");
			$("#header .hd nav ul li:last-child").removeClass("subMenu");
		 }


		
		
		
		var centerRbotWrap = (winHeight - rbotvidHeight) / 2;
		var rbotVideoWr = $("#rbotVideoWr").offset().top + (centerRbotWrap * -1);

		var rbotVideoTop = $("#rbotVideoWr").offset().top;
		var rbotVideoWidth = $(window).innerWidth();
		var videohalf = rbotvidHeight / 2;
		var video_len = $("#rbotVideoWr .rbotVideo_wrap video").length;
		
/*
		
		//각 비디오 중간 스크롤 값
		var rbotVideoZero = rbotVideoTop + videohalf,
		rbotVideoFirst = rbotVideoTop + (rbotvidHeight * 1) + videohalf,
		rbotVideoSecond = rbotVideoTop + (rbotvidHeight * 2) + videohalf,
		rbotVideoThird = rbotVideoTop + (rbotvidHeight * 3) + videohalf,
		rbotVideoFourth = rbotVideoTop + (rbotvidHeight * 4) + videohalf,
		rbotVideoFifth = rbotVideoTop + (rbotvidHeight * 5) + videohalf;

		//각 비디오 섹션에 비디오값 더해준 값
		var rbotVideoFirstTop = rbotVideoTop + (rbotvidHeight * 1),
		rbotVideoSecondTop = rbotVideoTop + (rbotvidHeight * 2),
		rbotVideoThirdTop = rbotVideoTop + (rbotvidHeight * 3),
		rbotVideoFourthTop = rbotVideoTop + (rbotvidHeight * 4),
		rbotVideoFifthTop = rbotVideoTop + (rbotvidHeight * 5);
*/
		
/*
		
		if (scrolltop >= rbotVideoWr){
			slide_idx = 0;
		}else if(rbotVideoTop + (rbotvidHeight * (video_len - 1)) > scrolltop){
			slide_idx = video_len;
		}
*/
		if(!is_mobile){
				
			if (scrolltop >= rbotVideoWr && rbotVideoTop + (rbotvidHeight * (video_len - 1)) > scrolltop && !navScroll)
			{
				$("#rbotVideoWr").addClass("content_fixed");
				$("#rbotVideoWr.content_fixed .rbotVideo_wrap").css("top", centerRbotWrap+"px");
				
				if(!is_animate){
					console.log(slide_idx);
					if(tmp_scrollTop < scrolltop){ //스크롤 올릴 때
						is_animate = true;
						if(slide_idx == 0){
							slide_idx = 1;	
							is_animate = false;		
						}else{ // 스크롤 내릴 때
							var next = slide_idx + 1;
							
							
							if(next > video_len){
								slide_idx = video_len;
							}else{
								
								$('html, body').stop().animate({
									scrollTop: rbotVideoTop + (rbotvidHeight * (next - 1))
								}, 1000, function(){
									setTimeout(function(){
										is_animate = false;
									}, 500)
									
									slide_idx = next;
								});
								
								$('#rbotVideoWr .rbotVideo_wrap').stop().animate({
									left: "-"+($(window).innerWidth() * (next - 1 ))+"px",
								}, 1000, function(){
									setTimeout(function(){
										is_animate = false;
									}, 500)
									slide_idx = next;
								});
							}
							
						}
					}else{
						is_animate = true;
						if(slide_idx == 1){
							slide_idx = 0;	
							is_animate = false;		
						}else{ // 스크롤 내릴 때
							var next = slide_idx - 1;
							
							
							if(next < 1){
								slide_idx = 0;
							}else{
								$('html, body').stop().animate({
									scrollTop: rbotVideoTop + (rbotvidHeight * (next - 1))
								}, 1000, function(){
									setTimeout(function(){
										is_animate = false;
									}, 500)
									slide_idx = next;
								});
								
								$('#rbotVideoWr .rbotVideo_wrap').stop().animate({
									left: "-"+($(window).innerWidth() * (next - 1 ))+"px",
								}, 1000, function(){
									setTimeout(function(){
										is_animate = false;
									}, 500)
									slide_idx = next;
								});
							}
							
						}
						console.log(slide_idx);
					}
				}
				
				
				
			}else{
				$("#rbotVideoWr").removeClass("content_fixed");
				
				if (scrolltop <= rbotVideoWr){
					slide_idx = 0;
					$('#rbotVideoWr .rbotVideo_wrap').css({
						left: "0px"
					})
				}else if(rbotVideoTop + (rbotvidHeight * (video_len - 1)) < scrolltop){
					slide_idx = video_len;
					$('#rbotVideoWr .rbotVideo_wrap').css({
						left: "-"+($(window).innerWidth() * (video_len - 1 ))+"px"
					})
				}
				
				if(slide_idx <= 1){
					$("#rbotVideoWr .rbotVideo_wrap").css("top","0px");
				}else{
					$("#rbotVideoWr .rbotVideo_wrap").css("top",(rbotvidHeight * (video_len-1))+"px");
				}
			}
		}
		
/*

		if(slide_idx == 0){
			slide_idx = 1;			
		}else{
			//var next = slide_idx + 1; 

			if(slide_idx == 1){

				if(scrolltop >= rbotVideoZero){
					$('.rbotVideo_wrap').animate({
						left: "-"+rbotVideoWidth+"px"
					}, 500);
					
					//슬라이드 후 다음영역으로 이동
					bodyScrollto(rbotVideoFirstTop, 500);

					slide_idx++;
					return false;
				}
	
			}else if(slide_idx == 2){
				if(scrolltop >= rbotVideoFirst){
					$('.rbotVideo_wrap').animate({
						left: "-"+(rbotVideoWidth * 2)+"px"
					}, 500);

					//슬라이드 후 다음영역으로 이동
					bodyScrollto(rbotVideoSecondTop, 500);

					slide_idx++;
					return false;
				}
			
			}else if(slide_idx == 3){

				if(scrolltop >= rbotVideoSecond){
					$('.rbotVideo_wrap').animate({
						left: "-"+(rbotVideoWidth * 3)+"px"
					}, 500);

					//슬라이드 후 다음영역으로 이동
					bodyScrollto(rbotVideoThirdTop, 500);

					slide_idx++;
					return false;
				}
			
			}else if(slide_idx == 4){

				if(scrolltop >= rbotVideoThird){
					$('.rbotVideo_wrap').animate({
						left: "-"+(rbotVideoWidth * 4)+"px"
					}, 500);

					//슬라이드 후 다음영역으로 이동
					bodyScrollto(rbotVideoFourthTop, 500);

					slide_idx++;
					return false;
				}
			
			}else if(slide_idx == 5){
				if(scrolltop >= rbotVideoFourth){
					$('.rbotVideo_wrap').animate({
						left: "-"+(rbotVideoWidth * 5)+"px"
					}, 500);
					return false;
				}

			}




			/*
			var next = slide_idx + 1; 
			var rbotVidone = rbotVideoWr + rbotvidHeight;
			var rbotVidtwo = rbotVideoWr + (rbotvidHeight * 2);
			
			if(scrolltop >= rbotVidone){
				$('#rbotVideoWr .rbotVideo_wrap').animate({
					left: "-"+$(window).innerWidth()+"px",
				}, 500);
			}
			/
		}
		console.log(slide_idx);

*/
		/*
		var rbotHeight = $(".rbotVideo").height();
		var rbotVideo = $(".rbotVideo video").length;

		var rbotVideoWr = $("#rbotVideoWr").offset().top;
		if (scrolltop >= rbotVideoWr && detailTop > scrolltop)
		{
			
			$("#rbotVideoWr").addClass("content_fixed");
			$("#rbotVideoWr").css("height", rbotHeight);
		}else{
			$("#rbotVideoWr").removeClass("content_fixed");
			$("#rbotVideoWr").css("height", "auto");
		}
		*/
		

		tmp_scrollTop = scrolltop;
	
	})


})



function bodyScrollto(p, t){

	$('html, body').animate({
		scrollTop: p
	}, t);

}



$(window).resize(function (){
	var rbotVideoWidth = $(window).innerWidth();
	//비디오 개수//
	var rbotlen = $("#rbotVideoWr .rbotVideo .rbotVideo_wrap video").length;
	var rbotvidHeight = $(".intro_video").height();
	//비디오 높이 와 갯수 곱//
	var rbotvidTimesHeight = rbotlen * rbotvidHeight;
	//비디오 가로 사이즈 변경//
	$(".rbotVideo video").attr("width", rbotVideoWidth+"px");
	$("#rbotVideoWr").css("height", rbotvidTimesHeight+"px");

})
