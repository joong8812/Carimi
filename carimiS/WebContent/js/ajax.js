var req = null;
var consol = null;
var READY_STATE_UNINITIALIZED=0;
var READY_STATE_LOADING=1;
var READY_STATE_LOADED=2;
var READY_STATE_INTERACTIVE=3;
var READY_STATE_COMPLETE=4;
var ReturnData="";


function initXMLHTTPRequest() 
{
	var xRequest = null;
	if (window.XMLHttpRequest) {
		xRequest = new XMLHttpRequest();
	} else if (window.ActiveXObject){
		xRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xRequest;
}


function sendRequest( url, params, HttpMethod)
{   
	if(!HttpMethod) {
		HttpMethod="GET";
	}
	req = initXMLHTTPRequest();
	if(req) 
	{
		req.onreadystatechange=onReadyState;	
		req.open(HttpMethod, url, true);
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8;");
		req.send(params);
	}
}


function onReadyState(){
	var ready = req.readyState;
	if ( ready == READY_STATE_COMPLETE ) 
	{
		if ( req.status == 200) 
		{
            ReturnData = req.responseText;
            //toConsole(ReturnData);
            result(ReturnData);
        }else if ( req.status == 204)
        {
			ReturnData = req.responseText;
            //toConsole(ReturnData);
            result(ReturnData);
        }
	}
	
}

		
