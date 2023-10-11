<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
    <nav class="navbar navbar-expand-custom navbar-mainbg">
        <a class="navbar-brand navbar-logo" href="/home.do">
            <div id="nav-logo-div">
                <img src="/resources/images/pet-white.png" alt="로고" width="25px" height="25px" id="logo-img">
                <span id="nav-pet-lounge">펫 라운지</span>
            </div>    
        </a>
        <button class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars text-white"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="hori-selector"><div class="left"></div><div class="right"></div></div>
            <ul class="navbar-nav">
                <li class="nav-item" id="hospitalLink">
                    <a class="nav-link" href="/hospital/page.do">동물병원 안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0);">산책 날씨 예보</a>
                </li>
                <li class="nav-item" id="supportLink">
                    <a class="nav-link" href="/support/list.do">펫 라운지 모금함</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0);">공지사항</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0);">자유게시판</a>
                </li>
            </ul>
            <c:if test="${ sessionScope.userId eq null }">
	            <ul class="navbar-nav ml-auto">
	                <li class="nav-item">
	                    <a class="nav-link" href="/userLogin/page.do">로그인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/userRegister/page.do">회원가입</a>
	                </li>
	            </ul>            
            </c:if>
            <c:if test="${ sessionScope.userId ne null }">
	            <ul class="navbar-nav ml-auto">
	                <li class="nav-item">
	                    <a class="nav-link" href="javascript:void(0);">로그아웃</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/userInfo/page.do">마이페이지</a>
	                </li>
	            </ul>            
            </c:if>
        </div>
    </nav>
</header>

 <script>
     // var currentURL = window.location.pathname;
 
     // // 각 메뉴 항목의 URL과 비교하여 활성 클래스를 추가
     // $('.navbar-nav a').each(function () {
     //     var linkURL = $(this).attr('href');
     //     if (currentURL === linkURL) {
     //         $(this).addClass('active');
     //     }
     // });
 </script>
 <script>
     // ---------Responsive-navbar-active-animation-----------
     function test(){
         var tabsNewAnim = $('#navbarSupportedContent');
         var selectorNewAnim = $('#navbarSupportedContent').find('li').length;
         var activeItemNewAnim = tabsNewAnim.find('.active');
         var activeWidthNewAnimHeight = activeItemNewAnim.innerHeight();
         var activeWidthNewAnimWidth = activeItemNewAnim.innerWidth();
         var itemPosNewAnimTop = activeItemNewAnim.position();
         var itemPosNewAnimLeft = activeItemNewAnim.position();
         $(".hori-selector").css({
             "top":itemPosNewAnimTop.top + "px", 
             "left":itemPosNewAnimLeft.left + "px",
             "height": activeWidthNewAnimHeight + "px",
             "width": activeWidthNewAnimWidth + "px"
         });
         $("#navbarSupportedContent").on("click","li",function(e){
             $('#navbarSupportedContent ul li').removeClass("active");
             $(this).addClass('active');
             var activeWidthNewAnimHeight = $(this).innerHeight();
             var activeWidthNewAnimWidth = $(this).innerWidth();
             var itemPosNewAnimTop = $(this).position();
             var itemPosNewAnimLeft = $(this).position();
             $(".hori-selector").css({
                 "top":itemPosNewAnimTop.top + "px", 
                 "left":itemPosNewAnimLeft.left + "px",
                 "height": activeWidthNewAnimHeight + "px",
                 "width": activeWidthNewAnimWidth + "px"
             });
         });
     }
     $(document).ready(function(){
         setTimeout(function(){ test(); });
     });
     $(window).on('resize', function(){
         setTimeout(function(){ test(); }, 500);
     });
     $(".navbar-toggler").click(function(){
         $(".navbar-collapse").slideToggle(300);
         setTimeout(function(){ test(); });
     });
 
 
 
     // --------------add active class-on another-page move----------
     jQuery(document).ready(function($){
         // Get current path and find target link
         var path = window.location.pathname;
 
         // Account for home page with empty path
         if ( path == '' ) {
             path = 'home.html';
         }
 
         var target = $('#navbarSupportedContent ul li a[href="'+path+'"]');
         // Add active class to target link
         target.parent().addClass('active');
     });
 
 
 
     // Add active class on another page linked
     // ==========================================
     // $(window).on('load',function () {
     //     var current = location.pathname;
     //     console.log(current);
     //     $('#navbarSupportedContent ul li a').each(function(){
     //         var $this = $(this);
     //         // if the current path is like this link, make it active
     //         if($this.attr('href').indexOf(current) !== -1){
     //             $this.parent().addClass('active');
     //             $this.parents('.menu-submenu').addClass('show-dropdown');
     //             $this.parents('.menu-submenu').parent().addClass('active');
     //         }else{
     //             $this.parent().removeClass('active');
     //         }
     //     })
     // });
</script>
<script>
    // 현재 페이지 경로 가져오기
    var currentPath = window.location.pathname;

    // 조건 확인 후 메뉴 업데이트
    if (currentPath === '/hospital/detail.do' || currentPath === '/hospital/search.do') {
        // '/hospital/detail.do' 경로에 해당하는 경우
        document.getElementById('hospitalLink').classList.add('active');
    } else {
        // 다른 경우
        document.getElementById('hospitalLink').classList.remove('active');
    }
    
    if (currentPath === '/support/list.do' || currentPath === '/support/detail.do' 
    		|| currentPath === '/support/insert.do' || currentPath === '/support/update.do' 
    		|| currentPath === '/support/payment.do' || currentPath === '/support/complete.do') {
        document.getElementById('supportLink').classList.add('active');
    } else {
        // 다른 경우
        document.getElementById('supportLink').classList.remove('active');
    }
    
</script>