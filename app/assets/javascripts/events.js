// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
       $("#prosseguir").click(function(){
        var selected = $(".product-item:checked").length;
        if (selected != 3) { 
                alert("Escolha exatamente 3 opções");
                return false 
        }
       });
});


// console.log("a");
//        $('#check-all').click(function(){
//        		console.log("b");
//     		$("input:checkbox").attr('checked', true);
//   			});
//   		$('#uncheck-all').click(function(){
//   			console.log("c");
//     		$("input:checkbox").attr('checked', false);
//   			});