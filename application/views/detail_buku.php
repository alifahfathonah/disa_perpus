<table id="buku" border="0" align="center">
    <?php
	if(count($row) > 0)
	{
		
		$image_properties = array(
          'src' => 'images/cover/'.$row->cover_buku,          
          'width' => '150',
          'height' => '200',
          'title' => $row->judul
		  );
	?>
    <tr bgcolor="#FC6">
    	<td valign="top">
        	<div><?php echo img($image_properties); ?></div>
        </td>
    	<td valign="top" width="500">
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
            	<td colspan="3"><?php echo $row->sinopsis;?>
            </tr>             
            </table>
            </div>		
        </td>
    </tr>
    <?php
    }
	else
	{echo "Data kosong";}
	?>
</table>