<html>
<head>
<title>Upload Form</title>
</head>
<body>

<h3>
<?php
if(empty($error))
{
	echo "Gambar berhasil di upload !!!";		
}
else
{
	$upload_data = NULL;
	echo $error;	
}
?>
</h3>

<p><?php echo anchor('c_pegawai', 'Kembali ke form'); ?></p>

</body>
</html>