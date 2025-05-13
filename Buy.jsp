<jsp:useBean id="cart" scope="session" class="org.Cart"/>

<% 
  String action=request.getParameter("action");
  if(action==null)
  {
  %>
   <jsp:forward page="rightFrame.jsp"/>
  <%  
  }
  else if(action.trim().equals("buy"))
  {
     String sid=request.getParameter("sid");
     cart.add(sid.trim());   
 %>
  <jsp:forward page="rightFrame.jsp"/>
 <%
  }
  else if(action.trim().equals("gc"))
  {
     String sid=request.getParameter("sid");
     String count=request.getParameter("count");
     cart.setCount(Integer.parseInt(count),sid);
  %>
    <jsp:forward page="Cart.jsp"/>
  <%      
  }
  else if(action.trim().equals("del"))
  {
     String sid=request.getParameter("sid");
     cart.deleteFromCart(sid);
  %>
    <jsp:forward page="Cart.jsp"/>
  <%
  }
  %>
 
