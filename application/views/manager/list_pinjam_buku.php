<center><h1>Laporan Buku yang Dipinjam </h1><br /><h2>Tahun <?php echo date('Y');?></h2></center>
<br />
<table border="1" align="center">
<tr>
	<td width="100">Laporan Bulan</td>
    <td width="50">Print</td>
</tr>
<?php
$month = date('m');
for($x = 1 ; $x <= $month ; $x++){
	switch($x)
	{
		case 1: $bulan = "Januari";
		break;
		case 2: $bulan = "Februari";
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
echo '
<tr>
	<td>'.$bulan.'</td>
    <td align="center">'.anchor('manager/peminjamanBuku/'.$bulan.'/'.$x, img('images/icon/printer.ico'), 'title="Print Laporan"').'</td>
</tr>
';
} ?>

</table>