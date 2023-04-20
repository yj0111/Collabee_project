	function getJsonDivision(categoryNum) {
    	
		$.ajax("../collections/getJsonDivision.do", {
			type: "get",
			data: {
				categoryNum:categoryNum
			},
			contentType: "application/json",
			dataType: "json",
			success: function(data){
				
				let dispHtml = "";
				for (let divisionVO of data) {
					dispHtml += "<a href='../collections/categories.do?divisionNum="+divisionVO.divisionNum+"&categoryNum="+divisionVO.categoryNum+"' class='list-group-item list-group-item-action category-list'>";
					dispHtml += divisionVO.division;
					dispHtml += "</a>";
				}
				
				$("#sub-category").html(dispHtml);
				
			},
			error: function(){
				alert("실패!~~");
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		}); 
	}
    
    $(function(){
        $("#category-box").mouseleave(function(){
            $("#sub-category-box").css("display", "none");
        });
        $(".category-list").mouseover(function(){
            $("#sub-category-box").css("width", "250px");
            $("#sub-category-box").css("display", "block");
            getJsonDivision(Number(this.name));
        });
        
        
    });
    
    // 버튼 클릭 시 맨 위로 이동
	$().ready(function(){
    	$("#moveTopBtn").click(function(){
   	  		window.scrollTo({ top: 0, behavior: "smooth" });  
    	});
	});
    


