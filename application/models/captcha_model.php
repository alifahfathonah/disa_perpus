<?php
class Captcha_model extends CI_Model{
	
	function __construct()
	{
		parent::__construct();
	}
	
	function createcaptcha()
	{
	    $this->load->plugin('captcha');
	    $vals = array(
	        'img_path'   => './captcha/',
	        'img_url'    => base_url().'captcha/'
	    );
	     
	    $cap = create_captcha($vals);
	 
	    $data = array(
	        'captcha_id'    => NULL,
	        'captcha_time'  => $cap['time'],
	        'ip_address'    => $this->input->ip_address(),
	        'word'      => $cap['word']
	    );
	 
	    $query = $this->db->insert_string('captcha', $data);
	    $this->db->query($query);
	    return $cap;
	}
	
	function captchabenar($captcha)
	{
	    $expiration = time()-7200; // Two hour limit
	    $this->db->query("DELETE FROM captcha WHERE captcha_time < ".$expiration);    
	    $sql = "SELECT COUNT(*) AS count FROM captcha WHERE word = ? AND ip_address = ? AND captcha_time > ?";
	    $binds = array($captcha, $this->input->ip_address(), $expiration);
	    $query = $this->db->query($sql, $binds);
	    $row = $query->row();
	     
	    if ($row->count == 0)
	    {
	        return false;
	    }
	    return true;
	}
}
