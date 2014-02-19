Number.prototype.formatMoney = function(c, d, t){
var n = this, 
    c = isNaN(c = Math.abs(c)) ? 2 : c, 
    d = d == undefined ? "," : d, 
    t = t == undefined ? "." : t, 
    s = n < 0 ? "-" : "", 
    i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", 
    j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
 };
 
$(function(){ 
	
       $('div').on("click", "#button",function(event){
          event.preventDefault();
          window.location.href =($(this).attr('data-url') + "&contribution%5Bquantity%5D=" + $(this).closest("div").find('#quantity').val());
        });
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
      $(".spinner").spinner({ min: 1 }).val(1);
      $('.ui-spinner-button').click(function() {
        $(this).siblings('input').change();
      });
      $('.ui-spinner-input').on("keyup",function(){
        $(this).change();
      });
      $('.spinner').spinner().change(function(){
        var qty=$(this).spinner('value');
        var price_p = $(this).closest('div').find(".price");
        var price = price_p.data('price');
        price_p.text("R$ "+(qty*price).formatMoney(2));
    });


})