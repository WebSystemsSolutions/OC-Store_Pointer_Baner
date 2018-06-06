<?php
class ModelDesignBannerPoints extends Model {
	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_points_image bpi LEFT JOIN " . DB_PREFIX . "banner_points_image_description bpid ON (bpi.banner_image_id  = bpid.banner_image_id) WHERE bpi.banner_id = '" . (int)$banner_id . "' AND bpid.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY bpi.sort_order ASC");

		return $query->rows;
	}
}