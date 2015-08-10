<%-- 
    Document   : navbar_session
    Created on : Aug 2, 2015, 11:32:20 AM
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->     
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>   
                <a class="navbar-brand" href="index.jsp">CFMS</a>
            </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">      
            <%
              //Getting usertype from session
 
                session = request.getSession(false);
                 if(session != null)
                {
                    session = request.getSession();
                    int type = 0; 
                    if(session.getAttribute("usertype") != null )
                    {  
                     type = Integer.parseInt(session.getAttribute("usertype").toString());
                    }
                     switch(type)
                     {
                        case 0:
            %>
                        <li align="left"><a href="login.jsp">Log In</a></li>
            <%
                        break;
                        case 1:
            %>
                        <li><a href="CourseCreation.jsp">Create Course</a></li>
           <%          case 2:%>
                        <li><a href="courseview.jsp">Edit Course</a></li>
           <%          case 3:%>
                        <li><a href="subjectview.jsp">Edit Course</a></li>
                        <li><a href="logout.jsp">Log Out</a></li>
           <%
                      break;
                      }
                  }
            %>    
              
            </ul>
        </div>
        </div>
    </nav>