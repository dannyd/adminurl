

function confirmDelete( what ) {
	msg = 'URL: ' + what + '\n\nAction: Delete\n\n\nDelete URL: ' + what + '?\n\n';
	return confirm(msg);
}

function confirmDeleteCat( what ) {
	msg = 'Category: ' + what + '\n\nAction: Delete\n\n\nDelete Category: ' + what + '?\n\n';
	return confirm(msg);
}






//
//
//      Unused functions:
//
//








//declare xmlhttp object for use in other functions
var xmlhttp;

function winWidth() {
	var myWidth = 0;
	if( typeof( window.innerWidth ) == 'number' ) {
		//Non-IE
		myWidth = window.innerWidth;
	} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
		//IE 6+ in 'standards compliant mode'
		myWidth = document.documentElement.clientWidth;
	} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
		//IE 4 compatible
		myWidth = document.body.clientWidth;
	}
	//alert('winWidth: ' + myWidth);
	return myWidth;
}

function winHeight() {
	var myHeight = 0;
	if( typeof( window.innerHeight ) == 'number' ) {
		//Non-IE
		myHeight = window.innerHeight;
	} else if( document.documentElement && ( document.documentElement.clientHeight ) ) {
		//IE 6+ in 'standards compliant mode'
		myHeight = document.documentElement.clientHeight;
	} else if( document.body && ( document.body.clientHeight ) ) {
		//IE 4 compatible
		myHeight = document.body.clientHeight;
	}
	//alert('winHeight: ' + myHeight);
	return myHeight;
}


function addEventDELETE(obj, evType, fn){
 if (obj.addEventListener){
   obj.addEventListener(evType, fn, false);
   return true; 
 } else if (obj.attachEvent){ 
   var r = obj.attachEvent("on"+evType, fn); 
   return r; 
 } else { 
   return false; 
 }
}

function showhide(item) {
	if (document.getElementById(item).style.display=="none") {
		document.getElementById(item).style.display="Inline";
	} else {
		document.getElementById(item).style.display="None";
	}
}

function popup(url) {
	myPopup = window.open(url,'myPopup','width=600,height=500,scrollbars=no');
}

function popupBig(url) {
	myBigPopup = window.open(url,'myBigPopup','width=750,height=625,scrollbars=no');
}

function spopup(url) {
	bla = document.location = url ;
}

function clearDiv(div) {
	document.getElementById(div).innerHTML = '';
}

function hideDiv(div) {
	document.getElementById(div).style.display = 'none';
}

function showDiv(div) {
	document.getElementById(div).style.display = 'block';
}

function toggleDiv(div) {
	if (document.getElementById(div).style.display == 'block' || document.getElementById(div).style.display == 'inline') {
		document.getElementById(div).style.display = 'none';
	}else{
		document.getElementById(div).style.display = 'block';
	}
}

function trimAll(sString) {
	//removes leading and trailing spaces
	while (sString.substring(0,1) == ' ')
		{
		sString = sString.substring(1, sString.length);
	}
	while (sString.substring(sString.length-1, sString.length) == ' ')
		{
		sString = sString.substring(0,sString.length-1);
	}
	return sString;
}

function initXMLHttp() {
    /*@cc_on @*/
    /*@if (@_jscript_version >= 5)
      try {
      xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
     } catch (e) {
      try {
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      } catch (E) {
       xmlhttp=false;
      }
     }
    @else
     xmlhttp=false
     @end @*/
    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
    	try {
    		xmlhttp = new XMLHttpRequest();
    	} catch (e) {
    		xmlhttp=false;
    	}
    }
    if (!xmlhttp && window.createRequest) {
    	try {
    		xmlhttp = window.createRequest();
    	} catch (e) {
    		xmlhttp=false;
    	}
    }
}

function confirmTerminate() {
	var userName = document.getElementById('chosenUserDiv').innerHTML;
	
	msg = 'User: ' + userName + '\n\nAction: Terminate\n\n\nAre you absolutely sure that you want to terminate ' + userName + '?\n\n';
	return confirm(msg);
}

function confirmEnable( action ) {
	var userName = document.getElementById('chosenUserDiv').innerHTML;

	msg = 'User: ' + userName + '\n\nAction: ' + action + ' Account\n\n\nAre you absolutely sure that you want to ' + action + ' the account for ' + userName + '?\n\n';
	return confirm( msg );
}

function confirmUnlock( action ) {
	var userName = document.getElementById('chosenUserDiv').innerHTML;

	msg = 'User: ' + userName + '\n\nAction: ' + action + ' Account\n\n\nAre you absolutely sure that you want to ' + action + ' the account for ' + userName + '?\n\n';
	return confirm( msg );
}

function confirmPasswordReset() {
	var userName = document.getElementById('chosenUserDiv').innerHTML;
	
	msg = 'User: ' + userName + '\n\nAction: Password reset\n\n\nAre you absolutely sure that you want to reset the password for ' + userName + '?\n\n';
	return confirm(msg);
}

function updateStylesheets() {
	var i,a,s;
	a=document.getElementsByTagName('link');
	for(i=0;i<a.length;i++) {
		s=a[i];
		if(s.rel.toLowerCase().indexOf('stylesheet')>=0&&s.href) {
			var h=s.href.replace(/(&|\\?)forceReload=d /,'');
			s.href=h+(h.indexOf('?')>=0?'&':'?')+'forceReload='+(new Date().valueOf());
		}
	}
}

function showOnlyUserPropCat(form) {
	var arTables, div;
	var arTables=document.getElementById('userPropParentDiv').getElementsByTagName('div');
	for(div in arTables)
		{
		if (arTables[div].className == 'userPropDiv'){arTables[div].style.display='none';}
		if (arTables[div].id == form){arTables[div].style.display='block';}
		if (form == 'All' && arTables[div].className == 'userPropDiv'){arTables[div].style.display='block';}
		//alert('showing: ' + form + ' \nThis id: ' + arTables[div].id + '\nThis items class: ' + arTables[div].className );
	}
	
}


function enableProceedButtons() {
	objs = document.getElementsByTagName("input");
	for (i=0; i < objs.length; i++){
		var btn = objs[i];
		if (btn.id.indexOf('proceed')>=0){
			//alert('field: ' + btn.id + '\n\nValue: ' + btn.value);
			btn.disabled = false;
		}
	}
}

function disableProceedButtons() {
	objs = document.getElementsByTagName("input");
	for (i=0; i < objs.length; i++){
		var btn = objs[i];
		if (btn.id.indexOf('proceed')>=0){
			//alert('field: ' + btn.id + '\n\nValue: ' + btn.value);
			btn.disabled = true;
		}
	}
}

/* ****************************************************************** */
/*            USER/GROUPS FORM                                        */
/* ****************************************************************** */

	function filterGroupTable(searchVal) {
		searchVal = searchVal.toLowerCase();
		var myTable = document.getElementById("availableGroups");
		for (var i = 0; i < myTable.rows.length; i++){
			cellData = myTable.rows[i].cells[0].innerHTML.replace(/<[^>]+>/g,"");
			if (cellData.toLowerCase().indexOf(searchVal)>=0 ) {
				myTable.rows[i].style.display = '';
			}else{
				myTable.rows[i].style.display = 'none';
			}
		}
	}		   


/* ****************************************************************** */
/*            USER SELECTOR FORM                                      */
/* ****************************************************************** */

function showUserSelectorForm( div, sPrompt, showExtended ) {
	//displays user search form
	initXMLHttp();
	statusDiv = document.getElementById(div)
	statusDiv.style.display = 'inline';
	statusDiv.innerHTML = 'Status: Getting data'
	document.body.style.cursor='wait';
	var sShowExtendedURL = '';
	if (showExtended){sShowExtendedURL="?showExtended=" + showExtended;}
	var sPromptURL = '';
	if (sPrompt){sPromptURL="&prompt=" + URLEncode( sPrompt );}

	// Prepare the XMLHTTP object for a HTTP POST to our validation ASP page
	var sURL = "find_user.asp" + sShowExtendedURL + sPromptURL;

	xmlhttp.open( "GET", sURL, false );

	// Execute the request
	xmlhttp.send('');
	statusDiv.innerHTML = '' + xmlhttp.responseText;
	document.body.style.cursor='auto';
	document.getElementById('searchName').focus();
}

function getUserProperties( userDN, userName , showExtended, propLevel ) {
	//shows user properties via 'get_user_info.asp'.
	//if showExtended is true, then add in links for both Basic and Detailed user information
	initXMLHttp();
	statusDiv = document.getElementById('userInfo');

	statusDiv.style.display = 'inline';
	titleDiv = document.getElementById('userInfoTitle');
	//titleDiv.innerHTML = '<div class=titleDiv><b>User info: ' + userName + '</b></div>';
	var newTitle = '<div class=userInfoTitleDiv><b>User info: ' + userName + '</b>';

	var sExtendedURL  = "";
	if (showExtended.indexOf('true')>=0) {
		//alert(showExtended);
		if (propLevel){
			if (propLevel.indexOf('full')>=0) {sExtendedURL = "&extendedProps=true";}
		}
		newTitle += '<span style="width: 100%;text-align:right;white-space:nowrap;">\n';
		newTitle += '<a class=basic href=# onclick="getUserProperties(\'' + userDN + '\',\'' + userName + '\',\'' + showExtended + '\',\'basic\');">Basic Info</a>';
		newTitle += '<a class=detail href=# onclick="getUserProperties(\'' + userDN + '\',\'' + userName + '\',\'' + showExtended + '\',\'full\');">Extended Info</a>';
		newTitle += '</span>\n';
	}

	newTitle += '</div>\n';
	titleDiv.innerHTML = newTitle;
	statusDiv.innerHTML = 'Status: looking up user properties: ';
	document.body.style.cursor='wait';

	// Prepare the XMLHTTP object for a HTTP POST to ASP page
	var sURL = "get_user_info.asp?dn=" + userDN + sExtendedURL;
	xmlhttp.open( "POST", sURL, false );

	// Execute the request
	xmlhttp.send('');
	statusDiv.innerHTML = '' + xmlhttp.responseText;
	document.body.style.cursor='auto';
}

function getUserSelector( searchDiv, div ) {
	//runs query via find_user.asp to display list of users in left column
	statusDiv = document.getElementById(div);
	user = document.getElementById(searchDiv).value;
	if (document.getElementById('showExtended')) {
		//alert('got value from showExtended: ' + document.getElementById('showExtended').value);
		var showExtended = document.getElementById('showExtended').value;
	}
	if ( trimAll(user) == '' || trimAll(user) == '&' || user.length<2){ 
		statusDiv.innerHTML = "Please enter at least two characters";
		return false;
	}
	setSizeUserSelector();
	initXMLHttp();
	document.getElementById('userInfo').innerHTML = '';
	document.getElementById('userInfoTitle').innerHTML = '';
	statusDiv.parentNode.style.display = 'block';
	statusDiv.style.display = 'block';
	document.body.style.cursor='wait';
	var sShowExtendedURL = '';
	if (showExtended){sShowExtendedURL="&showExtended=" + showExtended;}

	// Prepare the XMLHTTP object for a HTTP POST to our validation ASP page
	var sURL = "find_user.asp?searchName=" + user + sShowExtendedURL;
	//alert('getUserSelector is sending: ' + sURL);
	xmlhttp.open( "GET", sURL, false );

	// Execute the request
	xmlhttp.send('');
	statusDiv.innerHTML = '' + xmlhttp.responseText;
	document.body.style.cursor='auto';
}

function setSizeUserSelector() {
	//makes the form size proportional to window size
	var formHeight = winHeight()/1.6;
	//set form containers proportional to the current screen size
	document.getElementById('UserSelectorParentTable').style.height = formHeight + 'px';
	//find out what the resulting form height is
	var h1 = document.getElementById('UserSelectorParentTable').offsetHeight;
	//get the height of the find container is
	var h2 = document.getElementById('UserSelectorFindDiv').offsetHeight;
	//set the scroller area to the height of the form, minus the height of the find container
	//alert('formHeight: ' + formHeight + '\nh1: ' + h1 + '\nh2: ' + h2);
	document.getElementById('UserSelectorScroller').style.height = h1 - h2 + 'px';
	//alert(document.getElementById('UserSelectorScroller').style.height);
	document.getElementById('UserInfoScroller').style.height = h1 - h2 + 10 + 'px';
	//document.getElementById('UserInfoScroller').style.height = h1 + 'px';
	if ( document.getElementById('userScrollerTable') ) {
		var w1 = document.getElementById('userScrollerTable').offsetWidth;
		var w2 = document.getElementById('UserSelectorParentTable').offsetWidth;
		document.getElementById('UserSelectorLeftCell').style.width = w1 + 20 + 'px';
		//document.getElementById('UserSelectorRightCell').style.width = (w2 - w1) + 'px';
		document.getElementById('UserSelectorRightCell').style.width = '';
		//alert('new width of scroller: ' + w2);
	}
}

function getUserSelectUser( dn, ouPretty, formField, prettyDiv, buttonEnable ) {
	//upon select user, display info in appropriate places and enable the proceed button
	if (document.getElementById(formField)) {document.getElementById(formField).value = dn;}
	if (document.getElementById(prettyDiv)) {document.getElementById(prettyDiv).innerHTML = ouPretty;}
	if (document.getElementById(buttonEnable)) {document.getElementById(buttonEnable).disabled = false;}
	enableProceedButtons();
}


/* ****************************************************************** */
/*            END OF USER SELECTOR FORM                               */
/* ****************************************************************** */


/* ****************************************************************** */
/*            CREATE USER FORM                                        */
/* ****************************************************************** */

function verifyHasAddress( ouDN ) {
	//this gets the address for an OU or it's parents. If address is found, 
	// you can proceed, otherwise, disable proceed button
	initXMLHttp();
	document.body.style.cursor='wait';
	// Prepare the XMLHTTP object for a HTTP POST to ASP page
	var sURL = "get_ou_info.asp?dn=" + URLEncode( ouDN );
	xmlhttp.open( "POST", sURL, false );

	// Execute the request
	xmlhttp.send('');
	xmlResponse = xmlhttp.responseText;

	if (xmlResponse.indexOf("No address found for this OU")>=0){ 
		xmlResponse = "<span class=noticeDiv>" + xmlResponse + "</span>"
		disableProceedButtons();
	}

	if (document.getElementById('ouStreetAddress')) {
		document.getElementById('ouStreetAddress').innerHTML = xmlResponse;		
	}
		
	document.body.style.cursor='auto';
	return xmlResponse;
}


function checkUserExists() {
	//checks if user exists on domain, called from "check" button on new user form
	initXMLHttp();
	fname = document.getElementById('fname').value
	lname = document.getElementById('lname').value
	if (document.getElementById('chkUseMiddleInitial').checked) {
		mname = document.getElementById('mname').value
	}else{
		mname = '';
	}
	
	statusDiv = document.getElementById('checkUserExistsStatusDiv')
	hideDiv('checkUserExistsBeforeSubmit');
	statusDiv.style.display = 'inline';
	if (fname == '') {
		statusDiv.innerHTML = '<span class=infoDiv style="color:red">No first name specified</span>';
		var t1 = setTimeout("document.getElementById('checkUserExistsStatusDiv').style.display='none'",2500);
		return false;
	} else if (lname == '') {
		statusDiv.innerHTML = '<span class=infoDiv style="color:red">No last name specified</span>';
		var t1 = setTimeout("document.getElementById('checkUserExistsStatusDiv').style.display='none'",2500);
		return false;
	}
	statusDiv.innerHTML = '<span class=infoDiv >Status: checking user: ' + fname + ' ' + mname + ' ' + lname + '....</div>';
	document.body.style.cursor='wait';
	
	// Prepare the XMLHTTP object for a HTTP POST to our  ASP page
	var sURL = "get_user_exists.asp?fname=" + fname + "&lname=" + lname
	if (document.getElementById('chkUseMiddleInitial').checked) {
		sURL = sURL + "&mname=" + mname;
	}
	xmlhttp.open( "POST", sURL, false );

	// Execute the request
	xmlhttp.send('');
	var responseText = xmlhttp.responseText;
	document.body.style.cursor='auto';

	if (responseText.match("available")){
		statusDiv.innerHTML = '<span class=infoDiv>' + responseText + '</span>';
	}else{
		statusDiv.innerHTML = '<span class=errorDiv>' + responseText + '</span>';
		var t1 = setTimeout("document.getElementById('checkUserExistsBeforeSubmit').style.display='none'",3500);
		//return false;
	}
	document.body.style.cursor='auto';
	var t1 = setTimeout("document.getElementById('checkUserExistsStatusDiv').style.display='none'",2500);
}

function checkUserExistsBeforeSubmit() {
	// used when form is submitted, if user exists form submit is halted via 'return false'
	initXMLHttp();
	fname = document.getElementById('fname').value
	lname = document.getElementById('lname').value
	if (document.getElementById('chkUseMiddleInitial').checked) {
		mname = document.getElementById('mname').value
	}else{
		mname = '';
	}

	statusDiv = document.getElementById('checkUserExistsBeforeSubmit')
	statusDiv.style.display = 'inline';
	if (fname == '') {
		statusDiv.innerHTML = '<span style="color:red">No first name specified</span>';
		return false;
	} else if (lname == '') {
		statusDiv.innerHTML = '<span style="color:red">No last name specified</span>';
		return false;
	}
	statusDiv.innerHTML = 'Please wait...';
	document.body.style.cursor='wait';
	
	// Prepare the XMLHTTP object for a HTTP POST to our  ASP page
	var sURL = "get_user_exists.asp?fname=" + fname + "&lname=" + lname
	if (document.getElementById('chkUseMiddleInitial').checked) {
		sURL = sURL + "&mname=" + mname;
	}
	xmlhttp.open( "POST", sURL, false );

	// Execute the request
	xmlhttp.send('');
	var responseText = xmlhttp.responseText;
	document.body.style.cursor='auto';

	if (responseText.match("available")){
		return true;
	}else{
		statusDiv.innerHTML = '<span class=errorDiv>' + responseText + '</span>';
		var t1 = setTimeout("document.getElementById('checkUserExistsBeforeSubmit').style.display='none'",3500);
		return false;
	}
}

function checkUserExistsWhilePendingCreation( ) {

	statusDiv = document.getElementById('checkUserExistsWhilePendingCreationDiv');
	statusDiv.innerHTML = 'Refreshing - Please wait...';
	document.body.style.cursor='wait';

	initXMLHttp();
	
	if (!document.getElementById('chosenUserDN')) {
		var userDN = "";
	}else{
		var userDN = document.getElementById('chosenUserDN').value;
	}
	if (!document.getElementById('chosenUserRequestID')) {
		var requestID = "";
	}else{
		var requestID = document.getElementById('chosenUserRequestID').value;
	}
	
	// Prepare the XMLHTTP object for a HTTP POST to our  ASP page
	var sURL = "get_user_create_status.asp?dn=" + URLEncode( userDN ) + '&requestID=' + requestID;
	xmlhttp.open( "POST", sURL, false );

	// Execute the request
	xmlhttp.send('');
	var responseText = xmlhttp.responseText;

	if (responseText.match("Request status: Completed")){
		var userMsg = 'The user account has been created.';
		statusDiv.innerHTML = userMsg;
		addClass( statusDiv, "done" );
		document.getElementById('doneForm').style.display = 'block';
		document.body.style.cursor='auto';
		return true;
	}else if (responseText.match("Request status: Error")){
		var userMsg = 'There was an error creating the user account. Please see your system administrator.';
		statusDiv.innerHTML = responseText + "<br>" + userMsg;
		addClass( statusDiv, "error" );
		document.getElementById('doneForm').style.display = 'block';
		document.body.style.cursor='auto';
		return true;
	}else{

		var userMsg = 'The user account is being created by the system, please wait a moment.<br /><br />This process usually takes less than 1 minute.';
		//var msg = '<div style="float:left"><img src=/style/time.png></div>';
		//msg += '<div class="infoDiv noprint"  >' + userMsg + '</div></div>';
		statusDiv.innerHTML = responseText + "<br>" + userMsg;
		var t1 = setTimeout("checkUserExistsWhilePendingCreation()",4000);
		return false;
	}
}

function autoFormatUserNameFields(mode) {
	//returns preview of what the username will be given the options chosen (use middle initial, autoformat, etc.)
	if (mode == true) {
		document.getElementById('fname').value = properCase(document.getElementById('fname').value);
		document.getElementById('lname').value = properCase(document.getElementById('lname').value);
		document.getElementById('mname').value = properCase(document.getElementById('mname').value);
	}

	fname = document.getElementById('fname').value
	lname = document.getElementById('lname').value
	if (document.getElementById('chkUseMiddleInitial').checked) {
		mname = document.getElementById('mname').value
	}else{
		mname = '';
	}
	
	userNameDiv = document.getElementById('chosenUserName')
	
	var newUserName = fname.substring(0,1);

	newUserName = newUserName + mname + lname;
	userNameDiv.innerHTML = newUserName.toLowerCase();
	
}

function properCase(s) {
	//capitalizes the first char, and the rest is converted to lower case
	return s.toLowerCase().replace(/^(.)|-(.)|\s(.)/g, function($1) { return $1.toUpperCase(); });
}

function preValidateUserForm() {
	document.getElementById('createUser').disabled = true;
	if (trimAll(document.getElementById('fname').value) != "" &&
		trimAll(document.getElementById('lname').value) != "" &&
		trimAll(document.getElementById('chosenOU').value) != "") 
		{
		if (document.getElementById('createEmail').checked && trimAll(document.getElementById('cboStorageGroups').value) == '') 
			{
			document.getElementById('createUser').disabled = true;
			}else{
			document.getElementById('createUser').disabled = false;
		}
	}else{
		document.getElementById('createUser').disabled = true;
	}
	return false;
}

function setOU( ou, ouPretty ) {
	document.getElementById('chosenOU').value = ou;
	document.getElementById('chosenOuPrettyDiv').innerHTML = ouPretty;
	document.getElementById('proceed1').disabled = false;
}

function adminSelectOU( ou, ouPretty ) {
	document.getElementById('chosenOU').value = ou;
	document.getElementById('chosenOuPrettyDiv').innerHTML = ouPretty;
}

function setCompany( ou, ouPretty ) {
	document.getElementById('chosenCompany').value = ou;
	document.getElementById('chosenCompanyPrettyDiv').innerHTML = ouPretty;
	document.getElementById('proceed1').disabled = false;
}

function selectUser( ou, ouPretty ) {
	if (document.getElementById('chosenUser')) {document.getElementById('chosenUser').value = ou;}
	if (document.getElementById('chosenUserDiv')) {document.getElementById('chosenUserDiv').innerHTML = ouPretty;}
	if (document.getElementById('proceedActionUser')) {document.getElementById('proceedActionUser').disabled = false;}
}


/* ****************************************************************** */
/*            END OF CREATE USER FORM                                 */
/* ****************************************************************** */

/* ****************************************************************** */
/*            EDIT DEFAULT VALUES FORM                                */
/* ****************************************************************** */


function saveNewDefaultValue() {
	var statusDiv = document.getElementById('editValueResultsDiv');
	var chosenUserDN = document.getElementById('chosenOU').value;
	var adField = document.getElementById('cboADField').value;
	var newValue = URLEncode( document.getElementById('txtNewDefaultValue').value );
	if (adField==''){return false};
	if (newValue==''){return false};

	// Prepare the XMLHTTP object for a HTTP POST to our ASP page

	var sURL = "edit_defaults_getdata.asp?chosenUserDN=" + chosenUserDN + "&adField=" + adField + "&newDefaultValue=" + newValue;
	xmlhttp.open( "GET", sURL, false );

	// Execute the request
	xmlhttp.send('');
	var sResults = xmlhttp.responseText;
	if ( sResults.indexOf('Success')>=0 ){
		getDefaultValues();
		document.getElementById('txtNewDefaultValue').value = '';
	}else{
		statusDiv.innerHTML = 'Update Failed: ' + sResults;
	}
	document.body.style.cursor='auto';
}

function deleteDefaultValue( valToDelete ) {
	var statusDiv = document.getElementById('editValueResultsDiv');
	var chosenUserDN = document.getElementById('chosenOU').value;
	var adField = URLEncode( document.getElementById('cboADField').value );
	//var valToDelete = document.getElementById( deleteID ).value;
	if (chosenUserDN==''){alert('no ou specified');return false};
	if (adField==''){alert('no field specified');return false};
	if (valToDelete==''){alert('no value to delete');return false};

	// Prepare the XMLHTTP object for a HTTP POST to our ASP page

	var sURL = "edit_defaults_getdata.asp?chosenUserDN=" + chosenUserDN + "&adField=" + adField + "&valToDelete=" + valToDelete;
	xmlhttp.open( "GET", sURL, false );

	// Execute the request
	xmlhttp.send('');
	var sResults = xmlhttp.responseText;
	if ( sResults.indexOf('Success')>=0 ){
		statusDiv.innerHTML = 'Update succeeded: ' + sResults;
		document.getElementById('txtNewDefaultValue').value=URLDecode(valToDelete);
		getDefaultValues();
	}else{
		statusDiv.innerHTML = 'Update Failed: ' + sResults;
	}
	document.body.style.cursor='auto';
}

function getDefaultValues() {
	initXMLHttp();
	var chosenUserDN = document.getElementById('chosenOU').value;
	var adField = document.getElementById('cboADField').value;
	if (adField==''){return false};
	statusDiv = document.getElementById('defaultValuesDiv')
	statusDiv.style.display = 'inline';
	statusDiv.innerHTML = 'Status: Getting data'
	document.body.style.cursor='wait';

	// Prepare the XMLHTTP object for a HTTP POST to our ASP page

	var sURL = "edit_defaults_getdata.asp?chosenUserDN=" + chosenUserDN + "&adField=" + adField;
	xmlhttp.open( "GET", sURL, false );

	// Execute the request
	xmlhttp.send('');
	statusDiv.innerHTML = '' + xmlhttp.responseText;
	document.body.style.cursor='auto';
}

/* ****************************************************************** */
/*            END OF EDIT DEFAULT VALUES FORM                         */
/* ****************************************************************** */



/* ****************************************************************** */
/*            REQUEST QUEUE HISTORY FORM                              */
/* ****************************************************************** */

function showHideAllDetailsFields_QUEUE() {
	objs = document.getElementsByTagName("pre");
	for (i=0; i < objs.length; i++){
		var div = objs[i];
		if (div.id.indexOf('detailsDiv_')>=0){
			if (div.style.display == 'block') {
				div.style.display = 'none';
			}else{
				div.style.display = 'block';
			}
		}
	}
}



/* ****************************************************************** */
/*            APPLICATION SETTINGS FORM                               */
/* ****************************************************************** */

function filterSettingsTable(searchVal) {
	searchVal = searchVal.toLowerCase();
	var myTable = document.getElementById("appSettingsTable");
	for (var i = 1; i < myTable.rows.length-1; i=i+2){
		cell0Data = myTable.rows[i].cells[0].innerHTML.replace(/<[^>]+>/g,"");
		cell1Data = myTable.rows[i].cells[1].innerHTML;
		//.replace(/<[^>]+>/g,"");
		cellData = cell0Data + cell1Data;
		if (cellData.toLowerCase().indexOf(searchVal)>=0) {
			myTable.rows[i].style.display = '';
			myTable.rows[i+1].style.display = '';
		}else{
			myTable.rows[i].style.display = 'none';
			myTable.rows[i+1].style.display = 'none';
		}
	}
}		   



function expandContractAllDetailsFields(num) {
	objs = document.getElementsByTagName("textarea");
	for (i=0; i < objs.length; i++){
		var ta = objs[i];
		if (ta.id.indexOf('desc_')>=0){
			if (ta.rows + num >=1 ) {
				ta.rows = ta.rows + num;
			}
		}
	}
}

function showHideAllDetailsFields() {
	objs = document.getElementsByTagName("div");
	for (i=0; i < objs.length; i++){
		var div = objs[i];
		if (div.id.indexOf('detailsDiv_')>=0){
			if (div.style.display == 'block') {
				div.style.display = 'none';
			}else{
				div.style.display = 'block';
			}
		}
	}
}

function saveExistingAppSettingValue( idToUpdate, newVal, newDesc ) {
	initXMLHttp();
	statusDiv = document.getElementById('responseDiv_' + idToUpdate)
	statusDiv.innerHTML = 'Status: Saving'
	document.body.style.cursor='wait';

	// Prepare the XMLHTTP object for a HTTP POST to our ASP page

	var sURL = 'app_settings_get_save.asp?settingToUpdate=' + idToUpdate + '&newVal=' + URLEncode(newVal) + '&newDesc=' + URLEncode(newDesc);
	xmlhttp.open( "GET", sURL, false );

	// Execute the request
	xmlhttp.send('');
	var sResults = xmlhttp.responseText;
	if ( sResults.indexOf('Success')>=0 ){
		statusDiv.style.display='inline';
		statusDiv.innerHTML = '<div class=infoDiv>' + sResults + '<div>';
		document.getElementById('save_' + idToUpdate).disabled = true;
		setTimeout("statusDiv.style.display='none'",2500);		
	}else{
		statusDiv.style.display='inline';
		statusDiv.innerHTML = '<div class=errorDiv>' + sResults + '<div>';
	}
	
	document.body.style.cursor='auto';
}

function confirmDeleteSetting( idToDel, settingToDel ) {

	msg = 'WARNING: Missing Application settings could prevent this program from functioning properly.\n\nAre you absolutely sure that you want to delete this setting?\n\n\nSetting: ' + settingToDel + '\n\nAction: Delete';
	if (confirm(msg)) {
		document.location='app_settings.asp?settingToDelete=' + idToDel;
	}else{
		return false;
	}
	
}

/* ****************************************************************** */
/*            END OF APPLICATION SETTINGS FORM                        */
/* ****************************************************************** */








// ====================================================================
//       URLEncode and URLDecode functions
//
// Copyright Albion Research Ltd. 2002
// http://www.albionresearch.com/
//
// You may copy these functions providing that 
// (a) you leave this copyright notice intact, and 
// (b) if you use these functions on a publicly accessible
//     web site you include a credit somewhere on the web site 
//     with a link back to http://www.albionresearch.com/
//
// If you find or fix any bugs, please let us know at albionresearch.com
//
// SpecialThanks to Neelesh Thakur for being the first to
// report a bug in URLDecode() - now fixed 2003-02-19.
// And thanks to everyone else who has provided comments and suggestions.
// ====================================================================
function URLEncode( what )
{
	// The Javascript escape and unescape functions do not correspond
	// with what browsers actually do...
	var SAFECHARS = "0123456789" +					// Numeric
					"ABCDEFGHIJKLMNOPQRSTUVWXYZ" +	// Alphabetic
					"abcdefghijklmnopqrstuvwxyz" +
					"-_.!~*'()";					// RFC2396 Mark characters
	var HEX = "0123456789ABCDEF";

	var plaintext = what;
	var encoded = "";
	for (var i = 0; i < plaintext.length; i++ ) {
		var ch = plaintext.charAt(i);
	    if (ch == " ") {
		    encoded += "+";				// x-www-urlencoded, rather than %20
		} else if (SAFECHARS.indexOf(ch) != -1) {
		    encoded += ch;
		} else {
		    var charCode = ch.charCodeAt(0);
			if (charCode > 255) {
			    alert( "Unicode Character '" 
                        + ch
                        + "' cannot be encoded using standard URL encoding.\n" +
				          "(URL encoding only supports 8-bit characters.)\n" +
						  "A space (+) will be substituted." );
				encoded += "+";
			} else {
				encoded += "%";
				encoded += HEX.charAt((charCode >> 4) & 0xF);
				encoded += HEX.charAt(charCode & 0xF);
			}
		}
	} // for

	return encoded;
};

function URLDecode( what )
{
   // Replace + with ' '
   // Replace %xx with equivalent character
   // Put [ERROR] in output if %xx is invalid.
   var HEXCHARS = "0123456789ABCDEFabcdef"; 
   var encoded = what;
   var plaintext = "";
   var i = 0;
   while (i < encoded.length) {
       var ch = encoded.charAt(i);
	   if (ch == "+") {
	       plaintext += " ";
		   i++;
	   } else if (ch == "%") {
			if (i < (encoded.length-2) 
					&& HEXCHARS.indexOf(encoded.charAt(i+1)) != -1 
					&& HEXCHARS.indexOf(encoded.charAt(i+2)) != -1 ) {
				plaintext += unescape( encoded.substr(i,3) );
				i += 3;
			} else {
				alert( 'Bad escape combination near ...' + encoded.substr(i) );
				plaintext += "%[ERROR]";
				i++;
			}
		} else {
		   plaintext += ch;
		   i++;
		}
	} // while
   return plaintext;
};

function addClass(element, value) {
	if(!element.className) {
		element.className = value;
	} else {
		newClassName = element.className;
		newClassName+= " ";
		newClassName+= value;
		element.className = newClassName;
	}
}


