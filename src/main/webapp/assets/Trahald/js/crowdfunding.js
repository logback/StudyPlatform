/*!
 * jRaiser 2 Javascript Library
 * Yaolongfei - v1.0.0 (2015-07-28T17:30:00+0800)
 */
let path = (window.location+'').split('/');
let basePath = path[0]+'//'+path[2]+'/'+path[3];
let url1=basePath+"/personal/info";
let url2=basePath+"/personal/head";
let url4=basePath+"/personal/password";
$(document).ready(function(){
 
});
/**
 * 用于众筹个人中心左侧竖型菜单的动态样式切换
 * @method listClick
 * @for 无
 * @param {int} value 标记所点击的菜单
 * @return {null} 无
 */
function listClick(value){
	if(value == 1){
		$("#listClick_1").css("border-bottom","1px solid #C40521");
		$("#listClick_1").css("color","#C40521");
		$("#listClick_3").css("border-bottom","1px solid #CCC");
		$("#listClick_3").css("color","#666");
		$("#listClick_4").css("border-bottom","1px solid #CCC");
		$("#listClick_4").css("color","#666");
		
		$("#crowdfunding_iframe").attr("src",url1);
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","menu_list_on");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 2){
		$("#crowdfunding_iframe").attr("src",url2);
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","menu_list_on");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 4){
		$("#listClick_1").css("border-bottom","1px solid #CCC");
		$("#listClick_1").css("color","#666");
		$("#listClick_3").css("border-bottom","1px solid #CCC");
		$("#listClick_3").css("color","#666");
		$("#listClick_4").css("border-bottom","1px solid #C40521");
		$("#listClick_4").css("color","#C40521");
		
		$("#crowdfunding_iframe").attr("src",url4);
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","menu_list_on");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
}