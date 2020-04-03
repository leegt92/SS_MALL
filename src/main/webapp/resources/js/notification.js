
var iconDataURI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAKBJREFUeNpiYBjpgBFd4P///wJAaj0QO9DEQiAg5ID9tLIcmwMYsDgABhqoaTHMUHRxpsGYBv5TGqTIZsDkYWLo6gc8BEYdMOqAUQeMOoAqDgAWcgZAfB9EU63SIAGALH8PZb+H8v+jVz64KiOK6wIg+ADEArj4hOoCajiAqMpqtDIadcCoA0YdQIoDDtCqQ4KtBY3NAYG0csQowAYAAgwAgSqbls5coPEAAAAASUVORK5CYII=";

$(document).ready(function() {
	// 데스크탑 알림 권한 요청
	Notification.requestPermission(function(result) {
	
		return;

	});
});

// 데스크탑 알림 버튼을 누르면,
function noti(msg) {
	var message = msg;

	var options = {
		body : message,
		icon : iconDataURI
	}

	//데스크탑 알림 요청
	var notification = new Notification("상승몰 채팅창", options);

	//알림 후 5초 뒤,
	setTimeout(function() {
		//얼람 메시지 닫기
		notification.close();
	}, 5000);

};