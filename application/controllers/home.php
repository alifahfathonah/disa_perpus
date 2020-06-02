<?php
class Home extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('mperpus');
		$this->load->model('mbuku');
		$this->load->model('manggota');
		$this->load->model('mpetugas');
		$this->load->model('mtransaksi');
	}
	
	function index()
	{	
		$hasil = $this->mbuku->getBuku('', '', '');
		
		$config['base_url'] = base_url().'index.php/home/index/';
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
		
		$data['buku'] = $this->mbuku->getBuku('', $config['per_page'], $offset);
		$data['rank'] = $this->mbuku->rank_buku();
		$data['petugas'] = $this->mpetugas->getPetugas('');
		$this->template->load('template2', 'buku_list', $data);
	}
	
	function form_daftar()
	{
		$data['petugas'] = $this->mpetugas->getPetugas('');
		$data['rank'] = $this->mbuku->rank_buku();
		$data['kode'] = $this->mperpus->getKode('t_anggota', 'kode_anggota');
		$this->template->load('template2', 'daftar_baru', $data);	
	}
	
	function daftar()
	{
		$config['upload_path'] = './images/foto/';
		$config['allowed_types'] = 'gif|jpg|png|bmp';

		$this->load->library('upload', $config);
		if(!$this->upload->do_upload())
		{
			$error = array('error' => $this->upload->display_errors());
			$data = array('upload_data' => NULL);
		}
		
		$this->manggota->insert_anggota();
		
		$kode = $this->input->post('kode');
		
		$data['type'] = "notif";
		$data['notif'] = "Pendaftaran berhasil. Nomor Verifikasi anda adalah '".$kode."'. Hubungi perpustakaan kami untuk mem-verifikasi keanggotaan anda 			
		selanjutnya";
		
		$hasil = $this->mbuku->getBuku('', '', '');
		
		$config['base_url'] = base_url().'index.php/home/index/';
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
		
		$data['buku'] = $this->mbuku->getBuku('', $config['per_page'], $offset);
		$data['rank'] = $this->mbuku->rank_buku();
		$data['petugas'] = $this->mpetugas->getPetugas('');
		$this->template->load('template2', 'buku_list', $data);
	}
	
	function cariBuku()
	{
		$cari = $this->uri->segment(3);
		$data['buku'] = $this->mbuku->cariBuku($cari);
		$this->load->view('bukulist', $data);
	}
	
	function detail_buku()
	{
		$cari = $this->uri->segment(3);	
		$data['row'] = $this->mbuku->detail_buku($cari);
		$this->load->view('detail_buku', $data);
	}
	
	function masuk()
	{
		$user = $this->input->post('nama');
		$pass = md5($this->input->post('password'));
		
		$data = $this->mperpus->get_login($user, $pass);
		if(!empty($data->level))
		{$level = $data->level;}
		else
		{$level = NULL;}
		
		
		$session = array('user' => $user,
						 'level' => $level);
		$this->session->set_userdata($session);

		$this->menu();
	}
	
	function menu()
	{
		if($this->session->userdata('level') == 2)
		{
			$data = $this->mperpus->getName($this->session->userdata('level'));
			$this->session->set_userdata(array('nama' => $data->nama_petugas,
											   'status' => $data->hakakses));
			redirect('petugas/getPeminjaman');
		}
		elseif($this->session->userdata('level') == 3)
		{
			$data = $this->mperpus->getName($this->session->userdata('level'));
			$this->session->set_userdata(array('nama' => $data->nama_petugas));
			redirect('manager/laporan');
		}
		else
		{
			echo '<script type="text/javascript">
			alert("Username / password salah")
			location.href="'.base_url().'/index.php/home/logout"
			</script>';
		}
	}
	
	function logout()
	{
		$this->session->sess_destroy();
		redirect('home');
	}
}
