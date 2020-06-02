<h1>Masukan Kode Verifikasi</h1><br />
<form method="post" action="<?php echo base_url()?>index.php/petugas/verifikasi"/>
<input type="hidden" name="kode_verif" value="<?php echo $kode_verif;?>"/>
<table border="0" align="center">
<tr>
	<td>Kode Verifikasi</td>
    <td>:</td>
    <td><input type="text" name="kode"/></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>