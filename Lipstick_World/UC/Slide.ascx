<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slide.ascx.cs" Inherits="Lipstick_World.UC.Slide" %>
<div class="slideshow-container">

                <div class="mySlides fade" style="display:block;">
                    <div class="numbertext">1 / 3</div>
                    <img src="Image/slide_6.jpg" style="width:100%">
                    <div class="text">1</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="Image/slide_7.jpg" style="width:100%">
                    <div class="text">2</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="Image/slide_8.jpg" style="width:100%">
                    <div class="text">3</div>
                </div>

                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>

                </div>
                <br>

                <div style="text-align:center">
                    <span class="dot" onclick="currentSlide(1)"></span> 
                    <span class="dot" onclick="currentSlide(2)"></span> 
                    <span class="dot" onclick="currentSlide(3)"></span>
                </div>