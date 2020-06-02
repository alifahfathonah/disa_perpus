<?php
date_default_timezone_set('Asia/Jakarta');
$this->fpdf->FPDF("P","cm","A4");
$this->fpdf->SetMargins(1,1,1);
$this->fpdf->AliasNbPages();
$this->fpdf->AddPage();
$this->fpdf->SetFont('Times','B',18);
$this->fpdf->Cell(19,0.7,'Mari Membaca Library',0,0,'C');
$this->fpdf->Ln();
$this->fpdf->SetFont('helvetica','',8);
$this->fpdf->Cell(19,0.5,'Jl. Cagak Lagadar Telp:08986814554 Email:mmlibrary@gmail.com',0,0,'C');
$this->fpdf->Ln(1);
 
/* -------------- Header Halaman selesai ------------------------------------------------*/
 
$this->fpdf->SetMargins(1,1,1); 
$this->fpdf->SetFont('Times','B',12);
$this->fpdf->Cell(19,0.5,'LAPORAN PEMINJAMAN',0,0,'C');
$this->fpdf->Ln(1);
$this->fpdf->Line(1,3.5,20,3.5);
$this->fpdf->Line(1,3.55,20,3.55);
$this->fpdf->Ln();

$count=count($datapinjam);
 if($count>0)
 {
	$this->fpdf->SetFont('helvetica','',8);
	$this->fpdf->Cell(19,0.5,'Bulan : '.$bulan,0,0,'L');
	$this->fpdf->Ln();

	$this->fpdf->SetFont('Times','B',9);
	$this->fpdf->Cell(0.5, 1, 'No', 1, '0', 'C');
	$this->fpdf->Cell(4, 1, 'Nama Petugas', 1, '0', 'C');
	$this->fpdf->Cell(5, 1, 'Nama Anggota', 1, '0', 'C');
	$this->fpdf->Cell(7, 1, 'Judul Buku', 1, '0', 'C');
	$this->fpdf->Cell(2.5, 1, 'Tgl Peminjaman', 1, '0', 'C');
	 $no=1;
	 foreach($datapinjam as $data)
	{
		$this->fpdf->Ln();
		$this->fpdf->SetFont('Times','',7);
		$this->fpdf->Cell(0.5, 0.7, $no, 1, '0', 'C');
		$this->fpdf->Cell(4, 0.7, $data->nama_petugas, 1, '0', 'L');
		$this->fpdf->Cell(5, 0.7, $data->nama_anggota, 1, '0', 'L');
		$this->fpdf->Cell(7, 0.7, substr($data->judul, 0, 47), 1, '0', 'L');
		$this->fpdf->Cell(2.5, 0.7, $data->tgl_peminjaman, 1, '0', 'L');
		$no++;
	}
}
else
{	
	$this->fpdf->Ln(3);
	$this->fpdf->SetFont('Times','B',14);
	$this->fpdf->Cell(19,0.5,'LAPORAN PEMINJAMAN KOSONG',0,0,'C');
}
$this->fpdf->SetMargins(1,1,1);
$this->fpdf->SetY(-3); 
$this->fpdf->SetFont('Times','',10);
$this->fpdf->Cell(9.5, 0.5, 'Printed on : '.date('d/m/Y H:i').' | Mari Membaca Library',0,'LR','L');

$this->fpdf->Cell(9.5, 0.5, 'Page '.$this->fpdf->PageNo().'/{nb}',0,0,'R');
 
$this->fpdf->Output();
?>