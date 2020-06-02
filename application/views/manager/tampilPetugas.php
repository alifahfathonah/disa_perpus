<h1>Hak Akses Petugas</h1><br />

<?php
if(!empty($notif))
{echo '<div class="'.$type.'">'.$notif.'</div><br/>';}
else
{NULL;}
?>

<table border="1" align="center">
    <tr align="center" id="judul">
    	<td>Nama Petugas</td>
        <td>Diijinkan mengubah dan <br /> menghapus data</td>
        <td>Aksi</td> 
        <img 
        align="middle"       
    </tr>
    <?php
	$x=1;
    foreach($petugas as $row){
		
	if($x%2==0)
	{$warna = "#FC6";}
	else
	{$warna = NULL;}
	?>
    <tr align="center" bgcolor="<?php echo $warna;?>">
    	<td><?php echo $row->nama_petugas; ?></td>
        <td>
        <?php
        if($row->hakakses == 'tidak')
		{echo img(array('src' => 'images/icon/off.ico', 'title' => 'Tidak diijinkan'));}
		else
		{echo img(array('src' => 'images/icon/on.ico', 'title' => 'Diijinkan'));}
		?>
        </td>
        <td>
        <?php
        if($row->hakakses == 'tidak')
		{echo anchor('manager/ubahHakakses/on/'.$row->kode_petugas, 'Aktifkan');}
		else
		{echo anchor('manager/ubahHakakses/off/'.$row->kode_petugas, 'Matikan');}
		?>
        </td>
    </tr>
    <?php $x++;} ?>
</table>
