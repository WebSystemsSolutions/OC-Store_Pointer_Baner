<div id="slideshow_points<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
    <?php foreach ($banners as $banner) { ?>
        <div class="item">
            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
            <?php if($banner['points']){ ?>
                <?php foreach ($banner['points'] as $j=>$point){ ?>
                    <div class="marker" onclick="get_popup_points(<?php echo $point['product_id']; ?>);" title="<?php echo $point['product_name']; ?>" style="left:<?php echo $point['left']; ?>%;top:<?php echo $point['top']; ?>%"></div>
                <?php } ?>
            <?php } ?>
        </div>
    <?php } ?>
</div>
<script type="text/javascript"><!--
    $(document).ready(function () {
        var owl = $('#slideshow_points<?php echo $module; ?>');
        owl.owlCarousel({
            items: 6,
            autoPlay: 3000,
            singleItem: true,
            navigation: true,
            navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
            pagination: true,
        });
    });


    --></script>


<style>
    .marker{
        position: absolute;
        background-color: #229ac8;
        background-image: linear-gradient(to bottom, #23a1d1, #1f90bb);
        width: 60px;
        height: 60px;
        border-radius: 50%;
        cursor: pointer;
        transform: translate(-50%, -50%) scale(-0.4);
        cursor: pointer;
    }
    .marker:after{
        content: '';
        width: 22px;
        height: 4px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        background: white;
    }
    .marker:before{
        content: '';
        width: 22px;
        height: 4px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%) rotate(90deg);
        background: white;

    }
</style>