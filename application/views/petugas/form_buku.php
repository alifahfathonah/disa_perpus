<h1>Data Buku</h1><br />
<?php
if(!empty($kode))
{$kodebuku = $kode->hasil+1;}
else
{$kodebuku = NULL;}

if(empty($value))
{
  $value->kode_buku = "KB00".$kodebuku;
  $value->kode_kategori = "";
  $value->kode_penerbit = "";
  $value->judul= "";
  $value->sinopsis = "";
  $value->pengarang = "";
  $value->thn_terbit = "";
  $value->cover_buku = "";
  $value->stok = "";
  $kode = "";
}
?>
<form method="post" action="<?php echo base_url()?>index.php/petugas/changeBuku" enctype="multipart/form-data"/>
<input type="hidden" name="kodebuku" value="<?php echo $value->kode_buku;?>"/>
<input type="hidden" name="cover" value="<?php echo $value->cover_buku;?>"/>
<table border="0" align="center">
<tr>
	<td>Judul</td>
    <td>:</td>
    <td><input type="text" name="judul" value="<?php echo $value->judul; ?>"/></td>
</tr>
<tr>
	<td>Kategori</td>
    <td>:</td>
    <td>
    	<?php
		foreach($kategori as $baris)
		{$kategori_option[$baris->kode_kategori] = $baris->nama_kategori;}
		echo form_dropdown('kategori', $kategori_option, $valuekategori);
		?>
    </td>
</tr>
<tr>
	<td>Pengarang</td>
    <td>:</td>
    <td><input type="text" name="pengarang" value="<?php echo $value->pengarang; ?>"/></td>
</tr>
<tr>
	<td>Penerbit</td>
    <td>:</td>
    <td>
    	<?php
		foreach($penerbit as $baris)
		{$penerbit_option[$baris->kode_penerbit] = $baris->nama_penerbit;}
		echo form_dropdown('penerbit', $penerbit_option, $valuepenerbit);
		?>
    </td>
</tr>
<tr>
	<td>Tahun Terbit</td>
    <td>:</td>
    <td><input type="text" name="tahun" size="5" value="<?php echo $value->thn_terbit; ?>"/></td>
</tr>
<tr>
	<td>Sinopsis</td>
    <td>:</td>
    <td><textarea name="sinopsis"><?php echo $value->sinopsis;?></textarea></td>
</tr>
<tr>
	<td>Poto</td>
    <td>:</td>
    <td><input type="file" name="userfile" /></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan / Ubah"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>
<br/>

<table border="1" align="center">
    <?php
	if(count($buku) > 0)
	{
		$x=1;
		foreach($buku as $row){
		if($x%2==0)
		{$warna = "#FC6";}
		else
		{$warna = NULL;}
		
		$image_properties = array(
          'src' => 'images/cover/'.$row->cover_buku,          
          'width' => '150',
          'height' => '200',
          'title' => $row->judul);
	?>
    <tr bgcolor="<?php echo $warna;?>">
    	<td>
        	<div><?php echo img($image_properties); ?></div>
        </td>
    	<td valign="top" width="250">
        	<div style="padding: 0px 3px 0px 3px;">
            <table border="0">
            <tr height="25" valign="top">
            	<td colspan="3"><b><?php echo $row->judul; ?></b></td>
            </tr>
            <tr>
            	<td>Kategori</td>
                <td>:</td>
                <td><?php echo $row->nama_kategori; ?></td>
            </tr>
            <tr>
            	<td>Pengarang</td>
                <td>:</td>
                <td><?php echo $row->pengarang; ?></td>
            </tr>
            <tr>
            	<td>Penerbit</td>
                <td>:</td>
                <td><?php echo $row->nama_penerbit; ?></td>
            </tr>
            <tr>
            	<td>Tahun</td>
                <td>:</td>
                <td><?php echo $row->thn_terbit; ?></td>
            </tr>
            <tr>
            	<td>Status</td>
                <td>:</td>
                <td><?php echo $row->status; ?></td>
            </tr>
            <tr>
            	<td colspan="3"><?php echo substr($row->sinopsis, 0, 80)."... ";?>
            </tr>
            </table>
            </div>		
        </td>
        <?php if($this->session->userdata('status') == "ya"){ ?>
        <td>
        	<?php
            echo anchor('petugas/editBuku/'.$row->kode_buku, img('images/icon/pencil.png'), 'title="Edit"');
			echo "<br/><br/>";
			echo anchor('petugas/deleteBuku/'.$row->kode_buku, img('images/icon/delete.png'), array('title'=>"Hapus", 'onClick'=>"return confirm('Anda yakin?')"));
			?>
        </td>
        <?php }?>
    </tr>
    <?php
    $x++;}}
	else
	{echo "Data kosong";}
	?>
</table>
<center> <?php echo $this->pagination->create_links();?> </center>