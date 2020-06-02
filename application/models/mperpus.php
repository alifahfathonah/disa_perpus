<?php
class Mperpus extends CI_Model{
	
	function __construct()
	{
		parent::__construct();
	}
	
	function get_login($user, $pass)
	{
		$where = array('username' => $user,
					   'password' => $pass);
		$query = $this->db->get_where('login', $where);
		return $query->row();
	}
	
	function getName($level)
	{
		if($level == 2 OR $level == 3)
		{
			$this->db->select('nama_petugas, hakakses');
			$query = $this->db->get_where('t_petugas', array('kode_petugas' => $this->session->userdata('user')));	
			return $query->row();
		}
		else
		{
			NULL;
		}
	}
	
	function getKode($table, $field)
	{
		$query = $this->db->query("SELECT MAX(RIGHT(".$field.", 3)) AS hasil FROM ".$table);
		return $query->row();
	}
	
	function getAkses()
	{
		$this->db->select('hakakses');
		$query = $this->db->get_where('t_petugas', array('kode_petugas' => $this->session->userdata('user')));	
		return $query->row();
	}
}
