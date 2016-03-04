var map, marker;
var contentString, infowindow;
var geocoder = new google.maps.Geocoder();
var myLatlng;

function geocodePosition(pos) {
  geocoder.geocode({
    latLng: pos
  }, function(responses) {
    if (responses && responses.length > 0) {
      updateMarkerAddress(responses[0].formatted_address);
    } else {
      updateMarkerAddress('Cannot determine address at this location.');
    }
  });
 
}

function updateMarkerStatus(str) {
  document.getElementById('markerStatus').innerHTML = str;
}

function updateMarkerPosition(latLng) {
  document.getElementById('info').innerHTML = [
    latLng.lat(),
    latLng.lng()
  ].join(', ');
}

function updateMarkerAddress(str) {
  document.getElementById('address').innerHTML = str;
  if(str != 'Dragging...'){
	  contentString = '<div style="width:170px;height:50px;">' + str + '</div>';
	    infowindow = new google.maps.InfoWindow({
			content: contentString,
			size: new google.maps.Size(200,100)
		});
		infowindow.open(map, marker);
  } else {
	  infowindow.close(map, marker);
  } 
}


function initialize() {
	navigator.geolocation.getCurrentPosition(showPosition);
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
	    draggable: true
	  });
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
  
	//Update current position info.
  updateMarkerPosition(myLatlng);
  geocodePosition(myLatlng);
  
  movingMouse();
  
  document.getElementById("lx").value = getLocation_x();
  document.getElementById("ly").value = getLocation_y();
}

function movingMouse(){
	//Update current position info.
//	  updateMarkerPosition(myLatlng);
//	  geocodePosition(myLatlng);
	  
	  // Add dragging event listeners.
	  google.maps.event.addListener(marker, 'dragstart', function() {
	    updateMarkerAddress('Dragging...');
	  });
	  
	  google.maps.event.addListener(marker, 'drag', function() {
	    //updateMarkerStatus('Dragging...');
	    updateMarkerPosition(marker.getPosition());
	  });
	  
	  google.maps.event.addListener(marker, 'dragend', function() {
	    //updateMarkerStatus('Drag ended');
	    geocodePosition(marker.getPosition());
	    document.getElementById("lx").value = getLocation_x();
	    document.getElementById("ly").value = getLocation_y();
	  });
}

function codeAddress(){  
    var address = document.getElementById("saddress").value;  
    var r = document.getElementById("r");  
    
    r.innerHTML = '';  
      
    geocoder.geocode({  
        'address': address  
    }, function(results, status){  
        if (status == google.maps.GeocoderStatus.OK) {  
            map.setCenter(results[0].geometry.location);  
            addMark(results[0].geometry.location.lat(), results[0].geometry.location.lng());  
                          
            for(var i in  results){  
                var li = document.createElement('li');  
                var a = document.createElement('a');  
                a.href = "javascript:resultMarker("+ results[i].geometry.location.lat() + ", " +
                			results[i].geometry.location.lng() + ");";
                
                a.innerHTML = results[i].formatted_address;
                
                li.appendChild(a);  
                r.appendChild(li);  
            }             
        } else {  
            r.innerHTML = "검색 결과가 없습니다."+status;              
        }  
    });  
}  

// 사용자 검색을 위한 코드 추가 
function resultMarker(lat, lng){
	map.setCenter(new google.maps.LatLng(lat, lng));
	addMark(lat, lng);
}



//if you click on map, place marker :)
function placeMarker(location) {
	if(typeof marker!='undefined'){  
        marker.setMap(null);  
    }  
  marker = new google.maps.Marker({
      position: location, 
      map: map,
      info: "말풍선",
      draggable:true,			// marker drag
  });
  google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
  
//Update current position info.
  updateMarkerPosition(myLatlng);
  geocodePosition(myLatlng);
  
  movingMouse();

  map.setCenter(location);
}

function addMark(lat, lng){  
    if(typeof marker!='undefined'){  
        marker.setMap(null);  
    }  
    marker = new google.maps.Marker({  
        map: map,  
        position: new google.maps.LatLng(lat, lng),  
    	draggable: true
    });
    
	  //Update current position info.
    updateMarkerPosition(new google.maps.LatLng(lat, lng));
    geocodePosition(new google.maps.LatLng(lat, lng));
    
    movingMouse();
    
    document.getElementById("lx").value = getLocation_x();
    document.getElementById("ly").value = getLocation_y();
}

function getLocation_x(){
	return marker.getPosition().lng();
}
function getLocation_y(){
	return marker.getPosition().lat();
}



// Show current location
function showPosition(position) {
	myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	map.setCenter(myLatlng);
	addMark(position.coords.latitude, position.coords.longitude);
}

google.maps.event.addDomListener(window, 'load', initialize);

// For putting only numbers in textfield.
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 
			|| keyID == 9) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
