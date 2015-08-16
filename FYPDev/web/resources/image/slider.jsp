<%-- 
    Document   : slider
    Created on : Aug 11, 2015, 4:49:04 PM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../resources.jsp" %>
<style>
    img{
        height:100px;
    }
</style>

<div id="image-slider" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#image-slider" data-slide-to="0" class="active"></li>
                <li data-target="#image-slider" data-slide-to="1"></li>
                <li data-target="#image-slider" data-slide-to="2"></li>
                <img src="164607_407106632704056_1591502594_n.jpg" alt=""/>
                <li data-target="#image-slider" data-slide-to="3"></li>
                <li data-target="#image-slider" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="Eid-Mubarak-2013-Background.png" alt="Gambar lama"/>
                </div>
                <div class="item">
                    <img src="Banner-Anugerah-Kualiti-2015.jpg" alt="Anugerah Kualiti 2015"/>
                </div>
            
                <div class="item">
                    <img src="Program-bazar-ramadan.png" alt="Program Bazar Ramadhan"/>
                </div>
            
                <div class="item">
                    <img src="RAYANC.png" alt=""/>
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
