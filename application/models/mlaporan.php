<?php
class Mlaporan extends CI_Model
{
	function __construct()
	{
		parent::__construct();
		date_default_timezone_set('Asia/Krasnoyarsk');
	
	}
	
	//query laporan
	function peminjamanBuku($bulan)
	{
		$where = array(	"MONTH(tgl_peminjaman)" => $bulan,
						"YEAR(tgl_peminjaman)" => date('Y'));
		$this->db->select("*, COUNT(*) AS hitung");
		$this->db->group_by("kode_buku");
		$query = $this->db->get_where("peminjaman_buku", $where);
		return $query->result();
	}
	
	function anggotaPinjam($bulan)
	{
		$where = array(	"MONTH(tgl_peminjaman)" => $bulan,
						"YEAR(tgl_peminjaman)" => date('Y'));
		$this->db->select("*, COUNT(*) AS hitung");
		$this->db->group_by("kode_anggota");
		$query = $this->db->get_where("anggota_pinjam", $where);
		return $query->result();	
	}
	
	function dataPinjam($bulan)
	{
		$where = array(	"MONTH(tgl_peminjaman)" => $bulan,
						"YEAR(tgl_peminjaman)" => date('Y'));
		$query = $this->db->get_where("data_peminjaman", $where);
		return $query->result();
	}
	
	function getGrafik()
	{
		$query = $this->db->get('grafik_peminjaman')->result();
		
		if(!empty($query))
		{
			foreach($query as $row)
			{
				switch($row->bulan)
				{
					case 1: $bulan = "Januari";
					break;
					case 2: $Bulanan = "Februari";
					break;
					case 3: $bulan = "Maret";
					break;
					case 4: $bulan = "April";
					break;
					case 5: $bulan = "Mei";
					break;
					case 6: $bulan = "Juni";
					break;
					case 7: $bulan = "Juli";
					break;
					case 8: $bulan = "Agustus";
					break;
					case 9: $bulan = "September";
					break;
					case 10: $bulan = "Oktober";
					break;
					case 11: $bulan = "November";
					break;
					case 12: $bulan = "Desember";
					break;
					
				}
				$data_bulan[] = $bulan;
				$data_pinjam[] = $row->jumlah;
			}
			
			$ff = new graph();
			$ff->set_data( $data_pinjam );
			$ff->title( 'Grafik Peminjaman Buku Tahun '.date('Y'), '{font-size: 14px; color: #3D5570;font-family:calibri;}' );
			$ff->line_dot( 3, 5, '#8B6122', 'Banyak Meminjam', 10 );
			$ff->bg_colour = '#FFFFFF';
			$ff->x_axis_colour( '#818D9D', '#ADB5C7' );
			$ff->y_axis_colour( '#818D9D', '#ADB5C7' );
			$ff->set_x_labels( $data_bulan );
			$ff->set_y_max( max($data_pinjam)+1 );
			$ff->y_label_steps( count($data_pinjam) );
			$ff->set_y_legend( 'Jumlah Peminjaman', 12, '#3D5570' );
			$ff->set_x_legend( 'Bulan Ke-', 12, '#3D5570' );
			$ff->set_output_type('js');
			$ff->width = '90%';
			$ff->height = '300';
			return $ff->render();
		}
		else
		{return "Data Kosong";}
	}
	//End laporan
}
?>