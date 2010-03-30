jQuery(document).ready(function(){
  jQuery("#main-nav li a.main-link").mouseover(function(){
    jQuery("#main-nav li a.close").fadeIn();
    jQuery("#main-nav li a.main-link").removeClass("active");                         
    jQuery(this).addClass("active");                    
    jQuery("#sub-link-bar").animate({
      height: "40px"             
    });
    jQuery(".sub-links").hide();
    jQuery(this).siblings(".sub-links").fadeIn();
  });
  jQuery("#main-nav li a.close").click(function(){
    jQuery("#main-nav li a.main-link").removeClass("active");                                           
    jQuery(".sub-links").fadeOut();
    jQuery("#sub-link-bar").animate({
      height: "10px"             
    });   
    jQuery("#main-nav li a.close").fadeOut();
  });
  
  
});