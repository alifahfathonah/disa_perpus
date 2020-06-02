<script type="text/javascript">
function validasi(){
   if (document.form.password.value==""){
      alert("Password lama harus diisi");
	  document.form.password.focus();
	  return false;}
}
</script>
<h1>Edit Akun</h1><br />
<form method="post" name="form" onSubmit="return validasi()" action="<?php echo base_url()?>index.php/manager/changeAkun"/>
<input type="hidden" name="passlama" value="<?php echo $petugas->password;?>"/>
<input type="hidden" name="ym" value="<?php echo $petugas->ym_user;?>"/>
<table border="0" align="center">
<tr>
	<td>Username</td>
    <td>:</td>
    <td><input type="text" name="user" disabled value="<?php echo $petugas->username;?>"/></td>
</tr>
<tr>
	<td>Password Baru</td>
	<td>:</td>
	<td><input type="password" name="passbaru"/></td>
</tr>
</table>

<br /><h1>Edit Profil</h1><br />
<table border="0" align="center">
<tr>
	<td>Nama</td>
    <td>:</td>
    <td><input type="text" name="nama" value="<?php echo $petugas->nama_petugas;?>"/></td>
</tr>
<tr>
	<td>Password Lama</td>
	<td>:</td>
	<td><input type="password" name="password"/></td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Simpan"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>
<br />