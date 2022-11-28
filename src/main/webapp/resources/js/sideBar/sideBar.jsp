<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<input type="hidden" name="ifmmSeq">

 <div class="left-bar">
		    <div class="upper-part">
		      <div class="actions">
		        <div class="circle"></div>
		        <div class="circle-2"></div>
		      </div>
		    </div>
		    <div class="left-content">
		      <ul class="action-list">
		      	<li style="text-align: center; margin-bottom: 23px; font-size: 15px;">
		      		<span style="display: inline-block; color: #ff7f00;"><c:out value="${sessName }"/>님,</span>
		      		<span style="display: inline-block; color: white;">반갑습니다.</span>
		      	</li>
		      	<hr style="color: white;">
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-inbox"
		            viewBox="0 0 24 24">
		            <path d="M22 12h-6l-2 3h-4l-2-3H2" />
		            <path d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z" />
		          </svg>
		          <a class="Home" href="/xdminMain">
		          	<span>Home</span>
		          </a>
		        </li>
		        <li class="item pt-2">
		        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-users">
		            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
		            <circle cx="9" cy="7" r="4" />
		            <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
		            <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
		            <a class="Member" href="/member/xdminMemberList">
			          <span> Member</span>
		            </a>
		        </li>
		        <li class="item pt-2">
		        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-star">
		            <polygon
		              points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
		            </svg>
		          <a class="Order" href="/order/xdminOrderList">
		          	<span>Order</span>
		          </a>
		        </li>
		        <li class="item pt-2">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-hash">
		            <line x1="4" y1="9" x2="20" y2="9" />
		            <line x1="4" y1="15" x2="20" y2="15" />
		            <line x1="10" y1="3" x2="8" y2="21" />
		            <line x1="16" y1="3" x2="14" y2="21" /></svg>
		            <a class="Reservation" href="/reservation/xdminReservationList">
		          		<span>Reservation</span>
		          	</a>
		        </li>
		        <li class="item pt-2">
		        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-zap">
		            	<polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
		            </svg>
		             <a class="Store" href="/store/xdminStoreList">
		          		<span>Store</span>
		          	</a>
		        </li>
		        <li class="item pt-2">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-zap">
		            	<polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
		            </svg>
		             <a class="Store" href="/store/ownerStoreList">
		          		<span>Owner Store</span>
		          	</a>
		        </li>
		        <li class="item pt-2">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-sun" viewBox="0 0 24 24">
		            <circle cx="12" cy="12" r="5"></circle>
		            <path d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"></path>
		          </svg>
		           <a class="Menu" href="/menu/xdminMenuList">
		          		<span>Menu</span>
		          	</a>
		        </li>
		        <li class="item pt-2">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-sun" viewBox="0 0 24 24">
		            <circle cx="12" cy="12" r="5"></circle>
		            <path d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"></path>
		          </svg>
		           <a class="Menu" href="/menu/ownerMenuList">
		          		<span>Owner Menu</span>
		          	</a>
		        </li>
		        <li class="item pt-2">
		         <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-users">
		            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
		            <circle cx="9" cy="7" r="4" />
		            <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
		            <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
	         	 	<a class="Comment" href="/comment/xdminCommentList">
		          		<span>Comment</span>
	          		</a>
		        </li>
		      </ul>
		      <ul class="category-list" style="margin-top: 30px;">
		        <li class="item pt-2">
		         <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-hash">
		            <line x1="4" y1="9" x2="20" y2="9" />
		            <line x1="4" y1="15" x2="20" y2="15" />
		            <line x1="10" y1="3" x2="8" y2="21" />
		            <line x1="16" y1="3" x2="14" y2="21" /></svg>
		          <a class="Code b" href="/code/xdminCodeList">
	          		<span>Code</span>
		          </a>
		        </li>
		        <li class="item pt-2">
		         <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-hash">
		            <line x1="4" y1="9" x2="20" y2="9" />
		            <line x1="4" y1="15" x2="20" y2="15" />
		            <line x1="10" y1="3" x2="8" y2="21" />
		            <line x1="16" y1="3" x2="14" y2="21" /></svg>
		             <a class="CodeGroup b" href="/codeGroup/xdminCodeGroupList">
		          		<span>CodeGroup</span>
			          </a>
		        </li>
		      <hr style="color: white;">
		        <li class="item pt-2">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-trending-up">
		            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18" />
		            <polyline points="17 6 23 6 23 12" /></svg>
		             <a>
		          		<button type="button" id="logout" name="logout" style="color: white;">Logout</button>
			          </a>
		        </li>
		      </ul>
		    </div>
		  </div>
		  
<<script type="text/javascript">
	// 로그아웃
	
	$("#logout").on("click", function() {
		alert("sdfsf");
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/xdminLogin";
					} 
				}
			});
		});

</script>
