<?php
class Mkategori extends CI_Model
{
	function __construct()
	{
		parent::__construct();	
	}
	
	//query kategori
	function getKategori($id)
	{
		if(empty($id))
		{
			$query = $this->db->get('t_kategori');
			return $query->result();		
		}
		else
		{
			$query = $this->db->get_where("t_kategori", array("kode_kategori" => $id));	
			return $query->row();	
		}
				
	}
	
	function change_kategori()
	{
		$kodekategori = $this->input->post('kode');
		$nama = $this->input->post('nama');
		
		$this->db->query("CALL change_kategori('$kodekategori', '$nama')");		
	}
	
	function deleteKategori($id)
	{
		$this->db->delete('t_kategori', array('kode_kategori' => $id));
	}
	
	function carikategori($cari)
	{
		$this->db->like('nama_kategori', $cari);
		$query = $this->db->get('kategori');
		return $query->result();	
	}
}
?>