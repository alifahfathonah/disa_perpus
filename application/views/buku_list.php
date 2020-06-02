<?php
if(!empty($notif))
{echo '<div class=" '.$type.' "> '.$notif.' </div><br/>';}
else
{NULL;}
?>
<script language='JavaScript'>		
var ajaxRequest;
function getAjax() //memeriksa apakah web browser mendukun AJAX
{
	try
	{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e) 
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
}

function validasi(keyEvent) //untuk mendapatkan nilai dari inputan yang dimasukkan
{
	keyEvent = (keyEvent) ? keyEvent: window.event;
	input = (keyEvent.target) ? keyEvent.target: keyEvent.srcElement;

	if (keyEvent.type == "keypress")
	{
		var targetDiv = document.getElementById("hasil");
		targetDiv.innerHTML = "<div></div>";
		if (input.value != null)
		{
			getData("<?php echo base_url()?>index.php/home/cariBuku/" + input.value);
		}
	}
}

function getData(dataSource) //menampilkan kemungkinan hasil nama barang yang diinput
{
	getAjax();
	if (ajaxRequest)
	{
		ajaxRequest.open("GET",dataSource);
		ajaxRequest.onreadystatechange = 
			function()
			{
				if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200)
				{
					var targetDiv = document.getElementById("hasil");
					targetDiv.innerHTML = ajaxRequest.responseText;
				}
				else
				{
					ajaxRequest.send(null);	
				}
			}
		ajaxRequest.send(null);
	}
}
</script>

Cari Buku : 
<input type="text" onkeypress="validasi(event)" id="inputan" placeholder="Nama Buku" />
<br/><br/>

<div id="hasil">
<?php
echo $this->load->view('bukulist');?>
</div>