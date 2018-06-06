<?php
class ControllerModuleSlideshowPoints extends Controller {
	public function index($setting) {

		static $module = 0;

		$this->document->addScript('catalog/view/javascript/slideshow_marker.js');

		$this->load->model('design/banner_points');
		$this->load->model('tool/image');

        $data['readone_slider'] = $this->language->get('readone_sliders');

		$data['banners'] = array();

	 $results = $this->model_design_banner_points->getBanner($setting['banner_id']);


		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					//'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					'image' => 'image/'.$result['image'],
					'points' => isset($result['points'])? json_decode($result['points'], true) :''
				);
			}
		}


		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow_points.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/slideshow_points.tpl', $data);
		} else {
			return $this->load->view('default/template/module/slideshow_points.tpl', $data);
		}
	}
}
