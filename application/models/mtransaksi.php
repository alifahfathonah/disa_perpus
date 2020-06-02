<?php
class Mtransaksi extends CI_Model
{
	function __construct()
	{
		parent::__construct();	
	}
	
	function getPeminjaman($id, $perhal, $offset)
	{
		if(empty($id) && empty($perhal) && empty($offset))
		{
			$query = $this->db->get('get_peminjaman');
			return $query->result();
		}
		elseif(empty($id) && !empty($perhal) && $offset >= 0)
		{
			$this->db->limit($perhal, $offset);	
			$query = $this->db->get('get_peminjaman');
			return $query->result();
		}
		else
		{
			$query = $this->db->get_where("get_peminjaman", array("kode_anggota" => $id));	
			return $query->result();	
		}		
	}
	
	function peminjaman()
	{
		$query = $this->db->get_where("status_anggota", array("kode_anggota" => $this->input->post('anggota')))->row();
		
		if(empty($query->status_verif) && empty($query->tgl_kembali))
		{
			$status = NULL;
			$kembali = NULL;
		}
		else
		{
			$status = $query->status_verif;
			$kembali = $query->tgl_kembali;
		}
		
		$kodepinjam = $this->input->post('kodepinjam');
		$anggota = $this->input->post('anggota');
		$kodepetugas = $this->input->post('kodepetugas');
		$buku = $this->input->post('buku');
		$kodekembali = $this->input->post('kodekembali');
					
		if(($status == NULL) && ($kembali == NULL))
		{
			$this->db->query("CALL peminjaman(@hasil, '$kodepinjam', '$anggota', '$kodepetugas', '$buku', '$kodekembali')");
			return $this->db->query("SELECT @hasil as hasil")->row()->hasil;
		}
		else
		{return "Anggota tersebiut belum di verifikasi / masih meminjam buku";}
	}
	
	function pengembalian($kodepinjam, $kodebuku, $denda)
	{
		$this->db->query("CALL pengembalian('$kodepinjam', '$kodebuku', '$denda')");
	}
}
?>