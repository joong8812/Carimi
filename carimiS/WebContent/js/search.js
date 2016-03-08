

		var map, places, iw;
		var markers = [];
		var infowindows = [];
		var autocomplete;
		var usersearch;
		var myLatlng;
		// 사용자 입력을 위해 변수 1개 추가
		var geocoder; 
		var marker;
		var contentString, infowindow;
		var startLat = null;
		var startLng = null;
		var endLat = null;
		var endLng = null;

		function initialize() {
			
			geocoder = new google.maps.Geocoder();
			myLatlng = new google.maps.LatLng(37.552067, 126.937251);
//			navigator.geolocation.getCurrentPosition(showPosition);
			var myOptions = {
				zoom: 16,
				center: myLatlng,
				scaleControl:true,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
			
			
//			places = new google.maps.places.PlacesService(map);
//			google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);
//			autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
//			google.maps.event.addListener(autocomplete, 'place_changed', function () {
//				showSelectedPlace();
//			});
//			
//			usersearch = new google.maps.places.Autocomplete(document.getElementById('usersearch'));
//			google.maps.event.addListener(usersearch, 'place_changed', function () {
//				showSelectedPlace();
//			});
//			
			//------------------------------------------------마커 관련
			
			 google.maps.event.addListener(map, 'click', function(event) {
				    placeMarker(event.latLng);
				  });
			 
//			contentString = '<div style="width:100px;height:50px;">쌍용교육센터</div>';
//			infowindow = new google.maps.InfoWindow({
//				content: contentString,
//				size: new google.maps.Size(200,100)
//			});
			
			marker = new google.maps.Marker({
				position: myLatlng,
				map: map, 
			    draggable:true,			// 마커 드래그 가능
			    icon: "http://maps.google.com/mapfiles/ms/micons/man.png",
				title: '혜택 팡팡!'	// 마커 : 도움말 풍선(마우스 오버 시)
					
			});
			//infowindow.open(map, marker);
			google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);

//				if (marker.getAnimation() != null) {
//					marker.setAnimation(null);
//				} else {
//					marker.setAnimation(google.maps.Animation.BOUNCE);
//				}
			});

			marker.setMap(map);
			
			//Update current position info.
			  updateMarkerPosition(myLatlng);
			  geocodePosition(myLatlng);
	
			  movingMouse();
  
		}


		
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
			  document.getElementById('maddress').innerHTML = str;
			  if(str != 'Dragging...'){
				  contentString = '<div style="width:170px;height:50px;">' + str + '</div>';
				    infowindow = new google.maps.InfoWindow({
						content: contentString,
						size: new google.maps.Size(200,100)
					});
					//infowindow.open(map, marker);
			  } else {
				  infowindow.close(map, marker);
			  } 
			}
			
		function tilesLoaded() {
			google.maps.event.clearListeners(map, 'tilesloaded');
			google.maps.event.addListener(map, 'zoom_changed', search);
			google.maps.event.addListener(map, 'dragend', search);
			search();
		}

		function showSelectedPlace() {
			clearResults();
			clearMarkers();
			var place = autocomplete.getPlace();
			alert(place.geometry.location);
			map.panTo(place.geometry.location);
			markers[0] = new google.maps.Marker({
				position: place.geometry.location,
				map: map
			});
			iw = new google.maps.InfoWindow({
				content: getIWContent(place)
			});
			iw.open(map, markers[0]);
		}

		function clearMarkers() {
			for (var i = 0; i < markers.length; i++) {
				if (markers[i]) {
					markers[i].setMap(null);
					markers[i] == null;
				}
			}
			markers = [];
		}
		function clearInfos() {
			for (var i = 0; i < infowindows.length; i++) {
				if (infowindows[i]) {
					infowindows[i] == null;
				}
			}
			infowindows = [];
		}

		function dropMarker(i) {
			return function () {
				markers[i].setMap(map);
			}
		}

		
		function codeAddress(){  
		    var address = document.getElementById("address").value;  
		    var r = document.getElementById("r");  
		    
		    r.innerHTML = '';  
		      
		    geocoder.geocode({  
		        'address': address  
		    }, function(results, status){  
		        if (status == google.maps.GeocoderStatus.OK) {  
		            map.setCenter(results[0].geometry.location);  
		            addMark(results[0].geometry.location.lat(), results[0].geometry.location.lng());  
		                          
		            for(var i in  results){  
//		                r.innerHTML += results[i].formatted_address+',';  
		                var li = document.createElement('li');  
		                var a = document.createElement('a');  
//		                a.href = "javascript:addMark(" + marker.position.lat() + ", " + marker.position.lng() + ");";
//		                a.href = "javascript:addMark(" + results[i].geometry.position.Pa + 
//		                ", " + results[i].geometry.position.Qa + ");";  
//		                a.href = "javascript:clickAddress(" + results[i].geometry.location + ", "
//		                		+ results[i].formatted_address + ");";
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
		  
		function addMark(lat, lng){  
		    if(typeof marker!='undefined'){  
		        marker.setMap(null);  
		    }  
		    marker = new google.maps.Marker({  
		        map: map,  
		        position: new google.maps.LatLng(lat, lng),  
		        icon: "http://maps.google.com/mapfiles/ms/micons/man.png",
		    	draggable : true
		    });
		    google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
			});
		    
		  //Update current position info.
		    updateMarkerPosition(new google.maps.LatLng(lat, lng));
		    geocodePosition(new google.maps.LatLng(lat, lng));
		    
		    movingMouse();
		    
		}
		
		// Find current location.
		function getLocation() {
		    if (navigator.geolocation) {
		    	alert("현재 위치로 이동합니다.");
		        navigator.geolocation.getCurrentPosition(showPosition);
		    } else {
		        alert("Geolocation is not supported by this browser.");
		    }
		}
		
		// Show current location
		function showPosition(position) {
			myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			map.setCenter(myLatlng);
			addMark(position.coords.latitude, position.coords.longitude);
		}
		
		function movingMouse(){
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
		
		//------------------------------------------------------------------- 다중 마커 찍기~~~
		
		function addMarkerWithTimeout(markObj, timeout) {
			var markertype;
			if(markObj.cardtype == 'card1'){

				markertype = "/CarimiS/image/m_card1.png";

			} else {
				markertype = "/CarimiS/image/m_card2.png";
			}
			
			  window.setTimeout(function() {
				  markersSetting(markObj, markertype);
			  }, timeout);
			}
		
		// markers setting
		function markersSetting(markObj, markertype){
			var brateStr;
			
			if(markObj.brate < 100){
				  brateStr = markObj.brate + " % 할인";
			  } else {
				  brateStr = markObj.brate + " 원 할인";
			  }
			
			contentString = '<div style="width:170px;height:80px;text-align:center;">'
	  			+ '가맹점명 : ' + markObj.shopname + '<br>'
	  			+ '전화번호 : ' + markObj.phone + '<br>'
	  			+ '혜택정보 : ' + brateStr
  				+ '</div>';
			
			var infowindow = new google.maps.InfoWindow({
                content : contentString
                });
			var t_marker = new google.maps.Marker({
			      position: new google.maps.LatLng(markObj.locationy, markObj.locationx),
			      map: map,
			      icon: markertype,
			      animation: google.maps.Animation.DROP
			    });
			
			markers.push(t_marker);
			infowindows.push(infowindow);
			google.maps.event.addListener(t_marker, 'click', function() {
				closeAllinfo();
                infowindow.open(map, t_marker);   
			});
		}
		
		// 드롭 마커 보기
		function viewMarker(Arr, menu) {
			
			clearMarkers();
			clearInfos();
			var sel;
			if(menu == 'all'){
				sel = Arr.all;
			} else if(menu == 'card1'){
				sel = Arr.card1;
			} else if(menu == 'card2'){
				sel = Arr.card2;
			}
			for (var i = 0; i < sel.length; i++) {
				addMarkerWithTimeout(sel[i], i * 100);
			}
		}
		
		function focusMarker(a,b){
			for(var i=0; i<markers.length; i++){
				if(markers[i].position.lat() == b && markers[i].position.lng() == a){
					map.setCenter(new google.maps.LatLng(b, a));
					closeAllinfo();
					infowindows[i].open(map, markers[i]);
				}
			}
		}
		function closeAllinfo(){
			for(var i=0; i<markers.length; i++){
				infowindows[i].close(map, markers[i]);
			}
		}
		
		//--------------------------------------------

		google.maps.event.addDomListener(window, 'load', initialize);
		
		// These functions are not related in Google API.
		
		// This function helps it checks only one check box.
		function chk_only(chk){								
			var obj = document.getElementsByName("benefit");
			for(var i=0; i<obj.length; i++){
				if(obj[i] != chk){
					obj[i].checked = false;
				}
			}
		}
		// This function helps it checks only two check boxes.
		function chk_two(chk){
			var obj = document.getElementsByName("cards");
			var count = 0;
			for(var i=0; i<obj.length; i++){
				if(obj[i].checked === true){
					count++;
					if(count > 2){
						alert("카드를 2개 이상 선택 할 수 없습니다");
						chk.checked = false;
					}
				}
			}
		}
		
		function selectCard(cardname, chk){
			var obj = document.getElementsByName("card");
			var count = 0;
			var cn = document.getElementById(cardname);
			if(cn.value != cardname){
				cn.style.border = "3px solid #00ba8b";
				cn.value = cardname;
			
				for(var i=0; i<obj.length; i++){
					if(obj[i].value != null){
						count++;
						if(count > 2){
							alert("카드를 2개 이상 선택 할 수 없습니다");
							chk.value = null;
							chk.style.border = "";
						} else {
							document.getElementById("card" + count).value = obj[i].value;
						}
					}
				}
			} else {
				for(var i=0; i<obj.length; i++){
					if(obj[i].value === document.getElementById("card1").value){
						document.getElementById("card1").value = "";
					} else if(obj[i].value === document.getElementById("card2").value){
						document.getElementById("card2").value = "";
					}
				}
				cn.style.border = "";
				cn.value = null;
			}
		}
		function selectBenefit(benefit, chk){
			var obj = document.getElementsByName("bnf");
			for(var i=0; i<obj.length; i++){
				if(obj[i] === chk){
					obj[i].value = benefit;
					var img = benefit + "_on.png"
					obj[i].src = "/CarimiS/image/benefits/" + img;
					document.getElementById("benefit").value = obj[i].value
				} else {
					obj[i].value = "";
					var img = obj[i].getAttribute("id") + "_off.png"
					obj[i].src = "/CarimiS/image/benefits/" + img;
				}
			}
		}
