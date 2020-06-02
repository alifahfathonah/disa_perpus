/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.20 : Database - disa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`disa` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `disa`;

/*Table structure for table `captcha` */

DROP TABLE IF EXISTS `captcha`;

CREATE TABLE `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `captcha` */

/*Table structure for table `log_file` */

DROP TABLE IF EXISTS `log_file`;

CREATE TABLE `log_file` (
  `aksi` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `pelaku` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `log_file` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` char(30) NOT NULL,
  `password` varchar(300) NOT NULL,
  `level` int(3) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`password`,`level`,`id`) values ('PG001','047581f5a82d66f3e0d0afa151126979',2,1),('PG002','5e70e7103d3b0ced50f67166c559733c',2,2),('MN001','047581f5a82d66f3e0d0afa151126979',3,3);

/*Table structure for table `t_anggota` */

DROP TABLE IF EXISTS `t_anggota`;

CREATE TABLE `t_anggota` (
  `kode_anggota` varchar(15) NOT NULL,
  `nama_anggota` varchar(100) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `alamat_anggota` varchar(150) DEFAULT NULL,
  `tlp_anggota` varchar(15) DEFAULT NULL,
  `foto_anggota` varchar(300) DEFAULT NULL,
  `status_verif` varchar(10) DEFAULT 'belum',
  PRIMARY KEY (`kode_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_anggota` */

insert  into `t_anggota`(`kode_anggota`,`nama_anggota`,`gender`,`alamat_anggota`,`tlp_anggota`,`foto_anggota`,`status_verif`) values ('MML-AG001','Adinda Ayu Ratu Balqis','P','Hj. Gofur','089661249159','adinda1.jpg','sudah'),('MML-AG002','Laila Nursiami Kusmayanti','P','Sukajadi','022777838','laila.jpg','sudah'),('MML-AG003','Clara Agustina Nurfajri','P','Dustira','0813887378482','clara.jpg','belum'),('MML-AG004','Kemal Arigi','L','Kosambi','0893347482','SAM_7863.JPG','sudah'),('MML-AG005','Taryadi','L','Bandung','0878326472','SAM_7809.JPG','belum'),('MML-AG006','Adudu','P','Bandung','089676181051','SAM_7769.JPG','sudah');

/*Table structure for table `t_buku` */

DROP TABLE IF EXISTS `t_buku`;

CREATE TABLE `t_buku` (
  `kode_buku` varchar(15) NOT NULL,
  `kode_kategori` varchar(15) DEFAULT NULL,
  `kode_penerbit` varchar(15) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `sinopsis` longtext,
  `pengarang` varchar(30) DEFAULT NULL,
  `thn_terbit` year(4) DEFAULT NULL,
  `cover_buku` varchar(500) DEFAULT NULL,
  `status` enum('pinjam','tidak') DEFAULT 'tidak',
  PRIMARY KEY (`kode_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_buku` */

insert  into `t_buku`(`kode_buku`,`kode_kategori`,`kode_penerbit`,`judul`,`sinopsis`,`pengarang`,`thn_terbit`,`cover_buku`,`status`) values ('KB0010','KT001','PT002','Syair-syair Cinta','Bila cinta mendatangimu, ikuti dia. Walaupun jalannya sulit dan terjal. Ketika cinta memahkotaimu, ia akan menyalibmu. Cinta membuatmu mengetahui rahasia dalam hatimu. Cinta membuatmu mengetahui rasa sakit dari kelembutan. Cinta membuatmu berdarah dengan bahagia dan nikmat. Cinta membuatmu terbangun saat senja dengan hati bersayap, dan berterima kasih atas hari yang penuh cinta. Ketika kau mencintai, janganlah berkata,\"Tuhan ada dalam hatiku,\" berkatalah, \"Aku ada di hati Tuhan.\" Karena cinta ','Kahlil Gibran',2009,'2606_134319835233_7692041_n.jpg','tidak'),('KB0011','KT001','PT002','Resep Mudah Tetap Sehat','Orang sekarang punya penyakitnya sendiri. Sebagian besar sebab salah memilih gaya hidup. Kebanyakan penyakit yang sekarang orang derita sebetulnya tak perlu terjadi. Itu hanya karena orang tidak tahu bagaimana cara membatalkannya. Sebetulnya tak perlu menjadi dokter untuk sehat sepanjang hayat. Peran dokter tidak besar membantu orang bisa membatalkan jatuh sakit. Buku ini berisi Kamus bagaimana resep mudah dan sederhana mampu tetap sehat sampai ujung hayat di zaman sekarang.','Dr. Handrawan Nadesul',2009,'2606_134319840233_8214782_n.jpg','tidak'),('KB0012','KT001','PT003',' Marketing is Bullshit','Setelah 10 Jurus Terlarang dan 13 Wasiat Terlarang sold out di mana-mana, diliput hampir seluruh stasiun televisi, dan tercatat di Museum Rekor Indonesia (MURI), kini Ippho Santosa hadir dengan Marketing is Bullshit... sebuah buku yang ditunggu-tunggu marketer, entrepreneur, dan networker di Indonesia dan Singapura. Intinya, meledakkan profit hingga 2 kali lipat dalam 6 bulan berbekal kreativitas dan otak kanan. Di dalamnya terdapat 88 trik kreatif, ide liar, dan studi kasus senilai Rp 180 juta, diantaranya :\r\n\r\n* Mengaktifkan hoki, membuang sial\r\n* Mengaktifkan intuisi kurang dari satu detik\r\n* Membuat pelanggan membeli berulang-ulang\r\n* Menyulap pelanggan jadi pesuruh\r\n* Menyulap sakit jadi duit\r\n* Menyulap sampah jadi rupiah\r\n* Menyulap ide jadi income\r\n* Menembak mampus pesaing\r\n* Promosi dengan biaya nyaris nol\r\n* Mengaktifkan Plan A, membuang Plan B\r\n* Menjadi creative marketer tanpa batas','Ippho Santosa',2009,'2606_134321010233_7562800_n.jpg','tidak'),('KB0013','KT001','PT006','20 Wisdom & Success','\"Memang punya tekad bukanlah segala-galanya, tetapi tanpa tekad tidak mungkin ada segalanya.\" -Andrie Wongso-\r\n\r\n\r\nKutipan di atas menjadi pembuka yang cukup menggelitik dari buku 20 Wisdom&Success yang ditulis oleh Andrie Wongso ini. Kutipan yang diambil dari cerita pertama berjudul Percikan Api tersebut memang sedikit menggoda kala hinggap di kepala. Sebab, sentilan kecil itu seolah langsung mengingatkan kita pada diri sendiri. Kadang tanpa kita sadari, sebuah tekad, sekecil apapun itu, jika bertemu dengan waktu dan tempat yang pas, akan jadi letupan semangat yang mampu membawa perubahan. Padahal, di sisi lain, kita kadang meremehkan pentingnya tekad ini.\r\n\r\nSebuah ciri khas tulisan gaya Andrie Wongso kembali kita temui dari buku seri keempatnya ini. Sederhana, lugas, ringkas, namun tepat langsung ke sasaran. Itulah kekuatan untaian kata yang dirangkai dalam cerita dalam buku setebal total 200-an halaman ini. Memang, kata demi kata, yang diolah dalam kalimat penuh makna selalu menjadi kekuatan dari buku yang sudah masuk pada seri keempat. Sebelumnya, seri pertama berisi 15 cerita, 16 cerita, 18 cerita, dan kini berisi 20 cerita.\r\n\r\nKali ini, ada sedikit yang berbeda dari buku-buku sebelumnya. Cerita yang diuraikan pada buku ini tanpa uraian dalam bahasa Inggris. Namun, itu semua tak mengurangi kekuatan buku ini. Sebab, dari 20 cerita yang ada, masing-masing punya hikmah dan nilai tersendiri yang sangat membumi.\r\n\r\nCobalah tengok kisah Rumah Pesanan Terakhir sebagai contoh. Kisah itu seperti menyentil diri yang acap cepat puas (baca: kerja seadanya) hanya karena kerja sudah menjadi rutinitas. Untuk satu hal ini, di halaman 38, Andrie menyebut agar kerja harus dinikmati dengan hati bahagia, bukan dianggap sebagai beban tapi berupa kesenangan. Berapa banyakkah dari kita yang sudah menemukan kebahagiaan dari kerja yang dilakukan?\r\n\r\nNilai wisdom memang sangat kental di semua buku Andrie. Coba tengok pula apa yang diungkapnya dalam kisah penuh haru berjudul Cinta Sejati di halaman 49. Ia menuturkan dengan lugas soal kehidupan keluarga yang mungkin dialami banyak pasangan. Bahwa, kebahagiaan sebuah keluarga bisa didapat dengan memelihara komitmen saling menghargai, komunikasi yang berimbang, dan curahan perhatian satu sama lain. Sebuah resep sederhana, namun kadang justru dilupakan.\r\n\r\nBaca pula kisah yang menggugah pengertian kita tentang takdir dalam cerita Takdir Ada di Tangan Sendiri. Dengan cerdas, Andrie bicara soal takdir tanpa kesan menggurui melalui analogi kisah burung dalam genggaman. Ia menuturkan, bahwa sejatinya kekuatan yang menentukan masa depan sejatinya terletak dari kemampuan kita untuk memaksimalkan potensi diri sendiri. \r\n\r\nPilihan cerita-cerita yang diambil dari materi siaran Andrie Wongso di SMART FM setiap Senin-sebagaimana disebut di kata pengantar-ini memang penuh nuansa pembelajaran. Hebatnya, semua disampaikan dengan bahasa yang enak dan terasa mengalir, sehingga dibaca beberapa kali pun tak kan terasa membosankan. Memang, itulah kekuatan sebuah cerita. Mampu menginspirasi tanpa menggurui, mampu menggugah tanpa bahasa perintah.','Andrie Wongso',2008,'2648_134342650233_3439956_n.jpg','tidak'),('KB0014','KT001','PT007','Even Buffett Isn\'t Perfect','Buku terbaik tentang Buffet setelah bertahun-tahun. Karya Vahan Janjigian ini begitu memikat, merasuk, dan sangat berharga. Buku ini wajib dibaca oleh semua penggemar Buffet dan siapa pun yang ingin meningkatkan keterampilan berinvestasi. Jadi Siapa pun yang mengaku memahami pendekatan Warren Buffett dalam berinvestasi harus membaca buku ini. Dengan mengawinkan kebijaksanaan dari sang maestro dan riset terbaru mengenai strategi investasi, Vahan meluruskan berbagai mitos dan menghadirkan tampilan yang sama sekali baru pada pemikiran kreatif yang telah menjadikan Buffett sebagai Investor nilai terbesar di dunia.','',2009,'2670_138778815233_5431208_n.jpg','tidak'),('KB0015','KT001','PT008',' Sejarah Dunia dalam 10 1/2 Bab','Kisah-kisah yang diperikan dalam novel ini seolah tak berhubungan. Novel dibuka dengan kisah seekor ulat penumpang gelap bahtera Nuh, yang menjadi saksi banyak kejadian mencengangkan di atas bahtera.\r\n\r\nCerita kemudian bergulir tentang seorang penumpang kapal Titanic yang selamat karena mengenakan gaun dan dikira perempuan, tentang jalannya proses pengadilan yang ganjil di salah satu pedesaan Prancis abad ke-16, tentang ekspedisi seorang mantan astronot untuk menemukan sisa-sisa bahtera Nuh, hingga tentang seorang lelaki yang tiba-tiba mendapati dirinya berada di surga.\r\n\r\n\r\nDengan semua itu san novelis seolah berkata bahwa dunia berputar sedemikian rupa dan peristiwa-peristiwa saling berkait, berkelindan, dan rumit. Namun seringkali sejarah yang ditulis para sejarawan begitu menyederhanakan sebab-akibat. Karena itulah manusia mudah tersesat dalam kebenaran sejarah mereka yang menang.\r\n\r\nNovel ini memberi pemahaman tentang betapa berbahayanya takluk pada satu kebenaran sejarah - sikap yang akan membuat lenyapnya individualitas dan kemanusiaan kita.','Julian Barnes',2009,'2670_138778820233_7596537_n.jpg','tidak'),('KB0016','KT001','PT002','Sintong Panjaitan - Perjalanan Seorang Prajurit Para Komando','Dari operasi memburu Kahar Muzakkar di Sulawesi; penumpasan G30S/PKI di RRI Jakarta, Lubang Buaya, dan Jawa Tengah; operasi tempur di Irian dan Kalimantan; hingga operasi antiteror pembajakan pesawat Garuda di Thailand, Sintong Panjaitan selalu terlibat. Simak catatannya sebagai Panglima Kodam IX/Udayana saat Peristiwa Dili 1991, upaya membangun sistem senjata dan perlengkapan ABRI, hingga peralihan kekuasaan dari Soeharto ke BJ Habibie.\r\n------------------------------------------------------------------------------------------------------------------------------\r\n\r\nPengalaman dan pandangan Sintong Panjaitan sekitar Mei 1998 akan memperkaya khazanah riset tentang perubahan politik nasional, yang menentukan arah sejarah bangsa dan tertib regional ASEAN.\r\nJuwono Sudarsono (Menteri Pertahanan)\r\n\r\nSebuah pustaka yang mampu menjawab teka-teki secara terang dan jelas tentang misteri yang terjadi di kalangan TNI, sehingga berguna untuk pembelajaran kita.\r\nAtmadji Sumarkidjo (Wartawan Senior)\r\n\r\nSangat sedikit purnawirawan TNI menulis memoar mereka sebagai prajurit tempur. Buku ini penuh dengan kisah di berbagai palagan tempur, sangat asyik dibaca dan perlu diketahui oleh generasi muda, khususnya TNI.\r\nIswahyudi Karim SH, LLM (Pengamat Militer)\r\n\r\nMemuat hal-hal yang selama ini sangat samar-samar diketahui publik: segitiga antara BJ HabibieWiranto Prabowo, kasus penculikan aktivis prodemokrasi, Peristiwa Mei 1998, dan seputar lengsernya Soeharto.\r\nMayjen TNI (Purn) Samsudin (Komandan Pussenif 1985-1987)\r\n','Hendro Subroto',2009,'2670_138784005233_994350_n.jpg','tidak'),('KB0017','KT001','PT002','Tepian Tanah Air - 92 Pulau Terluar Indonesia (Indonesia Bagian Barat)','Mengenal Tanah Air! Sudah selayaknya pemilik rumah mengenal tempat tinggalnya sampai batas pagar dengan tetangga sebelah. Dengan 17.504 pulau, 1.608 suku bangsa yang berkomunikasi dengan 665 bahasa daerah di seluruh Nusantara; Indonesia adalah negara kepulauan yang besar. Dikaruniai iklim yang bersahabat, tanah yang subur, alam yang indah, kaya dengan spesies langka flora dan fauna mencakup mamalia, kupu-kupu, reptil, burung, unggas, hingga amfibi yang jumlahnya 3.025 spesies. Juga ada 47.000 spesies tumbuhan. \r\n\r\nPustaka ini menyajikan foto memesona dengan narasi yang memikat perihal keindahan alam dan kehidupan anak bangsa pada pulau-pulau terluar di Indonesia Bagian Barat sepanjang sisi selatan Jawa, sisi barat Sumatera, Selat Malaka, Kepulauan Riau, Kepulauan Anambas sampai Kepulauan Natuna. Semua terekam dalam kegiatan Ekspedisi Garis Depan Nusantara Wanadri-Rumah Nusantara.\r\nSuatu harta tak ternilai, dokumentasi kekayaan alam dan budaya Nusantara, untuk meningkatkan pemahaman wawasan kewilayahan serta memacu perkembangan di pulau-pulau terluar.','Wanadri dan Rumah Nusantara',2009,'2670_138784010233_1000843_n.jpg','tidak'),('KB0018','KT001','PT007','Andys Corner (2)','Andys Corner adalah kumpulan tulisan yang ditujukan untuk menjawab berbagai pertanyaan para penonton Kick Andy terkait topik-topik yang ditayangkan. Berbeda dengan buku pertamanya, Andys Corner 2 kali ini dihadirkan dengan lebih berwarna. Ilustrasi yang disajikan dalam setiap tulisan, tampaknya memang sengaja dibuat untuk mengimbangi setiap cerita yang ditampilkan. Masih dengan kesan sebagai buku saku, Andys Corner tampaknya mencoba dihadirkan seringan mungkin agar para pembacanya dapat membaca tanpa mengerutkan kening. Mencontek dari motto tayangan Kick Andy, Andys Corner 2 ingin mengajak para pembacanya untuk membaca dengan hati. Memaknai pengalaman, tampaknya menjadi titik berat Andy dalam tulisannya di Andys Corner, yang diluncurkan pada ulang tahun ke-3 Kick Andy.\r\n\r\n\r\nBuku ini juga bagaikan album pikiran Andy F. Noya. Membaca buku ini, ingatan kita akan dibawa kembali ke dalam episode-episode yang pernah ditayangkan. Yang lebih mengesankan dan mengentakkan kesadaran adalah ternyata banyak pemirsa yang memperoleh pencerahan hidup dan berusaha untuk menjadi lebih baik serta lebih mensyukuri anugerah hidup setelah menonton Kick Andy.\r\n\r\nPengalamanAndy F. Noya bertemu dengan bermacam tamu selama menjadi host Kick Andy sedikit banyak memengaruhi hidupnya dan menimbulkan percik perenungan. Melalui buku ini, Andy F. Noya sengaja berbagi pengalaman dan inspirasi kepada Anda.\r\n\r\n ada banyak bibit di dalam diri manusia. Ada bibit kebodohan, keserakahan, kemarahan, iri hati, dendam. Ada juga bibit kesabaran, kasih sayang, cinta, memaafkan, persahabatan. Pertanyaan berikutnya, bibit-bibit mana yang kita sirami setiap harinya?\r\n\r\n-Gede Prama, Penutur Kejernihan','Andy F. Noya',2009,'2670_141100635233_7166981_n.jpg','tidak'),('KB0019','KT001','PT002',' Membongkar Manipulasi Sejarah - Kontroversi Pelaku dan Peristiwa','Ketika Orde Baru berakhir, gugatan terhadap sejarah bermunculan. Sejarah pun menjadi polemik karena fakta dan interpretasi selama ini dinilai tidak tepat, tidak lengkap, dan tidak jelas. Manipulasi sejarah dilakukan secara sistematis dan meluas demi kepentingan politik dan kekuasaan.\r\n\r\nMengapa Proklamator Sukarno tidak tampak saat pengibaran bendera Merah Putih 17 Agustus 1945 yang dimuat dalam buku Pejuang dan Prajurit? Kemudian, siapa yang melakukan rekayasa dalam buku Bung Karno, Penyambung Lidah Rakyat Indonesia, bahwa Sukarno tidak memerlukan Hatta dan Sjahrir, bahkan peranan Hatta dalam sejarah tidak ada? Mengapa peristiwa Serangan Umum 1 Maret 1949 digambarkan menyanjung Soeharto dan melupakan Sultan Hamengku Buwono IX sebagai konseptor? Bagaimana kisah diorama Monumen Nasional era Orde Baru yang penuh manipulasi sejarah?\r\n\r\nPenulis melalui bukunya ini membeberkan kebenaran sejarah secara jujur. Bukan hanya membongkar manipulasi dan rekayasa sejarah Indonesia saja, tetapi juga menampilkan tokoh-tokoh pergerakan dengan kisah yang menyentuh hati. Kisah Agus Salim yang dikatakan menguasai bahasa kambing dan kuda. Kisah Mayor John Lie, seorang tokoh etnis Tionghoa, yang berani membersihkan ranjau laut. Juga kisah M.H. Thamrin seorang politikus santun yang satu napas dengan Bung Karno.','Asvi Warman Adam',2009,'2670_141100650233_1567981_n.jpg','tidak'),('KB0020','KT001','PT002','The Science & Miracle of ZONA IKHLAS','Dalam buku fenomenal ini penulis buku best-seller Quantum Ikhlas Erbe Sentanu melanjutkan eksplorasinya menurut jejak ilmu pengetahuan modern dengan pijakan hidup berserah diri yang berlaku di Indonesia. Sebuah cetak biru teknologi trnasformasi diri yang menjawab kehausan masyarakat dalam mencari seimbangnya kemuliaan dan kesuksesan hidup yang telah menghasilkan perubahan nyata pada ribuan pembacanya.\r\n\r\nDengan pengantar dari tokoh-tokoh transformasi masyarakat Jacob Oetama, ustadz M. Arifin Ilham, Prof. Dr. Komaruddin Hidayat, Purdi e. Chandra, Reza Gunawan, Kak Seto Mulyadi, dan Guruh Sukarno Putra buku ini akan menjadi panduan komplit dan praktis bidang finansial, mental, fisikal, relasional, dan spiritual yang bercita rasa khas Nusantara. Buku petunjuk praktis (how-to) yang ditunggu oleh bangsa Indonesia untuk meretas belenggu penjajahan jiwa yang akan memerdekakan hati Anda.\r\n\r\n\r\nTHE SCIENCE & MIRACLE OF ZONA IKHLAS - Panduan praktis mengatasi krisis multidimensi dengan mengandalkan kekuatan jati diri Anda sendiri. Manual memenangkan perang melawan diri sendiri untuk meraih sukses lahir batin yang luar biasa.\r\n\r\n\r\nIkhlas itu ilmiah, hasilnya menakjubkan..\r\nuntuk semua orang biasa yang ingin mengaktivasi potensi ilahinya yang luar biasa. Dengan memiliki buku ini Anda ikut membantu kualitas lingkungan hidup dan pendidikan kita','Ebe Sentana',2009,'2670_141102265233_1990802_n.jpg','tidak'),('KB0021','KT001','PT007',' Mario Teguh - Becoming A Star','Becoming A Star adalah rangkuman kecerdasan sederhana yang tidak sederhana dampaknya bagi siapapun yang menerapkannya dalam perjalanan karir dan hidupnya. Buku ini adalah pendamping bagi kecemerlangan sudut pandang dan tindakan Anda.\r\n\r\nSebuah kualitas tidak bisa lepas dari kualitas sebelumnya. Hanya dia yang kualitasnya prima akan mencapai keprimaan. Dengan sikap pintas yang lugas dan brilian, Anda dapat tampil dengan kualitas kebintangan dalam semua interaksi Anda dengan orang lain.\r\n\r\nMario Teguh menaruh butir-butir kebintangan dalam buku ini sebagai hasil dari pengalaman karirnya sendiri dan pengamatannya karirnya sendiri dan pengamatannya atas perilaku terbaik dari pribadi-pribadi yang mencapai kebintangan karena penerapan sikap dan sudut pandang yang cemerlang.\r\n\r\nTidak semua konsultan bisnis adalah pembicara seminar, tidak semua pembicara adalah konsultan, dan tidak semua pembicara seminar adalah motivator yang berdampak. Dan sudah tentu, tidak semuanya adalah penulis yang lugas. Mario Teguh adalah kombinasi yang efektif dari itu semua.','Mario Teguh',2009,'2670_141102270233_7616044_n.jpg','tidak'),('KB0022','KT001','PT002','Tea for Two','Tea for Two adalah perusahaan makcomblang milik Sassy. Baginya, tak ada tanggung jawab dan kebahagiaan yang lebih besar daripada mempertemukan dua orang yang awalnya saling tak mengenal kemudian mengantarkan mereka pada kehidupan yang diidam-idamkan. PERNIKAHAN!\r\n\r\nHidup berbahagia selama-lamanya. Begitulah moto Tea for Two yang terdengar manis.\r\n\r\nTapi... eits, tunggu dulu!\r\n\r\nApakah benar pernikahan adalah satu-satunya jalan terindah bertabur bunga yang diimpikan dan dicita-citakan oleh semua orang? Ternyata tidak semua orang menyikapi hal itu dengan kata setuju. Celakanya, pernikahan Sassy sendiri mengandung rangkaian rahasia kecil yang berbuntut menjadi kebohongan publik besar-besaran. KDRT, Kekerasan Dalam Rumah Tangga.\r\nSemuanya diawali dengan romantisme yang menggebu dan berakhir dengan kekejaman tiada banding.\r\n\r\nIt could happen to you. It could happen to anybody.\r\n\r\nInilah kisah yang menelanjangi sisi buruk pernikahan. Para lajang, bergetarlah, karena lelaki yang kaupikir Mr. Right bisa berubah menjadi Mr. Totally Wrong.','Clara Ng',2009,'2670_141102275233_6480120_n.jpg','tidak'),('KB0023','KT001','PT002',' The Worlds of Chrestomanci Charmed Life - Eric Chant dan Korek Api Bertuah','\'Selamat Datang di Dunia-Dunia Chrestomanci\', tempat sihir menjadi sesuatu yang seumum matematika--dan dua kali lebih merepotkan jika berada di tangan yang salah!\r\n\r\nSemua orang mengatakan Gwendolen Chant adalah penyihir berbakat yang memiliki kekuatan menakjub-kan. Jadi gadis cilik itu tidak merasa heran ketika Chrestomanci mengajaknya tinggal di kastilnya untuk dididik bersama anak-anaknya sendiri. Gwendolen berangkat dengan antusias, yakin bahwa cita-citanya menjadi penyihir besar akan segera tercapai. Tapi adiknya, Eric (biasa dipanggil Cat) tidak begitu bersemangat, karena ia sama sekali tidak berbakat sihir.\r\n\r\nTernyata, hidup bersama Chrestomanci dan keluarganya tidak seperti yang dibayangkan Gwendolen maupun Cat. Bukannya dikembangkan bakat sihirnya, Gwendolen malah tidak diizinkan melakukan sihir sama sekali! Gwendolen berang dan sengaja unjuk kekuatan, sampai-sampai adiknya nyaris tewas gara-gara korek api bertuah!','Diana Wayne Jones',2009,'2670_141102280233_7033638_n.jpg','tidak'),('KB0024','KT001','PT002','ASIAN GODFATHERS - Menguak Tabir Perselingkuhan Pengusaha dan Penguasa','Perekonomian di kawasan Singapura, Malaysia, Thailand, Indonesia, Hong Kong, danFilipina dikendalikan hanya oleh segelintir konglomerat. Mereka dikenal sebagai godfather Asia. Pada 1990-an, mereka termasuk delapan dari 25 orang terkaya di dunia. Siapa sejatinya mereka? Dan bagaimana mereka bisa seperkasa itu?\r\n\r\nNama mereka tak asing di telinga publik, namun sosok mereka misterius dan penuh selubung mitos. Sebut saja, Li Ka-shing, sang miliuner Hong Kong; Stanley Ho, bandar kasino di Macau; Lim Goh Tong, pemilik Genting Highland Resort di Malaysia; Lucio Tan, miliuner tembakau asal Filipina; atau para konglomerat Indonesia, dari Liem Sioe Liong, Eka Tjipta Widjaya, Aburizal Bakrie, hingga Tommy Winata.\r\n\r\nBerpengalaman sebagai reporter selama belasan tahun di kawasan Asia, Joe Studwell melukiskan secara detail potret diri dan lakon bisnis para godfather: keberanian, kekejaman, kedermawanan, kelihaian, keculasan, kehidupan seksual, pergulatan membangun kongsi dan guanxi, serta komitmen dan pengkhianatan terhadap politisi, preman, juga triad dan sindikat. ','Joe Studwell',2009,'2670_141102285233_3974518_n.jpg','pinjam'),('KB0025','KT001','PT002','TALK-inc. Points','Banyak di antara kita yang takut berbicara di depan banyak orang, dengan segala macam alasannya. Bahkan di Amerika Serikat ada penelitian yang mengungkapkan bahwa sebagian orang ternyata lebih takut berbicara di depan publik ketimbang takut pada ular! Namun kita juga mengetahui bahwa di dunia ini ada pembicara-pembicara yang luar biasa, baik itu negarawan, host acara televisi, master of ceremony, yang mampu memukau audiens, misalnya Bung Karno, John F. Kennedy, Barack Obama, Oprah Winfrey, Larry King, Ellen DeGeneres. Mereka adalah pembicara profesional yang telah menempa dirinya selama bertahun-tahun, menggali potensi dirinya untuk menjadi pembicara yang hebat dan dikagumi.\r\n\r\nDalam buku Talk-inc ini, kita akan belajar bagaimana menjadi pembicara profesional dari guru-guru yang terbaik di Indonesia, yaitu Alexander Sriewijono, Erwin Parengkuan, dan Becky Tumewu. Erwin Parengkuan dan Becky Tumewu dikenal sebagai MC dan presenter terkemuka Indonesia dan sedangkan Alexander Sriewijono adalah psikolog dan inspiring public speaker. Mereka akan mengungkap rahasia kepada Anda tentang strategi sukses menjadi pembicara andal.\r\n\r\nAlexander Sriewijono akan membagikan pengetahuannya tentang membangun pola pikir yang positif, berpikir kritis, dan mengatasi ketakutan serta meningkatkan rasa percaya diri. Erwin Parengkuan akan menjelaskan cara melatih vokal yang baik serta bagaimana mengatur kata-kata yang memberikan impact luar biasa bagi audiens. Becky Tumewu akan menguraikan tentang bagaimana harus bersikap dan memaksimalkan bahasa tubuh serta cara-cara membangun brand image.\r\n\r\nMemiliki buku ini seperti menghadirkan ketiga praktisi komunikasi ini sebagai pelatih pribadi Anda dalam berbicara. Buku ini adalah work book yang dilengkapi dengan beragam latihan dan aktivitas sebagai proses belajar menuju panggung kesuksesan.','Alexander Sriewijono',2008,'2694_146395670233_5894317_n.jpg','tidak'),('KB0026','KT001','PT003',' Semut Mengalahkan Gajah','Dalam buku ini, penulis ingin menggugah dan meyakinkan para pembaca, bahwa setiap bangsa mempunyai potensi yang sangat dahsyat untuk keluar sebagai pemenang dan tidak sekadar bertahan agar tidak kalah. Kita akan sama-sama menelaah, berdialog dengan pikiran dan hati yang bersih, untuk memperbaiki kelemahan, bersemangat untuk melakukan empowerment, dan bersama-sama kita kalahkan para Gajah, kemudian kita raih kesuksesan seperti yang telah dinikmati oleh Jepang dan China. Saya percaya, bahwa kita mempunyai kemampuan itu.','Amir Faisal',2009,'2694_146395675233_841031_n.jpg','tidak'),('KB0027','KT001','PT002',' Outliers -- Rahasia di Balik Sukses','Biasanya kisah-kisah tentang orang-orang yang amat sangat sukses menonjolkan faktor kecerdasan dan ambisi. Dalam buku Outliers, Malcolm Gladwell mengemukakan bahwa kisah sejati tentang sukses benar-benar berbeda dengan apa yang biasa kita baca, dan bahwa jika kita ingin memahami bagaimana perjuangan orang-orang, kita seharusnya meluangkan waktu lebih banyak untuk mengamati apa yang ada di sekeliling mereka-misalnya keluarga mereka, tempat lahir, atau bahkan tanggal lahir mereka. Kisah di balik kesuksesan ternyata jauh lebih rumit-dan jauh lebih menarik-ketimbang yang terlihat di permukaan.\r\n\r\nBuku Outliers ini menjelaskan apa persamaan Beatles dan Bill Gates, kesuksesan luar biasa bangsa Asia dalam bidang matematika, keuntungan tersembunyi yang diperoleh bintang-bintang olahraga, mengapa semua pengacara New York memiliki riwayat hidup yang sama, dan alasan mengapa orang-orang genius tidak selalu sukses---semuanya berhubungan dengan generasi, keluarga, budaya, dan kelas sosial. Menurut Gladwell, sangatlah penting tahun berapa Anda lahir jika Anda ingin menjadi miliarder Lembah Silikon dan sangatlah penting di mana Anda lahir jika Anda ingin menjadi pilot yang sukses. Hidup para outlier-orang-orang yang pencapaian suksesnya di luar jangkauan normal-mengikuti logika yang aneh dan tak terduga.','Malcolm Gladwell',2009,'2694_146395680233_4040736_n.jpg','tidak'),('KB0028','KT001','PT002',' Drachenreiter -- Sang Penunggang Naga','Karena tempat tinggal para naga terancam diusik manusia, para tetua naga mengutus Lung pergi ke Kaki Langit. Maka berangkatlah sang naga muda ke Pegunungan Himalaya, mencari tempat yang selama ini diduga hanya merupakan legenda itu.\r\n\r\nIa ditemani Bulubelerang si gadis goblin dan Ben, bocah laki-laki yatim piatu. Sayang perjalanan mereka tidak berjalan mulus, sebab Nettlebrand, makhluk ganas mirip naga raksasa bersisik emas ciptaan sang alkemis, mengincar mereka. Nettlebrand dibantu Kakiranting, homunkulus--manusia mini--yang menjadi mata-mata dengan menyusup ke ransel Ben.\r\n\r\nPerjalanan makin berat, sebab Lung, Ben, dan Bulubelerang ternyata juga harus berhadapan dengan para kurcaci gila emas, peri-peri jail, basilisk, ular laut, burung raksasa Rock, bahkan jin bermata seribu!','Cornelia Funke',2009,'2694_146395685233_6587998_n.jpg','tidak'),('KB0029','KT001','PT001','The Lonely Planet Story','Pada pertengahan 1972, Tony dan Maureen Wheeler berangkat melakukan perjalanan keliling dunia selama setahun. Setelah mengikuti \'jejak hippie\' dari Inggris melintasi Asia ke Australia, mereka mengenali perlunya panduan perjalanan jenis baru yang cocok dengan pelancong tipe baru yang santai dan independen.\r\n\r\nLebih dari tiga puluh tahun kemudian, mereka menjadi pemilik salah satu perusahaan penerbitan panduan perjalanan terbesar, tersukses, dan paling dicintai di dunia. Lonely Planet Publication memiliki kantor di tiga benua, dengan 400 pegawai, 250 penulis, lebih dari 600 judul yang masih beredar, dan penjualan tahunan lebih dari enam juta buku. Tony dan Maureen Wheeler tinggal di Melbourne, Australia. Inilah kisah luar biasa tentang pasangan petualang yang ber-backpacking lintas Asia dan mendirikan bisnis penerbitan panduan perjalanan tersukses di planet ini.','Tony & Maureen Wheeler',2009,'2664_147567200233_7895277_n.jpg','tidak'),('KB0030','KT001','PT002',' GIGI','ARMAND MAULANA: Cara orang menghargai karya? Bajakan itu dilegalkan saja. Ini cara menghargai karya cipta yang di Indonesia sudah sangat hancur!\r\n\r\nDEWA BUDJANA: Mungkin orang menganggap main band sekarang menghasilkan uang, dikenal. Jadi banyak orangtua yang ingin anaknya bermain musik.\r\n\r\nTHOMAS RAMDHAN: Pihak label menempatkan orang yang mengerti musik, tidak melulu dagang. Keberadaan orang seperti itu akan memengaruhi industri musik di Indonesia.\r\n\r\nGUSTI HENDY: Idealnya, musisi di Indonesia punya kontrol masing-masing. Mudah-mudahan semua bikin album untuk mencerdaskan kehidupan bangsa.','Adib Hidayat',2009,'2664_151036365233_7240695_n.jpg','tidak'),('KB0031','KT001','PT002','Panduan Lengkap Menata Rumah','Home sweet home; rumahku istanaku. Keduanya sangat tepat untuk menggambarkan tujuan buku ini. Berawal dari pemikiran bahwa semua orang menginginkan rumah yang fungsi ruang dan penataannya sesuai dengan kebutuhan, buku ini dihadirkan untuk mempermudah Anda mendapatkan hunian yang bukan hanya tampil cantik, tapi juga melahirkan rasa nyaman.\r\n\r\nLangkah awal yang patut dilakukan adalah mengenali kelebihan dan kekurangan hunian Anda. Setelah itu, Anda bisa memanfaatkan jasa konsultan, bisa juga mengerahkan kemampuan sendiri, untuk memaksimalkan penataannya. Simak berbagai ide menarik di sini yang bisa dijadikan sontekan praktis. Kiat menata yang mudah diterapkan, diperkaya foto-foto interior indah sebagai panduan, mempermudah Anda mewujudkan tatanan rumah idaman.','Imelda Akmal',2009,'2664_151036375233_67795_n.jpg','pinjam'),('KB0032','KT001','PT007','The Miracle of Enzyme Self-healing Program','Mengapa kita sebaiknya:\r\n\r\n- tidak minum susu sapi?\r\n- membatasi minum teh hijau?\r\n- makan buah dan minum jus 30-60 menit sebelum makan utama?\r\n- minum 1-3 gelas air setelah bangun tidur pagi dan 2-3 gelas sejam sebelum makan?\r\n- detoksifikasi menggunakan suntikan kopi?\r\n- tidur siang 5 menit, setelah makan siang?\r\n\r\nTernyata, melakukan hal-hal tersebut bahkan bisa menyembuhkan kanker, obesitas, fibroid, konstipasi, sulit tidur, penyakit jantung dan autoimun.\r\n\r\nDr. Hiromi Shinyaperintis pembedahan kolonoskopis tanpa insisi perut (teknik Shinya)yakin bahwa tubuh punya kemampuan menakjubkan menyembuhkan-sendiri. Kuncinya: Faktor Enzim.\r\n\r\nDalam buku lengkap, praktis, dan menarik ini, Dr. Shinya menunjukkan bahwa:\r\n\r\n- suplemen kalsium dan produk susu bisa menyebabkan osteoporosis;\r\n- pembedahan dan obat-obatan tidak mengobati kanker;\r\n- obat-obatan sering membuat Anda lebih sakit;\r\n- demam justru bisa menyehatkan; dan\r\n- rasa cinta dan gembira bisa meningkatkan daya tahan tubuh.\r\n\r\nPenemuan Dr. Shinya tentang keajaiban tubuh akan merevolusi cara pandang kita terhadap tubuh manusia, nutrisi, pengobatan, dan kesehatan; hanya dengan memahami kuncinya: Enzim.','Dr. Hiromi Shinya',2009,'2664_151087480233_5670375_n.jpg','tidak'),('KB0033','KT001','PT001',' Malaikat dan Iblis','Persaudaraan rahasia purba\r\nSenjata penghancur yang sangat merusak\r\nTarget yang tak terkira\r\nRobert Langdon, simbologis Harvard tersohor, tidak pernah menyangka kalau satu hari dalam hidupnya akan dipenuhi oleh terlalu banyak kejutan. Kalau hanya melihat ambigram yang bertuliskan nama kelompok persaudaraan Illuminati, mungkin itu bukan masalah besar. Tapi melihatnya tercap di dada lima lelaki yang terbunuh pada hari yang sama?\r\n\r\nJauh sebelum memecahkan Kode Da Vinci, Robert Langdon diminta oleh sebuah institusi penelitian di Swiss untuk menganalisis simbol penuh teka-teki yang tercap di dada seorang ahli fisika yang tewas terbunuh. Apa yang ditemukannya sungguh di luar dugaan: dendam mematikan terhadap Gereja Katolik dari sebuah persaudaraan kuno yang sudah berlangsung selama berabad-abadIlluminati. Terdorong untuk menyelamatkan Vatikan dari bom waktu yang berdaya ledak besar, Langdon membantu pasukan penjaga paling setia di dunia bersama dengan seorang ilmuwan misterius nan cantik bernama Vittoria Vetra. Berdua, mereka memulai perburuan yang menyeramkan ke ruang-ruang bawah tanah yang terkunci rapat, kuburan-kuburan berbahaya, katedral-katedral yang lengang, dan tempat yang paling misterius di dunia ... markas Illuminati yang lama terlupakan.\r\n\r\nDitulis dengan gaya jenaka namun cerdas, Dan Brown membawa kita berpetualang di pusat kebudayaan tertua di Eropa, Roma. Pemahaman kita dibuat terkaget-kaget dengan penyingkapan berbagai rahasia di balik tempat-tempat bersejarah dan karya-karya seni terkenal yang terdapat di sana. Dengan plot cerita yang melingkar-lingkar dan alur yang cepat, Brown sekali lagi berhasil menyiksa kita dengan sebuah novel yang sulit dilepaskan begitu kita mulai membacanya!','Dan Brown',2009,'2867_157799815233_6112378_n.jpg','tidak'),('KB0034','KT001','PT001','The Effective Executive -- Kitab Suci Para Eksekutif','Efektivitas itu bisa dipelajari. Buku ini panduannya.\r\nPada dasarnya, pekerjaan seorang eksekutif atau pemimpin adalah to effect dan to execute. Keberhasilannya diukur dari kemampuan dia untuk melakukan hal-hal yang tepat. Inteligensi, imajinasi, wawasan, dan karisma mungkin tidak terlalu berguna dalam pekerjaan eksekutif tanpa kebiasaan (habits) yang dibutuhkan dan membentuk semuanya menjadi hasil yang tepat.\r\n\r\nPeter F. Drucker mengatakan efektivitas itu bidang ilmu, jadi siapa pun dapat mempelajarinya dan berlatih untuk menerapkannya. Drucker menjabarkan lima latihan efektivitas bisnis yang dapat, dan harus, dipelajari:\r\n Mengelola waktu\r\n Menentukan apa yang bisa kita kontribusikan bagi organisasi\r\n Mengetahui bagaimana dan di mana kita harus mengerahkan kekuatan untuk hasil terbaik\r\n Menyusun prioritas yang tepat\r\n Merangkum semuanya dalam pengambilan keputusan yang efektif. \r\n\r\nDengan mengambil contoh dari dunia bisnis dan pemerintahan, Drucker menunjukkan beragam keterampilan eksekutif dan menawarkan pemahaman segar ke dalam situasi bisnis yang tampaknya kolot.','PETER F. DRUCKER',2009,'2867_157799820233_611178_n.jpg','tidak'),('KB0035','KT001','PT001','Honeymoon With My Brother -- Bertualang Keliling Dunia Gara-gara Putus Cinta','Apa yang akan Anda lakukan jika tunangan Anda mencampakkan Anda menjelang pesta pernikahan saat semua undangan telah disebar \r\ndan sebagian tamu tengah berada dalam perjalanan ke kota Anda? \r\n\r\nKehidupan Franz Wisner seolah-olah hancur berantakan ketika tunangannya yang telah dipacarinya selama 10 tahun memutuskan hubungan seminggu sebelum hari pernikahan mereka. Dengan pesta pernikahan dan bulan madu yang telah siap menanti, ada dua pilihan yang tersedia baginya: membatalkan semuanya atau menjalankannya tanpa mempelai wanita. Didukung oleh adiknya, Kurt Wisner, dan para sahabatnya, Franz yang nyaris putus asa mengambil pilihan kedua. \r\n\r\nBulan madu yang awalnya dianggap sebagai gurauan untuk meringankan beban hati, ternyata berubah menjadi pengalaman luar biasa. Franz dan Kurt, dua bersaudara yang semula merasa saling terasing menemukan kembali jati diri dan keintiman mereka. Keduanya kemudian memutuskan berhenti dari pekerjaan mereka, menjual rumah mereka, menyumbangkan pakaian dan perabot mereka, membuang ponsel dan penyeranta mereka, lalu pergi bersama mengelilingi dunia. \r\n\r\nSetelah bertualang selama empat tahun dan menyinggahi lebih dari enam puluh negara, termasuk Indonesia, hubungan mereka justru semakin erat. Franz yang semula patah hati akhirnya menemukan makna hidup yang baru. \r\nPerjalanan mereka pun berubah menjadi sebuah cara baru menikmati hidup. Dari alam liar Amerika Latin hingga Eropa Timur dan Timur Tengah, dari Afrika hingga Asia Tenggara, Australia dan Selandia Baru, setiap petualangan baru membawa mereka ke tempat-tempat yang lebih unik dan menarik, diwarnai aneka kisah seru yang mereka alami. \r\n\r\nLucu, menyentuh, dan sekaligus sangat menghibur, buku ini bakal memancing hasrat bepergian Anda. Mengikuti kedua bersaudara itu sedikit demi sedikit menanggalkan setiap rutinitas harian mereka dan hidup bebas merdeka, mau tak mau Anda akan berharap dapat melakukannya juga.','Franz Wisner',2009,'2867_157799825233_3607965_n.jpg','tidak'),('KB0036','KT001','PT001','The Art of Racing in the Rain Enzo - Novel Tentang Seekor Filsuf','\"Memang, aku dimasukkan ke dalam tubuh seekor anjing, tapi itu hanya kulit luar. Di dalamnyalah yang penting. Jiwa. Dan jiwaku sangat manusiawi,\" kata Enzo.\r\n\r\nEnzo mengetahui ada sesuatu dalam dirinya yang berbeda dari anjing-anjing lain. Dia seekor filsuf yang gemar menonton televisi, khususnya National Geographic dan F1. Dari kotak ajaib itulah dia belajar tentang, dan menjadi, manusia. Dia juga menyimak dengan saksama kata-kata yang diucapkan tuannya, Denny Swift, seorang pembalap.\r\n\r\nMelalui Denny, Enzo memperoleh sangat banyak pengetahuan mengenai kehidupan manusia. Dia memahami bahwa hidup, seperti halnya balapan, tidaklah hanya soal melaju kencang. Dengan menggunakan teknik-teknik di arena balap, manusia dapat berhasil menjalani liku-liku kehidupan. \r\n\r\nPada malam sakaratulmautnya, Enzo menghimpun kenangannya, mengingat kembali semua yang telah dia alami bersama Denny dan keluarganya, termasuk membebaskan majikannya dari pengadilan atas tuduhan pemerkosaan. Setelah mempelajari apa saja yang diperlukan untuk menjadi manusia mulia dan sukses, anjing yang bijaksana itu tak sabar lagi menunggu kehidupan selanjutnya. \r\n\r\nSebagai cerita tentang keluarga, cinta, kesetiaan, dan harapan yang meremas hati tetapi sangat lucu dan begitu menginspirasi, buku ini dibingkai dalam sudut pandang yang tidak biasa terhadap betapa bikin penasaran dan absurdnya kehidupan manusia... yang tentu saja hanya bisa dilakukan seekor anjing.','Garth Stein',2009,'2919_165044760233_5090765_n.jpg','tidak'),('KB0037','KT001','PT003','New Ideas From Dead CEOs','New Ideas from Dead CEOs menyingkap rahasia sukses para CEO besar dengan menyajikan sebuah pandangan yang intim tentang kehidupan profesional dan pribadi mereka kepada para pembaca. Mengapa rencana Ray Kroc untuk McDonalds berhasil dengan gemilang ketika banyak bisnis burger lain gagal? Mengapa, satu dasawarsa kemudian, Krispy Kreme gagal memetik pelajaran dari kesuksesan kerja keras Kroc? Bagaimana hari-hari paling kelam Walt Disney sebagai seorang kartunis muda dapat mengubah kariernya secara radikal? Ketika Estee Lauder masih kanak-kanak di Queens, New York, rata-rata orang Amerika membelanjakan $8 per tahun untuk barang-barang perawatan tubuh. Mengapa ia mampu menemukan kesempatan untuk menjual barang-barang kosmetik berharga tinggi, dan mengapa ia mengetuk-ngetuk pintu pusat pembelanjaan mewah Saks? Bagaimanakah Thomas Watson Jr. sampai memutuskan untuk mengadu nasib dan mempertaruhkan semua uang IBM dalam bisnis komputer, ketika ayahnya menganggap hal itu sebagai gagasan pecundang? Kita akan mempelajari tantangan dan kegagalan para CEO besar tersebut, dan bagaimana mereka mampu mengatasi gelombang perubahan demografi dan teknologi. \r\n\r\nNew Ideas from CEOs tidak hanya memberikan pemahaman yang mendalam mengenai kehidupan para CEO, tetapi juga menunjukkan kepada kita cara menerapkan gagasan mereka pada kemenangan dan perjuangan di masa kini yang dilakukan Sony, Dell, Costco, Carnival Cruises, Time Warner, dan banyak perusahaan lain yang mencoba untuk menemukan cara bertahan atau meniti kembali jalan menuju puncak kejayaan. \r\n\r\nPara CEO yang diketengahkan dalam buku ini bukanlah calon orang suci. Namun, orang-orang ini mengabdikan diri dalam bisnisnya dan tidak semata-mata mencurahkan konsentrasi pada ego, rekening bank, dan yatch pribadi mereka saja. \r\n\r\nNew Ideas from Dead CEOs yang segar dan penuh makna dari Todd G. Buchholz ini sangatlah mengasyikkan dan enak untuk dibaca -sekaligus serius dan realistis- memberikan pandangan tentang apa yang harus kita serap dan pelajari dari para CEO yang telah wafat. ','Todd G. Buchholz',2009,'2919_165044765233_188202_n.jpg','tidak'),('KB0038','KT001','PT001','Charisma Effect','Bayangkan Anda adalah orang yang selalu bisa memberikan kesan yang positif di mana pun dan kapan pun Anda berada \r\nKita semua tahu siapa orang yang berkarisma. Mereka selalu memancarkan kepercayaan diri serta daya tarik yang luar biasa terhadap orang-orang di sekelilingnya. Oleh karenanya, mereka mendapat kerpercayaan, kekaguman, dan persetujuan dari semua orang. \r\nAnda ingin menjadi seperti itu juga? \r\nBuku ini akan memaparkan caranya. Mengajari Anda untuk membangkitkan keahlian pribadi dengan cepat, membangun penilaian yang berkesan pada setiap pertemuan dengan semua orang yang Anda temui, dan membawa daya tarik di mana pun dan kapan pun Anda pergi. Temukan kehebatan efek karisma yang luar biasa untuk meningkatkan semua aspek dalam kehiduapan Anda. ','Andrew Leigh',2009,'2919_165044770233_8077679_n.jpg','tidak'),('KB0039','KT001','PT001','The Mafias Greatest Hits - Kisah Nyata 10 Pembunuhan Paling Masyhur di Dunia Mafia','Mafia. Kata itu mengingatkan kita pada gangster yang berasal dari Sisilia, Italia. Mafia telah menorehkan sejarah tersendiri dalam dunia kriminal. Mereka terkenal karena salah satu kode etiknya yaitu omertasikap tutup mulut. Pelanggaran terhadap kode etik ini berarti: maut! \r\n\r\nSiapa yang tak kenal Al Capone, Charlie Luciano, Don Salvatore Maranzano, Bugsy Siegel, Albert Anastasia, ataupun Paul Castellano? Mereka semua adalah bos Mafia yang mempunyai andil besar dalam perkembangan Mafia di Amerika. Siapa sangka pembunuhan bos Mafia bisa berhubungan dengan percobaan pembunuhan Fidel Castro, CIA, JFK, dan Marylin Monroe? \r\n\r\nBuku ini mengupas sepuluh pembunuhan terkenal yang terjadi pada bos-bos Mafia. Dalam buku ini dibahas secara mendalam latar belakang serta strategi dan taktik yang digunakan dalam pembunuhan tersebut, plus dampaknya terhadap dunia Mafia. Sepuluh pembunuhan itu jelas membawa perubahan besar!','David H. Jacobs',2009,'2919_165044775233_1623833_n.jpg','tidak'),('KB0040','KT001','PT007','Merah','Sesuai dengan namanya. Petra keras kepala seperti batu karang. Masa kecilnya pun keras karena ia ditolak oleh keluarganya. Ia memang tak secantik kakak pertamanya, Joana. Dan tak sepintar kakak keduanya, Helen. Dan, orangtuanya tak senang mendapatkan anak ketiga lagi-lagi perempuan, di saat ekonomi mereka tak terlalu baik. Tapi ia punya hati yang baik. Pertemuannya dengan Yohanes telah mengubah hidup Petra karena pria itu punya kepercayaan bahwa suatu hari gadis itu akan menjadi seorang yang luar biasa melebihi kedua kakaknya. \r\n\r\nTak pernah dibayangkan Petra bahwa ia akan berhubungan dengan dua orang pria kakak beradik yang seayah lain ibu. Yang satu adalah pria yang kejam dan tak berperasaan., tapi menjadi orang pertama yang mengukir cinta di hatinya Yang satu lagi selalu menjadi penolongnya di saat ia tertimpa masalah. \r\n\r\nKeduanya berperan besar dalam mengubah masa depan Petra. Dan tanpa Petra sadari, sebuah Kekuasaan Yang Lebih Tinggi telah memilih wanita itu untuk menjadi si Merah, yang kelak akan menolong banyak sekali orang. Khususnya di Indonesia. Bagaimana dengan kisah cinta Petra? Siapa yang dipilihnya, Nathan sang kakak yang berkuasa, atau Jimmy sang adik yang selalu menyelamatkannya? ','Agnes Jessica',2009,'2919_165044785233_149938_n.jpg','tidak'),('KB0041','KT001','PT003','Naskah-Naskah Kompas Jaya Suprana','Bung Jaya Suprana adalah seorang penulis yang memiliki karakter khas. Gayanya orisinal dan selalu diselipi sentuhan kocak. Maklum budayawan yang kartunis ini juga seorang dedengkot humor Indonesia. Tulisan-tulisannya banyak memberi pencerahan bagi berbagai pemahaman yang sebetulnya keliru namun telanjur dianggap benar karena sudah menjadi \'kaprah\'. Ideologi positivisme mewarnai tulisan-tulisannya, mencerahkan langit yang sumpek oleh polusi berbagai pemikiran negatif dan pesimistik. Kumpulan naskah Bung Jaya Suprana ini bagaikan katalog pemikiran yang memudahkan kita mencari referensi segar.','JAYA SUPRANA',2009,'4141_167257255233_8359853_n.jpg','tidak'),('KB007','KT003','PT002','Karakter-karakter yang Mengubah Dunia','Orang berkarakter kerap lebih mengesankan dan mengundang rasa ingin tahu daripada ulasan sejarah maupun setumpuk buku. Mereka mampu mengguncangkan dunia, menggetarkan hati, mengubah jalan kehidupan peradaban manusia, memperlihatkan bahwa menjadi manusia seseorang bisa mengeluarkan kualitas terbaiknya. Aksi individu seperti itu membuat kehidupan manusia jadi dramatik, penuh petualangan, berani, bahkan nyaris tanpa kompromi.\r\nKetika orang bertanya, \"Siapa saya?\" untuk memastikan integritas diri dalam kehidupan di dunia, buku ini memastikan bahwa untuk menjadi manusia terbaik ialah dengan menjalani dengan teguh karakter yang sudah ditakdirkan untuk dirinya sendiri. Sebuah buku yang bukan saja cocok sebagai koleksi berharga keluarga, melainkan juga bisa dibaca oleh semua generasi. Isinya penuh dengan pengajaran, ditulis dengan emosi yang mampu membuat nafas pembacanya tertahan.','John McCain',2009,'2606_134319820233_6629778_n.jpg','tidak'),('KB008','KT003','PT002','Membongkar Kejahatan Jaringan Internasional','Belum ada sebelumnya seorang mantan bandit yang bicara blak-blakan tentang sebuah kejahatan global seperti John Perkins. Melalui alur tulisan yang tak membosankan dan mudah dimengerti, ia membongkar kejahatan jaringan internasional atas upaya Pemiskinan negara-negara dunia ketiga. Sebut saja Tibet, Kongo, Lebanon, Venezuela, Irak, dan lainnya. Ditambah perusahaan besar yang kerjanya memeras keringat pegawainya. Mencengangkan !!\r\n\r\nIndonesia sendiri dijarah, kekayaannya dihisap habis, potensinya dilemahkan, posisi tawarnya di hadapan lembaga internasional menjadi tak berharga, rakyatnya dimiskinkan, dan hanya menguntungkan segelintir orang yang menjadi perantara jaringan hitam ini.','John Perkins',2009,'2606_134319825233_1793331_n.jpg','tidak'),('KB009','KT004','PT002',' The Black Swan','Buku ini tentang Black Swan: peristiwa acak yang mendasari hidup kita, dari munculnya buku-buku bestseller hingga bencana dunia. Dampak peristiwa-peristiwa tersebut amat besar; nyaris mustahil dapat diprediksi; namun setelah terjadi, kita selalu berusaha untuk merasionalisasinya. Salah contoh terkini tentang Black Swan adalah kejatuhan pasar saham dunia pada tahun 2008-sesuatu yang telah diendus dalam buku ini. The Black Swan menunjukkan kepada kita mengapa kita mesti berusaha memprediksi segala sesuatu dan justru mengambil keuntungan dari ketidakpastian.','Nassim Nicholas Taleb',2009,'2606_134319830233_2123068_n.jpg','tidak');

/*Table structure for table `t_kartu` */

DROP TABLE IF EXISTS `t_kartu`;

CREATE TABLE `t_kartu` (
  `kode_anggota` varchar(15) NOT NULL,
  `kode_petugas` varchar(15) DEFAULT NULL,
  `tgl_buat` date DEFAULT '0000-00-00',
  `tgl_akhir` date DEFAULT '0000-00-00',
  `status_aktiv` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`kode_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_kartu` */

insert  into `t_kartu`(`kode_anggota`,`kode_petugas`,`tgl_buat`,`tgl_akhir`,`status_aktiv`) values ('MML-AG001','PG001','2013-02-16','2012-02-16','habis'),('MML-AG002','PG001','2013-02-14','2013-03-01','aktif'),('MML-AG003',NULL,'0000-00-00','0000-00-00','belum'),('MML-AG004','PG001','2013-02-15','2014-02-15','aktif'),('MML-AG005',NULL,'0000-00-00','0000-00-00','belum'),('MML-AG006','PG001','2013-02-13','2014-02-13','aktif');

/*Table structure for table `t_kategori` */

DROP TABLE IF EXISTS `t_kategori`;

CREATE TABLE `t_kategori` (
  `kode_kategori` varchar(15) NOT NULL,
  `nama_kategori` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kode_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_kategori` */

insert  into `t_kategori`(`kode_kategori`,`nama_kategori`) values ('KT001','Fiksi Romantika Remaja'),('KT002','Fiksi Horror'),('KT003','Non-Fiksi Biographi'),('KT004','Non-Fiksi Ensikloped'),('KT005','Fiksi Novel Romantis');

/*Table structure for table `t_peminjaman` */

DROP TABLE IF EXISTS `t_peminjaman`;

CREATE TABLE `t_peminjaman` (
  `kode_peminjaman` varchar(20) NOT NULL,
  `kode_anggota` varchar(15) DEFAULT NULL,
  `kode_petugas` varchar(15) DEFAULT NULL,
  `kode_buku` varchar(15) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `tgl_hrs_kembali` date DEFAULT NULL,
  PRIMARY KEY (`kode_peminjaman`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_peminjaman` */

insert  into `t_peminjaman`(`kode_peminjaman`,`kode_anggota`,`kode_petugas`,`kode_buku`,`tgl_peminjaman`,`tgl_hrs_kembali`) values ('MML-PMJN-001','MML-AG001','PG001','KB007','2012-12-30','2013-01-06'),('MML-PMJN-002','MML-AG002','PG001','KB008','2012-12-30','2013-01-06'),('MML-PMJN-003','MML-AG001','PG001','KB009','2013-01-10','2013-01-17'),('MML-PMJN-004','MML-AG002','PG001','KB0010','2013-02-12','2013-02-19'),('MML-PMJN-005','MML-AG006','PG001','KB0010','2013-02-13','2013-02-20'),('MML-PMJN-006','MML-AG002','PG001','KB0024','2013-02-14','2013-02-21'),('MML-PMJN-007','MML-AG006','PG001','KB0031','2013-02-15','2013-02-22');

/*Table structure for table `t_penerbit` */

DROP TABLE IF EXISTS `t_penerbit`;

CREATE TABLE `t_penerbit` (
  `kode_penerbit` varchar(15) NOT NULL,
  `nama_penerbit` varchar(20) DEFAULT NULL,
  `alamat_penerbit` varchar(100) DEFAULT NULL,
  `tlp_penerbit` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`kode_penerbit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_penerbit` */

insert  into `t_penerbit`(`kode_penerbit`,`nama_penerbit`,`alamat_penerbit`,`tlp_penerbit`) values ('PT001','	Global Media','Jl. Gajah Mada 30 Jakarta Pusat','0218768345'),('PT002','Gramedia','Jl. Sudirman 345 Jakarta Pusat','02165479875'),('PT003','	Elex Media','Jl. Jend. A. Yani Surabaya','089793927399 	'),('PT006','AW Publishing','Jakarta','0218977885'),('PT007','Pustaka Hermon','',''),('PT008','KPG','','');

/*Table structure for table `t_pengembalian` */

DROP TABLE IF EXISTS `t_pengembalian`;

CREATE TABLE `t_pengembalian` (
  `kode_pengembalian` varchar(20) DEFAULT NULL,
  `kode_peminjaman` varchar(20) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_pengembalian` */

insert  into `t_pengembalian`(`kode_pengembalian`,`kode_peminjaman`,`tgl_kembali`,`denda`) values ('MML-KMBL-001','MML-PMJN-001','2013-01-10','4000'),('MML-KMBL-002','MML-PMJN-002','2013-01-10','4000'),('MML-KMBL-003','MML-PMJN-003','2013-02-12','26000'),('MML-KMBL-004','MML-PMJN-004','2013-02-14','0'),('MML-KMBL-005','MML-PMJN-005','2013-02-15','0'),('MML-KMBL-006','MML-PMJN-006','0000-00-00','0'),('MML-KMBL-007','MML-PMJN-007','0000-00-00','0');

/*Table structure for table `t_petugas` */

DROP TABLE IF EXISTS `t_petugas`;

CREATE TABLE `t_petugas` (
  `kode_petugas` varchar(15) NOT NULL,
  `nama_petugas` varchar(50) DEFAULT NULL,
  `hakakses` varchar(5) NOT NULL DEFAULT 'tidak',
  `ym_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kode_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_petugas` */

insert  into `t_petugas`(`kode_petugas`,`nama_petugas`,`hakakses`,`ym_user`) values ('MN001','Bernard Fisto Ariando','not','not'),('PG001','Syahwa Puti Nabila','tidak','SyahwaPuti'),('PG002','Disa Arista Syuhada','tidak','disarista');

/* Trigger structure for table `t_anggota` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_verifikasi` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `delete_verifikasi` AFTER DELETE ON `t_anggota` FOR EACH ROW BEGIN
	DELETE from t_kartu where kode_anggota = OLD.kode_anggota;
    END */$$


DELIMITER ;

/* Trigger structure for table `t_petugas` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `add_petugas` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `add_petugas` AFTER INSERT ON `t_petugas` FOR EACH ROW BEGIN
	insert into login(username, password, level) values(NEW.kode_petugas, md5(NEW.kode_petugas), 2);
    END */$$


DELIMITER ;

/* Trigger structure for table `t_petugas` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_petugas` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `delete_petugas` AFTER DELETE ON `t_petugas` FOR EACH ROW BEGIN
	DELETE from login where username = OLD.kode_petugas;
	delete from t_kartu where kode_petugas = OLD.kode_petugas;
	delete from t_peminjaman where kode_petugas = OLD.kode_petugas;
    END */$$


DELIMITER ;

/* Function  structure for function  `denda` */

/*!50003 DROP FUNCTION IF EXISTS `denda` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `denda`(kembali DATE, tenggat DATE) RETURNS int(11)
BEGIN
	DECLARE denda INT;
	
	IF(kembali = '0000-00-00')
	THEN
	SET denda = (DATEDIFF(CURDATE(), tenggat)) * 1000;
	ELSE
	SET denda = (DATEDIFF(kembali, tenggat)) * 1000;
	END IF;
	
	IF(denda >= 1000)
	THEN
	RETURN denda;
	ELSE
	RETURN 0;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `change_buku` */

/*!50003 DROP PROCEDURE IF EXISTS  `change_buku` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `change_buku`(kode_buku2 VARCHAR(15), kode_kategori2 varchar(15), kode_penerbit2 varchar(15), judul2 varchar(100), sinopsis2 LONGTEXT, pengarang2 varchar(30), thn_terbit2 year(4), cover_buku2 varchar(500))
BEGIN
	IF(EXISTS(SELECT kode_buku FROM t_buku WHERE kode_buku = kode_buku2))
	THEN
	UPDATE t_buku SET kode_kategori = kode_kategori2, kode_penerbit = kode_penerbit2, judul = judul2, sinopsis = sinopsis2, pengarang = pengarang2, thn_terbit = thn_terbit2, cover_buku = cover_buku2 WHERE kode_buku = kode_buku2;
	ELSE
	INSERT INTO t_buku(kode_buku, kode_kategori, kode_penerbit, judul, sinopsis, pengarang, thn_terbit, cover_buku) VALUES(kode_buku2, kode_kategori2, kode_penerbit2, judul2, sinopsis2, pengarang2, thn_terbit2, cover_buku2);
	END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `change_kategori` */

/*!50003 DROP PROCEDURE IF EXISTS  `change_kategori` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `change_kategori`(kode_kategori2 VARCHAR(15), nama_kategori2 VARCHAR(30))
BEGIN
IF(EXISTS(SELECT kode_kategori FROM t_kategori WHERE kode_kategori=kode_kategori2))
THEN
UPDATE t_kategori SET nama_kategori=nama_kategori2 WHERE kode_kategori=kode_kategori2;
ELSE
INSERT INTO t_kategori(kode_kategori, nama_kategori) VALUES(kode_kategori2, nama_kategori2);
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `change_penerbit` */

/*!50003 DROP PROCEDURE IF EXISTS  `change_penerbit` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `change_penerbit`(kode_penerbit2 varchar(15), nama_penerbit2 varchar(20), alamat_penerbit2 varchar(100), tlp_penerbit2 varchar(15))
BEGIN
IF(EXISTS(SELECT kode_penerbit FROM t_penerbit WHERE kode_penerbit=kode_penerbit2))
THEN
UPDATE t_penerbit SET nama_penerbit=nama_penerbit2, alamat_penerbit=alamat_penerbit2, tlp_penerbit=tlp_penerbit2 WHERE kode_penerbit=kode_penerbit2;
ELSE
INSERT INTO t_penerbit(kode_penerbit, nama_penerbit, alamat_penerbit, tlp_penerbit) VALUES(kode_penerbit2, nama_penerbit2, alamat_penerbit2, tlp_penerbit2);
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `change_petugas` */

/*!50003 DROP PROCEDURE IF EXISTS  `change_petugas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `change_petugas`(kode_petugas2 VARCHAR(15), nama_petugas2 VARCHAR(30), ym_user2 varchar(30))
BEGIN
IF(EXISTS(SELECT kode_petugas FROM t_petugas WHERE kode_petugas=kode_petugas2))
THEN
UPDATE t_petugas SET nama_petugas=nama_petugas2, ym_user = ym_user2 WHERE kode_petugas=kode_petugas2;
ELSE
INSERT INTO t_petugas(kode_petugas, nama_petugas) VALUES(kode_petugas2, nama_petugas2);
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `kartu_anggota` */

/*!50003 DROP PROCEDURE IF EXISTS  `kartu_anggota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `kartu_anggota`(kode_petugas2 varchar(15), kode_anggota2 varchar(15))
BEGIN
	DECLARE tglbuat date;
	DECLARE tglakhir DATE;
	DECLARE stat DATE;
	
	
	select tgl_buat, tgl_akhir, status_aktiv into tglbuat, tglakhir, stat from t_kartu where kode_anggota = kode_anggota2;
	
	if(tglbuat = '0000-00-00') then
	update	t_kartu set kode_petugas = kode_petugas2, tgl_buat = CURDATE(), tgl_akhir = DATE_ADD(CURDATE(), INTERVAL 1 year), status_aktiv = 'aktif' where kode_anggota = kode_anggota2;
	else
		if(DATEDIFF((tglakhir), CURDATE()) < 0) then
			if(stat = 'aktif') then
			update t_kartu set status_aktiv = 'habis' where kode_anggota = kode_anggota2;
			else
			UPDATE t_kartu SET tgl_buat = CURDATE(), tgl_akhir = DATE_ADD(CURDATE(), INTERVAL 1 YEAR), status_aktiv = 'aktif' WHERE kode_anggota = kode_anggota2;
			end if;
		end if;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `peminjaman` */

/*!50003 DROP PROCEDURE IF EXISTS  `peminjaman` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `peminjaman`(OUT hasil varchar(100), kode_peminjaman2 varchar(20), kode_anggota2 varchar(15), kode_petugas2 varchar(15), kode_buku2 varchar(15), kode_pengembalian2 varchar(20))
BEGIN
DECLARE kembali DATE;
SET kembali = DATE_ADD(CURRENT_DATE(), INTERVAL +7 DAY);
if(EXISTS(SELECT kode_anggota from t_anggota where kode_anggota = kode_anggota2) AND EXISTS(SELECT kode_buku FROM t_buku WHERE kode_buku = kode_buku2)) then
	if((SELECT status_aktiv from t_kartu where kode_anggota = kode_anggota2) = "aktif") then
	
		if((SELECT status from t_buku where kode_buku = kode_buku2) = "tidak") THEN
			INSERT INTO t_peminjaman(kode_peminjaman, kode_anggota, kode_petugas, kode_buku, tgl_peminjaman, tgl_hrs_kembali) VALUES(kode_peminjaman2, kode_anggota2, kode_petugas2, kode_buku2, NOW(), kembali);
			insert into t_pengembalian(kode_pengembalian, kode_peminjaman, tgl_kembali, denda) values(kode_pengembalian2, kode_peminjaman2, '0000-00-00', '0');
			update t_buku set status = "pinjam" where kode_buku = kode_buku2;
			set hasil = "Peminjaman Disimpan";
		else
		set hasil = "Buku masih dipinjam oleh anggota lain";
		end if;
	else
	set hasil = concat("Masa aktif kartu anggota ", kode_anggota2, " telah habis");
	end if;
else
set hasil = "Terdapat kesalahan dalam mengisi kode anggota / kode buku";
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `pengembalian` */

/*!50003 DROP PROCEDURE IF EXISTS  `pengembalian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pengembalian`(kode_peminjaman2 varchar(20), kode_buku2 varchar(15), denda2 VARCHAR(10))
BEGIN
	UPDATE t_pengembalian set tgl_kembali = NOW(), denda = denda2 where kode_peminjaman = kode_peminjaman2;
	UPDATE t_buku set status = "tidak" where kode_buku = kode_buku2;
    END */$$
DELIMITER ;

/*Table structure for table `anggota_pinjam` */

DROP TABLE IF EXISTS `anggota_pinjam`;

/*!50001 DROP VIEW IF EXISTS `anggota_pinjam` */;
/*!50001 DROP TABLE IF EXISTS `anggota_pinjam` */;

/*!50001 CREATE TABLE `anggota_pinjam` (
  `kode_anggota` varchar(15) DEFAULT NULL,
  `nama_anggota` varchar(100) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `data_peminjaman` */

DROP TABLE IF EXISTS `data_peminjaman`;

/*!50001 DROP VIEW IF EXISTS `data_peminjaman` */;
/*!50001 DROP TABLE IF EXISTS `data_peminjaman` */;

/*!50001 CREATE TABLE `data_peminjaman` (
  `nama_petugas` varchar(50) DEFAULT NULL,
  `nama_anggota` varchar(100) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `detail_buku` */

DROP TABLE IF EXISTS `detail_buku`;

/*!50001 DROP VIEW IF EXISTS `detail_buku` */;
/*!50001 DROP TABLE IF EXISTS `detail_buku` */;

/*!50001 CREATE TABLE `detail_buku` (
  `kode_buku` varchar(15) NOT NULL,
  `kode_kategori` varchar(15) DEFAULT NULL,
  `kode_penerbit` varchar(15) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `sinopsis` longtext,
  `pengarang` varchar(30) DEFAULT NULL,
  `thn_terbit` year(4) DEFAULT NULL,
  `cover_buku` varchar(500) DEFAULT NULL,
  `status` enum('pinjam','tidak') DEFAULT NULL,
  `nama_kategori` varchar(30) DEFAULT NULL,
  `nama_penerbit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `get_peminjaman` */

DROP TABLE IF EXISTS `get_peminjaman`;

/*!50001 DROP VIEW IF EXISTS `get_peminjaman` */;
/*!50001 DROP TABLE IF EXISTS `get_peminjaman` */;

/*!50001 CREATE TABLE `get_peminjaman` (
  `kode_peminjaman` varchar(20) NOT NULL,
  `kode_anggota` varchar(15) DEFAULT NULL,
  `kode_petugas` varchar(15) DEFAULT NULL,
  `kode_buku` varchar(15) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `tgl_hrs_kembali` date DEFAULT NULL,
  `kode_pengembalian` varchar(20) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `jumdenda` bigint(11) DEFAULT NULL,
  `nama_anggota` varchar(100) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `grafik_peminjaman` */

DROP TABLE IF EXISTS `grafik_peminjaman`;

/*!50001 DROP VIEW IF EXISTS `grafik_peminjaman` */;
/*!50001 DROP TABLE IF EXISTS `grafik_peminjaman` */;

/*!50001 CREATE TABLE `grafik_peminjaman` (
  `bulan` int(2) DEFAULT NULL,
  `jumlah` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `kartu_anggota` */

DROP TABLE IF EXISTS `kartu_anggota`;

/*!50001 DROP VIEW IF EXISTS `kartu_anggota` */;
/*!50001 DROP TABLE IF EXISTS `kartu_anggota` */;

/*!50001 CREATE TABLE `kartu_anggota` (
  `kode_anggota` varchar(15) NOT NULL,
  `nama_anggota` varchar(100) DEFAULT NULL,
  `sisa` int(7) DEFAULT NULL,
  `status_verif` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `peminjaman_buku` */

DROP TABLE IF EXISTS `peminjaman_buku`;

/*!50001 DROP VIEW IF EXISTS `peminjaman_buku` */;
/*!50001 DROP TABLE IF EXISTS `peminjaman_buku` */;

/*!50001 CREATE TABLE `peminjaman_buku` (
  `kode_buku` varchar(15) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `ranking_buku` */

DROP TABLE IF EXISTS `ranking_buku`;

/*!50001 DROP VIEW IF EXISTS `ranking_buku` */;
/*!50001 DROP TABLE IF EXISTS `ranking_buku` */;

/*!50001 CREATE TABLE `ranking_buku` (
  `kode_buku` varchar(15) NOT NULL,
  `kode_kategori` varchar(15) DEFAULT NULL,
  `kode_penerbit` varchar(15) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `sinopsis` longtext,
  `pengarang` varchar(30) DEFAULT NULL,
  `thn_terbit` year(4) DEFAULT NULL,
  `cover_buku` varchar(500) DEFAULT NULL,
  `status` enum('pinjam','tidak') DEFAULT 'tidak',
  `jumlah` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `status_anggota` */

DROP TABLE IF EXISTS `status_anggota`;

/*!50001 DROP VIEW IF EXISTS `status_anggota` */;
/*!50001 DROP TABLE IF EXISTS `status_anggota` */;

/*!50001 CREATE TABLE `status_anggota` (
  `kode_anggota` varchar(15) NOT NULL,
  `status_verif` varchar(10) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*View structure for view anggota_pinjam */

/*!50001 DROP TABLE IF EXISTS `anggota_pinjam` */;
/*!50001 DROP VIEW IF EXISTS `anggota_pinjam` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `anggota_pinjam` AS select `t_peminjaman`.`kode_anggota` AS `kode_anggota`,`t_anggota`.`nama_anggota` AS `nama_anggota`,`t_peminjaman`.`tgl_peminjaman` AS `tgl_peminjaman` from (`t_anggota` join `t_peminjaman`) where (`t_anggota`.`kode_anggota` = `t_peminjaman`.`kode_anggota`) */;

/*View structure for view data_peminjaman */

/*!50001 DROP TABLE IF EXISTS `data_peminjaman` */;
/*!50001 DROP VIEW IF EXISTS `data_peminjaman` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_peminjaman` AS select `t_petugas`.`nama_petugas` AS `nama_petugas`,`t_anggota`.`nama_anggota` AS `nama_anggota`,`t_buku`.`judul` AS `judul`,`t_peminjaman`.`tgl_peminjaman` AS `tgl_peminjaman` from (((`t_peminjaman` join `t_petugas`) join `t_anggota`) join `t_buku`) where ((`t_peminjaman`.`kode_petugas` = `t_petugas`.`kode_petugas`) and (`t_peminjaman`.`kode_anggota` = `t_anggota`.`kode_anggota`) and (`t_peminjaman`.`kode_buku` = `t_buku`.`kode_buku`)) */;

/*View structure for view detail_buku */

/*!50001 DROP TABLE IF EXISTS `detail_buku` */;
/*!50001 DROP VIEW IF EXISTS `detail_buku` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_buku` AS select `t_buku`.`kode_buku` AS `kode_buku`,`t_buku`.`kode_kategori` AS `kode_kategori`,`t_buku`.`kode_penerbit` AS `kode_penerbit`,`t_buku`.`judul` AS `judul`,`t_buku`.`sinopsis` AS `sinopsis`,`t_buku`.`pengarang` AS `pengarang`,`t_buku`.`thn_terbit` AS `thn_terbit`,`t_buku`.`cover_buku` AS `cover_buku`,`t_buku`.`status` AS `status`,`t_kategori`.`nama_kategori` AS `nama_kategori`,`t_penerbit`.`nama_penerbit` AS `nama_penerbit` from ((`t_buku` join `t_kategori`) join `t_penerbit`) where ((`t_buku`.`kode_kategori` = `t_kategori`.`kode_kategori`) and (`t_buku`.`kode_penerbit` = `t_penerbit`.`kode_penerbit`)) */;

/*View structure for view get_peminjaman */

/*!50001 DROP TABLE IF EXISTS `get_peminjaman` */;
/*!50001 DROP VIEW IF EXISTS `get_peminjaman` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_peminjaman` AS select `t_peminjaman`.`kode_peminjaman` AS `kode_peminjaman`,`t_peminjaman`.`kode_anggota` AS `kode_anggota`,`t_peminjaman`.`kode_petugas` AS `kode_petugas`,`t_peminjaman`.`kode_buku` AS `kode_buku`,`t_peminjaman`.`tgl_peminjaman` AS `tgl_peminjaman`,`t_peminjaman`.`tgl_hrs_kembali` AS `tgl_hrs_kembali`,`t_pengembalian`.`kode_pengembalian` AS `kode_pengembalian`,`t_pengembalian`.`tgl_kembali` AS `tgl_kembali`,`denda`(`t_pengembalian`.`tgl_kembali`,`t_peminjaman`.`tgl_hrs_kembali`) AS `jumdenda`,`t_anggota`.`nama_anggota` AS `nama_anggota`,`t_buku`.`judul` AS `judul` from (((`t_peminjaman` join `t_pengembalian`) join `t_anggota`) join `t_buku`) where ((`t_peminjaman`.`kode_peminjaman` = `t_pengembalian`.`kode_peminjaman`) and (`t_peminjaman`.`kode_anggota` = `t_anggota`.`kode_anggota`) and (`t_peminjaman`.`kode_buku` = `t_buku`.`kode_buku`)) order by `t_peminjaman`.`tgl_peminjaman` desc */;

/*View structure for view grafik_peminjaman */

/*!50001 DROP TABLE IF EXISTS `grafik_peminjaman` */;
/*!50001 DROP VIEW IF EXISTS `grafik_peminjaman` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grafik_peminjaman` AS select month(`t_peminjaman`.`tgl_peminjaman`) AS `bulan`,count(0) AS `jumlah` from `t_peminjaman` where (year(`t_peminjaman`.`tgl_peminjaman`) = year(curdate())) group by month(`t_peminjaman`.`tgl_peminjaman`) */;

/*View structure for view kartu_anggota */

/*!50001 DROP TABLE IF EXISTS `kartu_anggota` */;
/*!50001 DROP VIEW IF EXISTS `kartu_anggota` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kartu_anggota` AS select `t_kartu`.`kode_anggota` AS `kode_anggota`,`t_anggota`.`nama_anggota` AS `nama_anggota`,(to_days(`t_kartu`.`tgl_akhir`) - to_days(curdate())) AS `sisa`,`t_anggota`.`status_verif` AS `status_verif` from (`t_kartu` join `t_anggota`) where (`t_kartu`.`kode_anggota` = `t_anggota`.`kode_anggota`) order by `t_anggota`.`status_verif` */;

/*View structure for view peminjaman_buku */

/*!50001 DROP TABLE IF EXISTS `peminjaman_buku` */;
/*!50001 DROP VIEW IF EXISTS `peminjaman_buku` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `peminjaman_buku` AS select `t_peminjaman`.`kode_buku` AS `kode_buku`,`t_buku`.`judul` AS `judul`,`t_peminjaman`.`tgl_peminjaman` AS `tgl_peminjaman` from (`t_peminjaman` join `t_buku`) where (`t_peminjaman`.`kode_buku` = `t_buku`.`kode_buku`) */;

/*View structure for view ranking_buku */

/*!50001 DROP TABLE IF EXISTS `ranking_buku` */;
/*!50001 DROP VIEW IF EXISTS `ranking_buku` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ranking_buku` AS select `t_buku`.`kode_buku` AS `kode_buku`,`t_buku`.`kode_kategori` AS `kode_kategori`,`t_buku`.`kode_penerbit` AS `kode_penerbit`,`t_buku`.`judul` AS `judul`,`t_buku`.`sinopsis` AS `sinopsis`,`t_buku`.`pengarang` AS `pengarang`,`t_buku`.`thn_terbit` AS `thn_terbit`,`t_buku`.`cover_buku` AS `cover_buku`,`t_buku`.`status` AS `status`,count(`t_peminjaman`.`kode_buku`) AS `jumlah` from (`t_buku` join `t_peminjaman`) where (`t_peminjaman`.`kode_buku` = `t_buku`.`kode_buku`) group by `t_peminjaman`.`kode_buku` order by count(`t_peminjaman`.`kode_buku`) desc limit 0,5 */;

/*View structure for view status_anggota */

/*!50001 DROP TABLE IF EXISTS `status_anggota` */;
/*!50001 DROP VIEW IF EXISTS `status_anggota` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `status_anggota` AS select `t_anggota`.`kode_anggota` AS `kode_anggota`,`t_anggota`.`status_verif` AS `status_verif`,`t_pengembalian`.`tgl_kembali` AS `tgl_kembali` from ((`t_anggota` join `t_peminjaman`) join `t_pengembalian`) where ((`t_peminjaman`.`kode_anggota` = `t_anggota`.`kode_anggota`) and (`t_peminjaman`.`kode_peminjaman` = `t_pengembalian`.`kode_peminjaman`) and (`t_pengembalian`.`tgl_kembali` = '0000-00-00')) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
