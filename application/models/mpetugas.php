<?php
class Mpetugas extends CI_Model
{
	function __construct()
	{
		parent::__construct();	
	}
	
	//query anggota
	function getPetugas($id)
	{
		if(empty($id))
		{
			$this->db->where('hakakses !=', 'not');
			$query = $this->db->get('t_petugas');	
			return $query->result();
		}
		else
		{
			$this->db->select('t_petugas.*, login.*');
			$this->db->from('t_petugas');
			$this->db->join('login', 'login.username = t_petugas.kode_petugas');
			$this->db->where('kode_petugas', $id);
				
			$query = $this->db->get();	
			return $query->row();	
		}
				
	}
	
	function change_petugas()
	{
		$kodepetugas = $this->input->post('kode');
		if(empty($kodepetugas))
		{$kodepetugas = $this->session->userdata('user');}
		else
		{NULL;}
		
		$nama = $this->input->post('nama');
		$ym = $this->input->post('ym');
			
		$this->db->query("CALL change_petugas('$kodepetugas', '$nama', '$ym')");		
	}
	
	function change_akun()
	{
		$passbaru = $this->input->post('passbaru');
		if(empty($passbaru))
		{$password = $this->input->post('passlama');}
		else
		{$password = md5($passbaru);}
		
		$this->db->where('username', $this->session->userdata('user'));
		$this->db->update('login', array('password' => $password));
	}
	
	function deletePetugas($id)
	{
		$this->db->delete('t_petugas', array('kode_petugas' => $id));
	}
	
	function ubahHakakses($status, $kode)
	{
		if($status == "on")
		{$status = "ya";}
		else
		{$status = "tidak";}
		
		$this->db->where('kode_petugas', $kode);
		$this->db->update('t_petugas', array("hakakses" => $status));	
	}
	//End query anggota
}
?>