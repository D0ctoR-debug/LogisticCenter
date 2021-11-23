<%--
  Created by IntelliJ IDEA.
  User: Doctor
  Date: 27.10.2021
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <style>
        .col_white_amrc {
            color: #FFF;
        }

        footer {
            width: 100%;
            background-color: #263238;
            min-height: 250px;
            padding: 10px 0px 25px 0px;
        }

        .pt2 {
            padding-top: 40px;
            margin-bottom: 20px;
        }

        footer p {
            font-size: 13px;
            color: #CCC;
            padding-bottom: 0px;
            margin-bottom: 8px;
        }

        .mb10 {
            padding-bottom: 15px;
        }

        .footer_ul_amrc {
            margin: 0px;
            list-style-type: none;
            font-size: 14px;
            padding: 0px 0px 10px 0px;
        }

        .footer_ul_amrc li {
            padding: 0px 0px 5px 0px;
        }

        .footer_ul_amrc li a {
            color: #CCC;
        }

        .footer_ul_amrc li a:hover {
            color: #fff;
            text-decoration: none;
        }

        .fleft {
            float: left;
        }

        .padding-right {
            padding-right: 10px;
        }

        .footer_ul2_amrc {
            margin: 0px;
            list-style-type: none;
            padding: 0px;
        }

        .footer_ul2_amrc li p {
            display: table;
        }

        .footer_ul2_amrc li a:hover {
            text-decoration: none;
        }

        .footer_ul2_amrc li i {
            margin-top: 5px;
        }

        .bottom_border {
            border-bottom: 1px solid #323f45;
            padding-bottom: 20px;
        }

        .foote_bottom_ul_amrc {
            list-style-type: none;
            padding: 0px;
            display: table;
            margin-top: 10px;
            margin-right: auto;
            margin-bottom: 10px;
            margin-left: auto;
        }

        .foote_bottom_ul_amrc li {
            display: inline;
        }

        .foote_bottom_ul_amrc li a {
            color: #999;
            margin: 0 12px;
        }

        .social_footer_ul {
            display: table;
            margin: 15px auto 0 auto;
            list-style-type: none;
        }

        .social_footer_ul li {
            padding-left: 20px;
            padding-top: 10px;
            float: left;
        }

        .social_footer_ul li a {
            color: #CCC;
            border: 1px solid #CCC;
            padding: 8px;
            border-radius: 50%;
        }

        .social_footer_ul li i {
            width: 20px;
            height: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<footer class="footer">
    <div class="container bottom_border">
        <div class="row">
            <div class=" col-sm-4 col-md  col-6 col"></div>
            <div class=" col-sm-4 col-md col-sm-4  col-12 col">
                <h5 class="headin5_amrc col_white_amrc pt2"><spring:message code="contact.footer"/></h5>
                <!--headin5_amrc-->
                <p class="mb10"><spring:message code="how.footer"/>:</p>
                <p><i class="fa fa-location-arrow"></i><spring:message code="address.footer"/>
                </p>
                <p><i class="fa fa-phone"></i><spring:message code="mobile.footer"/>
                </p>
                <p><i class="fa fa fa-envelope"></i><spring:message code="email.footer"/> </p>
            </div>

        </div>
    </div>


    <div class="container">
        <ul class="foote_bottom_ul_amrc">
            <li><a href="/">Home</a></li>
            <li><a href="/#Welcome">About</a></li>
            <li><a href="/main#Services">Services</a></li>
        </ul>
        <!--foote_bottom_ul_amrc ends here-->
        <p class="text-center">Copyright @2021| Designed With by <a href="#">Logistic Center</a></p>
    </div>
</footer>
</body>
</html>
