<h1>Data Petugas</h1><br />
<?php
if(!empty($kode))
{$kodepetugas = $kode->hasil+1;}
else
{$kodepetugas = NULL;}

if(empty($value))
{
  $value->kode_petugas = "PG00".$kodepetugas;
  $value->nama_petugas = "";
  $value->ym_user = "";
}
?>
<form method="post" action="<?php echo base_url()?>index.php/manager/changePetugas"/>
<input type="hidden" name="kode" value="<?php echo $value->kode_petugas;?>"/>
<table border="0" align="center">
<tr>
	<td>Nama Petugas</td>
    <td>:</td>
    <td><input type="text" name="nama" value="<?php echo $value->nama_petugas;?>"/></td>
</tr>
<tr>
	<td>YM Username</td>
	<td>:</td>
	<td><input type="text" name="ym" value="<?php echo $value->ym_user;?>"/></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan / Edit"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>

<br />

<table border="1" align="center">
    <tr id="judul">
    	<td>Nama Petugas</td>
        <td>Yahoo Messager</td>
        <td colspan="2">Aksi</td>
    </tr>
    <?php
	$x=1;
    foreach($petugas as $row){
		
	if($x%2==0)
	{$warna = "#FC6";}
	else
	{$warna = NULL;}
	?>
    <tr bgcolor="<?php echo $warna;?>">
    	<td><?php echo $row->nama_petugas; ?></td>
        <td><?php echo $row->ym_user; ?></td>
        <td><?php echo anchor('manager/editPetugas/'.$row->kode_petugas, img('images/icon/pencil.png'), 'title="Edit"');?></td>
        <td><?php echo anchor('manager/deletePetugas/'.$row->kode_petugas, img('images/icon/delete.png'), array('title'=>'Delete', 'onClick'=>"return confirm('Anda yakin?')"));?></td>
    </tr>
    <?php $x++;} ?>
</table>