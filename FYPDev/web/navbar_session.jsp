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
<%@include file="resources.jsp" %>
<div>
    <nav class="navbar navbar-default navbar-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>                        
                </button>
              <a class="navbar-brand" href="#">CFMS</a>
              <button class="navbar-toggle collapse in" data-toggle="collapse" id="menu-toggle-2"> <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navbar">
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
                    
            <%
                        break;
                        case 1:
            %>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="CourseCreation.jsp"><div>Create Course</div></a></button></li>
          <%          case 2:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="courseview.jsp"><div>Course View</div></a></button></li>
          <%          case 3:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="subjectview.jsp"><div>Subject View</div></a></button></li>
          <%
                        default:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="logout.jsp"><div>Log Out</div></a></button></li><%;
                      }
                  }
            %>
            </ul>
          </div>
        </div>
    </nav>
</div>
