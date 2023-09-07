<%@page import="mtinfo.model.vo.Mtinfo" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% Mtinfo mt=(Mtinfo)request.getAttribute("mt"); %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9a2f35856f46bd082d1ef297c29d5fc&libraries=services"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
          integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
          crossorigin="anonymous"></script>


        <title>Insert title here</title>
        <style>
          body,
          p,
          h1,
          h2,
          h3,
          h4,
          h5,
          h6,
          ul,
          ol,
          li,
          dl,
          dt,
          dd,
          table,
          th,
          td,
          form,
          fieldset,
          legend,
          input,
          textarea,
          button,
          select,
          div,
          figure,
          article,
          header,
          nav,
          footer,
          section,
          aside {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            word-break: keep-all;
            word-wrap: break-word;
            white-space: normal;
            -webkit-text-size-adjust: 100%;
            text-size-adjust: 100%;
          }

          body,
          input,
          textarea,
          select,
          button,
          table,
          th,
          td {
            font-size: 13px;
            color: #000000;
            font-weight: 400;
            line-height: 1.25;
            letter-spacing: -0.02em;
          }

          img,
          fieldset,
          iframe {
            border: 0;
            vertical-align: top
          }

          div,
          form,
          input {
            box-sizing: border-box;
            /* border: 1px solid red; */
          }




          #content {
            width: 1200px;
            height: 500px;
            margin: auto;
          }

          #content_2 {
            width: 1200px;

          }


          #topbtn {
            position: fixed;
            right: 24px;
            bottom: 24px;
            z-index: 50;
          }

          a:hover:not(#km) {
            font-weight: bold;
            cursor: pointer;
          }

          .tab-menu {
            width: 1200px;
          }

          .tab-menu>div {
            width: 200px;
          }

          a.country {
            color: #000;
          }

          a.country:hover {
            color: #000;
          }

          .tab-menu-wrap {
            position: relative;
          }

          .tab-menu-wrap .tab-menu {
            font-size: 0;
          }

          .tab-menu-wrap .tab-menu:after {
            content: "";
            display: block;
            clear: both;
          }

          .tab-menu-wrap .tab-menu>* {
            display: inline-block;
            text-align: center;
            position: relative;
          }

          .tab-menu-wrap .tab-menu>* button,
          .tab-menu-wrap .tab-menu>* a {
            display: inline-block;
            width: 100%;
            font-size: 30px;
            font-weight: 300;
            padding: 10px 0;
            position: relative;
            overflow: visible;
          }

          .tab-menu-wrap .tab-menu>* button span,
          .tab-menu-wrap .tab-menu>* a span {
            padding: 0 20px;
          }

          .tab-menu-wrap .tab-menu>* .icon {
            background-image: url('../image/sub-tab-icon-off_2.png');
          }

          .tab-menu-wrap .tab-menu>* .on .icon {
            background-image: url('../image/icon_help_2.png');
          }

          .tab-menu-wrap .tab-menu>.tab-sm>a {
            font-size: 20px;
          }

          .tab-menu-wrap .tab-menu>.tab-sm>a.on {
            border-bottom: 3px solid #009ae1;
          }

          .tab-menu-wrap .tab-menu>* .on {
            color: #0081bd;
            font-weight: 700;
            border-bottom: 5px solid #009ae1;
          }

          .tab-menu-wrap .tab-menu>* .on {
            font-size: 17px;
            border-bottom: 3px solid #009ae1;
            padding-bottom: 5px;
          }

          #image-player-wrapper .cmp-pdf-download {
            position: absolute;
            bottom: 0px;
            right: 100px;
          }

          .cmp-mt-weather {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-end;
          }

          .cmt-mt-mountains-table {
            width: 100%;
            padding: 0 20px;
            display: flex;
            flex-wrap: wrap;
          }

          .cmt-mt-mountains-table>div {
            width: calc(100% / 4);
            padding: 10px 10px;
            text-align: center;
          }

          .cmt-mt-mountains-table>div>a {
            font-size: 20px;
            color: #000;
            font-weight: 300;
            position: relative;
            padding: 2px 5px;
          }

          .cmt-mt-mountains-table>div>a:hover {
            text-decoration: underline;
          }

          .cmt-mt-mountains-table>div>a.on {
            font-weight: 600;
          }

          .cmt-mt-mountains-table>div>a.on:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            right: 0;
            height: 2px;
            background-color: #000;
          }

          .cmp-mt-weather p {
            padding: 14px;
            font-size: 14px;
          }

          .cmt-mt-mountains dt {
            font-size: 0.9em;
          }

          .cmt-mt-mountains dl {
            line-height: 1em;
            text-align: left;
            height: 11px;
            width: 50px;
          }

          .cmt-mt-mountains dl dt {
            padding-bottom: 2px;
            font-size: 0.90em;
            color: #333;
            position: absolute;
            left: 8px;
            bottom: -5px;
            width: 100%;
            z-index: 2;
            padding-top: 4px;
          }

          .cmt-mt-mountains .unit {
            display: inline;
            position: absolute;
            bottom: 50px;
            right: 13px;
          }

          .cmt-mt-mountains dl dt.left {
            left: -33px;
          }

          .cmt-mt-mountains dl dt.top {
            bottom: 4px;
          }


          .cmp-mt-weather-109 {
            width: 335px;
            height: 317px;
            position: relative;
          }

          a {
            display: inline-block;
            box-sizing: border-box;
            color: inherit;
            text-decoration: none;
            cursor: default;
          }

          div,
          form,
          input {
            box-sizing: border-box;
            /* border: 1px solid red; */

          }

          .wrap {
            width: 1200px;
            height: 1600px;
            margin-bottom: 20px;
            margin: auto;
          }

          .wrap>div {
            margin: auto;
            width: 1000px
          }

          .mountainImage img {
            width: 400px;
            height: 300px;
          }

          #mountainImage1,
          #mountainImage2 {
            width: 500px;
            float: left;
          }

          .mt-info>div {
            border-style: none;
            border-bottom: 1px solid gray;
          }

          .mt-info>p,
          .mt-info>a {
            height: 100px;
            border-radius: 10px;
            margin-top: 5px;
            padding: 10px;
            box-sizing: border-box;
            display: none;
          }

          p>a {
            display: block;
          }

          .mt-info>div:hover {
            cursor: pointer;
          }

          #topbtn {
            position: fixed;
            right: 24px;
            bottom: 24px;
            z-index: 50;
          }

          .map_wrap,
          .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            font-size: 12px;
          }

          .map_wrap a,
          .map_wrap a:hover,
          .map_wrap a:active {
            color: #000;
            text-decoration: none;
          }

          .map_wrap {
            position: relative;
            width: 100%;
            height: 500px;
          }

          #menu_wrap {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 250px;
            margin: 10px 0 30px 10px;
            padding: 5px;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.7);
            z-index: 1;
            font-size: 12px;
            border-radius: 10px;
          }

          .bg_white {
            background: #fff;
          }

          #menu_wrap hr {
            display: block;
            height: 1px;
            border: 0;
            border-top: 2px solid #5F5F5F;
            margin: 3px 0;
          }

          #menu_wrap .option {
            text-align: center;
          }

          #menu_wrap .option p {
            margin: 10px 0;
          }

          #menu_wrap .option button {
            margin-left: 5px;
          }

          #placesList li {
            list-style: none;
          }

          #placesList .item {
            position: relative;
            border-bottom: 1px solid #888;
            overflow: hidden;
            cursor: pointer;
            min-height: 65px;
          }

          #placesList .item span {
            display: block;
            margin-top: 4px;
          }

          #placesList .item h5,
          #placesList .item .info {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
          }

          #placesList .item .info {
            padding: 10px 0 10px 55px;
          }

          #placesList .info .gray {
            color: #8a8a8a;
          }

          #placesList .info .jibun {
            padding-left: 26px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
          }

          #placesList .info .tel {
            color: #009900;
          }

          #placesList .item .markerbg {
            float: left;
            position: absolute;
            width: 36px;
            height: 37px;
            margin: 10px 0 0 10px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
          }

          #placesList .item .marker_1 {
            background-position: 0 -10px;
          }

          #placesList .item .marker_2 {
            background-position: 0 -56px;
          }

          #placesList .item .marker_3 {
            background-position: 0 -102px
          }

          #placesList .item .marker_4 {
            background-position: 0 -148px;
          }

          #placesList .item .marker_5 {
            background-position: 0 -194px;
          }

          #placesList .item .marker_6 {
            background-position: 0 -240px;
          }

          #placesList .item .marker_7 {
            background-position: 0 -286px;
          }

          #placesList .item .marker_8 {
            background-position: 0 -332px;
          }

          #placesList .item .marker_9 {
            background-position: 0 -378px;
          }

          #placesList .item .marker_10 {
            background-position: 0 -423px;
          }

          #placesList .item .marker_11 {
            background-position: 0 -470px;
          }

          #placesList .item .marker_12 {
            background-position: 0 -516px;
          }

          #placesList .item .marker_13 {
            background-position: 0 -562px;
          }

          #placesList .item .marker_14 {
            background-position: 0 -608px;
          }

          #placesList .item .marker_15 {
            background-position: 0 -654px;
          }

          #pagination {
            margin: 10px auto;
            text-align: center;
          }

          #pagination a {
            display: inline-block;
            margin-right: 10px;
          }

          #pagination .on {
            font-weight: bold;
            cursor: default;
            color: #777;
          }

          td {
            font-size: 16px;
          }

          #content_2-1 {
            display: none;
          }

          .icons {
            display: inline-block;
            height: 230px;
            width: 170px;
            margin: 10px;
            border: 5px solid rgb(48, 47, 47);
            border-radius: 10px;
        }

        .image {
            height: 140px;
            width: 100%;
        }

        .imgClass {
            height: 150px;
            width: 100%;
        }

        .weather {
            margin: 5px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
        }

        .minValues {
            text-align: center;
            display: inline-block;
            border-radius: 5px;
            height: 25px;
            width: 70px;
            margin-bottom: 5px;
            margin-left: 5px;
        }

        .maxValues {
            text-align: center;
            display: inline-block;
            border-radius: 5px;
            height: 25px;
            width: 70px;
            margin-bottom: 5px;
            margin-left: 5px;
        }

        #iconsContainer {
          text-align: center;
        width: 1000px;
      }
      #title {
        color: rgb(149, 193, 31);
        font-weight: bolder;
        margin: 70px;
        letter-spacing: 5px;
      }
        </style>
      </head>

      <body>
        <%@ include file="../common/menubar.jsp" %>
          <div class="wrap">
            <h1 align="center" id="title">한국의 산</h1>
            <div id="content">
              <div id="content_2">
                <div class="cont-wrap">
                  <div class="tab-menu-wrap">
                    <div class="tab-menu">
                      <div class="tab-btn01 tab-sm">
                        <a class="country"><input type="hidden" value="서울">서울·경기도</a>
                      </div>
                      <div class="tab-btn02 tab-sm">
                        <a class="country"><input type="hidden" value="강원">강원특별자치도</a>
                      </div>
                      <div class="tab-btn03 tab-sm">
                        <a class="country"><input type="hidden" value="충청">충청남북도</a>
                      </div>
                      <div class="tab-btn04 tab-sm">
                        <a class="country"><input type="hidden" value="전라">전라남북도</a>
                      </div>
                      <div class="tab-btn05 tab-sm">
                        <a class="country"><input type="hidden" value="경상">경상남북도</a>
                      </div>
                      <div class="tab-btn06 tab-sm">
                        <a class="country"><input type="hidden" value="제주">제주도</a>
                      </div>
                    </div>
                  </div>
                </div>


                <div id="content_3">
                  <div class="cmp-stack">
                    <div class="cmp-mt-weather">

                      <div id="map2" style="width:100%;height:350px;">


                      </div>

                      <div class="cmt-mt-mountains-table">

                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div id="content_2-1">
              <div>
                <h1 align="center" class="mtName"></h1>
              </div>
              <br><br>
              <div class="mountainImage" align="center">
                <div id="mountainImage1">
                  <img class="mtimg1" src="" alt="산사진1">
                </div>
                <div id="mountainImage2">
                  <img class="mtimg2" src="" alt="산사진2">
                </div>
              </div>
              <br><br><br><br><br><br><br><br><br><br><br><br><br>
              <div>
                <table>
                  <tr>
                    <td width="150">
                      <li>문의 및 안내</li>
                    </td>
                    <td class="mtph"></td>
                  </tr>
                  <tr>
                    <td>
                      <li>주소</li>
                    </td>
                    <td class="mtad"></td>
                  </tr>
                  <tr>
                    <td>
                      <li>홈페이지</li>
                    </td>
                    <td><a target="_blank" class="mtpage" href=""></a>
                    </td>
                  </tr>
                </table>
              </div>

              <br><br>
              <div class="mt-info">
                <div class="detail-info">
                  <h3>상세정보</h3>
                </div>
                <p style="display: block; height:100%" class="dtinfo"></p>

                <div class="map detail-info">
                  <h3>위치</h3>
                </div>

                <div id="map" style="width:100%;height:350px;"></div>


                <div class="detail-info">
                  <h3>코스</h3>
                </div>
                <p class="course"></p>


                <div class="detail-info">
                  <h3>날씨</h3>
                </div>
                <div id="iconsContainer">
                  <div class="icons">
                    <p class="weather" id="day1"></p>
                    <div class="image"><img src="dots.png" class="imgClass" id="img1"></div>
                    <p class="minValues" id="day1Min"></p>
                    <p class="maxValues" id="day1Max"></p>
                  </div>
                  <div class="icons">
                    <p class="weather" id="day2"></p>
                    <div class="image"><img src="dots.png" class="imgClass" id="img2"></div>
                    <p class="minValues" id="day2Min"></p>
                    <p class="maxValues" id="day2Max"></p>
                  </div>
                  <div class="icons">
                    <p class="weather" id="day3"></p>
                    <div class="image"><img src="dots.png" class="imgClass" id="img3"></div>
                    <p class="minValues" id="day3Min"></p>
                    <p class="maxValues" id="day3Max"></p>
                  </div>
                  <div class="icons">
                    <p class="weather" id="day4"></p>
                    <div class="image"><img src="dots.png" class="imgClass" id="img4"></div>
                    <p class="minValues" id="day4Min"></p>
                    <p class="maxValues" id="day4Max"></p>
                  </div>
                  <div class="icons">
                    <p class="weather" id="day5"></p>
                    <div class="image"><img src="dots.png" class="imgClass" id="img5"></div>
                    <p class="minValues" id="day5Min"></p>
                    <p class="maxValues" id="day5Max"></p>
                  </div>
                </div>

                <div class="detail-info">
                  <h3>교통</h3>
                </div>
                <p class="bmw"></p>

                <div class="detail-info">
                  <h3>관련사이트</h3>
                </div>
                <p>
                  <a href="http://www.koreasanha.net/">한국의산하</a>
                  <a href="http://san.chosun.com/">월간산</a>
                  <a href="https://www.forest.go.kr/kfsweb/kfs/idx/Index.do">산림청</a>
                  <a href="https://www.weather.go.kr/w/index.do">기상청</a>
                </p>
                <div class="detail-info">
                  <h3>맛집</h3>
                </div>
                <div class="map_wrap">
                  <div id="map3" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                  <div id="menu_wrap" class="bg_white">
                    <div class="option">
                      <div>
                        <form onsubmit="searchPlaces(); return false;">
                          키워드 : <input type="text" value="" id="keyword" size="15">
                          <button type="submit">검색하기</button>
                        </form>
                      </div>
                    </div>
                    <hr>
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                  </div>
                </div>
              </div>
              <script>

                $(function () {
                  $(".country").click(function () {
                    $(".country").removeClass("on");
                    $(this).addClass('on');
                  })
                });

                $(function () {
                  $(".country").click(function () {
                    $.ajax({
                      url: "mtcountry.do",
                      data: { country: $(this).children().val() },

                      success: function (c) {
                        (c);
                        let mtlist = "";

                        for (var i = 0; i < c.length; i++) {
                          mtlist += "<div><a><input type='hidden' value=" + c[i].mtName + ">" + c[i].mtName + "</a></div>";
                        }
                        $(".cmt-mt-mountains-table").html(mtlist);

                        (ta);

                        var ta = [];

                        for (var j = 0; j < c.length; j++) {
                          ta[j] = {
                            title: c[j].mtName,
                            address: c[j].mtDetailAddress

                          }

                        }
                        (ta);

                        var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div
                          mapOption2 = {
                            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                            level: 13 // 지도의 확대 레벨
                          };

                        // 지도를 생성합니다
                        var map2 = new kakao.maps.Map(mapContainer2, mapOption2);

                        // 주소-좌표 변환 객체를 생성합니다
                        var geocoder2 = new kakao.maps.services.Geocoder();


                        var bounds = new kakao.maps.LatLngBounds();
                        ta.forEach(function (position) {
                          // 주소로 좌표를 검색합니다
                          geocoder2.addressSearch(position.address, function (result, status) {

                            // 정상적으로 검색이 완료됐으면
                            if (status === kakao.maps.services.Status.OK) {

                              var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);

                              // 결과값으로 받은 위치를 마커로 표시합니다
                              var marker2 = new kakao.maps.Marker({
                                map: map2,
                                position: coords2
                              });
                              marker2.setMap(map2);
                              bounds.extend(coords2);
                              // 인포윈도우로 장소에 대한 설명을 표시합니다

                              var infowindow2 = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + position.title + '</div>'
                              });
                              infowindow2.open(map2, marker2);
                            }
                          });
                        });
                        function setBounds() { //추가한 함수
                          // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
                          // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
                          map2.setBounds(bounds);
                        }

                        $(function () {
                          $(".cmt-mt-mountains-table>div>a").click(function () {
                            $(".cmt-mt-mountains-table>div>a").removeClass("on");
                            $(this).addClass('on');
                            $("#content_2-1").css("display", "block");
                          })
                        });

                        $(function () {
                          $(".cmt-mt-mountains-table>div>a").click(function () {
                            $.ajax({
                              url: "mtinfo.do",
                              data: { mtName: $(this).children().val() },
                              success: function (e) {

                                $(".mtName").html(e.mtName);
                                $(".mtimg1").attr("src", "views/resources/img/" + e.mtName + "1.png");
                                $(".mtimg2").attr("src", "views/resources/img/" + e.mtName + "2.png");
                                $(".mtph").html(e.mtName);
                                $(".mtad").html(e.mtAddress);
                                $(".course").html(e.mtCourse);
                                $(".dtinfo").html(e.mtDetailInfo);
                                $(".bmw").html(e.mtVehicle);
                                $("#keyword").val(e.mtName + " 맛집");
                                $(".mtpage").attr("href", e.mtPage);
                                $(".mtpage").html(e.mtPage);
                                (e);

                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                  mapOption = {
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 7 // 지도의 확대 레벨
                                  };

                                // 지도를 생성합니다    
                                var map = new kakao.maps.Map(mapContainer, mapOption);

                                // 주소-좌표 변환 객체를 생성합니다
                                var geocoder = new kakao.maps.services.Geocoder();

                                // 주소로 좌표를 검색합니다
                                geocoder.addressSearch(e.mtDetailAddress, function (result, status) {

                                  // 정상적으로 검색이 완료됐으면 
                                  if (status === kakao.maps.services.Status.OK) {

                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    var marker = new kakao.maps.Marker({
                                      map: map,
                                      position: coords
                                    });
                                    (e.mtName);
                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                    var infowindow = new kakao.maps.InfoWindow({
                                      content: '<div style="width:150px;text-align:center;padding:6px 0;">' + e.mtName + '</div>'

                                    });
                                    infowindow.open(map, marker);
                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                  }
                                })


                                var markers = [];
                                var mapContainer3 = document.getElementById('map3'), // 지도를 표시할 div 
                                  mapOption3 = {
                                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                  };

                                // 지도를 생성합니다    
                                var map3 = new kakao.maps.Map(mapContainer3, mapOption3);

                                // 장소 검색 객체를 생성합니다
                                var ps = new kakao.maps.services.Places();

                                // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                                var infowindow3 = new kakao.maps.InfoWindow({ zIndex: 1 });

                                // 키워드로 장소를 검색합니다
                                searchPlaces(e.mtName);
                                (e.mtName)
                                // 키워드 검색을 요청하는 함수입니다
                                function searchPlaces() {

                                  var keyword = document.getElementById('keyword').value;


                                  // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                                  ps.keywordSearch(keyword, placesSearchCB);
                                }
                                // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                                function placesSearchCB(data, status, pagination) {
                                  if (status === kakao.maps.services.Status.OK) {

                                    // 정상적으로 검색이 완료됐으면
                                    // 검색 목록과 마커를 표출합니다
                                    displayPlaces(data);

                                    // 페이지 번호를 표출합니다
                                    displayPagination(pagination);

                                  } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                                    alert('검색 결과가 존재하지 않습니다.');
                                    return;

                                  } else if (status === kakao.maps.services.Status.ERROR) {

                                    alert('검색 결과 중 오류가 발생했습니다.');
                                    return;

                                  }
                                }

                                // 검색 결과 목록과 마커를 표출하는 함수입니다
                                function displayPlaces(places) {

                                  var listEl = document.getElementById('placesList'),
                                    menuEl = document.getElementById('menu_wrap'),
                                    fragment = document.createDocumentFragment(),
                                    bounds = new kakao.maps.LatLngBounds(),
                                    listStr = '';

                                  // 검색 결과 목록에 추가된 항목들을 제거합니다
                                  removeAllChildNods(listEl);

                                  // 지도에 표시되고 있는 마커를 제거합니다
                                  removeMarker();

                                  for (var i = 0; i < places.length; i++) {

                                    // 마커를 생성하고 지도에 표시합니다
                                    var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                                      marker3 = addMarker(placePosition, i),
                                      itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                                    // LatLngBounds 객체에 좌표를 추가합니다
                                    bounds.extend(placePosition);

                                    // 마커와 검색결과 항목에 mouseover 했을때
                                    // 해당 장소에 인포윈도우에 장소명을 표시합니다
                                    // mouseout 했을 때는 인포윈도우를 닫습니다
                                    (function (marker3, title) {
                                      kakao.maps.event.addListener(marker3, 'mouseover', function () {
                                        displayInfowindow(marker3, title);
                                      });

                                      kakao.maps.event.addListener(marker3, 'mouseout', function () {
                                        infowindow3.close();
                                      });

                                      itemEl.onmouseover = function () {
                                        displayInfowindow(marker3, title);
                                      };

                                      itemEl.onmouseout = function () {
                                        infowindow3.close();
                                      };
                                    })(marker3, places[i].place_name);

                                    fragment.appendChild(itemEl);
                                  }

                                  // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                                  listEl.appendChild(fragment);
                                  menuEl.scrollTop = 0;

                                  // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                                  map3.setBounds(bounds);
                                }
                                // 검색결과 항목을 Element로 반환하는 함수입니다
                                function getListItem(index, places) {

                                  var el = document.createElement('li'),
                                    itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
                                      '<div class="info">' +
                                      '   <h5>' + places.place_name + '</h5>';

                                  if (places.road_address_name) {
                                    itemStr += '    <span>' + places.road_address_name + '</span>' +
                                      '   <span class="jibun gray">' + places.address_name + '</span>';
                                  } else {
                                    itemStr += '    <span>' + places.address_name + '</span>';
                                  }

                                  itemStr += '  <span class="tel">' + places.phone + '</span>' +
                                    '</div>';

                                  el.innerHTML = itemStr;
                                  el.className = 'item';

                                  return el;
                                }

                                // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                                function addMarker(position, idx, title) {
                                  var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                                    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                                    imgOptions = {
                                      spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                                      spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                                      offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                                    },
                                    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                                    marker3 = new kakao.maps.Marker({
                                      position: position, // 마커의 위치
                                      image: markerImage
                                    });

                                  marker3.setMap(map3); // 지도 위에 마커를 표출합니다
                                  markers.push(marker3);  // 배열에 생성된 마커를 추가합니다

                                  return marker3;
                                }

                                // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                                function removeMarker() {
                                  for (var i = 0; i < markers.length; i++) {
                                    markers[i].setMap(null);
                                  }
                                  markers = [];
                                }

                                // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                                function displayPagination(pagination) {
                                  var paginationEl = document.getElementById('pagination'),
                                    fragment = document.createDocumentFragment(),
                                    i;

                                  // 기존에 추가된 페이지번호를 삭제합니다
                                  while (paginationEl.hasChildNodes()) {
                                    paginationEl.removeChild(paginationEl.lastChild);
                                  }

                                  for (i = 1; i <= pagination.last; i++) {
                                    var el = document.createElement('a');
                                    el.href = "#";
                                    el.innerHTML = i;

                                    if (i === pagination.current) {
                                      el.className = 'on';
                                    } else {
                                      el.onclick = (function (i) {
                                        return function () {
                                          pagination.gotoPage(i);
                                        }
                                      })(i);
                                    }

                                    fragment.appendChild(el);
                                  }
                                  paginationEl.appendChild(fragment);
                                }

                                // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
                                // 인포윈도우에 장소명을 표시합니다
                                function displayInfowindow(marker3, title) {
                                  var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

                                  infowindow3.setContent(content);
                                  infowindow3.open(map3, marker3);
                                }

                                // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                                function removeAllChildNods(el) {
                                  while (el.hasChildNodes()) {
                                    el.removeChild(el.lastChild);
                                  }
                                }
                                $(function () {
                                  function GetInfo() {
                                    fetch('https://api.openweathermap.org/data/2.5/forecast?q='+e.mtWt+'&appid=fb632c6d41147f0013e7bb5cd8fe34b9')
                                      .then(response => response.json())
                                      .then(data => {
                                        // Getting the min and max values for each day
                                        for (i = 0; i < 5; i++) {
                                          document.getElementById("day" + (i + 1) + "Min").innerHTML = "최저기온 " + Number(data.list[i * 8].main.temp_min - 273.15).toFixed(1) + "°";
                                        }

                                        for (i = 0; i < 5; i++) {
                                          document.getElementById("day" + (i + 1) + "Max").innerHTML = "최고기온 " + Number(data.list[i * 8].main.temp_max - 273.15).toFixed(2) + "°";
                                        }

                                        for (i = 0; i < 5; i++) {
                                          document.getElementById("img" + (i + 1)).src = "http://openweathermap.org/img/wn/" +
                                            data.list[i * 8].weather[0].icon +
                                            ".png";
                                        }
                                      })
                                      .catch(err => alert("Something Went Wrong: Try Checking Your Internet Connection"))
                                  }

                                  var d = new Date();
                                  var weekday = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

                                  function CheckDay(day) {
                                    if (day + d.getDay() > 6) {
                                      return day + d.getDay() - 7;
                                    } else {
                                      return day + d.getDay();
                                    }
                                  }

                                  for (i = 0; i < 5; i++) {
                                    document.getElementById("day" + (i + 1)).innerHTML = weekday[CheckDay(i)];
                                  }

                                  // GetInfo 함수를 호출하여 데이터를 가져오도록 함
                                  GetInfo();
                                });
                              }, error: function () {
                                ("ajax통신실패");
                              }
                            })
                          })
                        });

                      }, error: function () {
                        ("ajax통신실패");
                      }
                    })
                  })
                });
                $(function () {
                  $(".mt-info>.detail-info").click(function () {
                    const $p = $(this).next();
                    if ($p.css("display") == "none") {
                      $p.slideDown();
                    } else {
                      $p.slideUp();
                    }
                  })
                });



              </script>

              <div id="topbtn">
                <a href="#"><img src="https://blog.kakaocdn.net/dn/8Q2Lz/btrcOS9MCg8/GNshUKOnQXIjXq2nKhcYf1/img.png"
                    style="width: 40px; height: 40px;"></a>
              </div>

              <%@ include file="../common/footerbar.jsp" %>
      </body>

      </html>