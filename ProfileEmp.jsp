<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.green.bean.Employee"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <!-- for collaps and expand -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
  
  
  <style>
  
  
  .dropbtn {
    background-color: #87ceeb;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #87ceeb;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color:#87ceeb;
}
  .jumbotron {
      background-color: #87ceeb;
      color: #fff;
      padding: 100px 25px;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #87ceeb;
      font-size: 50px;
  }
  .logo {
      color: #87ceeb;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #87ceeb;
  }
  .carousel-indicators li {
      border-color: #87ceeb;
  }
  .carousel-indicators li.active {
      background-color: #87ceeb;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel {
      border: 1px solid #87ceeb; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #87ceeb;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-heading {
      color: #fff !important;
      background-color:#00bfff!important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #87ceeb;
      color: #fff;
  }
  .navbar {
      margin-bottom: 0;
      background-color: #87ceeb;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 4px;
      border-radius: 0;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #87ceeb  !important;
      background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

     <%
			try {
				AnnotationConfiguration cfg = new AnnotationConfiguration();
				cfg.configure("hibernate.cfg.xml");
				SessionFactory factory = cfg.buildSessionFactory();
				Session session1 = factory.openSession();

				 HttpSession session2 = request.getSession(false);
				String eid = (String) session2.getAttribute("eid"); 
				
				//String email=request.getParameter("email");
				System.out.println("value of eid is:" + eid);

				//int eid1 = Integer.parseInt(eid);

				Employee e = new Employee();

				e = (Employee) session1.load(Employee.class, eid);
		%>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
<div class="collapse navbar-collapse" id="myNavbar">
     <a class="navbar-brand" href="#myPage" style="padding:0px;">
  <img src="logo.png" style="height:70%;" >
</a>
        <ul class="nav navbar-nav navbar-left">
 <li><a href="Profile.jsp">HOME</a></li>
</ul>
</div>

    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><div class="dropdown">
    <button class="dropbtn">Profile</button>
  <div class="dropdown-content">
    <a href="UpdateEmp.jsp?eid=<%-- <%=e.getEid()%> --%>">Update Details</a>
    <a href="ViewEmpProfile.jsp?eid=<%-- <%=e.getEid()%> --%>">View Details</a>
    <a href="#">Inventory</a>
  </div>  </div>   </li>
   <li><div class="dropdown">
   <button class="dropbtn"><span class="glyphicon glyphicon-user"></span>Your Account</button>

  <div class="dropdown-content">
    <a href="LogoutEmp">Log out</a>
    
  </div>  </div>   </li>
  
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">

  <h1> <a class=""style="padding:0px;">
  <img src="logo.png" style="height:-400%;" >
</a></h1>
  <p>Coming together for better solutions</p> 
<h2>Wellcome aboard!</h2>
</div>


     

<%
		session1.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</body>
</html>
