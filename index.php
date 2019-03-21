<?php
	if($_POST){
		
		echo "Bağlantı Yapıldı";

		if(isset($_POST["kullanici"]))
		{
			$kadi=strip_tags(trim($_POST["kullanici"]));
		}	
		
		else{
			echo "Eposta verisi gelmedi";
		}
		if(isset($_POST["sifre"])){
			
			$sifre=strip_tags(trim($_POST["sifre"]));
		}
		else{
			echo "Şifre Verisi Gelmedi";
		}
		

		echo $kadi.$sifre;
	}
	else{
		echo "Bağlantı Yapılamadı";
	}



?>