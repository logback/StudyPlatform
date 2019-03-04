
let path = (window.location+'').split('/');
let basePath = path[0]+'//'+path[2]+'/'+path[3];
let url1=basePath+"/personal/info";
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
var win = window.opener; // 表示打开本window的那个页面的window 
function listClick(value){
	if(value == 1){
        $("#crowdfunding_iframe", window.parent.document).attr("src",url1);
        $("#crowdfunding_iframe", window.parent.document).attr("height",1045);
        $("#listClick1", window.parent.document).attr("class","menu_list_on");
        $("#listClick3", window.parent.document).attr("class","");
        $("#listClick4", window.parent.document).attr("class","");
    }
	if(value == 4){
		$("#crowdfunding_iframe", window.parent.document).attr("src",url4);
		$("#crowdfunding_iframe", window.parent.document).attr("height",1045);
		$("#listClick1", window.parent.document).attr("class","");
		$("#listClick3", window.parent.document).attr("class","");
		$("#listClick4", window.parent.document).attr("class","menu_list_on");
	}
}