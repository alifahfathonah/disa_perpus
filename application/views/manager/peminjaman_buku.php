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
 
$this->fpdf->SetMargins(4,1,1);
$this->fpdf->SetFont('Times','B',12);
$this->fpdf->Cell(19,0.5,'LAPORAN BUKU YANG DIPINJAM',0,0,'C');
$this->fpdf->Ln(1);
$this->fpdf->Line(1,3.5,20,3.5);
$this->fpdf->Line(1,3.55,20,3.55);
$this->fpdf->Ln();

$count=count($pinjambuku);
 if($count>0)
 {
$this->fpdf->SetFont('helvetica','',8);
$this->fpdf->Cell(19,0.5,'Bulan : '.$bulan,0,0,'L');
$this->fpdf->Ln();	 
	 
$this->fpdf->SetFont('Times','B',9);
$this->fpdf->Cell(0.5, 1, 'No', 1, '0', 'C');
$this->fpdf->Cell(10, 1, 'Nama Buku', 1, '0', 'C');
$this->fpdf->Cell(3, 1, 'Banyak Dipinjam', 1, '0', 'C');
 $no=1;
 foreach($pinjambuku as $data)
{
    $this->fpdf->Ln();
    $this->fpdf->SetFont('Times','',7);
    $this->fpdf->Cell(0.5, 0.7, $no, 1, '0', 'C');
    $this->fpdf->Cell(10, 0.7, $data->judul, 1, '0', 'L');
    $this->fpdf->Cell(3, 0.7, $data->hitung.' Kali', 1, '0', 'L');
    $no++;
}
}
else
{	
	$this->fpdf->Ln(3);
	$this->fpdf->SetFont('Times','B',14);
	$this->fpdf->Cell(13,0.5,'LAPORAN BUKU YANG DIPINJAM',0,0,'C');
}
$this->fpdf->SetMargins(1,1,1);
$this->fpdf->SetY(-3); 
$this->fpdf->SetFont('Times','',10);
$this->fpdf->Cell(9.5, 0.5, 'Printed on : '.date('d/m/Y H:i').' | Mari Membaca Library',0,'LR','L');

$this->fpdf->Cell(9.5, 0.5, 'Page '.$this->fpdf->PageNo().'/{nb}',0,0,'R');
 
$this->fpdf->Output();
?>