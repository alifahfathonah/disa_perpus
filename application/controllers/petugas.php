<?php
class Petugas extends CI_Controller
{
	function __construct()
	{	
		parent::__construct();
		$this->load->model('mperpus');
		$this->load->model('mpetugas');
		$this->load->model('mtransaksi');
		$this->load->model('mbuku');
		$this->load->model('manggota');
		$this->load->model('mpenerbit');
		$this->load->model('mkategori');
		
		$this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, no-transform, max-age=0, post-check=0, pre-check=0");
		$this->output->set_header("Pragma: no-cache");
	}
	
	//function buku
	function dataBuku()
	{
		$data['valuekategori'] = "";
		$data['valuepenerbit'] = "";
		
		$data['kategori'] = $this->mkategori->getKategori('');
		$data['penerbit'] = $this->mpenerbit->getPenerbit('');
		$data['value'] = "";
		
		$hasil = $this->mbuku->getBuku('', '', '');
		
		$config['base_url'] = base_url().'index.php/petugas/dataBuku/';
		$config['total_rows'] = count($hasil);
		$config['per_page'] = 3;
		$config['uri_segment'] = 3;
		$config['next_link'] = 'Selanjutnya';
		$config['prev_link'] = 'Sebelumnya';
		$config['first_link'] = 'Awal';
		$config['last_link'] = 'Akhir';
		
		$this->pagination->initialize($config);
		
		$offset = $this->uri->segment(3);
		if(empty($offset))
		{$offset = 0;}
		
		$data['buku'] = $this->mbuku->getBuku('', $config['per_page'], $offset);
		$data['kode'] = $this->mperpus->getKode('t_buku', 'kode_buku');
		$this->template->load('template', 'petugas/form_buku', $data);
	}
	
	function editBuku()
	{
		$id = $this->uri->segment(3);
		$data['value'] = $this->mbuku->getBuku($id, '', '');
		$data['valuekategori'] = $data['value']->kode_kategori;
		$data['valuepenerbit'] = $data['value']->kode_penerbit;
		
		$data['kategori'] = $this->mkategori->getKategori('');
		$data['penerbit'] = $this->mpenerbit->getPenerbit('');
		
		$hasil = $this->mbuku->getBuku('', '', '');
		
		$config['base_url'] = base_url().'index.php/petugas/dataBuku/';
		$config['total_rows'] = count($hasil);
		$config['per_page'] = 3;
		$config['uri_segment'] = 3;
		$config['next_link'] = 'Selanjutnya';
		$config['prev_link'] = 'Sebelumnya';
		$config['first_link'] = 'Awal';
		$config['last_link'] = 'Akhir';
		
		$this->pagination->initialize($config);
		
		$offset = $this->uri->segment(3);
		if(empty($offset))
		{$offset = 0;}
		
		$data['buku'] = $this->mbuku->getBuku('', $config['per_page'], $offset);
		$this->template->load('template', 'petugas/form_buku', $data);	
	}
	
	function changeBuku()
	{
		$config['upload_path'] = './images/cover/';
		$config['allowed_types'] = 'gif|jpg|png|bmp';

		$this->load->library('upload', $config);
		if(!$this->upload->do_upload())
		{
			$error = array('error' => $this->upload->display_errors());
			$data = array('upload_data' => NULL);
		}
					
		$this->mbuku->change_buku();
		$this->dataBuku();
	}
	
	function deleteBuku()
	{
		$id = $this->uri->segment(3);
		$this->mbuku->deleteBuku($id);
		redirect("petugas/dataBuku");		
	}
	
	function caribuku()
	{
		$kategori = $this->input->post('kategori');
		$cari = $this->input->post('cari');
		if(empty($cari))
		{redirect('petugas/databuku');}
		
		$data['valuekategori'] = "";
		$data['kategori'] = $this->mkategori->getkategori('');
		$data['value'] = "";
		$data['buku'] = $this->mbuku->caribuku($kategori, $cari);
		$this->template->load('template', 'petugas/form_buku', $data);	
	}
	//End buku
	
	//function anggota
	function dataAnggota()
	{
		$data['value'] = "";
		$data['anggota'] = $this->manggota->getAnggota('');
		$this->template->load('template', 'petugas/form_anggota', $data);
	}
	
	function editAnggota()
	{
		$id = $this->uri->segment(3);
		$data['value'] = $this->manggota->getAnggota($id);
		$data['anggota'] = $this->manggota->getAnggota('');
		$this->template->load('template', 'petugas/form_anggota', $data);	
	}
	
	function changeAnggota()
	{
		$config['upload_path'] = './images/foto/';
		$config['allowed_types'] = 'gif|jpg|png|bmp';

		$this->load->library('upload', $config);
		if(!$this->upload->do_upload())
		{
			$error = array('error' => $this->upload->display_errors());
			$data = array('upload_data' => NULL);
		}
		
		$this->manggota->change_anggota();
		$this->dataAnggota();
	}
	
	function deleteAnggota()
	{
		$id = $this->uri->segment(3);
		$this->manggota->deleteAnggota($id);
		redirect("petugas/dataAnggota");		
	}
	//End anggota
	//penerbit
	function dataPenerbit()
	{
		$data['value'] = "";
		$data['penerbit'] = $this->mpenerbit->getPenerbit('');
		$data['kode'] = $this->mperpus->getKode('t_penerbit', 'kode_penerbit');
		$this->template->load('template', 'petugas/form_penerbit', $data);
	}
	
	function editPenerbit()
	{
		$id = $this->uri->segment(3);
		$data['value'] = $this->mpenerbit->getPenerbit($id);
		$data['penerbit'] = $this->mpenerbit->getPenerbit('');
		$this->template->load('template', 'petugas/form_penerbit', $data);	
	}
	
	function changePenerbit()
	{
		$this->mpenerbit->change_penerbit();
		$this->dataPenerbit();
	}
	
	function deletePenerbit()
	{
		$id = $this->uri->segment(3);
		$this->mpenerbit->deletePenerbit($id);
		redirect("petugas/dataPenerbit");		
	}
	
	function caripenerbit()
	{
		$cari = $this->input->post('cari');
		if(empty($cari))
		{redirect('petugas/datapenerbit');}
		
		$data['value'] = "";
		$data['penerbit'] = $this->mpenerbit->caripenerbit($cari);
		$this->template->load('template', 'petugas/form_penerbit', $data);
	}
	//end pepenerbit
	//function kategori
	function dataKategori()
	{
		$data['value'] = "";
		$data['kategori'] = $this->mkategori->getKategori('');
		$data['kode'] = $this->mperpus->getKode('t_kategori', 'kode_kategori');
		$this->template->load('template', 'petugas/form_kategori', $data);
	}
	
	function editKategori()
	{
		$id = $this->uri->segment(3);
		$data['value'] = $this->mkategori->getKategori($id);
		$data['kategori'] = $this->mkategori->getKategori('');
		$this->template->load('template', 'petugas/form_kategori', $data);	
	}
	
	function changeKategori()
	{
		$this->mkategori->change_kategori();
		$this->dataKategori();
	}
	
	function deleteKategori()
	{
		$id = $this->uri->segment(3);
		$this->mkategori->deleteKategori($id);
		redirect("petugas/dataKategori");		
	}
	
	function carikategori()
	{
		$cari = $this->input->post('cari');
		if(empty($cari))
		{redirect('petugas/datakategori');}
		
		$data['value'] = "";
		$data['kategori'] = $this->mkategori->carikategori($cari);
		$this->template->load('template', 'petugas/form_kategori', $data);
	}
	//end kategori
	//keanggotaan
	function form_verifikasi()
	{
		$data['kode_verif'] = $this->uri->segment(3);
		$this->template->load('template', 'petugas/kode_verif', $data);	
	}
	
	function verifikasi()
	{
		$kode = $this->input->post('kode');
		$kode_verif = $this->input->post('kode_verif');
		if(empty($kode))
		{
			$data['verifikasi'] = $this->manggota->verifikasi();
			$this->template->load('template', 'petugas/form_verifikasi', $data);	
		}
		else
		{
			if($this->manggota->change_status($kode, $kode_verif) == 'gagal')
			{
				$data['type'] = "error";
				$data['notif'] = "Kode tidak cocok";
			}
			else
			{
				$data['type'] = "notif";
				$data['notif'] = "Verifikasi berhasil";
			}
			
			$data['verifikasi'] = $this->manggota->verifikasi();
			$this->template->load('template', 'petugas/form_verifikasi', $data);
		}		
	}
	
	function buatKartu()
	{
		$kode = $this->uri->segment(3);
		$this->manggota->getKartu($kode);
		$data['kartu'] = $this->manggota->getAnggota($kode);
		$this->load->view('petugas/kartu_anggota', $data);
	}
	//end keanggotaan
	//transaksi
	function getPeminjaman()
	{
		$hasil = $this->mtransaksi->getPeminjaman('','','');
		
		$config['base_url'] = base_url().'index.php/petugas/getPeminjaman/';
		$config['total_rows'] = count($hasil);
		$config['per_page'] = 5;
		$config['uri_segment'] = 3;
		$config['next_link'] = 'Selanjutnya';
		$config['prev_link'] = 'Sebelumnya';
		$config['first_link'] = 'Awal';
		$config['last_link'] = 'Akhir';
		
		$this->pagination->initialize($config);
		
		$offset = $this->uri->segment(3);
		if(empty($offset))
		{$offset = 0;}
		
		$data['pinjam']	= $this->mtransaksi->getPeminjaman('', $config['per_page'], $offset);
		$data['kode'] = $this->mperpus->getKode('t_peminjaman', 'kode_peminjaman');
		$this->template->load('template', 'petugas/peminjaman', $data);
	}
	
	function peminjaman()
	{
		$hasil = $this->mtransaksi->peminjaman();
			
		echo '<script type="text/javascript">
		alert("'.$hasil.'")
		location.href="'.base_url().'/index.php/petugas/getPeminjaman"
		</script>';	
	}
	
	function pengembalian()
	{
		$kodepinjam = $this->uri->segment(3);
		$kodebuku = $this->uri->segment(4);
		$denda = $this->uri->segment(5);
		
		$this->mtransaksi->pengembalian($kodepinjam, $kodebuku, $denda);
		redirect('petugas/getPeminjaman');
	}
	
	function cariPinjam()
	{
		$cari = $this->input->post('cari');
		
		if(empty($cari))
		{redirect('petugas/getPeminjaman');}
		else{
		$hasil = $this->mtransaksi->getPeminjaman('','','');
		
		$config['base_url'] = base_url().'index.php/petugas/getPeminjaman/';
		$config['total_rows'] = count($hasil);
		$config['per_page'] = 5;
		$config['uri_segment'] = 3;
		$config['next_link'] = 'Selanjutnya';
		$config['prev_link'] = 'Sebelumnya';
		$config['first_link'] = 'Awal';
		$config['last_link'] = 'Akhir';
		
		$this->pagination->initialize($config);
		
		$offset = $this->uri->segment(3);
		if(empty($offset))
		{$offset = 0;}
		
		$data['pinjam']	= $this->mtransaksi->getPeminjaman($cari, $config['per_page'], $offset);
		$data['kode'] = $this->mperpus->getKode('t_peminjaman', 'kode_peminjaman');
		$this->template->load('template', 'petugas/peminjaman', $data);
		}
	}
	//end transaksi
	//edit akun
	function editAkun()
	{
		$data['petugas'] = $this->mpetugas->getPetugas($this->session->userdata('user'));
		$this->template->load('template', 'petugas/edit_akun', $data);	
	}
	
	function changeAkun()
	{
		$passlama = $this->input->post('passlama');
		$password = $this->input->post('password');
		if(md5($password) == $passlama)
		{
			$this->mpetugas->change_petugas();
			$this->mpetugas->change_akun();
			echo '<script type="text/javascript">
			alert("Berhasil disimpan, anda harus login kembali")
			location.href="'.base_url().'/index.php/home/logout"
			</script>';	
		}
		else
		{
			echo '<script type="text/javascript">
			alert("Maaf, password lama anda salah")
			location.href="'.base_url().'/index.php/petugas/editAkun"
			</script>';	
		}
	}
	//end edit akun
}