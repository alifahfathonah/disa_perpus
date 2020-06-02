<h1>Peminjaman Buku</h1><br />
<?php 
$kode = $kode->hasil+1;

if(!empty($notif))
{echo '<div class="'.$type.'">'.$notif.'</div><br/>';}
else
{NULL;}
?>

<form method="post" action="<?php echo base_url()?>index.php/petugas/peminjaman"/>
<input type="hidden" name="kodepinjam" value="<?php echo "MML-PMJN-00".$kode;?>"/>
<input type="hidden" name="kodekembali" value="<?php echo "MML-KMBL-00".$kode;?>"/>
<input type="hidden" name="kodepetugas" value="<?php echo $this->session->userdata('user');?>"/>
<table border="0" align="center">
<tr>
	<td>Petugas</td>
    <td>:</td>
    <td><?php echo $this->session->userdata('nama');?></td>
</tr>
<tr>
	<td>Anggota</td>
    <td>:</td>
    <td><input type="text" name="anggota" placeholder="Kode Anggota"/></td>
</tr>
<tr>
	<td>Buku</td>
    <td>:</td>
    <td><input type="text" name="buku" placeholder="Kode Buku"/> </td>
</tr>
<tr>
	<td colspan="3"><input type="submit" value="Pinjam"> <input type="reset" value="Cancel"></td>
</tr>
</table>
</form>
<br/>

<center>
	<form method="post" action="<?php echo base_url()?>index.php/petugas/cariPinjam"/>
    <input type="text" name="cari" placeholder="Kode Anggota" />
    <input type="submit" value="Cari" />
    </form>
</center>

<table border="1" align="center">
    <?php if(count($pinjam) > 0){ ?>
    <tr id="judul">
    	<td>Nama Anggota</td>
        <td>Buku</td>
        <td>Tgl Pinjam</td>
        <td>Tgl Tenggang</td>
        <td>Tgl Kembali</td>
        <td>Denda</td>
        <td>Ket</td>
    </tr>
    <?php
	$x=1;
    foreach($pinjam as $row){
		
	if($x%2==0)
	{$warna = "#FC6";}
	else
	{$warna = NULL;}
	?>
    <tr bgcolor="<?php echo $warna;?>">
    	<td width="90"><?php echo $row->nama_anggota; ?></td>
        <td width="130"><?php echo $row->judul; ?></td>
        <td><?php echo $row->tgl_peminjaman; ?></td>
        <td><?php echo $row->tgl_hrs_kembali; ?></td>
        <td><?php echo $row->tgl_kembali; ?></td>
        <td><?php echo $row->jumdenda; ?></td>
        <td width="50">
			<?php
			if($row->tgl_kembali == "0000-00-00")
			{echo anchor('petugas/pengembalian/'.$row->kode_peminjaman.'/'.$row->kode_buku.'/'.$row->jumdenda, 'Kembalikan <br/> Buku');}
			else
			{echo "Buku sudah dikembalikan";}
			?>
        </td>
    </tr>
    <?php $x++;} ?>
</table>
<center> <?php echo $this->pagination->create_links();?> </center>
<?php
}
else
{echo "Data kosong";}
?>
