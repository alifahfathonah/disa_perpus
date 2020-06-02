<h1>Data Anggota</h1><br />
<?php
if(empty($value))
{
  $value->kode_anggota = "";
  $value->nama_anggota= "";
  $value->gender = "";
  $value->alamat_anggota = "";
  $value->tlp_anggota = "";
  $value->foto_anggota = "";
}
?>
<form method="post" action="<?php echo base_url()?>index.php/petugas/changeAnggota" enctype="multipart/form-data"/>
<input type="hidden" name="kode" value="<?php echo $value->kode_anggota;?>"/>
<input type="hidden" name="foto" value="<?php echo $value->foto_anggota;?>"/>
<table border="0" align="center">
<tr>
	<td>Nama</td>
    <td>:</td>
    <td><input type="text" name="nama" value="<?php echo $value->nama_anggota;?>"/></td>
</tr>
<tr>
	<td>Gender</td>
    <td>:</td>
    <td><input type="radio" name="gender" value="L" <?php if($value->gender == 'L'){echo "checked";}else{echo NULL;}?> />Laki-laki
    	<input type="radio" name="gender" value="P" <?php if($value->gender == 'P'){echo "checked";}else{echo NULL;}?> />Perempuan</td>
</tr>
<tr>
	<td>Alamat</td>
    <td>:</td>
    <td><textarea name="alamat"><?php echo $value->alamat_anggota;?></textarea></td>
</tr>
<tr>
	<td>Telepon</td>
	<td>:</td>
	<td><input type="text" name="tlp" value="<?php echo $value->tlp_anggota;?>"/></td>
</tr>
<tr>
	<td>Foto</td>
    <td>:</td>
    <td><input type="file" name="userfile" /></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan / Edit"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>
<br />

<table border="1" align="center">
    <?php
	if(count($anggota) > 0)
	{
		$x=1;
		foreach($anggota as $row){
		if($x%2==0)
		{$warna = "#FC6";}
		else
		{$warna = NULL;}
		
		$image_properties = array(
          'src' => 'images/foto/'.$row->foto_anggota,          
          'width' => '130',
          'height' => '130',
          'title' => $row->nama_anggota);
	?>
    <tr bgcolor="<?php echo $warna;?>">
    	<td>
        	<div><?php echo img($image_properties); ?></div>
        </td>
    	<td valign="top" width="150">
        	<div style="padding: 0px 3px 0px 3px;">
            <table border="0">
            <tr height="25" valign="top">
            	<td colspan="3"><b><?php echo $row->nama_anggota; ?></b></td>
            </tr>
            <tr>
            	<td>Gender</td>
                <td>:</td>
                <td><?php echo $row->gender; ?></td>
            </tr>
            <tr>
            	<td>Alamat</td>
                <td>:</td>
                <td><?php echo $row->alamat_anggota; ?></td>
            </tr>
            <tr>
            	<td>Telp</td>
                <td>:</td>
                <td><?php echo $row->tlp_anggota; ?></td>
            </tr>           
            </table>
            </div>		
        </td>
        <?php if($this->session->userdata('status') == "ya"){ ?>
        <td>
        	<?php
            echo anchor('petugas/editAnggota/'.$row->kode_anggota, img('images/icon/pencil.png'), 'title="Edit"');
			echo "<br/><br/>";
			echo anchor('petugas/deleteAnggota/'.$row->kode_anggota, img('images/icon/delete.png'), array('title'=>"Hapus", 'onClick'=>"return confirm('Anda yakin?')"));
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