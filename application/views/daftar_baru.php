<h2 align="center">FORMULIR PENDAFTARAN</h2> <br/>
<h4>- Isi dengan lengkap -</h4>
<form method="post" action="<?php echo base_url()?>index.php/home/daftar" enctype="multipart/form-data"/>
<input type="hidden" name="kode" value="MML-AG00<?php echo $kode->hasil+1;?>" />
<table border="0" cellpadding="5" cellspacing="10" align="center">
<tr>
	<td>Nama</td>
    <td>:</td>
    <td><input type="text" name="nama"/></td>
</tr>
<tr>
	<td>Gender</td>
    <td>:</td>
    <td><input type="radio" name="gender" value="L"/>Laki-laki
    <input type="radio" name="gender" value="P" />Perempuan</td>
</tr>
<tr>
	<td>Alamat</td>
    <td>:</td>
    <td><textarea name="alamat"></textarea></td>
</tr>
<tr>
	<td>Telepon / HP</td>
    <td>:</td>
    <td><input type="text" name="telp"/></td>
</tr>
<tr>
	<td>Foto</td>
    <td>:</td>
    <td><input type="file" name="userfile" /></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>