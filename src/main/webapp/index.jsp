<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script>
        $(function () {
            // 发送ajax请求，加载所有省份数据
            $.get("provinceServlet", function (data) {
                //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]
                //1.获取select
                var province = $("#province");
                //2.遍历json数组
                $(data).each(function () {
                    //3.创建<option>
                    var option = "<option value='" + this.id + "'>" + this.name + "</option>";
                    //4.调用select的append追加option
                    province.append(option);
                });
            });
        });

        function provinceChange() {
            var id = $("#province option:selected").val();
            var params = {"id": id};
            $("#city").html('<option>--请选择城市--</option>');
            $("#city").show();
            $.get("cityServlet", params,function (data) {
                //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]
                //1.获取select
                var city = $("#city");
                //2.遍历json数组
                $(data).each(function () {
                    //3.创建<option>
                    var option = "<option value='" + this.id + "'>" + this.name + "</option>";
                    //4.调用select的append追加option
                    city.append(option);
                });
            });
        }

        function cityChange() {

            var id = $("#city option:selected").val();
            var params = {"id": id};
            $("#county").html('<option>--请选择县或区--</option>');
            $("#county").show();
            $.get("countyServlet", params,function (data) {
                //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]
                //1.获取select
                var county = $("#county");
                //2.遍历json数组

                $(data).each(function () {
                    //3.创建<option>
                    var option = "<option value='" + this.id + "'>" + this.name + "</option>";
                    //4.调用select的append追加option
                    county.append(option);
                });
            });
        }
    </script>
</head>
<body>
<select id="province" onchange="provinceChange()">
    <option>--请选择省份--</option>
</select>
<select id="city" onchange="cityChange()" hidden>
    <option>--请选择城市--</option>
</select>
<select id="county" hidden>
    <option>--请选择县或区--</option>
</select>
</body>
</html>