<?php echo link_tag('css/kartu.css'); ?>
<script type="text/javascript">
function PrintKartu()
{
	location.href="<?php echo base_url()?>index.php/petugas/verifikasi";
	print();		
}
</script>
<center>
	<div id='kartu' style='width:500px;height:300px;cursor:pointer' onclick='PrintKartu()' title='Print Kartu'>
        <img style="margin:0px;padding:0px;" src="<?php echo base_url()?>images/kartu.png" height="300" width="500">
        <div id="foto"> <img src='<?php echo base_url()?>images/foto/<?php echo $kartu->foto_anggota;?>' height='150px' width='120px'></div>
        <div id="masa_aktif">Aktif Hingga <?php echo $kartu->tgl_akhir; ?></div>
        <div id="kode_anggota"><?php echo $kartu->kode_anggota; ?></div>
        <div id="nama"><?php echo $kartu->nama_anggota; ?></div>
        <div id="gender"><?php echo $kartu->gender; ?></div>
        <div id="alamat"><?php echo $kartu->alamat_anggota; ?></div>
        <div id="telepon"><?php echo $kartu->tlp_anggota; ?></div>
	</div>
<br>
<br>
<br>
<br>
</center>