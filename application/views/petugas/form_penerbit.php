<h1>Data Penerbit</h1><br />
<?php
if(!empty($kode))
{$kodepenerbit = $kode->hasil+1;}
else
{$kodepenerbit = NULL;}

if(empty($value))
{
  $value->kode_penerbit = "PT00".$kodepenerbit;
  $value->nama_penerbit= "";
  $value->alamat_penerbit = "";
  $value->tlp_penerbit = "";
}
?>
<form method="post" action="<?php echo base_url()?>index.php/petugas/changePenerbit"/>
<input type="hidden" name="kode" value="<?php echo $value->kode_penerbit;?>"/>
<table border="0" align="center">
<tr>
	<td>Nama</td>
    <td>:</td>
    <td><textarea name="nama"><?php echo $value->nama_penerbit;?></textarea></td>
</tr>
<tr>
	<td>Alamat</td>
    <td>:</td>
    <td><textarea name="alamat"><?php echo $value->alamat_penerbit;?></textarea></td>
</tr>
<tr>
	<td>Telp</td>
	<td>:</td>
	<td><input type="text" name="telp" value="<?php echo $value->tlp_penerbit;?>"/></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan / Edit"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>

<br />

<table border="1" align="center">
    <tr id="judul">
    	<td>Nama Penerbit / Alamat</td>
        <td>Telp</td>
        <?php
        if($this->session->userdata('status') == "ya")
		{echo '<td colspan="2">Aksi</td>';}
		?>
    </tr>
    <?php
	$x=1;
		
    foreach($penerbit as $row){
		
	if($x%2==0)
	{$warna = "#FC6";}
	else
	{$warna = NULL;}
	?>
    <tr bgcolor="<?php echo $warna;?>">
    	<td><?php echo $row->nama_penerbit."<br/>".$row->alamat_penerbit; ?></td>
        <td><?php echo $row->tlp_penerbit; ?> </td>
   		<?php if($this->session->userdata('status') == "ya"){ ?>
        <td><?php echo anchor('petugas/editPenerbit/'.$row->kode_penerbit, img('images/icon/pencil.png'), 'title="Edit"');?></td>
        <td><?php echo anchor('petugas/deletePenerbit/'.$row->kode_penerbit, img('images/icon/delete.png'), array('title'=>'Hapus', 'onClick'=>"return confirm('Anda yakin?')"));?></td>
    <?php }?>
    </tr>
    <?php $x++;} ?>
</table>