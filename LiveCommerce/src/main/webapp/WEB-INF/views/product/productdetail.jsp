<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>상품상세보기</title>
    <link href="http://script.gmarket.co.kr/pc/css/common/kr/swiper.min.css" rel="stylesheet">
    <link href="http://script.gmarket.co.kr/pc/css/ko/common.css" rel="stylesheet">
    <link href="http://script.gmkt.kr/pc/css/ko/vip.css" rel="stylesheet">
    <link href="http://script.gmarket.co.kr/pc/css/common/kr/ui/browser_update.css" rel="stylesheet">
    <script async="" src="//static.criteo.net/js/ld/ld.js"></script>
    <script async="" src="https://tags.bkrtx.com/js/bk-coretag.js"></script>
    <script src="h0ttps://connect.facebook.net/signals/config/899590157100217?v=2.9.91&amp;r=stable" async=""></script>
    <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
    <script async="" src="https://scripts.baikalize.com/etm/etm.js?id=gmkt-pc"></script>
    <script async="" src="//script.gmarket.co.kr/mobile/js/common/kr/util/viewability.js"></script>
    <script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
    <script async=""
        src="//montelena.gmarket.co.kr/montelena.js?path=http://item.gmarket.co.kr/Item?goodscode=1552234801&amp;ver=638091306927143587">
    </script>
    <script type="text/javascript" src="http://script.gmkt.kr/jQuery/1.8.3/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $j = jQuery.noConflict();
        $ = jQuery.noConflict();
    </script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/utils/Polyfill.js"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/ItemBase.js"></script>
    <script type="text/javascript" defer="defer"
        src="http://script.gmarket.co.kr/js/item2/challenge/neo_include/js/impression.js">
    </script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/common/ubprofiler_gmkt.js"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/common/ats_gmkt.js"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/common/pds_gmkt.js"></script>
    <!-- header -->
    <link rel="stylesheet" href="http://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css">
    <script src="http://script.gmarket.co.kr/fnp/desktop-layout.js"></script>
    <!-- // header -->
    <style>
    	body{
    		margin: 0 auto;
    		width: auto;
    		font-size:16px;
    	}
    	.location-navi{
    		background-color: white;
    		padding-right: 30px;
    		padding-top:130px;
    		padding-bottom:20px;
    		padding-left:50px;
    	}
    	#container{
    		background-color: white;
    	}

		.vip-tabwrap .vip-tabnavi.fixed{
			position:absolute;
		}

    </style>
</head>

<body class="vip-smiledelivery">
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/common/rpm.js"></script>
    <script>
		// 제품 수량 변경
		function change_qty(button){
			console.log("버튼클릭");
			 var min_qty = 1;
			 var this_qty = $(".num").val()*1;
			 var this_price = $("#price").val()*1;
			 var max_qty = 10;
			 if(button=='left'){
				 console.log("수량감소");
				 console.log("가격" + this_price);
				 this_qty -= 1;
				 if(this_qty < min_qty){
					 this_qty = 1;
				 }
				 console.log(this_qty);
			 }
			 
			 else if(button=='right'){
				 console.log("수량증가");
				 console.log("가격" + this_price);

				 this_qty += 1;
				 if(this_qty > max_qty){
					 alert("재고가 부족합니다.");
					 return;
				 }
				 console.log(this_qty);
			 }
			 
			 var show_total_amount = this_price * this_qty;
			 $(".num").val(this_qty);
			 $("#coreTotalPrice").html(show_total_amount + "원");
			 $("#wingTotalPrice").html(show_total_amount + "원");
			 $(".sumPrice").html(show_total_amount + "원");
	
			 $("#pamount").val(this_qty);
		}
		
        function category(lcategory, scategory){
            console.log(lcategory + " " + scategory);
            var cate = '/product/listCategory?lcategory='+lcategory+'&scategory='+scategory;
            
            location.href = cate;
        }
    </script>
    <div class="location-navi">
    	<div style="display:none;">
			로그인ID : <sec:authentication property="name"/><br>
			로그인 Auth : <sec:authentication property="authorities"/><br>
			로그인 Detail : <sec:authentication property="Details"/><br>
			로그인 Credentials : <sec:authentication property="Credentials"/>
			로그인 Principal : <sec:authentication property="Principal"/><br>
		</div>
	<!-- 	<a href="/mypage/orderList">주문현황</a> -->
        <ul>
            <li>
                <a href="#" data-montelena-acode="200000474" onclick="">홈</a>
            </li>
            <li>
                <a href="#" data-montelena-acode="200000475" onclick=""> ${productInfo.lcategory}</a>
                <div class="loc-catewrap uxerollover">
                    <a href="#loc-cate1" aria-haspopup="menu" aria-expanded="false" aria-controls="loc-cate1" class="bt_view-ctrl">열기</a>
                    <span id="loc-cate1" class="layer_loc-cate" role="menu">
                        <a href="/product/listCategory?lcategory=과일과채소&scategory=" data-montelena-acode="200000475" onclick=""> 과일과 채소</a>
                        <a href="/product/listCategory?lcategory=곡물과견과&scategory=" data-montelena-acode="200000475" onclick=""> 곡물과 견과</a>
                        <a href="/product/listCategory?lcategory=생선과해산물,건어물&scategory=" data-montelena-acode="200000475" onclick=""> 생선과 해산물,건어물</a>
                        <a href="/product/listCategory?lcategory=육류와달걀&scategory=" data-montelena-acode="200000475" onclick=""> 육류와 달걀</a>
                        <a href="/product/listCategory?lcategory=밥과국,면&scategory=" data-montelena-acode="200000475" onclick=""> 밥과 국,면</a>
                        <a href="/product/listCategory?lcategory=밑반찬과간식&scategory=" data-montelena-acode="200000475" onclick=""> 밑반찬과 간식</a>
                        <a href="/product/listCategory?lcategory=양념과오일,통조림&scategory=" data-montelena-acode="200000475" onclick=""> 양념과 오일,통조림</a>
                        <a href="/product/listCategory?lcategory=베이커리와치즈&scategory=" data-montelena-acode="200000475" onclick=""> 베이커리와 치즈</a>
                        <a href="/product/listCategory?lcategory=과자와초콜릿,캔디&scategory=" data-montelena-acode="200000475" onclick=""> 과자와 초콜릿,캔디</a>
                        <a href="/product/listCategory?lcategory=물과우유,커피,음료&scategory=" data-montelena-acode="200000475" onclick=""> 물과 우유,커피,음료</a>
                        <a href="/product/listCategory?lcategory=홍삼과비타민,영양제&scategory=" data-montelena-acode="200000475" onclick=""> 홍삼과 비타민,영양제</a>
                        <a href="/product/listCategory?lcategory=생활용품&scategory=" data-montelena-acode="200000475" onclick=""> 생활용품</a>
                        <a href="/product/listCategory?lcategory=리빙,라이프스타일&scategory=" data-montelena-acode="200000475" onclick=""> 리빙,라이프스타일</a>
                        <a href="/product/listCategory?lcategory=반려동물사료와간식&scategory=" data-montelena-acode="200000475" onclick=""> 반려동물 사료와 간식</a>
                    </span>
                </div>
            </li>
        </ul>
        <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/lib/clipboard.min.js"></script>
    </div>

    <!-- content -->
    <div id="container" role="main" class="vip-content" data-goodscode="1552234801">
        <div class="item-topinfowrap">
            <div class="thumb-gallery uxecarousel alone">
                <div class="box__viewer-container">
                    <ul class="viewer">
                        <li class="bigsmile on">
                            <a>
                                <img src="${productInfo.img1}"alt="상품이미지">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="item-topinfo item-topinfo--additional box__item-info--vip">
                <div class="item-topinfo_headline">
                    <p class="shoptit">
                        <span class="text__brand">
                            <span class="text"></span>
                        </span>
                    </p>
                    <div id="itemcase_basic">
                        <div class="box__item-title">
                            <h1 class="itemtit"> ${productInfo.pname} </h1>
                            <div class="box__item-made">원산지 : ${productInfo.origin}</div>
                            <div class="box__rating-information">
                                <span class="for-a11y"></span><span class="box__rating-number"></span>
                            </div>
                            <div class="action-btns">
                                <button class="add-interest" aria-pressed="false" data-goodscode="1552234801"
                                    data-montelena-acode="200000483"
                                    onclick=""></span></button>
                                <button class="sare-sns uxeBlock-ctrl" aria-haspopup="true" aria-expanded="false"
                                    aria-controls="tooltip_sns_share" data-href="#tooltip_sns_share"
                                    id="open_tooltip_sns_share" data-montelena-acode="200000484"
                                    onclick=""><span class="blind"></span></button>
                            </div>
                            <div id="tooltip_sns_share" class="tooltip_layer">
                                <div class="arrowtop_tooltip">
                                    <h4 class="tit_tooltip hidden">QR코드 안내</h4>
                                    <div class="tooltip_content">
                                        <div class="sns_share">
                                            <ul>
                                                <li>
                                                    <a href="http://www.facebook.com/sharer.php?u=http%3a%2f%2fitem.gmarket.co.kr%2fItem%3fgoodsCode%3d1552234801%26jaehuid%3d200004165&amp;t=%ec%9d%b4%ea%b1%b0+%ea%b4%9c%ec%b0%ae%ec%9d%80+%eb%93%af"
                                                        target="_blank" title="페이스북 공유하기 새창이동">
                                                        <i class="facebook">페이스북 아이콘 </i>
                                                        <span>페이스북</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="http://twitter.com/?status=%ec%9d%b4%ea%b1%b0+%ea%b4%9c%ec%b0%ae%ec%9d%80+%eb%93%af+http%3a%2f%2fitem.gmarket.co.kr%2fItem%3fgoodsCode%3d1552234801%26jaehuid%3d200004166"
                                                        target="_blank" title="트위터 공유하기 새창이동">
                                                        <i class="twitter"></i>
                                                        <span>트위터</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <a href="#" class="tooltip_hide"><i class="btn_close"><span class="blind">
                                        팝업닫기</span></i>
                                    </a>
                                </div>
                            </div>

                            <p class="price">
                                <span class="box__icon"></span>
                                <span class="price_innerwrap">
                                    <strong class="price_real">
                                    <fmt:formatNumber value="${productInfo.price}" pattern="#,###" />
                                    <span class="unit">원</span></strong>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="box__item-detailinfo box__item-detailinfo--additional">
                    <ul class="item-topinfo_sub uxeslide">
                        <li class="list-item-delivery  uxeslide_item">

                            <div class="box__information-title">
                                <div class="box__information">
                                    <span class="image__icon image__icon-delivery">
                                        <span class="sp_vipgroup2x">배송안내</span>
                                    </span>
                                </div>
                            </div>
                            <div class="box__delivery">
                                <div class="box__information-address">
                                    <div class="box__delivery-information">
                                        <div class="box__information">
                                            <span class="text__delivery-make ">배송형태</span>
                                        </div>
                                        <div class="box__information">
                                            <em class="txt_default">
                                                새벽배송 / 밤 11시까지 결제 시<br/>
                                                택배배송 / 밤 6시까지 결제 시<br/>
                                                배송비 3,500원 (5만원 이상 구매 시 무료)
                                            </em>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="item_option_area">
                    <div class="form_top" id="coreFormTop">
                        <div class="section_now_selected">
                            <h2 class="tit_options hidden">지금 선택한상품</h2>
                            <div class="select-item">
                                <div class="item_options uxeselectbox selected">
                                    <button class="select-item_option uxeselect_btn" disabled="disabled" style="cursor: default;">
                                        <span class="txt minishop-selected">
                                            <div class="thumb">
                                                <img src="${productInfo.img1}" alt="상품이미지">
                                            </div>
                                            <div class="info">
                                                <span class="item_num"> <em>상품</em></span>
                                                <span class="item_tit">${productInfo.pname}</span>
                                                <span class="item_price">
                                                    <fmt:formatNumber value="${productInfo.price}" pattern="#,###" /><em class="unit">원</em>
                                                </span>
                                            </div>
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_body">
                        <div class="section_seleted_list" id="coreSelectedList" style="">
                            <ul class="selected-list">
                                <li id="coreSelectedLi_0" class=" " data-goodscode="1552234801" data-bundlediscount-calctypesub=""
                                    data-bundlediscount-minapplycondition="0" data-bundlediscount-originprice="0"
                                    data-bundlediscount-discountcount="0" data-bundlediscount-discountprice="0"
                                    data-bundlediscount-discountrate="0">
                                    <div class="choose_item">
                                        <p class="tit">
                                            <span></span>
                                            <span class="txt_tit">${productInfo.pname}</span>
                                            <span class="txt_option"></span>
                                        </p>
                                    </div>
                                    <div class="choose_calc">
                                        <span class="num-ctrl uxequnatity-ctrl">
                                        	<input type="hidden" id="pamount" name="pamount" value="1" />
                                            <button data-montelena-acode="200000509" class="bt_increase" onclick="change_qty('right');">
                                            	<span class="blind">수량증가</span>
                                            </button>
                                            <button data-montelena-acode="200000509" class="bt_decrease" onclick="change_qty('left');">
                                            	<span class="blind">수량감소</span>
                                            </button>
                                            <input data-montelena-acode="200000509" id="txtqty" class="num" type="text" maxlength="3" title="수량" value="1">
                                        </span>
                                    </div>
                                    <div class="choose_result">
                                        <strong id="sumPrice" class="price sumPrice" data-goodscode="1552234801" data-index="0" data-originprice="32900"
                                            data-baseprice="27970" data-count="6" data-price="167820" data-std-price="32900"
                                            data-addprice="0" data-couponprice="0" data-hascoupon="false" data-free-count="0"
                                            data-bundle-discount-price="0"><fmt:formatNumber value="${productInfo.price}" pattern="#,###" /><span>원</span></strong>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form_bottom">
                        <p class="total" id="coreTotalPriceP" style="visibility: visible;">
                            <span class="tit">총 상품금액
                                <a href="#" class="open_tooltip_priceguide uxeBlock-ctrl">
                                    <i class="icon i_question">총 상품금액 안내 레이어 보기</i>
                                </a>
                            </span>
                            <strong class="price" id="coreTotalPrice"><fmt:formatNumber value="${productInfo.price}" pattern="#,###" /><span class="unit">원</span></strong>
                        </p>
                        <div class="section_bottombtns section_bottombtns-layout ">
                            <div class="box__gift-info">
                                <button class="btn_primary btn_white btn_gift" id="coreGiftBtn"
                                    data-montelena-acode="200008511" data-montelena-goodscode="1552234801" style="visibility: hidden">
                                </button>
                            </div>
                            <button class="btn_primary btn_white btn_mycart" data-href="#layer_mycart" data-montelena-acode="200000516"
                                id="coreAddCartBtn" onclick="">
                                <em>장바구니</em>
                            </button>
                            <button class="btn_primary btn_blue" id="coreInsOrderBtn" data-montelena-acode="200000517"
                                data-montelena-goodscode="1552234801" onclick="">
                                <em>구매하기</em>
                            </button>
                            <form action="/order/<sec:authentication property="name"/>" method="get" class="order_form">
								<input type ="hidden" name = "orders[0].pid" value = "${productInfo.pid}">
								<input type ="hidden" name = "orders[0].pcount" value = "">
							</form>
                        </div>
                        <div class="tooltip_priceguide tooltip_layer">
                            <div class="arrowtop_tooltip">
                                <h4 class="tit_tooltip hidden">총상품금액 안내</h4>
                                <a href="#" class="tooltip_hide"><i class="btn_close"><span class="blind">닫기</span></i></a>
                                <div class="tooltip_content">
                                    <div class="tooltip_default_area">
                                        <p>
                                            총 상품금액에 <em>배송비는 포함되어 있지
                                                <br>않습니다.</em> 결제시 조건에 따라 배송비가 추가
                                            될 수 있습니다.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="vip-tabwrap uxetabs">
            <div class="vip-tabnavi uxeposfix">
                <ul>
                    <li class="uxetabs_menu on"><a href="#vip-tab_detail" aria-current="page"
                            aria-controls="vip-tab_detail" data-subtarget=".vip-detail_sub,.vip-all_sub"
                            data-montelena-acode="200000546">상세설명</a>
                        </li><!-- D:활성화 탭 li에 'on' 클래스추가 -->
                    <li class="uxetabs_menu"><a href="#vip-tab_exchange" aria-controls="vip-tab_exchange"
                            data-subtarget=".vip-all_sub" data-montelena-acode="200000549">교환/반품</a>
                        </li>
                </ul>
            </div>
            <div class="vip-tabcontentwrap">
                <div id="shop_info_div">
                    <input type="hidden" id="shopPageSize" value="6">
                </div>
                <div class="vip-tab_container">
                    <div id="vip-tab_detail" class="vip-tabcontent vip-tabcontent_lt on">
                        <div class="box__detail-view js-toggle-content">
                            <!-- 상품 상세 -->
                            <div class="vip-detailarea_seller" id="skip-item-detail">
                                <iframe id="detail1" src="${productInfo.img2}" onload="" frameborder="0" width="860" height="700" scrolling="NO"></iframe>
                                <iframe id="detail1" src="${productInfo.img3}" onload="" frameborder="0" width="860" height="700" scrolling="NO"></iframe>
                            </div>
                        </div>
                    </div>
                    <div id="vip-tab_exchange" class="vip-tabcontent vip-tabcontent_lt">
                        <div class="box__exchange-guide">
                            <div class="box__inner">
                                <h3 class="text__exchange-title">주문취소 안내</h3>
                                <ul class="list__exchange-data">
                                    <li class="list-item">
                                    	결제완료 이후 주문의 상태가 "상품준비중"으로 변경될 경우, 취소가 제한됩니다.
                                    </li>
                                    <li class="list-item">
                                    	비회원은 로그인>비회원주문조회에서 주문을 취소하실 수 있습니다.
                                    </li>
                                    <li class="list-item">
                                    	일부 예약배송, 정기배송, 정기구독 등의 예약상품은 배송 3~4일 전까지만 취소하실 수 있습니다.
                                    </li>
                                    <li class="list-item">
                                    	주문상품의 부분취소는 불가능합니다.
                                    </li>
                                    <li class="list-item">
                                    	카드환불은 카드사 정책에 따르며, 취소 시 사용하신 H.Point, H.Bonus, 쿠폰 등은 모두 복원됩니다. 단, 취소시 사용기한이 지난 혜택은 복원되지 않습니다.
                                    </li>
                                </ul>
                            </div>
                            <div class="box__inner">
                                <h3 class="text__exchange-title">교환/반품안내</h3>
                                <ul class="list__exchange-data">
                                    <li class="list-item"><strong>#상품설명에 배송/교확/반품/취소 관련 안내가 기재된 경우 다음 안내사항보다 우선적용됩니다.</strong></li>
                                    <li class="list-item">
                                    	상품에 문제가 있는 경우<br>
                                    	: 냉장/냉동상품은 제품수령 후 최대 2일(48시간) 내,<br>
                                    	상품을 촬용한 사진과 함꼐 1:1문의 게시판에 등록하시면,<br>
                                    	담당자 확인 후 교환/반품이 진행됩니다.<br>
                                    	이때 발생하는 모든 배송비는 현대식품관 투홈이 부담합니다.
                                    </li>
                                    <li class="list-item">
                                    	단순변심/주문착오의 경우<br>
                                    	: 냉장.냉동상품은 교환/반품이 불가능합니다.<br>
                                    	: 상온상품(유통기한 30일 이상)및 기타상품은 제품수령 후<br>
                                    	최대 7일 이내에 사진과 함께 1:1문의 게시판에 등록하시면, 담당자 확인 후 교환/반품이 진행됩니다.<br>
                                    	(교환:왕복,반품:편도)는 고객님께서 부담하셔야 합니다.
                                    </li>
                                    <li class="list-item">
                                    	교환/반품이 불가한 경우<br>
                                    	: 교환/반품 가능기간을 초과하였을 경우<br>
                                    	: 상품 및 구성품을 사용하였거나 부주의로 인하여 상품이 훼손(파손/고장/오염 등) 된 경우<br>
                                    	: 상품 사용 시 상품설명에 기재된 주의사항을 지키지 않는 경우<br>
                                    	: 상품택을 파손하였거나 분실했을 경우<br>
                                    	: 배송 후 설치완료된 상품인 경우<br>
                                    	: 기타'전자상거래 등에서의 소비자보호에 관한 법률'이<br>
                                    	정하는 청약철회 제한사유에 해당되는 경우
                                    	<br><br>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!-- //.vip-tab_container-->
            </div><!-- //.vip-tabcontentwrap -->
            <div class="vip-cpcarea">
                <div class="vip-togetheritems uxecarousel" id="vipPowerClickLayer" style="display:none;"></div>
                <div class="box__divider box__event" id="vipSmileFreshPromotionAdsLayer" style="display:none;"></div>
            </div>
            <div class="vip-detailoption_wrap">
                <div class="vip-detailoption uxeposfix" style="">
                    <div class="item_option_area">
                        <div class="form_top" id="wingFormTop">
                            <div class="section_now_selected">
                                <h2 class="tit_options hidden">지금 선택한상품</h2>
                                <div class="select-item">
                                    <div class="item_options uxeselectbox selected">
                                        <button class="select-item_option uxeselect_btn" disabled="disabled" style="cursor: default;">
                                            <span class="txt minishop-selected">
                                                <div class="thumb">
                                                    <img src="${productInfo.img1}"
                                                        alt="상품이미지">
                                                </div>
                                                <div class="info">
                                                    <span class="item_num">상품 <em></em></span>
                                                    <span class="item_tit">${productInfo.pname}</span>
                                                    <span class="item_price">
                                                        ${productInfo.price}<em class="unit">원</em>
                                                    </span>
                                                </div>
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form_body" style="height: 422px;">
                            <div class="section_seleted_list" id="wingSelectedList" style="">
                                <ul class="selected-list">
                                    <li id="coreSelectedLiWing_0" class=" " data-goodscode="1552234801"
                                        data-bundlediscount-calctypesub="" data-bundlediscount-minapplycondition="0"
                                        data-bundlediscount-originprice="0" data-bundlediscount-discountcount="0"
                                        data-bundlediscount-discountprice="0" data-bundlediscount-discountrate="0">
                                        <div class="choose_item">
                                            <p class="tit">
                                                <span></span>
                                                <span class="txt_tit">${productInfo.pname}</span>
                                                <span class="txt_option"></span>
                                            </p>
                                        </div>
                                        <div class="choose_calc">
                                            <span class="num-ctrl uxequnatity-ctrl">
                                                <button data-montelena-acode="200000531" class="bt_increase" onclick="change_qty('right');"><span
                                                        class="blind">수량증가</span></button>
                                                <button data-montelena-acode="200000531" class="bt_decrease" onclick="change_qty('left');"><span
                                                        class="blind">수량감소</span></button>
                                                <input data-montelena-acode="200000531" class="num" id="txtqty" type="text" maxlength="3" title="수량" value="1">
                                            </span>                
                                        </div>
                                        <div class="choose_result">
                                        	<input  type="hidden" name="price" id="price" value="${productInfo.price}" readonly="readonly">
                                            <strong id="sumPrice" class="price sumPrice" data-goodscode="1552234801" data-index="0" data-originprice="32900"
                                                data-baseprice="27970" data-count="6" data-price="167820" data-std-price="32900"
                                                data-addprice="0" data-couponprice="0" data-hascoupon="false" data-free-count="0"
                                                data-bundle-discount-price="0">${productInfo.price}<span>원</span></strong>
                                        </div>
                                    </li>
                
                                </ul>
                            </div>
                        </div>
                        <div class="form_bottom">
                            <p class="total" id="wingTotalPriceP" style="visibility: visible;">
                                <span class="tit">총 상품금액<a href="#tooltip_priceguide" class="open_tooltip_priceguide uxeBlock-ctrl"><i
                                            class="icon i_question">총 상품금액 안내 레이어 보기</i></a></span>
                                <strong class="price" id="wingTotalPrice">${productInfo.price}<span class="unit">원</span></strong>
                            </p>
                            <div class="section_bottombtns section_bottombtns-layout ">
                                <button class="btn_primary btn_white btn_mycart" data-href="#layer_mycart"
                                    data-montelena-acode="200000538" id="wingAddCartBtn"
                                    onclick=""><em>장바구니</em></button>
                                <button class="btn_primary btn_blue" id="wingInsOrderBtn" data-montelena-acode="200000539"
                                    data-montelena-goodscode="1552234801"
                                    onclick=""><em>구매하기</em></button>
                            </div>
                            <div class="tooltip_priceguide tooltip_layer" style="display: none;">
                                <div class="arrowtop_tooltip">
                                    <h4 class="tit_tooltip hidden">총상품금액 안내</h4>
                                    <a href="#" class="tooltip_hide"><i class="btn_close"><span class="blind">닫기</span></i></a>
                                    <div class="tooltip_content">
                                        <div class="tooltip_default_area">
                                            <p>
                                                총 상품금액에 <em>배송비는 포함되어 있지
                                                    <br>않습니다.</em> 결제시 조건에 따라 배송비가 추가
                                                될 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="virtualfooter" style="height:0"></div><!-- //.vip-content -->

    <!-- footer FooterScriptContainer 변경-->
    <div id="footer">
        <div id="desktop_layout-footer" class="section__footer" role="contentinfo">
            <div class="box__top" data-montelena-acode="200003793">
                <a href="#desktop_layout-header" class="link__top">
                    <span class="sprite__common">Top으로 이동</span>
                </a>
            </div>
        </div>
    </div>
    
    <script>
    let csrfHeaderName ="${_csrf.headerName}";
    let csrfTokenValue="${_csrf.token}";
    /* 바로구매 버튼 */
	$("#coreInsOrderBtn").on("click", function(){
		let pCount = $(".num").val();
		console.log(pCount)
		$(".order_form").find("input[name='orders[0].pcount']").val(pCount);
		$(".order_form").submit();
	});
    
	// 서버로 전송할 데이터(상품상세페이지 -> 장바구니)
	// 밑에 form data에다가 member_mid : '${member.mid}'로 바꿔줘야함 밑에는 테스트
	const form = {
			member_mid : '<sec:authentication property="name"/>',
			product_pid : '${productInfo.pid}',
			p_quantity : ''
	}
	//장바구니 추가 버튼
	$("#coreAddCartBtn").on("click", function(e){
		console.log('<sec:authentication property="name"/>');
		if('<sec:authentication property="name"/>'== "anonymousUser") location.href = "/login";
		form.p_quantity = $(".num").val();
		
		$.ajax({
			url: '/cart/add',
			type: 'POST',
			data: form,
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			success: function(result){
				cartAlert(result);
			}
		})
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
    </script>
    
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/common/RviPdsService.js"></script>
    <!-- //footer -->

    <script type="text/javascript" src="http://script.gmkt.kr/js/common/rpm.js"></script>
    <script type="text/javascript" src="http://script.gmkt.kr/js/common/ubprofiler_gmkt.js?t=20140305"></script>
    <script type="text/javascript" src="http://script.gmkt.kr/pc/js/ko/common.js?_cb=20170810080000"></script>
    <script type="text/javascript" src="http://script.gmkt.kr/pc/js/ko/vip.js?_cb=20170810080000"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/utils/Utils.js"></script>

    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/pages/Review.js?t=20211117"></script>
    <script type="text/javascript" src="http://script.gmkt.kr/pc/js/api/jquery.uniform.js"></script>
    <script type="text/javascript" src="http://script.gmkt.kr/_Net/js/dimmed.js"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/pages/OrderUtil.js"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/pages/OptionV2.js?_cb=202209190000">
    </script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/pages/Order.js?_cb=202212270000">
    </script>

    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/pages/OptionUtil.js?_cb=20180706">
    </script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/pages/Coupon.js?ver=202212070000">
    </script>

    <script type="text/javascript" src="http://script.gmarket.co.kr/js/itemdweb/LoginGate.js?date=20210622"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/pc/js/application/kr/checkout/swiper.min.js">
    </script>

    <script type="text/javascript" src="http://script.gmarket.co.kr/pc/js/application/kr/smilefresh/app.js"></script>

    <!--쿠폰받기 배너를 위한 스크립트-->
    <script type="text/javascript" src="http://script.gmarket.co.kr/mobile/js/gmkt-vip-coupon-layer/dist/react.js">
    </script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/mobile/js/gmkt-vip-coupon-layer/dist/react-dom.js">
    </script>
    <script type="text/javascript"
        src="http://script.gmarket.co.kr/mobile/js/gmkt-vip-coupon-layer/dist/vipCouponLayer.js"></script>

    <script type="text/javascript" src="http://script.gmarket.co.kr/pc/js/ko/corner/smiledelivery/smiledelivery.js">
    </script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/header/SmileDeliveryLNB.utf8.js"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/js/shop/smiledelivery/SmileDeliveryAutoComplete.js">
    </script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/mobile/js/common/kr/util/viewability.js"></script>
    <script type="text/javascript" src="http://script.gmarket.co.kr/mobile/js/core/lib/ui/lottie/bodymovin.js"></script>

    <script type="text/javascript" src="http://script.gmarket.co.kr/pc/js/common/kr/ui/common.js" charset="UTF-8">
    </script>

    
</body>
</html>