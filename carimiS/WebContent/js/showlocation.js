var map, marker;
var brateStr;

//function showMap(locationx, locationy){
//	initialize(locationx, locationy);
//}

function initialize() {
  var locationx = document.getElementById("locationx").value;
  var locationy = document.getElementById("locationy").value;
  var myLatlng = new google.maps.LatLng(locationy, locationx);
  var myOptions = {
    zoom: 16,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
  marker = new google.maps.Marker({
	    position: myLatlng,
	    title: 'Point A',
	    map: map,
	  });
  google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
  
  if(document.getElementById("brate").value < 100){
	  brateStr = document.getElementById("brate").value + " % 할인";
  } else {
	  brateStr = document.getElementById("brate").value + " 원 할인";
  }
  
  contentString = '<div style="width:180px;height:70px;">'
	  			+ '가맹점명 : ' + document.getElementById("shopname").value + '<br>'
	  			+ '전화번호 : ' + document.getElementById("phone").value + '<br>'
//	  			+ '혜택정보 : ' + document.getElementById("brate").value
	  			+ '혜택정보 : ' + brateStr
  				+ '</div>';
  infowindow = new google.maps.InfoWindow({
		content: contentString,
		size: new google.maps.Size(200,100)
	});
  infowindow.open(map, marker);
}

google.maps.event.addDomListener(window, 'load', initialize);
  