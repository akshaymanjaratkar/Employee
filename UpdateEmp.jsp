<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.green.bean.Employee"%>
<%@page import= "javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
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
<body >

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" style="padding:0px;">
  <img src="logo.png" style="height:100%;" >
</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
  
     
              <li><div class="dropdown">
  <button class="dropbtn"><span class="glyphicon glyphicon-user"></span> Your Account</button>
  <div class="dropdown-content">
    <a href="#">Link 1</a>
    <a href="LogoutEmp">Log out</a>
    
  </div>  </div>   </li>
      </ul>
      
    </div>
    
    
   
    
  </div>
  
</nav>
<%
			try {
				AnnotationConfiguration cfg = new AnnotationConfiguration();
				cfg.configure("hibernate.cfg.xml");
				SessionFactory factory = cfg.buildSessionFactory();
				Session session1 = factory.openSession();
/* String eid=request.getParameter("eid"); */
				 HttpSession session2 = request.getSession(false);
				String eid = (String) session2.getAttribute("eid");
				System.out.println("value of eid is:" + eid); 

				//int eid1 = Integer.parseInt(eid);

				Employee e = new Employee();

				e = (Employee) session1.load(Employee.class, eid);
		%>
		
<div class="container">
         <form role="form" method="POST" action="UpdateEmp">
        
        <legend>Personal  Details</legend>
        <div class="row">
            
           <div class=" form-group col-md-6 ">
 

                    <fieldset>
                        

                        <div class="form-group col-md-12">
                            <label for="first_name">Employee-Id</label>
                            <input type="text" class="form-control" name="eid" value="<%=e.getEid()%>" readonly placeholder="Enter Emp ID">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="fname">First name</label>
                            <input type="text" class="form-control" name="fname"  value="<%=e.getFname()%>">
                        </div>
                         <div class="form-group col-md-6">
                            <label for="mlname">Middle name</label>
                            <input type="text" class="form-control" name="mname" value="<%=e.getMname()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="lname">Last name</label>
                            <input type="text" class="form-control" name="lname" value="<%=e.getLname()%>">
                        </div>
                         <div class="form-group col-md-6">
                            <label for="mothername">Mother name</label>
                            <input type="text" class="form-control" name="mothername" value="<%=e.getMothername()%>">
                        </div>


                    </fieldset>

                   </div>
  <div class=" form-group col-md-6 ">


                   

                    <fieldset>
                   

                        <div class="form-group col-md-6">
                            <label for="first_name">Aadhar NO:</label>
                            <input type="number" class="form-control" name="aadharn" value="<%=e.getAadharn()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="last_name">Pan NO:</label>
                            <input type="text" class="form-control" name="pann" id="" value="<%=e.getPann()%>">
                        </div>

                       <div class="form-group col-md-6">
                            <label for="first_name">Passport NO:</label>
                            <input type="text" class="form-control" name="passn" id="" value="<%=e.getPassn()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="last_name">Date Of Birth:</label>
                            <input type="date" class="form-control" name="dob" id="" value="<%=e.getDob()%>">
                        </div>

                       <div class="form-group col-md-6">
                            <label for="last_name">Blood Group:</label>
                            <input type="text" class="form-control" name="bloodg" value="<%=e.getBloodg()%>">
                        </div>
                       






                    </fieldset>

                   </div>
           </div>
           
           
           
           <legend>Educational Details</legend>
            <div class="row">
           <div class=" form-group col-md-6 ">
  <!-- <div data-role="collapsible">
      <h1>SSC</h1> -->
      <legend>SSC</legend>
                    <fieldset>
                       <div class="form-group col-md-6">
                            <label for="first_name">Board Name</label>
                            <input type="text" class="form-control" name="sun"  value="<%=e.getSun()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="last_name">Year Of Pass</label>
                            <input type="text" class="form-control" name="syop" id="" value="<%=e.getSyop()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="">Percentage</label>
                            <input type="number" class="form-control" name="smarks" id="" value="<%=e.getSmarks()%>">
                        </div>
  </fieldset>
</div>
                   <!-- </div> -->
  <div class=" form-group col-md-6 ">

<!--  <div data-role="main" class="ui-content">
    <div data-role="collapsible">
      <h1>GRADUATION</h1> -->
      <legend>GRADUATION</legend>
                    <fieldset>
                         


                        <div class="form-group col-md-6">
                            <label for="first_name">University Name</label>
                            <input type="text" class="form-control" name="uun"  value="<%=e.getUun()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="last_name">Year Of Pass</label>
                            <input type="text" class="form-control" name="uyop" id="" value="<%=e.getUyop()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="">Percentage</label>
                            <input type="number" class="form-control" name="umarks" id="" value="<%=e.getUmarks()%>">
                        </div>
  </fieldset>

                   </div>
           </div>
           
          
            <div class="row"> 
           <div class=" form-group col-md-6 ">
 
   <!--  <div data-role="collapsible">
      <h1>HSC</h1> -->
       <legend>HSC</legend>
                    <fieldset>
                        
                      

                        <div class="form-group col-md-6">
                            <label for="first_name">Board Name</label>
                            <input type="text" class="form-control" name="hun"  value="<%=e.getHun()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="last_name">Year Of Pass</label>
                            <input type="text" class="form-control" name="hyop" id="" value="<%=e.getHyop()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="">Percentage</label>
                            <input type="number" class="form-control" name="hmarks" id="" value="<%=e.getHmarks()%>">
                        </div>






                    </fieldset>
</div>
                   <!-- </div> -->
  <div class=" form-group col-md-6 ">


                   

   <!--  <div data-role="collapsible">
      <h1>POST GRADUATION(If apllicable)</h1>  -->
                   
                    <legend>POST GRADUATION(if aplicable)</legend>
                    <fieldset>
                  

                        <div class="form-group col-md-6">
                            <label for="first_name">University Name</label>
                            <input type="text" class="form-control" name="pun"  value="<%=e.getPun()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="last_name">Year Of Pass</label>
                            <input type="text" class="form-control" name="pyop" id="" value="<%=e.getPyop()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="">Percentage</label>
                            <input type="number" class="form-control" name="pmarks" id="" value="<%=e.getPmarks()%>">
                        </div>






                    </fieldset>
</div>
                   </div>
           
           
          
 
     <legend>JOB Details</legend>      
           <div class="row">
       <div class=" form-group col-md-6 ">    
 <p><label class="checkbox-inline">Fresher <input type="checkbox">
 
</label>

<label class="checkbox-inline">Experience
  <input type="checkbox"  id="myCheck"  onclick="myFunction()">
  
</label> </p><p>   <br></br>                                                                                        

</p>    
 


  <fieldset  id="text" style="display:none">
                      <div class="form-group col-md-12">
                            <label for="first_name">Previous Company Name</label>
                            <input type="text" class="form-control" name="prevcn" id="" value="<%=e.getPrevcn()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="last_name">Previous Salary</label>
                            <input type="text" class="form-control" name="prevsal" id="" value="<%=e.getPrevsal()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="">Year Of Exp</label>
                            <input type="text" class="form-control" name="yoexp" id="" value="<%=e.getYoexp()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="date">Date Of Join</label>
                            <input type="date" class="form-control" name="dojoin"  value="<%=e.getDojoin()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="date">Date Of Leave</label>
                            <input type="date" class="form-control" name="doleave"  value="<%=e.getDoleave()%>">
                        </div>
</fieldset>

                   </div>
  <div class=" form-group col-md-6 ">


            <legend> New Company Details</legend>       

                    <fieldset>
                   

                        <div class="form-group col-md-12">
                            <label for="first_name">Company Name</label>
                            <input type="text" class="form-control" name="cname" value="<%=e.getCname()%>"readonly>
                        </div>
                        
                        
                        <div class="form-group col-md-6">
                            <label for="">Date Of Join</label>
                            <input type="date" class="form-control" name="doj" value="<%=e.getDoj()%>"readonly>
                        </div>
              
    <!-- <div data-role="collapsible">
      <h1>Salary breakup</h1> -->
                        <div class="form-group col-md-6">
                            <label for="">Besic Salary</label>
                            <input type="text" class="form-control" name="basic" placeholder="Enter Besic Salary" id="weight1" onblur="calculateForm();" value="<%=e.getBasic()%>"readonly>
                        </div>
                        
                        
                        <div class="form-group col-md-6">
                            <label for="">HRA</label>
                            <input type="text" class="form-control" name="hra"  placeholder="Enter HRA" id="weight2" onblur="calculateForm();" value="<%=e.getHra()%>"readonly>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="">EWW</label>
                            <input type="text" class="form-control" name="eww" placeholder="Enter EWW" id="weight3" onblur="calculateForm();" value="<%=e.getEww()%>"readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="">Total</label>
                            <input type="text" class="form-control" name="totalsal"   id="weightTotal" value="<%=e.getTotalsal()%>"readonly>
                        </div>
<!-- </div> -->  <div class="form-group col-md-12">
                            <label for="date">Designation</label>
                            <input type="text" class="form-control" name="destination" value="<%=e.getDestination()%>">
                        </div>

                       </fieldset>

                   </div>
           </div>
           
           <legend>CONTACT Details</legend>      
           <div class="row">
            
           <div class=" form-group col-md-6 ">
 
 
                    <fieldset>
                        

                        <div class="form-group col-md-12">
							<label for="">current Address</label>
							<textarea     class="form-control"
								value="<%=e.getCaddress()%>" name="caddress" ></textarea>
						</div>

                        <div class="form-group col-md-12">
							<label for="">Permanant Address</label>
							<textarea     class="form-control"
								value="<%=e.getPaddress()%>" name="paddress" ></textarea>
						</div>

                        <div class="form-group col-md-6">
                            <label for="">Mobile No.</label>
                            <input type="text" class="form-control" name="mnumber" id="" value="<%=e.getMnumber()%>">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="date">Land Line No.</label>
                            <input type="text" class="form-control" name="lnumber" id="" value="<%=e.getLnumber()%>">
                        </div>

                        <div class="form-group col-md-12">
                            <label >Email (if you want to change Email please contact your HR)</label>
                            <input type="email" class="form-control" name="email" id="" value="<%=e.getEmail()%>" readonly>
                        </div>

                            



                    </fieldset>

                   </div>
                  
           
           <div class="form-group-center">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary"  onclick="al()">
                                Update
                            </button>
                           
                        </div>
                    </div>
                  </form>
 </div>


<%
		//session1.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	%>

<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
<script>
var calculateForm = function () {
    document.getElementById("weightTotal").value =
    (
        Number(document.getElementById("weight1").value) +
        Number(document.getElementById("weight2").value) +
        Number(document.getElementById("weight3").value)
    )  ;
};
</script>
<script>
function myFunction() {
    var checkBox = document.getElementById("myCheck");
    var text = document.getElementById("text");
    if (checkBox.checked == true){
        text.style.display = "block";
    } else {
       text.style.display = "none";
    }
}
</script>
<script>
function al(){alert('Update Details successfully');}
</script>
 <style>
 #dvPreview
	 {
	     filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
	     min-height: 400px;
	     min-width: 400px;
	     display: none;
	 }</style>
</html>



		