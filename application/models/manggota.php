<?php
class Manggota extends CI_Model
{
	function __construct()
	{
		parent::__construct();	
	}
	
	//query anggota
	function getAnggota($id)
	{
		if(empty($id))
		{
			$query = $this->db->get_where("t_anggota", array("status_verif" => "sudah"));	
			return $query->result();		
		}
		else
		{
			$this->db->select('t_anggota.*, t_kartu.*');
			$this->db->from('t_anggota');
			$this->db->join('t_kartu', 't_kartu.kode_anggota = t_anggota.kode_anggota');
			$this->db->where('t_anggota.kode_anggota', $id);
				
			$query = $this->db->get();
			return $query->row();	
		}
				
	}
	
	function insert_anggota()
	{
		$dok = $this->upload->data();
		$foto = $dok['file_name'];
		
		$data1 = array(	'kode_anggota' => $this->input->post('kode'),
						'nama_anggota' => $this->input->post('nama'),
						'gender' => $this->input->post('gender'),
						'alamat_anggota' => $this->input->post('alamat'),
						'tlp_anggota' => $this->input->post('telp'),
						'foto_anggota' => $foto);
		$this->db->insert('t_anggota', $data1);
		
		$data2 = array(	'kode_anggota' => $this->input->post('kode'),
						'status_aktiv' => 'belum');
		$this->db->insert('t_kartu', $data2);
	}
	
	function change_anggota()
	{
		$dok = $this->upload->data();
		$foto = $dok['file_name'];
		
		if(empty($foto))
		{$foto = $this->input->post('foto');}
		else
		{NULL;}
		
		$data = array(	'nama_anggota' => $this->input->post('nama'),
						'gender' => $this->input->post('gender'),
						'alamat_anggota' => $this->input->post('alamat'),
						'tlp_anggota' => $this->input->post('tlp'),
						'foto_anggota' => $foto);
		$this->db->where('kode_anggota', $this->input->post('kode'));
		$this->db->update('t_anggota', $data);
	}
	
	function deleteAnggota($id)
	{
		$this->db->delete('t_anggota', array('kode_anggota' => $id));
	}
	
	function verifikasi()
	{
		$query = $this->db->get('kartu_anggota');
		return $query->result();
	}
	
	function getKartu($kode)
	{		
		$this->db->query("CALL kartu_anggota('".$this->session->userdata('user')."', '".$kode."')");
	}
	
	function change_status($kode, $kode_verif)
	{
		if($kode == $kode_verif)
		{
			$this->db->where('kode_anggota', $kode);
			$this->db->update('t_anggota', array('status_verif' => 'sudah'));	
		}
		else
		{return 'gagal';}
			
	}
	//End query anggota
}
?>