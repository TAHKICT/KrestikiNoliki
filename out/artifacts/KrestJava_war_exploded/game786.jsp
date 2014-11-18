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
    <script>
    function post(path, params, method) {
    method = "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
    if(params.hasOwnProperty(key)) {
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", key);
    hiddenField.setAttribute("value", params[key]);

    form.appendChild(hiddenField);
    }
    }

    document.body.appendChild(form);
    form.submit();
    }

        document.forms["requestFORM"].submit();

    </script>

    <%
        //allow access only if session exists
        String user = null;
        if(session.getAttribute("user") == null){
            response.sendRedirect("index.html");
        }else user = (String) session.getAttribute("user");
        String userName = null;
        String sessionUrl = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("user")) userName = cookie.getValue();
                if(cookie.getName().equals("url")) sessionUrl = cookie.getValue();
            }
        }
    %>

    <title></title>
</head>
<body>

Hi <%=userName%>, ok
<form action="gamecontroller" method="post" id="requestFORM">
    <input type="hidden" name="name" value="<%=userName%>">
    <input type="hidden" name="sessionUrl" value="<%=sessionUrl%>">
</form>
<script type="text/javascript">setInterval("document.getElementsByTagName('form')[0].submit()", 3000);</script>

</body>
</html>