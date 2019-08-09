/**
 * 
 */

//delete
function delRoom(obj){
	var row=obj.parentNode.parentNode.parentNode.parentNode;
	var roomID=row.cells[2].innerText;
	if(window.confirm("您确定要删除"+roomID+"吗？")){ 
		location.href="DelRoomServlet?roomID="+roomID;
	}
}

function delType(obj){
	var row=obj.parentNode.parentNode.parentNode.parentNode;
	var typeid=row.cells[1].innerText;
	if(window.confirm("您确定要删除"+typeid+"吗？")){ 
		location.href="DelTypeServlet?typeid="+typeid;
	}
}

function delOrder(obj){
	var row=obj.parentNode.parentNode.parentNode.parentNode;
	var orderid=row.cells[1].innerText;
	if(window.confirm("您确定要删除"+orderid+"吗？")){ 
		location.href="DelOrderServlet?orderid="+orderid;
	}
}
function delAlbum(obj){
	if(window.confirm("您确定要删除相册"+obj+"，还有其全部图片吗？")){ 
		   location.href="DelRoomAlbumServlet?aid="+obj;
		}
}

function delUser(obj){	
	var row=obj.parentNode.parentNode.parentNode.parentNode;
	var uname=row.cells[2].innerText;
	if(window.confirm("您确定要删除"+uname+"吗？")){ 
		//location.href="manager.jsp";
		location.href="DelUserServlet?uname="+uname;
	}	
}

function delPhoto(obj){
	if(window.confirm("您确定要删除图片"+obj+"吗？")){ 
	   location.href="DelPhotoServlet?pid="+obj;
	}
}


//edit
function editRoom(obj){	
	var row=obj.parentNode.parentNode.parentNode.parentNode;
	var i=row.cells[1].innerText;	
	var roomID=row.cells[2].innerText;
	document.form1.roomID.value=roomID;
	//var roomType=row.cells[3].innerText;
	//document.form1.roomType.value=roomType; 
	var roomName=row.cells[4].innerText;
	document.form1.roomName.value=roomName;
	//获取当前jsp页面中的房间状态
	//var value=document.getElementsByName("roomStatus")[i].value;		
	//循环获取对对应的节点，直到两者相等，退出循环
	/*var typeid=document.getElementById("selectType");
	for(var i=0;i<typeid.options.length;i++){
		if(typeid.options[i].text==roomType){
			alert(typeid.options.length+typeid.options[i].text);
			typeid.options[i].selected=true;
			isExit=true;
			break;
		}
	}*/

	//var id=document.getElementById("selectStatus");	//定位id

}

function editType(obj){	
	var row=obj.parentNode.parentNode.parentNode.parentNode;
	var typeid=row.cells[1].innerText;	
	document.form1.typeid.value=typeid;
	var rtype=row.cells[2].innerText;
	document.form1.rtype.value=rtype;
	var rprice=row.cells[3].innerText;
	document.form1.rprice.value=rprice; 
	var rtotal=row.cells[4].innerText;
	document.form1.rtotal.value=rtotal;
	var rdescription=row.cells[6].innerText;
	document.form1.rdescription.value=rdescription;
	var rphoto=row.cells[7].innerText;
	document.form1.rphoto.value=rphoto;
}
//替换某个房间类型的图片（rphoto）
function editTphoto(obj){
	
	var row=obj.parentNode.parentNode;
	var typeid=row.cells[1].innerText;	
	var rphoto=row.cells[7].innerText;
	if(window.confirm("您确定要替换编号"+typeid+"的图片"+rphoto+"吗？")){ 		
		document.pform.rtypeid.value=typeid;
    }
	else{
		 location.href="room-classify.jsp";
	}
}

function editUser(obj,r){	
	
	var row=obj.parentNode.parentNode.parentNode.parentNode;
	var role=row.cells[8].innerText;
	if(role=="超级管理员"&&r==1){
		alert("权限不足！！");
		location.href="user-list.jsp";
	}
	else{
		var i=row.cells[1].innerText;	
		var uname=row.cells[2].innerText;
		document.form1.uname.value=uname;
		
		var upwd=row.cells[3].innerText;
		document.form1.upwd.value=upwd; 
		
		var relName=row.cells[4].innerText;
		document.form1.relName.value=relName;
		
		//var gender=row.cells[5].innerText;
		//document.form1.gender.value=gender;
		
		var telNum=row.cells[6].innerText;
		document.form1.telNum.value=telNum;
		
		var email=row.cells[7].innerText;
		document.form1.email.value=email;	
	}
}

function  editAlbum(obj){
	
	//var aname=document.getElementById("aname");
	alert(obj);
	document.afrom.aid.value=obj;
	/*document.aform.a_name.value=obj1;*/
}



//按类型搜索房间
function search(obj){
	
	var selectSearch=document.getElementById("selectSearch");
	var index=selectSearch.selectedIndex;
	var text=selectSearch.options[index].text;
	var value=selectSearch.options[index].value;
	//alert(text+value);
	if(value=="all"){
		location.href="RoomListServlet?n=1";//n=1表示列出所有房间
	}else{
		 location.href="SearchRoomServlet?type="+value;
	}
}
  //按角色搜索用户
	function searchUserByRole(){
		
		var selectSearch=document.getElementById("selectRole");
		var index=selectSearch.selectedIndex;
		var text=selectSearch.options[index].text;
		var value=selectSearch.options[index].value;
		//alert(text+value);	
	    location.href="UserListServlet?r="+value;
		
	}
	
	//上传图片时，需要将aid传到jsp页面的弹框中
	function upPhoto(obj){
		alert(obj);
		document.pform.aid1.value=obj;
	}
	//显示某个相册的全部图片的DIV（plist）
	function displayPlist(obj){	
		location.href="PhotoListServlet?aid="+obj;
	}
	
