<%@ page import="GameOption.GameOptions" %>
<%@ page import="GameOption.GamesSingleton" %>
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
    <style>
        html{
            background-color:grey;
        }
        .wrapper{
        }
        td{
            width:70px;
            height:70px;
            border:3px solid black;
        }
        table{
            background:white;
            margin:auto;
            margin-top:150px;
            border:5px solid black;
            border-radius:12px;
        }
        h2{
            padding:20px;
        }
        .login1{
            float:left;
        }
        .login2{
            float:right;
        }
        .result{
            text-align:center;
        }

    </style>
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
<%
    GameOptions game = GamesSingleton.games.get(sessionUrl);
    if  (game.getCurrentPlayerName().equals(userName))
    {      %>
        <form action="gamecontroller" method="post" id="requestMyTurn">
            <input type="hidden" name="name" value="<%=userName%>">
            <input type="hidden" name="sessionUrl" value="<%=sessionUrl%>">
            <input type="text" name="kor1">
            <input type="text" name="kor2">
            <input type="submit" value="join">
        </form>
<%    }
    else
    {      %>
        <form action="gamecontroller" method="post" id="requestMyTurn">
            <input type="hidden" name="name" value="<%=userName%>">
            <input type="hidden" name="sessionUrl" value="<%=sessionUrl%>">
        </form>
<script type="text/javascript">setInterval("document.getElementsByTagName('form')[0].submit()", 3000);</script>

<%    }
            %>
    <%
        char [][] gameMatrix = game.getGameBoard();
    %>
    <table cellspacing="0">
        <tr>
            <td> <%=gameMatrix[0][0]%> </td><td><%=gameMatrix[1][0]%></td><td><%=gameMatrix[2][0]%></td>
        </tr>
        <tr>
            <td><%=gameMatrix[0][1]%></td><td><%=gameMatrix[1][1]%></td><td><%=gameMatrix[2][1]%></td>
        </tr>
        <tr>
            <td><%=gameMatrix[0][2]%></td><td><%=gameMatrix[1][2]%></td><td><%=gameMatrix[2][2]%></td>
        </tr>

    </table>


</body>
</html>