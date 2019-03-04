

let navs = [{
	"title" : "后台首页",
	"icon" : "icon-computer",
	"href" : " http://localhost:8080/StudyPlatform/start/backstage/firstPage",
	"spread" : false
},{
    "title" : "角色管理",
    "icon" : "&#xe61c;",
    "href" : "https://www.layui.com/",
    "spread" : false,
    "children" : [
        {
            "title" : "小白用户",
            "icon" : "&#xe631;",
            "href" : "http://localhost:8080/StudyPlatform/user/backstage/show",
            "spread" : false
        },
        {
            "title": "管理员",
            "icon": "&#xe631;",
            "href": "http://localhost:8080/StudyPlatform/admin/backstage/show",
            "spread": false
        }]
},{
    "title" : "视频管理",
    "icon" : "&#xe61c;",
    "href" : "http://localhost:8080/StudyPlatform/start/videoManage",
    "spread" : false

},{
	"title" : "权限管理",
	"icon" : "&#xe631;",
	"href" : "http://localhost:8080/StudyPlatform/word/wordPage",
	"spread" : false,
    "children" : [
        {
            "title" : "角色列表",
            "icon" : "&#xe631;",
            "href" : "http://localhost:8080/StudyPlatform/role/list",
            "spread" : false
        },
        {
            "title" : "角色分配",
            "icon" : "&#xe631;",
            "href" : "http://localhost:8080/StudyPlatform/role/assign",
            "spread" : false
        },
        {
            "title" : "权限列表",
            "icon" : "&#xe631;",
            "href" : "http://localhost:8080/StudyPlatform/role/permission",
            "spread" : false
        },
        {
            "title" : "权限分配",
            "icon" : "&#xe631;",
            "href" : "http://localhost:8080/StudyPlatform/role/permissionAssign",
            "spread" : false
        }
    ]
},{
	"title" : "词库管理",
	"icon" : "&#xe61c;",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "词汇管理",
			"icon" : "&#xe631;",
			"href" : "http://localhost:8080/StudyPlatform/word/wordPage",
			"spread" : false
		},
		{
			"title" : "句子管理",
			"icon" : "&#xe631;",
			"href" : "http://localhost:8080/StudyPlatform/word/sentencePage",
			"spread" : false
		}
	]
},{
    "title" : "Druid监控",
    "icon" : "&#xe61c;",
    "href" : "http://127.0.0.1:8080/StudyPlatform/druid/datasource.html",
    "spread" : false
}];