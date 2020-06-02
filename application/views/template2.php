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
				<li><a href="<?php echo base_url()?>index.php/home">Home</a></li>            
            </ul>
		<div id="date"><?php //echo timezones('UP7'); 
		//echo date('d M Y');?></div>
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
                    	<h4>Belum menjadi anggota?</h4> <a href="<?php echo base_url()?>index.php/home/form_daftar">Daftar Menjadi Anggota</a>                        
                        <form action="<?php echo base_url()?>index.php/home/masuk" method="post">
                        <br/><h4>Login</h4>
                        Username <br/> <input class="textbox" size="15" type="text" name="nama" autocomplete="off" />
                        <br/>
                        Password <br/> <input class="textbox" size="15" type="password" name="password" />                  
                        <input class="input" type="submit" value="Masuk">	                        
                        </form>
                        
                        <?php
						$x=1;
                        foreach($petugas as $row)
						{echo '<br/>Costumer '.$x.'<br/><a href="ymsgr:sendIM?'.$row->ym_user.'"><img src="http://opi.yahoo.com/online?u='.$row->ym_user.'&m=g&t=2" border="0" /></a><br/>';
						$x++;}
						$this->load->view('rank_buku');
						?>
                        
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