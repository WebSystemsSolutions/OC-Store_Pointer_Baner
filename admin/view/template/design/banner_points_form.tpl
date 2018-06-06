<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <table id="images" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_title; ?></td>
                <td class="text-left"><?php echo $entry_link; ?></td>
                <td class="text-left">Маркеры</td>
                <td class="text-right"><?php echo $entry_sort_order; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $image_row = 0; ?>
              <?php foreach ($banner_images as $banner_image) { ?>
              <tr id="image-row<?php echo $image_row; ?>" class="points_img_row">
                <td class="text-left"><?php foreach ($languages as $language) { ?>
                  <div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
                    <input type="text" name="banner_image[<?php echo $image_row; ?>][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($banner_image['banner_image_description'][$language['language_id']]) ? $banner_image['banner_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_banner_image[$image_row][$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_banner_image[$image_row][$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?></td>
                <td  style="width:20%;" class="text-center">
                    <div class="wrapp_input">
                        <?php if(isset($banner_image['points'])){ ?>
                            <?php $k=0; foreach ($banner_image['points'] as $point){ ?>
                                <div class="row" id="points_row<?php echo $k; ?>">
                                    <div class="col-sm-6"><label for="" class="control-label"><?php echo $x_choord_text; ?></label><input type="text" name="banner_image[<?php echo $image_row; ?>][points][<?php echo $k; ?>][left]"   value="<?php echo $point['left']; ?>" class="form-control p_left"></div>
                                    <div class="col-sm-6"><label for="" class="control-label"><?php echo $y_choord_text; ?></label><input type="text" name="banner_image[<?php echo $image_row; ?>][points][<?php echo $k; ?>][top]" value="<?php echo $point['top']; ?>" class="form-control p_top"></div>
                                    <div class="col-sm-12"><label for="" class="control-label"><?php echo $product_choord_text; ?> - <?php echo ($k + 1); ?></label><input type="text" name="banner_image[<?php echo $image_row; ?>][points][<?php echo $k; ?>][product_name]" value="<?php echo $point['product_name']; ?>" class="form-control init_autocomplete"><input
                                                type="hidden" name="banner_image[<?php echo $image_row; ?>][points][<?php echo $k; ?>][product_id]" value="<?php echo $point['product_id']; ?>">
                                        <?php if(isset($banner_points[$image_row][$k])){ ?>
                                            <div class="text-danger">
                                                <?php echo $banner_points[$image_row][$k]; ?>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="col-sm-12 text-center"><br><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').find('#points_row<?php echo $k; ?>').remove(); addDragableElems()" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div>
                                    <div class="col-sm-12"><hr></div>
                                </div>
                            <?php $k++ ;} ?>
                        <?php } ?>
                    </div>
                    <button type="button" onclick="addPoints($(this), <?php echo $image_row; ?>);" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                </td>
                <td class="text-left"><a href="" onmousedown="return false" id="thumb-image<?php echo $image_row; ?>" data-toggle="image_p" class="img-thumbnail point_link"><div class="wrapp_pnt_img"><img src="<?php echo $banner_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></div></a>
                  <input type="hidden" name="banner_image[<?php echo $image_row; ?>][image]" value="<?php echo $banner_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                <td class="text-right" style="width: 10%;"><input type="text" name="banner_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $banner_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              <?php $image_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="4"></td>
                <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_banner_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
      $('.p_left').keyup(function (e) {

          $(this).closest('.points_img_row').find('.drag_elem').eq($(this).closest('.row').index()).css({'left':$(this).val()+ '%'});

      });
      $('.p_top').keyup(function (e) {

          $(this).closest('.points_img_row').find('.drag_elem').eq($(this).closest('.row').index()).css({'top':$(this).val()+ '%'});

      });

      var image_row = <?php echo $image_row; ?>;


      var product_choord_text = '<?php echo $product_choord_text; ?>';
      var x_choord_text = '<?php echo $x_choord_text; ?>';
      var y_choord_text = '<?php echo $y_choord_text; ?>';

      function addPoints(elem, points_img_row, points_points_row){

          if(!points_points_row){
              points_points_row = $('#image-row'+points_img_row+ ' .wrapp_input').children().length;
          }

          html  = '<div class="row" id="points_row' + points_points_row + '">';
          html  +='<div class="col-sm-6"><label for="" class="control-label">' + x_choord_text + '</label><input type="text" name="banner_image[' + points_img_row +'][points]['+points_points_row+'][left]"   value="0" class="form-control p_left"></div>';
          html  += '<div class="col-sm-6"><label for="" class="control-label">'+ y_choord_text + '</label><input type="text" name="banner_image[' + points_img_row +'][points]['+points_points_row+'][top]" value="0" class="form-control p_top"></div>';
          html  += '<div class="col-sm-12"><label for="" class="control-label">' + product_choord_text + ' - ' + (points_points_row + 1) + '</label><input type="text" name="banner_image[' + points_img_row +'][points]['+points_points_row+'][product_name]" value="" class="form-control init_autocomplete"><input type="hidden" name="banner_image[' + points_img_row +'][points]['+points_points_row+'][product_id]" value=""></div>';
          html  += '<div class="col-sm-12 text-center"><br><button type="button" onclick="$(\'#image-row' + points_img_row  + '\').find(\'#points_row'+points_points_row+'\').remove(); addDragableElems()" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div>';
          html += '<div class="col-sm-12"><hr></div>';
          html += '</div>';

          $('#image-row' + points_img_row + ' .wrapp_input').append(html);


          addDragableElems();

          addEventDragable();

          init_autocomplete();

      }



      function addDragableElems(){

          var rw = document.querySelectorAll('.points_img_row');
          $('.points_img_row .wrapp_pnt_img .drag_elem').remove();
          for(var i = 0; i<rw.length; i++){
              var ch = rw[i].querySelectorAll('.row');
              for(var j = 0; j<ch.length; j++) {

                  var newDr = document.createElement("div");
                  newDr.textContent = j + 1;
                  newDr.classList.add('drag_elem');
                  newDr.id = 'drag_' + (j + 1);
                  newDr.style.left = ch[j].querySelector('.p_left').value + '%';
                  newDr.style.top = ch[j].querySelector('.p_top').value + '%';

                  document.querySelector('#image-row'+i+ ' .wrapp_pnt_img').appendChild(newDr)
              }
          }
      }
      addDragableElems();


      function addEventDragable() {

          var drag_elem = document.querySelectorAll('.drag_elem');
          for(var i = 0; i < drag_elem.length; i++){

              drag_elem[i].onmousedown = function(e) {

                  var drag_wrapp = this.parentElement;


                  var coords = getCoords(this);


                  var shiftX = e.pageX - coords.left + drag_wrapp.offsetLeft - 12.5;
                  var shiftY = e.pageY - coords.top + drag_wrapp.offsetTop - 12.5;

                  var main_elem = this;
                  moveAt(e);

                  function moveAt(e) {

                      main_elem.style.left = e.pageX - shiftX + 'px';
                      main_elem.style.top = e.pageY - shiftY + 'px';

                      $(main_elem).closest('.points_img_row').find('.wrapp_input .row').eq(main_elem.innerText - 1).find('.p_left').val((e.pageX - shiftX) * 100 / $(main_elem).closest('.wrapp_pnt_img').width());
                      $(main_elem).closest('.points_img_row').find('.wrapp_input .row').eq(main_elem.innerText - 1).find('.p_top').val((e.pageY - shiftY) * 100 / $(main_elem).closest('.wrapp_pnt_img').height());

                  }
                  document.onmousemove = function(e) {
                      moveAt(e);
                  };
                  main_elem.onmouseup = function() {
                      document.onmousemove = null;
                      main_elem.onmouseup = null;
                  };
                  main_elem.ondragstart = function() {
                      return false;
                  };
                  function getCoords(elem) {   // кроме IE8-
                      var box = elem.getBoundingClientRect();
                      return {
                          top: box.top + pageYOffset,
                          left: box.left + pageXOffset
                      };
                  }
              }
          }
      };
      addEventDragable();


function addImage() {
	html  = '<tr id="image-row' + image_row + '" class="points_img_row">';
    html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '    <div class="input-group">';
	html += '      <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="banner_image[' + image_row + '][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
    html += '    </div>';
	<?php } ?>
	html += '  </td>';
	html += '  <td class="text-center"><div class="wrapp_input"></div><button type="button" onclick="addPoints($(this), '+ image_row +');" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
	html += '  <td class="text-left"><a href="" onmousedown="return false" id="thumb-image' + image_row + '" data-toggle="image_p" class="img-thumbnail point_link"><div class="wrapp_pnt_img"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></div></a><input type="hidden" name="banner_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right" style="width: 10%;"><input type="text" name="banner_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#images tbody').append(html);
	image_row++;

}
      function init_autocomplete() {
          $('input.init_autocomplete').each(function () {
              var th = $(this)
              $(this).autocomplete({
                  'source': function(request, response) {
                      $.ajax({
                          url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                          dataType: 'json',
                          success: function(json) {
                              if($(th).val() == 0){
                                  $(th).next().next().val('');
                              }
                              response($.map(json, function(item) {
                                  return {
                                      label: item['name'],
                                      value: item['product_id']
                                  }
                              }));
                          }
                      });
                  },
                  'select': function(item) {
                      $(this).val(item['label']);
                      $(this).parent().find('input[type=\'hidden\']').val(item['value']);
                  }
              });
          });
      };
      $(document).ready(function () {
          init_autocomplete();
      });
//--></script></div>

<style>
    .wrapp_pnt_img{
        width: 650px;
        position: relative;
        -webkit-user-select: none;
        -moz-user-select: none;
        text-align: center;
    }
    .wrapp_pnt_img img{
        max-width: 100%;
        width: 100%;
        margin: 0 auto;
    }
    .drag_elem{
        width: 25px;
        height: 25px;
        background-color: #f56b6b;
        border-radius: 50%;
        z-index: 5;
        position: absolute;
        color: white;
        text-align: center;
        font-weight: bold;
        line-height: 24px;

        transform: translate(-50%, -50%);

        -webkit-user-select: none;
        -moz-user-select: none;
    }
</style>
<?php echo $footer; ?>
