$('#inforaccoon').html("<%= j (render 'edit') %>");

(function(){
    $(".raccoon-fo").css({
      'z-index' : '5',
      'opacity' : '1'
    });

  })();

$(".placement").slideDown(350);
