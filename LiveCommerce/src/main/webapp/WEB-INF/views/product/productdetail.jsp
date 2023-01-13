<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </script>
    <div class="location-navi">
        <ul>
            <li>
                <a href="#" data-montelena-acode="200000474" onclick="">홈</a>
            </li>
            <li>
                <a href="#" data-montelena-acode="200000475" onclick="#">
                    1번카테고리
                </a>
                <div class="loc-catewrap uxerollover">
                    <a href="#loc-cate1" aria-haspopup="menu" aria-expanded="false" aria-controls="loc-cate1" class="bt_view-ctrl">
                        열기
                    </a>
                    <span id="loc-cate1" class="layer_loc-cate" role="menu">
                        /*c태그 사용해서 대분류 카테고리*/
                        <a href="#"
                            data-montelena-acode="200000475"
                            onclick="">
                            빠른장보기
                        </a>
                    </span>
                </div>
            </li>
            <li class="on">
                <a href="#" data-montelena-acode="200000476" onclick="">
                    2번 카테고리
                </a>
                <div class="loc-catewrap uxerollover">
                    <a href="#loc-cate2" aria-haspopup="menu" aria-expanded="false" aria-controls="loc-cate2"
                        class="bt_view-ctrl">열기</a>
                    <span id="loc-cate2" class="layer_loc-cate" role="menu">
                        /*c태그 사용해서 중분류 카테고리*/
                        <a href="#"
                            data-montelena-acode="200000476"
                            onclick="">즉석/간편식품</a>
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
                                    <strong class="price_real">${productInfo.price}<span class="unit">원</span></strong>
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
                                                    ${productInfo.price}<em class="unit">원</em>
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
                                            data-bundle-discount-price="0">${productInfo.price}<span>원</span></strong>
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
                            <strong class="price" id="coreTotalPrice">${productInfo.price}<span class="unit">원</span></strong>
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
                            <form action="/order/gd" method="get" class="order_form">
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
                                <iframe id="detail1" src="${productInfo.img2}" onload="" frameborder="0" width="860" height="8054" scrolling="NO"></iframe>
                            </div>
                            <div class="box__detail-more">
                                <button type="button" class="button__detail-more js-toggle-button"
                                    data-montelena-acode="200003594">상세정보 <span>더보기</span></button>
                            </div>
                        </div>
                    </div>
                    <div id="vip-tab_exchange" class="vip-tabcontent vip-tabcontent_lt">
                        <div class="box__exchange-guide">
                            <p class="sprite__vip2x--before text__message">전자상거래 등에서의 소비자보호에 관한 법률에 의한 반품 규정이 판매자가 지정한
                                반품 조건보다 우선합니다.</p>
                            <div class="box__inner">
                                <h3 class="text__exchange-title">교환/반품 정보</h3>
                                <ul class="list__exchange-data">
                                    <li class="list-item"><span class="text__strong">반품배송비(편도)</span> : 2,500원 (최초 배송비
                                        미결제시 5,000원 부과)</li>
                                    <li class="list-item"><span class="text__strong">교환배송비(왕복)</span> : 5,000원</li>
                                    <li class="list-item"><span class="text__strong">보내실곳</span> : 18465 경기도 화성시 동탄물류로
                                        48 (신동) 화성동탄물류단지 B블럭 3층 3L 구역 통합반품센터</li>
                                    <li class="list-item">단, 교환/반품 비용은 상품 및 교환/반품 사유에 따라 변경될 수 있으므로 교환/반품 신청 화면 확인
                                        부탁드립니다.</li>
                                </ul>
                            </div>
                            <div class="box__inner">
                                <h3 class="text__exchange-title">교환/반품 사유에 따른 요청 가능 기간</h3>
                                <ul class="list__exchange-data">
                                    <li class="list-item">구매자 단순 변심 : 상품 수령 후 7일 이내(구매자 반품 배송비 부담)</li>
                                    <li class="list-item">표시/광고와 상이, 계약 내용과 다르게 이행된 경우 :<br>상품 수령 후 3개월 이내 혹은 표시/광고와 다른
                                        사실을 안 날로부터 30일 이내(판매자 반품 배송비 부담)</li>
                                </ul>
                            </div>
                            <div class="box__inner">
                                <h3 class="text__exchange-title">교환/반품 불가한 경우</h3>
                                <ul class="list__exchange-data list__numbering">
                                    <li class="list-item">교환/반품 요청이 기간이 지난 경우</li>
                                    <li class="list-item">소비자의 책임 있는 사유로 상품 등이 분실/파손/훼손된 경우 (단, 확인을 위한 포장 훼손 제외)</li>
                                    <li class="list-item">소비자의 사용/소비에 의해 상품 등의 가치가 현저히 감소한 경우 (예 : 식품, 화장품, 향수, 음반)</li>
                                    <li class="list-item">제품을 설치 또는 장착하였거나 개통한 경우 (예 : 전자제품, 컴퓨터, 휴대폰 등)</li>
                                    <li class="list-item">시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 (신선식품과 같이 유통기한이
                                        정해져 있는 상품)</li>
                                    <li class="list-item">복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/BOOK의 경우 포장 개봉 시)</li>
                                    <li class="list-item">주문제작 상품 중 상품제작에 들어간 경우 (주문접수 후 개별생산, 맞춤 제작 등)</li>
                                </ul>
                            </div>
                            <div class="box__inner">
                                <h3 class="text__exchange-title">거래 조건에 대한 정보</h3>
                                <ul class="list__exchange-data list__numbering">
                                    <li class="list-item">소화물 택배의 배송은 발송일로부터 1~2 영업일이 소요되나,<br>지역/대형 화물/설치/예약/발송지체 등의
                                        특이사항에 따라 배송기간은 달라질 수 있습니다.</li>
                                    <li class="list-item">‘전자상거래등에서의소비자보호에관한법률’이 정하는 바에 따라 소비자의 청약철회 후 판매자가 재화 등을 반환 받은
                                        날로부터<br>3영업일 이내에&nbsp;지급받은 대금의 환급을 정당한 사유없이 지연하는 때에는 소비자는 지연기간에 대해서 전상법 시행령으로
                                        정하는 이율을<br>곱하여 산정한 지연이자(지연배상금)을 신청할 수 있습니다.</li>
                                </ul>
                            </div>
                            <div class="box__inner">
                                <h3 class="text__exchange-title">판매자 정보</h3>
                                <ul class="list__exchange-data">
                                    <li class="list-item">상호명 : <span class="text__deco">로지트코리아 유한회사</span></li>
                                    <li class="list-item">대표자 : <span class="text__deco">김성종</span></li>
                                    <li class="list-item">연락처 : <span class="text__deco">070-4077-4646</span></li>
                                    <li class="list-item">통신판매업자번호 : <span class="text__deco">2021-서울강남-05667</span>
                                    </li>
                                    <li class="list-item">사업자 등록번호 : <span class="text__deco">649-86-00449</span></li>
                                    <li class="list-item">사업장소재지 : <span class="text__deco">서울특별시 강남구 테헤란로13길 18,
                                            4층(역삼동, 우진빌딩)</span></li>
                                    <li class="list-item">E-mail : <span
                                            class="text__deco">secondbox@logitkorea.com</span></li>

                                </ul>
                            </div>
                            <div class="box__inner">
                                <h3 class="text__exchange-title">구매 안전 서비스<span class="text__title-sub-info">결제대금예치업 등록
                                        02-006-00008</span><a
                                        href="http://www.fss.or.kr/kr/bbs/iframe/view.jsp?bbsid=1207404527596&amp;idx=400000000336&amp;num=1"
                                        target="_black" class="link__sign-check">서비스 가입사실 확인</a></h3>
                                <ul class="list__exchange-data">
                                    <li class="list-item">㈜지마켓은 전자금융거래법에 따라 결제대금예치업을 운영할 수 있는 전자금융업자로 금융위원회에
                                        등록되었으며,<br>본 판매자는 구매금액, 결제수단에 관계없이 모든 거래에 대해 자동적으로 ㈜지마켓이 제공하는 구매안전서비스를 적용하고
                                        있습니다.</li>
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
    /* 바로구매 버튼 */
	$("#coreInsOrderBtn").on("click", function(){
		let pCount = $(".num").val();
		console.log(pCount)
		$(".order_form").find("input[name='orders[0].pcount']").val(pCount);
		$(".order_form").submit();
	});
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