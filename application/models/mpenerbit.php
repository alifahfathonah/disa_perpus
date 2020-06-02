<?php
class Mpenerbit extends CI_Model
{
	function __construct()
	{
		parent::__construct();	
	}
	
	//query penerbit
	
	function getPenerbit($id)
	{
		if(empty($id))
		{
			$query = $this->db->get('t_penerbit');	
			return $query->result();		
		}
		else
		{
			$query = $this->db->get_where("t_penerbit", array("kode_penerbit" => $id));	
			return $query->row();	
		}
				
	}
	
	function change_penerbit()
	{
		$kodepenerbit = $this->input->post('kode');
		$nama = $this->input->post('nama');
		$alamat = $this->input->post('alamat');
		$telp = $this->input->post('telp');
				
		$this->db->query("CALL change_penerbit('$kodepenerbit', '$nama', '$alamat', '$telp')");		
	}
	
	function deletePenerbit($id)
	{
		$this->db->delete('t_penerbit', array('kode_penerbit' => $id));
	}
	
	function cariPenerbit($cari)
	{
		$this->db->like('nama_penerbit', $cari);
		$query = $this->db->get('pepenerbit');
		return $query->result();	
	}
	
	//end query penerbit
}
?>