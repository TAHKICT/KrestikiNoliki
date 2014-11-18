<%--
  Created by IntelliJ IDEA.
  User: админ
  Date: 16.11.14
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        //allow access only if session exists
        String user = null;
        if(session.getAttribute("user") == null){
            response.sendRedirect("index.html");
        }else user = (String) session.getAttribute("user");
        String userName = null;
        String sessionID = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("user")) userName = cookie.getValue();
            }
        }
    %>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script>
        setInterval(getAccess,1000);
        print('<div>Print this after the script tag</div>');
        function getAccess() {
            print('<div>Print this after the script tag</div>');
            $.ajax({
                type: "GET",
                url: "localhost:8080/gamecontroller",
                data: sessionUrl=window.location.pathname&name=<%=userName%>&kor1=1&kor2=2,
                    success: function(response){
            }
        });
        }
    </script>
    <script>
        alert('we are the champions');
        ("GET","gamecontroller?sessionUrl=window.location.pathname&name=<%=userName%>&kor1=1&kor2=2", true);

        var xmlHttpRequest = getXMLHttpRequest();
        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
        xmlHttpRequest.open("GET","gamecontroller?sessionUrl=window.location.pathname&name=<%=userName%>&kor1=1&kor2=2", true);
        xmlHttpRequest.setRequestHeader("Content-Type",
                "application/x-www-form-urlencoded");
        xmlHttpRequest.send(null);
    </script>

    <title></title>
</head>
<body>

Hi <%=userName%>, ok
<form action="gamecontroller" method="post">
    <input type="text" name="name">
    <input type="text" name="sessionUrl">
    <input type="text" name="kor1">
    <input type="text" name="kor2">
   <input type="submit" value="join">
</form>

</body>
</html>