$(function(){ 
	
       $("#prosseguir").click(function(){
       	
        var selected = $(".product-item:checked").length;
        	if (selected != 3) { 
                alert("Escolha exatamente 3 opções");
                return false 
        	}
       	});
             $('#check-all').click(function(){
       		
    		$(":checkbox").prop('checked', true);
  			});
  		$('#uncheck-all').click(function(){
  			
    		$(":checkbox").prop('checked', false);
  			});

})