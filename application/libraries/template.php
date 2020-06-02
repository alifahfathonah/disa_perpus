<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
/**
 * CODEIGNITER template library
 *
 * @author  Jérôme Jaglale
 * @url     http://maestric.com/doc/php/codeigniter_template
 */
 
class Template
{
      var $template_data = array();
	  
      function set($name, $value)
      {
         $this->template_data[$name] = $value;
      }
 
      function load($template = '', $view = '' , $view_data = array(), $return = FALSE)
      {
         $this->CI =& get_instance();
         $this->set('contents', $this->CI->load->view($view, $view_data, TRUE));
         return $this->CI->load->view($template, $this->template_data, $return);
		 $this->menu();
      }
	  
	  function menu($level)
	  {
		 if($level == 2)
		{
			echo "
				<li> ".anchor('petugas/getPeminjaman', 'Peminjaman Buku')." </li>
				<li> <a href='#'> Olah Data</a>
        			<ul>
						<li> ".anchor('petugas/dataBuku', 'Buku')." </li>
						<li> ".anchor('petugas/dataAnggota', 'Anggota')." </li>
						<li> ".anchor('petugas/dataPenerbit', 'Penerbit')." </li>
						<li> ".anchor('petugas/dataKategori', 'Kategori Buku')." </li>
           			</ul>
				</li>
				<li> ".anchor('petugas/verifikasi', 'Anggota Baru')." </li>
				<li> ".anchor('petugas/editAkun', 'Edit Akun')." </li>
				<li> ".anchor('home/logout', 'Keluar')." </li>";
		}
		elseif($level == 3)
		{
			echo "
			<li> ".anchor('manager/hakakses', 'Hak Akses Petugas')." </li>
			<li> ".anchor('manager/laporan', 'Laporan')."
        			<ul>
						<li> ".anchor('manager/dataPeminjaman', 'Laporan Peminjaman')." </li>
						<li> ".anchor('manager/peminjamanBuku', 'Laporan Buku yang Dipinjam')." </li>
						<li> ".anchor('manager/anggotaPinjam', 'Laporan Anggota yang Meminjam')." </li>
           			</ul>
			</li>
			<li> ".anchor('manager/dataPetugas', 'Data Petugas')." </li>
			<li> ".anchor('manager/editAkun', 'Edit Akun')." </li>
			<li> ".anchor('home/logout', 'Keluar')." </li>";
		}
		else
		{
			redirect('home/logout');	
		}
      }
	  
	  function warna($x)
	  {
		  if($x % 2 == 0)
		  {$id = "warna";}
		  else
		  {$id = "putih";}
		  
		  return $id;
		}
}
 
/* End of file Template.php */
/* Location: ./application/libraries/Template.php */
?>