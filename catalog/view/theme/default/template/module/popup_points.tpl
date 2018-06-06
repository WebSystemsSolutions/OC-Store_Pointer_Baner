<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title"><?php echo $heading_title; ?></h4>
        </div>
        <div class="modal-body">
            <?php if($isset_products){ ?>
                <div class="row">
                    <div class="col-sm-12">
                        <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive">
                    </div>
                    <div class="col-sm-12">
                        <div class="text-center">
                            <a href="<?php echo $href; ?>" class="btn btn-primary btn-block"><?php echo $view_product; ?></a>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <br>
                        <?php echo $model_text; ?>: <?php echo $model; ?>
                        <?php if($price) {?>
                            <br>
                            <div class="wrapp_price">
                                <?php if(!$special) { ?>
                                    <h2><?php echo $price; ?></h2>
                                <?php }else{ ?>
                                    <h2><?php echo $special; ?></h2>
                                    <h3 style="text-decoration: line-through;"><?php echo $price; ?></h3>
                                <?php } ?>
                            </div>
                        <?php } ?>
                        <?php echo $stock; ?>
                        <br>
                        <div class="text-left">
                            <?php echo $description; ?>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center">
                        <?php if($images){ ?>
                            <?php foreach ($images as $image) { ?>
                                <hr>
                                <img src="<?php echo $image['thumb']; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive">
                            <?php }?>
                        <?php } ?>
                    </div>
                </div>
            <?php }else{ ?>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center">
                            <h2><?php echo $empty_product_text; ?></h2>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>