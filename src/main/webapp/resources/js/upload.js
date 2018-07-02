function checkImageType(fileName) {
	var pattern = /jpg$|gif$|png$|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	
	var fileName,imgsrc,getLink;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc="/ex/displayFile?fileName="+fullName;
		fileLink=fullName.substr(14);
		
		var front = fullName.substr(0,12);
		var end = fullName.substr(14);
		getLink = "/ex/displayFile?fileName="+front+end;
	}
	else{
		imgsrc="/resources/images/fileiconicon.jpg";
		fileLink = fullName.substr(12);
		getLink = "/ex/displayFile?fileName="+fullName;
		
	}
	fileName=fileLink.substr(fileLink.indexOf("_")+1);
	return {fileName:fileName,imgsrc:imgsrc,getLink:getLink,fullName:fullName};
}
/*function fileCheck(fileSize,html){
	var maxSize  = 5*1024*1024; 
	
    if(fileSize<maxSize)
    {
    	$(".uploadedList").append(html);
    }else{
    	console.log("체크하고있다.",maxSize);
    	alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
    	return ;
}
}
*/