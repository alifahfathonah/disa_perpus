<br/><h1>Top 5</h1>
Buku yang paling banyak dipinjam
<br/>
<table id="buku" border="0" align="center" width="160">
    <?php
	$x=1;
	if(count($rank) > 0)
	{
		foreach($rank as $row){
		if($x%2==0)
		{$warna = "#FC6";}
		else
		{$warna = "#FC9";}
		
		$atts = array(
						'width'      => '700',
						'height'     => '600',
						'scrollbars' => 'no',
						'resizable'  => 'yes',
						'screenx'    => '0',
						'screeny'    => '0');
	?>
    <tr bgcolor="<?php echo $warna;?>">
    	<td valign="top" width="300">
        	<div style="padding: 0px 3px 0px 3px;">
            <table border="0">
            <tr>
            	<td colspan="3"><?php echo anchor_popup('home/detail_buku/'.$row->kode_buku, $row->judul, $atts); ?></td>
            </tr>
            <tr>
            	<td colspan="3">By <?php echo $row->pengarang; ?></td>
            </tr>
            <tr>
            	<td colspan="3">
					<?php 
					for($d = 1 ; $d <= $row->jumlah ; $d++)
					{echo img("images/icon/love.ico");}
					?>
                </td>
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