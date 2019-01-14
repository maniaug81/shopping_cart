<%@ page import="java.util.*" %>
<form name=cart action=updatecart.jsp method=post>
<table border=1>
<tr>
<td>Cart</td>
</tr>
<tr><th>Item</th><th>Price</th><th>Quantity</th><th>Update</th><th>Delete</th><th>Total</th></tr>
<tr>
<td>
<%
out.println("cart.jsp Session variable username is = " + session.getAttribute("user"));
Hashtable h = new Hashtable();
//h.put(1,"t");
if(session.getAttribute("cart")!=null)
{
	h=(Hashtable)session.getAttribute("cart");
	Enumeration e = h.keys();
	Object next;
	int total=0;
	while(e.hasMoreElements())
	{
		next = e.nextElement();
		String str = (String)h.get(next);
		String []arr = str.split(",");
		int subTotal = Integer.parseInt(arr[0]) * Integer.parseInt(arr[1]);
		total+=subTotal;
		out.println("<tr><td>" + next + " </td><td>" + arr[0] +"</td><td><input type=text name=quantity value="+arr[1]+" maxlength=3 size=3></td>");
		out.println("<td><input type=submit name=update value=Update></td>");
		out.println("<td><input type=submit name=delete value=Delete></td>");
		out.println("<td>"+subTotal+"</td></tr>");
	}
	out.println("<tr><td></td><td></td><td></td><td></td><td></td><td>"+total+"</td></tr>");
}
%>
<tr>
<td>
<input type=submit name=checkout value="Proceed to checkout">
<input type=submit name=clearcart value="Clear Cart">

</td>
</tr>
</table>
</form>