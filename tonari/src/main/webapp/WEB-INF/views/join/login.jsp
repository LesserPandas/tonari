<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp" %>


    <div class="main">
      <div class="container">
       
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1></h1>
            <!-- BEGIN CHECKOUT PAGE -->
            <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

              <!-- BEGIN CHECKOUT -->
              <div id="checkout" class="panel panel-default">
              
                <div class="panel-heading">
                  <h2 class="panel-title">
                    
                      
                    </a>
                  </h2>
                </div>
                <div id="checkout-content" class="panel-collapse collapse in">
                <form class="form-horizontal"  method="post" action="login.do">
                  <div class="panel-body row">
                    
                    <div class="col-md-6 col-sm-6" style="left: 25%; ">
                    
                      <h3 style="text-align: center; padding-top: 50px;  padding-bottom: 50px; font-size: 40px;">로그인 </h3>
                      <p></p>
                      
                        <div class="form-group" style="text-align: left;"> 
                         
                          <input type="text" id="userid" name="userid" class="form-control" placeholder="아이디입력">
                        </div>
                        <div class="form-group"style="text-align: left;">
                      
                           <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="패스워드 입력">
                        </div>
                        <div class="form-group"style="text-align: left;">
                         <button class="btn btn-primary" type="submit" style="    width: 100%;    height: 40px;    font-size: 20px;">Login</button>
                         </div>
                        <a href="contract.do" >회원이 아니신가요?</a>
                        <div class="padding-top-20">                  
                         
                        </div>
                       
					                       <!--  <div class="login-socio">
					                          <p class="text-muted">or login using:</p>
					                          <ul class="social-icons">
					                            <li><a href="javascript:;" data-original-title="facebook" class="facebook" title="facebook"></a></li>
					                            <li><a href="javascript:;" data-original-title="Twitter" class="twitter" title="Twitter"></a></li>
					                            <li><a href="javascript:;" data-original-title="Google Plus" class="googleplus" title="Google Plus"></a></li>
					                            <li><a href="javascript:;" data-original-title="Linkedin" class="linkedin" title="LinkedIn"></a></li>
					                          </ul>-->
                          
                        </div>                   
                     </div>
                     </form>
                  </div>
                </div>
                
              </div>
              <!-- END CHECKOUT -->

           
            </div>
            <!-- END CHECKOUT PAGE -->
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

  

    

<%@include file="footer.jsp" %>