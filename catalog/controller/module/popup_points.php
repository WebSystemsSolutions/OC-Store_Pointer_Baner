<?php
class ControllerModulePopupPoints extends Controller {
	public function index() {

		$data = array();

		$this->load->model('catalog/product');

		$this->load->language('module/popup_points');

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);

		$data['product_id'] = $product_id;

		if ($product_info) {

            $data['isset_products'] = true;

            if ($product_info['meta_h1']) {
                $data['heading_title'] = $product_info['meta_h1'];
            } else {
                $data['heading_title'] = $product_info['name'];
            }

            $data['view_product'] = $this->language->get('view_product');
            $data['model_text'] = $this->language->get('model_text');


            $data['manufacturer'] = $product_info['manufacturer'];
            $data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
            $data['model'] = $product_info['model'];
            $data['reward'] = $product_info['reward'];
            $data['points'] = $product_info['points'];
            $data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

            if ($product_info['quantity'] <= 0) {
                $data['stock'] = $product_info['stock_status'];
            } elseif ($this->config->get('config_stock_display')) {
                $data['stock'] = $product_info['quantity'];
            } else {
                $data['stock'] = $this->language->get('text_instock');
            }

            $this->load->model('tool/image');
            $data['images'] = array();

            if ($product_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
            }else{
                $data['thumb'] = $this->model_tool_image->resize('no_image.png', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
            }

            $results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

            if($results){
                foreach ($results as $result) {
                    $data['images'][] = array(
                        'thumb'  => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
                    );
                }
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $data['price'] = false;
            }

            if ((float)$product_info['special']) {
                $data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $data['special'] = false;
            }

            if ($this->config->get('config_tax')) {
                $data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
            } else {
                $data['tax'] = false;
            }

            $data['href'] = $this->url->link('product/product', 'product_id=' . $product_info['product_id']);



            if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/popup_points.tpl')) {
				$view = $this->load->view($this->config->get('config_template') . '/template/module/popup_points.tpl', $data);
			} else {
				$view = $this->load->view('default/template/module/popup_points.tpl', $data);
			}

			$this->response->setOutput($view);
		} else {

		    $data['empty_product_text'] = $this->language->get('empty_product_text');

            $data['isset_products'] = false;

            if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/popup_points.tpl')) {
                $view = $this->load->view($this->config->get('config_template') . '/template/module/popup_points.tpl', $data);
            } else {
                $view = $this->load->view('default/template/module/popup_points.tpl', $data);
            }

            $this->response->setOutput($view);
        }
	}

}
