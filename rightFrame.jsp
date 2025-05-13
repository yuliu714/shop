<%@    page pageEncoding="UTF-8"
 import="org.DBBean"
 %>

  <body>
    <table border="1">
   <tr>
    <th width="30%" align="center">书名</td>
    <th width="30%" align="center">定价</td>
    <th width="30%" align="center">作者</td>    
    <th width="30%" align="center">求购</td>  
  </tr>   
 <% 
		String cp=request.getParameter("cp");//cp为分页数
		int currpage=(cp==null||cp=="")?1:Integer.parseInt(cp);
		
		String[][] ss=DBBean.getGoodList(currpage);
		for(int i=0;i<ss.length;i++)
		{
%>
  <tr>
    <td height="30%" align="center"><%= ss[i][0] %></td>
    <td height="30%" align="center"><%= ss[i][1] %></td>
    <td height="30%" align="center"><%= ss[i][2] %></td>
    <td height="30%" align="center"><a href="Buy.jsp?sid=<%= ss[i][0] %>&action=buy">购买</a></td>
  </tr>
<%			
		}
 
 
 %>       
    </table>
    
 <% 
   int tp=DBBean.getTotalPage();
   
   if(currpage!=1)
   {
   
  %>
  
  <a href="rightFrame.jsp?cp=<%=currpage-1%>"><<上一页</a> &nbsp;&nbsp;
  
  <%
   
   }
   
   if(currpage!=tp)
   {   
%>
  <a href="rightFrame.jsp?cp=<%=currpage+1%>">下一页>></a>
<%      
   } 
  %>   
    
   <form action="rightFrame.jsp" name="myform">
     <select name="cp" onchange="document.myform.submit()">
<% 
    for(int i=1;i<=tp;i++)
    {
%>
    <option value="<%=i%>" <%= (i==currpage)?"selected":"" %>>第<%=i%>页</option>
<%    
    }
 %>
     </select>
   </form>
    
    <hr/>
    <a target="_BLANK" href="Cart.jsp">查看购物车</a>
    <a target="_BLANK" href="reg.jsp">用户注册</a>
  </body>
