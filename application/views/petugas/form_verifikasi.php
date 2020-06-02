<h1>Verifikasi Anggota Baru</h1><br />

<?php
if(!empty($notif))
{echo '<div class="'.$type.'">'.$notif.'</div><br/>';}
else
{NULL;}
?>

<form method="post" action="<?php echo base_url()?>index.php/petugas/verifikasi"/>
<table border="1" align="center">
    <tr align="center" id="judul">
    	<td>Nama Anggota</td>
        <td>Status Verifikasi</td>
        <td>Aksi</td>
        
    </tr>
    <?php
	$x=1;
    foreach($verifikasi as $row){
		
	if($x%2==0)
	{$warna = "#FC6";}
	else
	{$warna = NULL;}
	?>
    <tr align="center" bgcolor="<?php echo $warna;?>">
    	<td><?php echo $row->nama_anggota; ?></td>
        <td>
        <?php
        if($row->status_verif == 'belum')
		{echo img(array('src' => 'images/icon/delete.png', 'title' => 'Belum di verifikasi'));}
		else
		{echo img(array('src' => 'images/icon/check.png', 'title' => 'Sudah di verifikasi'));}
		?>
        </td>
        <td>
        <?php
        if($row->status_verif == 'belum')
		{echo anchor('petugas/form_verifikasi/'.$row->kode_anggota, 'Verifikasikan');}
		else
		{
			echo anchor('petugas/buatKartu/'.$row->kode_anggota, 'Buat Kartu Anggota');
			if($row->sisa > 0)
			{echo "<br/>".$row->sisa." hari lagi";}
			else
			{echo "<br/>Masa aktif habis";}
			
		}
		?>
        </td>
    </tr>
    <?php $x++;} ?>
</table>
</form>
