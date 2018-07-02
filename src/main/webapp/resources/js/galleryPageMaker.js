
function galleryPm(page, uploadCnt) {
	console.log("giarasddassd");
    var uploadCnt = uploadCnt || 1;
    var page = page || 1;

    var end = Math.ceil(uploadCnt / 10.0);
    var start = 1;
    
    var stri = "";
    
    stri+="<div id ='goLeft'>◀</div>";
stri+="<li>"+page+" - "+end+"</li>";
/*    if (prev) {
        stri += "<li><a href = '" + (start - 1) + "'> << </a></li>";
    }
    for (var i = start, len = end; i <= len; i++) {
        var strClass = page == i ? ' class=active' : '';
        stri += "<li " + strClass + "><a href = '" + i + "'>" + i + " </a></li>";
    }
    if (next) {
        stri += "<li><a href = '" + (end + 1) + "'> >> </a></li>"
    }*/
    stri += "<div id='goRight'>▶</div>";
    	
    
    	console.log("str====="+stri);
    $('.pagination').html(stri);
    
    return end;
}
