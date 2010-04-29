jQuery('.close').live('click', function(){
  jQuery('#confirmBox').dialog('close');
});

jQuery(function() {
  jQuery('.button').button();
});