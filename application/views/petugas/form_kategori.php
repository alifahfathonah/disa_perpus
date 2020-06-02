<h1>Data Kategori</h1><br />
<?php
if(!empty($kode))
{$kodekategori = $kode->hasil+1;}
else
{$kodekategori = NULL;}

if(empty($value))
{
  $value->kode_kategori = "KT00".$kodekategori;
  $value->nama_kategori = "";
  $kode = "";
}
?>
<form method="post" action="<?php echo base_url()?>index.php/petugas/changeKategori"/>
<input type="hidden" name="kode" value="<?php echo $value->kode_kategori;?>"/>
<table border="0" align="center">
<tr>
	<td>Kategori</td>
    <td>:</td>
    <td><textarea name="nama"><?php echo $value->nama_kategori;?></textarea></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan / Edit"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>

<br />

<table border="1" align="center">
    <tr id="judul">
    	<td>Nama kategori</td>
        <?php
        if($this->session->userdata('status') == "ya")
		{echo '<td colspan="2">Aksi</td>';}
		?>
    </tr>
    <?php
	$x=1;
    foreach($kategori as $row){
		
	if($x%2==0)
	{$warna = "#FC6";}
	else
	{$warna = NULL;}
	?>
    <tr bgcolor="<?php echo $warna;?>">
    	<td><?php echo $row->nama_kategori; ?></td>
        <?php if($this->session->userdata('status') == "ya"){ ?>
        <td><?php echo anchor('petugas/editKategori/'.$row->kode_kategori, img('images/icon/pencil.png'), 'title="Edit"');?></td>
        <td><?php echo anchor('petugas/deleteKategori/'.$row->kode_kategori, img('images/icon/delete.png'), array('title'=>'Delete', 'onClick'=>"return confirm('Anda yakin?')"));?></td>
    <?php }?>
    </tr>
    <?php $x++;} ?>
</table>