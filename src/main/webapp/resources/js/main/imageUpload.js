upload = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {

	const MAX_EACH_FILE_SIZE = 5 * 1024 * 1024;		//	5M
	const MAX_TOTAL_FILE_SIZE = 25 * 1024 * 1024;	//	25M
	const MAX_TOTAL_FILE_NUMBER = 5;				//	5

	function kbToMb(bytes) {
	    var e = Math.floor(Math.log(bytes)/Math.log(1024));

	    if(e == "-Infinity") return 0;
	    else return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2).slice(0, -3);
	}
			
	checkUploadedTotalFileNumber = function(obj, allowedMaxTotalFileNumber, fileCount) {
		if(allowedMaxTotalFileNumber < fileCount){
			alert("전체 파일 갯수는 "+ allowedMaxTotalFileNumber +"개 까지 허용됩니다.");
//			$("#file"+seq).val("");
//			obj.val("");
			return false;
		}
	}
 

	checkUploadedExt = function(objName, seq, div) {
		var ext = objName.split('.').pop().toLowerCase();
		var extArray = eval("extArray" + div);
		
		if(extArray.indexOf(ext) == -1) {
			alert("허용된 확장자가 아닙니다.");
//			$("#file"+seq).val("");
			return false;
		}
	}


	checkUploadedEachFileSize = function(obj, seq, allowedEachFileSize) {

		if(obj.size > allowedEachFileSize){
			alert("각 첨부 파일 사이즈는 "+kbToMb(allowedEachFileSize)+"MB 이내로 등록 가능합니다.");
			$("#file"+seq).val("");
			return false;
		}
	}


	checkUploadedTotalFileSize = function(seq, totalSize, allowedTotalFileSize) {
		if(totalSize > allowedTotalFileSize){
			alert("전체 용량은 "+kbToMb(allowedTotalFileSize)+"M를 넘을 수 없습니다.");
			$("#file"+seq).val("");
			return false;
		}
	}

//	objName 과 seq 는 jsp 내에서 유일 하여야 함.
//	memberProfileImage: 1
//	memberImage: 2
//	memberFile : 3
			
	var extArray1 = new Array();
	extArray1 = ["jpg","gif","png","jpeg","bmp","tif","jfif"];
	
	var extArray2 = new Array();
	extArray2 = ["txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];
	
	var totalFileSize = 0;
	var obj = $("#" + objName +"")[0].files;	
	var fileCount = obj.length;
	
	allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
	allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
	allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
	
	if(checkUploadedTotalFileNumber(obj, allowedMaxTotalFileNumber, fileCount) == false) { return false; } 
	alert("총 " + fileCount + "개 파일을 선택하셨습니다.")

	for (var i = 0 ; i < fileCount ; i++) {
		if(checkUploadedExt($("#" + objName +"")[0].files[i].name, seq, allowedExtdiv) == false) { return false; }
		if(checkUploadedEachFileSize($("#" + objName +"")[0].files[i], seq, allowedEachFileSize) == false) { return false; }

		totalFileSize += $("#" + objName +"")[0].files[i].size;
	}

	if(checkUploadedTotalFileSize(seq, totalFileSize, allowedTotalFileSize) == false) { return false; }
	
	if (uiType == 1) {
		$("#ulFile" + seq).children().remove();
		
		for (var i = 0 ; i < fileCount ; i++) {
			addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
		}
	} else if(uiType == 2) {
		$("#ulFile" + seq).children().remove();
		
		for (var i = 0 ; i < fileCount ; i++) {
			addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
		}
	} else if (uiType == 3) {
		var fileReader = new FileReader();
		 fileReader.readAsDataURL($("#" + objName +"")[0].files[0]);
		
		 fileReader.onload = function () {
			 $("#imgProfile").attr("src", fileReader.result);		
		 }		
	} else {
		return false;
	}
	return false;
}

addEventListenerCustom = function (objName, type, i, file, filePreview, maxNumber) { 
	return function(event) {
		var imageFile = event.target;
		var sort = parseInt(maxNumber) + i;

		var divImage = "";
		divImage += '<div id="imgDiv_'+type+'_'+ sort +'" style="display: inline-block; height: 95px;">';
		divImage += '	<img src="'+ imageFile.result +'" class="rounded" width= "85px" height="85px">';
		divImage += '	<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv(0,' + type +','+ sort +')">X</span></div>';
		divImage += '</div> ';
		
		filePreview.append(divImage);
    };
}


delImgDiv = function(objName, type, sort, deleteSeq, pathFile) {
	
	$("#imgDiv_"+type+"_"+sort).remove();
	
	var objDeleteSeq = $('input[name='+ objName +'DeleteSeq]');
	var objDeletePathFile = $('input[name='+ objName +'DeletePathFile]');

	if(objDeleteSeq.val() == "") {
		objDeleteSeq.val(deleteSeq);
	} else {
		objDeleteSeq.val(objDeleteSeq.val() + "," + deleteSeq);
	}
	
	if(objDeletePathFile.val() == "") {
		objDeletePathFile.val(pathFile);
	} else {
		objDeletePathFile.val(objDeletePathFile.val() + "," + pathFile);
	}
}


addUploadLi = function (objName, type, i, name, filePreview, maxNumber){

	var sort = parseInt(maxNumber) + i;
	
	var li ="";
	li += '<input type="hidden" id="'+ objName +'Process_'+type+'_'+ sort +'" name="'+ objName +'Process" value="1">';
	li += '<input type="hidden" id="'+ objName +'Sort_'+type+'_'+ sort +'" name="'+ objName +'Sort" value="'+ sort +'">';
	li += '<li id="li_'+type+'_'+sort+'" class="list-group-item d-flex justify-content-between align-items-center">';
	li += name;
	li +='<span class="badge bg-danger rounded-pill" onClick="delLi(0,'+ type +','+ sort +')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
	li +='</li>';
	
	filePreview.append(li);
}