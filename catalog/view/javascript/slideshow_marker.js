$(document).ready(function () {
    $(".points_slider").on('init', function(){
        if($(window).outerWidth() > 992){
            $('.points_slider .marker').each(function (i, elem) {
                var elem = $(this);
                var elem_x = Math.abs($(this).closest('.wrapp_points').offset().left - $(elem).offset().left);
                var elem_y = Math.abs($(this).closest('.wrapp_points').offset().top - $(elem).offset().top);

                $(document).on('mousemove', function (e) {

                    if(e.target.closest('.points_slider')){
                        var cursor_x = e.clientX - $('.points_slider').offset().left;
                        var cursor_y = e.clientY - $('.points_slider').offset().top;

                        //растояние елемента к маркеру (px):
                        var lg = Math.sqrt(Math.pow(Math.abs(elem_x - cursor_x), 2) + Math.pow(Math.abs(elem_y - cursor_y), 2));

                        if(lg <= 500){
                            //растояние елемента к маркеру (%):
                            var pr = 100 * lg / 500;

                            if((100 - pr) * 0.01 > 0.4){
                                $(elem).css({'transform':'translate(-50%, -50%) scale(-'+ (100 - pr) * 0.01 +')'});
                            }
                        }else{
                            $(elem).css({'transform':'translate(-50%, -50%) scale(-0.4)'});
                        }
                    }else{
                        $(elem).css({'transform':'translate(-50%, -50%) scale(-0.4)'});
                    }
                });
            });
        }
    });
});
function get_popup_points(product_id) {
    console.log(product_id);
    var url = 'index.php?route=module/popup_points&product_id=' + product_id;
    if (url.indexOf('#') == 0) {
        $(url).modal('open');
    } else {
        $.get(url, function (data) {
            $('<div class="modal fade" id="popup_points" tabindex="-1" role="dialog">' + data + '</div>').modal();
        }).success(function () {
            $('input:text:visible:first').focus();
        });
    }
}
