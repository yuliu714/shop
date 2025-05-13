<%@ page pageEncoding="UTF-8"
 import="org.DBBean"
 %>

<jsp:useBean id="cart" scope="session" class="org.Cart"/>

     <title>购物车</title>

   <body>
      <%
 if(cart.isEmpty())
 {
 %>
  <font color="red" size="20">购物车中没有任何商品！！！</Font>
 <%
 }


 else
 {
 %>
 <h2>购物车</h2>
     <table border="1">
    <tr>
      <th width="27%" align="center">书名</td>
      <th width="27%" align="center">定价</td>
      <th width="27%" align="center">作者</td>
      <th width="27%" align="center">数量</td>
      <th width="27%" align="center">求购</td>
    </tr>
 <%
    String[][] ssa=cart.getCart();
    for(int i=0;i<ssa.length;i++)
    {
 %>
    <tr>
      <th height="30%" align="center"><%= ssa[i][0] %></td>
      <th height="30%" align="center"><%= ssa[i][1] %></td>
      <th height="30%" align="center"><%= ssa[i][2] %></td>
      <th>
       <form action="Buy.jsp" method="post">
         <input type="text" name="count" value="<%= ssa[i][3] %>">
         <input type="hidden" name="sid" value="<%= ssa[i][0] %>">
         <input type="hidden" name="action" value="gc">
       </form>
      </td>
      <th><a href="Buy.jsp?sid=<%= ssa[i][0] %>&action=del">删除</a></td>
    </tr>
 <%
    }
 %>
     </table>
     <br>
     <br>
     本订单总价为：<%= Math.round(cart.getTotal()*100)/100.0%>
 <%
 }
 %>
      </td>
      <br>
   <hr/>
   <a target="_BLANK" href="frame.jsp">继续购物</a>

   </body>