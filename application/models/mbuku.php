<?php
class Mbuku extends CI_Model
{
	function __construct()
	{
		parent::__construct();	
	}
	
	//query t_buku
	function getBuku($id, $perhal, $offset)
	{
		if(empty($id) && empty($perhal) && empty($offset))
		{
			$query = $this->db->get('detail_buku');
			return $query->result();
		}
		elseif(empty($id) && !empty($perhal) && $offset >= 0)
		{
			$this->db->limit($perhal, $offset);	
			
			$query = $this->db->get('detail_buku');
			return $query->result();
		}
		else
		{
			$query = $this->db->get_where("t_buku", array("kode_buku" => $id));	
			return $query->row();	
		}
				
	}
	
	function detail_buku($id)
	{
		$this->db->where('kode_buku', $id);
		$query = $this->db->get('detail_buku');
		return $query->row();
	}
	
	function rank_buku()
	{
		$query = $this->db->get('ranking_buku');
		return $query->result();	
	}
	
	function change_buku()
	{
		$kodebuku = $this->input->post('kodebuku');
		$kodekategori = $this->input->post('kategori');
		$kodepenerbit = $this->input->post('penerbit');
		$judul = $this->input->post('judul');
		$sinopsis = $this->input->post('sinopsis');
		$pengarang = $this->input->post('pengarang');
		$tahun = $this->input->post('tahun');
		$stok = $this->input->post('stok');
		
		$dok = $this->upload->data();
		$cover = $dok['file_name'];
		
		if(empty($cover))
		{$cover = $this->input->post('cover');}
		else
		{NULL;}
		
		$this->db->query("CALL change_buku('".$kodebuku."', '".$kodekategori."', '".$kodepenerbit."', \"".$judul."\", '".$sinopsis."', '".$pengarang."', '".$tahun."', '".$cover."', '".$stok."')");		
	}
	
	function deleteBuku($id)
	{
		$this->db->delete('t_buku', array('kode_buku' => $id));
	}
	
	function cariBuku($cari)
	{
		$this->db->like('judul', $cari);
		$query = $this->db->get('detail_buku');
		return $query->result();
	}
	
	function t_bukuSupplier($kodekategori)
	{
		$query = $this->db->get_where("t_buku", array("kode_kategori" => $kodekategori));
		return $query->result();
	}
	
	function t_bukuPesan()
	{
		$this->db->where('stok >', '100'); 
		$query = $this->db->get("t_buku");
		return $query->result();
	}
	//End query t_buku
}
?>