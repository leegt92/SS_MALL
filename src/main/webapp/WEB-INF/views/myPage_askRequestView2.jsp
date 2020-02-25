<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <style type="text/css">

    html, body {

        width: 100%;
        height: 100%;

        margin: 0;
        padding: 0;

        font-family: "Helvetica Neue", Helvetica, sans-serif;

        background-color: #FFFFFF;
    }

    .accordion{

        position: relative;

        width: 500px;
        height: 100%;

        font-size: 12px;

        margin: 0 auto;

        padding-top: 30px;
    }

    ul {
        position: relative;

        width: 100%;
        height: 100%;

        list-style: none;

        margin: 0;
        padding: 0;
    }

    ul li h3 {

        position: relative;

        width: 100%;
        height: 30px;

        line-height: 30px;

        text-align: center;

        color: #ccbb88;

        background-color: #FFFFFF;

        cursor: pointer;

        margin: 0px;
        padding: 0px;

        border-bottom: #ddd 1px solid;
    }

    ul li h3:hover{
        color: #757575;
        background-color: #e5e5e5;
    }

    ul li h3.active {
        color: #757575;
        background-color: #f5f5f5;
    }

    ul li div{

        position: relative;

        width: 100%;
        height: 100px;

        background-color: #FFFFFF;

        word-break: break-all;
        word-wrap: break-word;

        overflow: auto;

        margin: 0;
        padding: 0;

        display: none;
    }

    ul li div span{

        position: relative;

        width: 100%;
        height: 100%;
    }

    </style>
</head>
<body>
<div class="accordion">
    <ul>
        <li>
            <h3>menu 1</h3>
            <div>
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
        <li>
            <h3>menu 2</h3>
            <div>
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
        <li>
            <h3>menu 3</h3>
            <div>
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
        <li>
            <h3>menu 4</h3>
            <div>
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
    </ul>
</div>
	<script>
		$(document).ready(function() {

		    // click 이벤트가 발생된 마지막 element
		    var lastElem = null;

		    $('.accordion').on('click', function (e) {

		        // click 이벤트가 발생한 element
		        var elem = e.target;

		        // nodeName 이 `h3` 가 아닌 경우, 해당 이벤트를 중지시킨다.
		        if (elem.nodeName.toLowerCase() !== 'h3'){
		            return;
		        }

		        // target element
		        var targetElem = $(elem);

		        // 이벤트가 발생된 마지막 element 를 닫는다.
		        if (lastElem) {
		            slideUp(lastElem.next(), 5, function (elem) {
		                elem.prev().attr('class', '');
		            });
		        }

		        var targetContentElem = targetElem.next();

		        // target element 가 active 일 경우
		        if (targetElem.attr('class') === 'active') return;

		        // 현재 target element 를 마지막 element 로 할당한다.
		        lastElem = targetElem;

		        // target content 를 보이게한다.
		        targetContentElem.show();
		        targetElem.attr('class', 'active');

		        slideDown(targetContentElem, 20);
		    });


		        function slideDown($elem, step, cb){

		            // jquery 로 생성된 element
		            if (!$elem){
		                console.error('엘리먼트가 존재하지 않습니다');
		                return;
		            }

		            // 증감 총 단계(전체 height 사이즈를, 총 몇 단계로 나눠 증감 시킬것인지 정할 수 있으며, 수치가 작을 수록 이동 속도가 올라간다.)
		            step = step || 20;

		            // callback function
		            cb = cb || function(){};

		            // $elem: jquery 로 생성된 element
		            // elem: dom element
		            var elem = $elem.get(0);

		            // 만약 타이머가 존재할 경우, 해당 타이머를 clear 시킨다.
		            if (elem.__timerId__){
		                window.clearInterval(elem.__timerId__);
		                elem.__timerId__ = null;
		            }

		            // (1)초당 함수가 호출되는 수(30 프레임으로 고정한다)
		            var fps = 1000 / 30;

		            // element 의 세로 사이즈
		            var height = parseFloat($elem.height());

		            // element 의 (초기)전체 사이즈
		            var dummyHeight = 0;

		            if (!elem.__dummyHeight__){
		                dummyHeight = elem.__dummyHeight__ = height;

		                $elem.height(0);
		                height = 0;
		            }
		            else{
		                dummyHeight = elem.__dummyHeight__;
		            }

		            // 증감 값
		            var increaseValue = dummyHeight / step;

		            elem.__timerId__ = window.setInterval(function () {

		                // height 값을 증감 시킨다.
		                height += increaseValue;

		                // height 값이 dummyHeight(전체 사이즈) 보다 크거나 같을경우, 해당 interval 을 중지시킨다.
		                if (height >= dummyHeight) {

		                    // 타이머를 중지 시킨다.
		                    if (elem.__timerId__){
		                        window.clearInterval(elem.__timerId__);
		                        elem.__timerId__ = null;
		                    }

		                    // element height 에 dummyHeight 값을 할당한다.
		                    $elem.height(dummyHeight);

		                    console.error('slideDown', $elem.text(), 'height', height, 'timerId', elem.__timerId__);

		                    // callback 호출
		                    cb($elem);
		                }
		                else{

		                    // 증감된 height 값을 할당한다.
		                    $elem.height(height);
		                    console.error('slideDown', $elem.text(), 'height', height);
		                }

		            }, fps);
		        }


		        function slideUp($elem, step, cb){

		            // jquery 로 생성된 element
		            if (!$elem){
		                console.error('엘리먼트가 존재하지 않습니다');
		                return;
		            }

		            // 가감 총 단계(전체 height 사이즈를, 총 몇 단계로 나눠 가감 시킬것인지 정할 수 있으며, 수치가 작을 수록 이동 속도가 올라간다.)
		            step = step || 5;

		            // callback function
		            cb = cb || function(){};

		            // $elem: jquery 로 생성된 element
		            // elem: dom element
		            var elem = $elem.get(0);

		            // 만약 타이머가 존재할 경우, 해당 타이머를 clear 시킨다.
		            if (elem.__timerId__){
		                window.clearInterval(elem.__timerId__);
		                elem.__timerId__ = null;
		            }

		            // (1)초당 함수가 호출되는 수(30 프레임으로 고정한다)
		            var fps = 1000 / 30;

		            // element 의 세로 사이즈
		            var height = parseFloat($elem.height());

		            // 가감 값
		            var increaseValue = elem.__dummyHeight__ / step;

		            elem.__timerId__ = window.setInterval(function () {

		                // height 값을 가감 시킨다.
		                height -= increaseValue;

		                // height 값이 0 보다 작거나 같을경우, 해당 interval 을 중지시킨다.
		                if (height <= 0) {

		                    if (elem.__timerId__){
		                        window.clearInterval(elem.__timerId__);
		                        elem.__timerId__ = null;
		                    }

		                    // element height 에 0 값을 할당한다.
		                    $elem.height(0);

		                    console.error('slideUp', $elem.text(), 'height', height, 'timerId', elem.__timerId__);
		                    cb($elem);
		                }
		                else{
		                    // 가감된 height 값을 할당한다.
		                    $elem.height(height);
		                }

		            }, fps);
		        }

		});
	</script>
</body>
</html>
