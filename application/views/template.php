<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	terrafirma1.0 by nodethirtythree design
	http://www.nodethirtythree.com

-->
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<title>Mari Membaca Library</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" href="<?php echo base_url()?>images/logo.gif" />
<?php echo link_tag('css/default.css'); ?> 
</head>
<body>

<div id="outer">

	<div id="upbg"></div>

	<div id="inner">

		<div id="header">
			<h1>Mari Membaca Library</h1>
		</div>
	
		<div id="splash"></div>
	
		<div id="menu">
			<ul>
				<?php
				$this->template->menu($this->session->userdata('level'));
				?>
			</ul>

		<div id="date"><?php //echo date('d M Y');?></div>
		</div>
	

		<div id="secondarycontent">
        </div>
        <div id="primarycontent">
		
			<!-- primary content start -->

			<div class="post">
				<div class="header">
				</div>
				<div class="content">
                    <div id="dua">
                    	<center>
                    	Selamat Datang<h2><?php echo img('images/icon/user.png').'<br/>'.$this->session->userdata('nama');?></h2><br /><br /> 
                        <?php
                        if($this->session->userdata('level') == 2)
						{
							if($this->session->userdata('status') == "ya")
							{echo img('images/icon/check.png')."<br/><h2>Dijinkan</h2>Mengubah dan menghapus data";}
							else
							{echo img('images/icon/delete.png')."<br/><h2>Tidak diijinkan</h2>Mengubah dan menghapus data";}
						}
						else
						{echo NULL;}
						?>
                        </center>
                    </div>
                    <div id="satu"><center><?php echo $contents;?></center></div>
					
				</div>			
			</div>

			<!-- primary content end -->
	
		</div>
		
		<div id="secondarycontent">

			<!-- secondary content start -->
			<!-- secondary content end -->

		</div>
	
		<div id="footer">
		
			&copy; My Website. All rights reserved. Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a>. Edited by Disa Arista
		
		</div>

	</div>

</div>

</body>
</html>