<table id="buku" border="1" align="center">
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
            	<td colspan="3"><?php 
					echo substr($row->sinopsis, 0, 100)."... ";
					
					$atts = array(
								  'width'      => '700',
								  'height'     => '600',
								  'scrollbars' => 'no',
								  'resizable'  => 'yes',
								  'screenx'    => '0',
								  'screeny'    => '0'
								);
					echo anchor_popup('home/detail_buku/'.$row->kode_buku, 'Selengkapnya',$atts); 
					?>
            </tr>             
            </table>
            </div>		
        </td>
    </tr>
    <?php
    $x++;}}
	else
	{echo "Data kosong";}
	?>
</table>
<center> <?php echo $this->pagination->create_links();?> </center>