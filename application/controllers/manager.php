<?php
class Manager extends CI_Controller
{
	function __construct()
	{	
		parent::__construct();
		$this->load->model('mlaporan');
		$this->load->model('mpetugas');
		$this->load->model('mbuku');
		$this->load->model('mperpus');
		
		$this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, no-transform, max-age=0, post-check=0, pre-check=0");
		$this->output->set_header("Pragma: no-cache");
	}
	
	//laporan
	function laporan()
	{
		$data['grafik'] = $this->mlaporan->getGrafik();
		$this->template->load('template', 'manager/laporan', $data);
	}
	
	function peminjamanBuku()
	{
		$month = $this->uri->segment(4);
		if(empty($month))
		{
			$this->template->load('template', 'manager/list_pinjam_buku');	
		}
		else
		{
			$data['pinjambuku'] = $this->mlaporan->peminjamanBuku($month);
			$data['bulan'] = $this->uri->segment(3);
			$this->load->view('manager/peminjaman_buku', $data);
		}
	}
	
	function anggotaPinjam()
	{
		$month = $this->uri->segment(4);
		if(empty($month))
		{
			$this->template->load('template', 'manager/list_anggota_pinjam');	
		}
		else
		{
			$data['anggotapinjam'] = $this->mlaporan->anggotaPinjam($month);
			$data['bulan'] = $this->uri->segment(3);
			$this->load->view('manager/anggota_pinjam', $data);	
		}
		
	}
	
	function dataPeminjaman()
	{
		$month = $this->uri->segment(4);
		if(empty($month))
		{
			$this->template->load('template', 'manager/list_data_pinjam');	
		}
		else
		{
			$data['datapinjam'] = $this->mlaporan->dataPinjam($month);
			$data['bulan'] = $this->uri->segment(3);
			$this->load->view('manager/data_peminjaman', $data);
		}	
	}
	
	function hakakses()
	{
		$data['petugas'] = $this->mpetugas->getPetugas('');
		$this->template->load('template', 'manager/tampilPetugas', $data);
	}
	
	function ubahHakakses()
	{
		$status = $this->uri->segment(3);
		$kode = $this->uri->segment(4);
		$this->mpetugas->ubahHakakses($status, $kode);
		redirect('manager/hakakses');
	}
	//end laporan
	//petugas
	function dataPetugas()
	{
		$data['value'] = "";
		$data['petugas'] = $this->mpetugas->getPetugas('');
		$data['kode'] = $this->mperpus->getKode('t_petugas', 'kode_petugas');
		$this->template->load('template', 'manager/form_petugas', $data);
	}
	
	function editPetugas()
	{
		$id = $this->uri->segment(3);
		$data['value'] = $this->mpetugas->getPetugas($id);
		$data['petugas'] = $this->mpetugas->getPetugas('');
		$this->template->load('template', 'manager/form_petugas', $data);	
	}
	
	function changePetugas()
	{
		$this->mpetugas->change_petugas();
		$this->dataPetugas();
	}
	
	function deletePetugas()
	{
		$id = $this->uri->segment(3);
		$this->mpetugas->deletePetugas($id);
		redirect("manager/dataPetugas");		
	}
	//end petugas
	//edit akun
	function editAkun()
	{
		$data['petugas'] = $this->mpetugas->getPetugas($this->session->userdata('user'));
		$this->template->load('template', 'manager/edit_akun', $data);	
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
			location.href="'.base_url().'/index.php/manager/editAkun"
			</script>';	
		}
	}
	//end edit akun
}