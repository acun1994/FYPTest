<%-- 
    Document   : slider
    Created on : Aug 11, 2015, 4:49:04 PM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../resources.jsp" %>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
  <div class="container">
        <div id="image-slider" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#image-slider" data-slide-to="0" class="active"></li>
                <li data-target="#image-slider" data-slide-to="1"></li>
                <li data-target="#image-slider" data-slide-to="2"></li>
                <li data-target="#image-slider" data-slide-to="3"></li>
                <li data-target="#image-slider" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="Eid-Mubarak-2013-Background.png" alt="Gambar 2013" width="460" height="345"/>
                </div>
                <div class="item">
                    <img src="Banner-Anugerah-Kualiti-2015.jpg" alt="Anugerah Kualiti 2015" width="460" height="345"/>
                </div>
            
                <div class="item">
                    <img src="Program-bazar-ramadan.png" alt="Program Bazar Ramadhan" width="460" height="345"/>
                </div>
            
                <div class="item">
                    <img src="RAYANC.png" alt="" width="460" height="345"/>
                </div>
            
                <div class="item">
                    <img src="iftar-ramadhan.png" alt=""/>
                </div>
            </div>
            
            <a class="left carousel-control" href="#image-slider" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#image-slider" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
  </div>

