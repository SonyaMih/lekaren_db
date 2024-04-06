-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: So 06.Apr 2024, 19:02
-- Verzia serveru: 10.4.32-MariaDB
-- Verzia PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `lekaren_db`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `davkovanie`
--

CREATE TABLE `davkovanie` (
  `id_davkovanie` int(11) NOT NULL,
  `nazov` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `davkovanie`
--

INSERT INTO `davkovanie` (`id_davkovanie`, `nazov`) VALUES
(1, 'Raz denne'),
(2, 'Dvakrát denne'),
(3, 'Trikrát denne'),
(4, 'Každé 4 hodiny'),
(5, 'Každých 6 hodín'),
(6, 'Každých 8 hodín'),
(7, 'Podľa potreby'),
(8, 'Každé 2 hodiny');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `forma`
--

CREATE TABLE `forma` (
  `id_forma` int(11) NOT NULL,
  `nazov` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `forma`
--

INSERT INTO `forma` (`id_forma`, `nazov`) VALUES
(1, 'Tablety'),
(2, 'Kapsuly'),
(3, 'Injekcia'),
(4, 'Sirup'),
(5, 'Krém'),
(6, 'Gél'),
(7, 'Inhalátor'),
(8, 'Pleister'),
(9, 'Roztok'),
(10, 'Kvapky');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `lekar`
--

CREATE TABLE `lekar` (
  `id_lekar` int(11) NOT NULL,
  `kod_lekara` char(12) NOT NULL,
  `meno` varchar(20) NOT NULL,
  `priezvisko` varchar(30) NOT NULL,
  `popis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `lekar`
--

INSERT INTO `lekar` (`id_lekar`, `kod_lekara`, `meno`, `priezvisko`, `popis`) VALUES
(1, 'LK123456', 'Jan', 'Novák', 'Všeobecný lekár s dlhoročnou praxou.'),
(2, 'LK234567', 'Eva', 'Kováčová', 'Odborníčka na dermatológiu'),
(3, 'LK345678', 'Martin', 'Hruška', 'Špecialista na ortopediu a traumatológiu'),
(4, 'LK456789', 'Jana', 'Mikušová', 'Lekárka so skúsenosťami v pediatrii.'),
(5, 'LK567890', 'Marek', 'Černý', 'Odborník na psychiatriu a psychoterapiu.'),
(6, 'LK678901', 'Zuzana', 'Malá ', 'Rodinná lekárka so zameraním na prevenciu.'),
(7, 'LK789012', 'Peter', 'Novotný', 'Expert na onkologické ochorenia.'),
(8, 'LK890123', 'Michaela', 'Krajčírová', 'Lekárka s odbornosťou v gynekológii.'),
(9, 'LK901234', 'Tomáš', 'Kubiš', 'Lekár so špecializáciou na kardiológiu.'),
(10, 'LK012345', 'Monika', 'Adamcová', 'Odborníčka na gastroenterológiu.');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `lieky`
--

CREATE TABLE `lieky` (
  `id_liek` int(11) NOT NULL,
  `nazov` varchar(30) NOT NULL,
  `uc_latka` varchar(30) NOT NULL,
  `id_davkovanie` int(11) NOT NULL,
  `id_forma` int(11) NOT NULL,
  `cena_pacient` decimal(10,2) NOT NULL,
  `cena_poistovna` decimal(10,2) NOT NULL,
  `predpis` tinyint(1) NOT NULL,
  `popis` text NOT NULL,
  `url_obr` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `lieky`
--

INSERT INTO `lieky` (`id_liek`, `nazov`, `uc_latka`, `id_davkovanie`, `id_forma`, `cena_pacient`, `cena_poistovna`, `predpis`, `popis`, `url_obr`) VALUES
(1, 'Paralen', 'Paracetamol', 4, 1, 2.50, 1.50, 0, 'Analgetikum na zmiernenie bolesti a horúčky', 'https://www.mojelieky.sk/images/products/bg/paralen-500-24.jpg'),
(2, 'Ibuprofen', 'Ibuprofen', 5, 1, 3.20, 2.00, 1, 'Protizápalový liek na bolesť a zápal.', 'https://mojalekarensk.vshcdn.net/upload/ib/up/ibuprofen-400-stada-50-tabliet-2397076-1000x1000-square.jpg'),
(3, 'Ibalgin', 'Ibuprofen', 4, 2, 3.50, 2.20, 0, 'Liečivo proti bolesti a zápalu.', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQpnX7T0zbxAKH_0MaRu9T23vz21adAcdD_jNykf4ydg518jyQPEbFFQ5qsyaiqGdZZQlvzRvS3OqXppwmlAurQlX4aDUrom4viZnU64DNSicbMAU0gMw2qTg&usqp=CAE'),
(6, 'Nurofen', 'Ibuprofen', 1, 1, 8.50, 6.50, 1, 'Liečivo na liečbu bolesti a zápalu.', 'https://example.com/nurofen.jpg'),
(7, 'Aspirin', 'Acetylsalicylová kyselina', 2, 1, 5.99, 4.00, 1, 'Bezpredpisový liek proti bolesti a horúčke.', 'https://example.com/aspirin.jpg'),
(8, 'Amoxicilin', 'Amoxicilín', 3, 2, 15.20, 12.30, 1, 'Antibiotikum používané na liečbu infekcií.', 'https://example.com/amoxicilin.jpg'),
(9, 'Paracetamol', 'Paracetamol', 1, 2, 4.20, 3.50, 1, 'Bezpredpisové liek na liečbu bolesti a horúčky.', 'https://example.com/paracetamol.jpg'),
(10, 'Ventolin', 'Salbutamol', 2, 2, 10.99, 9.50, 1, 'Inhalátorové liečivo na liečbu astmy.', 'https://example.com/ventolin.jpg'),
(11, 'Zyrtec', 'Cetirizín', 3, 1, 6.75, 5.20, 1, 'Antihistaminikum používané na liečbu alergií.', 'https://example.com/zyrtec.jpg'),
(12, 'Diazepam', 'Diazepam', 1, 3, 12.80, 10.50, 1, 'Liečivo na liečbu úzkosti a svalových kŕčov.', 'https://example.com/diazepam.jpg'),
(13, 'Tetracyklin', 'Tetracyklín', 2, 3, 18.99, 16.20, 1, 'Antibiotikum používané na liečbu infekcií.', 'https://example.com/tetracyklin.jpg'),
(14, 'Loratadin', 'Loratadín', 3, 1, 7.30, 5.80, 1, 'Antihistaminikum používané na liečbu alergií.', 'https://example.com/loratadin.jpg'),
(15, 'Diclofenac', 'Diklofenak', 1, 1, 9.20, 7.50, 1, 'Liečivo na liečbu bolesti a zápalu.', 'https://example.com/diclofenac.jpg'),
(16, 'Ciprofloxacin', 'Ciprofloxacín', 2, 2, 22.50, 19.80, 1, 'Antibiotikum používané na liečbu infekcií.', 'https://example.com/ciprofloxacin.jpg'),
(18, 'Prednison', 'Prednizón', 1, 2, 11.75, 9.20, 1, 'Liečivo na liečbu zápalových stavov.', 'https://example.com/prednison.jpg'),
(19, 'Metronidazol', 'Metronidazol', 2, 3, 14.30, 11.80, 1, 'Antibiotikum používané na liečbu infekcií.', 'https://example.com/metronidazol.jpg'),
(20, 'Omeprazol', 'Omeprazol', 3, 1, 8.90, 7.20, 1, 'Liečivo na liečbu žalúdočných vredov a refluksu.', 'https://example.com/omeprazol.jpg'),
(21, 'Atorvastatín', 'Atorvastatín', 1, 3, 16.50, 14.20, 1, 'Liečivo na liečbu vysokého cholesterolu.', 'https://example.com/atorvastatin.jpg'),
(22, 'Lisinopril', 'Lisinopril', 2, 1, 13.80, 11.50, 1, 'Liečivo na liečbu vysokého krvného tlaku.', 'https://example.com/lisinopril.jpg');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `mesto`
--

CREATE TABLE `mesto` (
  `id_mesto` int(11) NOT NULL,
  `nazov` varchar(30) NOT NULL,
  `psc` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `mesto`
--

INSERT INTO `mesto` (`id_mesto`, `nazov`, `psc`) VALUES
(1, 'Bratislava', '81101'),
(2, 'Košice', '04001'),
(3, 'Prešov', '08001'),
(4, 'Žilina', '01001'),
(5, 'Banská Bystrica', '97401'),
(6, 'Nitra', '94901'),
(7, 'Trnava', '91701'),
(8, 'Trenčín', '91101'),
(9, 'Martin', '03601'),
(10, 'Poprad', '05801');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pacient`
--

CREATE TABLE `pacient` (
  `id_pacient` int(11) NOT NULL,
  `meno` varchar(20) NOT NULL,
  `priezvisko` varchar(35) NOT NULL,
  `rod_cislo` char(11) NOT NULL,
  `id_mesto` int(11) NOT NULL,
  `adresa` varchar(30) NOT NULL,
  `id_pohlavie` int(11) NOT NULL,
  `telefon` char(10) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `pacient`
--

INSERT INTO `pacient` (`id_pacient`, `meno`, `priezvisko`, `rod_cislo`, `id_mesto`, `adresa`, `id_pohlavie`, `telefon`, `email`) VALUES
(1, 'Jan', 'Mrkvička', '980211/2561', 1, 'Nová 14', 1, '0901246589', 'janmrkva@gmail.com'),
(2, 'Peter', 'Novák', '840324/6835', 5, 'Stratených 2', 1, '0952364935', 'novakpeter@gmail.com');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pohlavie`
--

CREATE TABLE `pohlavie` (
  `id_pohlavie` int(11) NOT NULL,
  `nazov` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `pohlavie`
--

INSERT INTO `pohlavie` (`id_pohlavie`, `nazov`) VALUES
(1, 'Muž'),
(2, 'Žena');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `predpis`
--

CREATE TABLE `predpis` (
  `id_recept` int(11) NOT NULL,
  `kod_receptu` char(10) NOT NULL,
  `id_pacient` int(11) NOT NULL,
  `id_liek_1` int(11) NOT NULL,
  `id_davkovanie_1` int(11) NOT NULL,
  `datum_predpisu` date NOT NULL,
  `id_lekar` int(11) NOT NULL,
  `popis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `predpis`
--

INSERT INTO `predpis` (`id_recept`, `kod_receptu`, `id_pacient`, `id_liek_1`, `id_davkovanie_1`, `datum_predpisu`, `id_lekar`, `popis`) VALUES
(24, '123456', 1, 1, 1, '2024-04-05', 1, 'pokus');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `sklad`
--

CREATE TABLE `sklad` (
  `id_sklad` int(11) NOT NULL,
  `id_liek` int(11) NOT NULL,
  `pocet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `sklad`
--

INSERT INTO `sklad` (`id_sklad`, `id_liek`, `pocet`) VALUES
(1, 1, 35),
(2, 2, 29),
(3, 3, 31),
(4, 6, 10),
(5, 7, 20),
(6, 8, 30),
(7, 9, 40),
(8, 10, 50),
(9, 11, 15),
(10, 12, 25),
(11, 13, 35),
(12, 14, 45),
(13, 15, 30),
(14, 16, 20),
(16, 18, 25),
(17, 19, 35),
(18, 20, 45),
(19, 21, 20),
(20, 22, 30);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `davkovanie`
--
ALTER TABLE `davkovanie`
  ADD PRIMARY KEY (`id_davkovanie`);

--
-- Indexy pre tabuľku `forma`
--
ALTER TABLE `forma`
  ADD PRIMARY KEY (`id_forma`);

--
-- Indexy pre tabuľku `lekar`
--
ALTER TABLE `lekar`
  ADD PRIMARY KEY (`id_lekar`);

--
-- Indexy pre tabuľku `lieky`
--
ALTER TABLE `lieky`
  ADD PRIMARY KEY (`id_liek`),
  ADD KEY `fk_davkovanie` (`id_davkovanie`),
  ADD KEY `fk_forma` (`id_forma`);

--
-- Indexy pre tabuľku `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`id_mesto`),
  ADD UNIQUE KEY `u1_mesto` (`psc`);

--
-- Indexy pre tabuľku `pacient`
--
ALTER TABLE `pacient`
  ADD PRIMARY KEY (`id_pacient`),
  ADD UNIQUE KEY `u1_pacient` (`rod_cislo`),
  ADD KEY `fk_mesto` (`id_mesto`),
  ADD KEY `fk_pohlavie` (`id_pohlavie`);

--
-- Indexy pre tabuľku `pohlavie`
--
ALTER TABLE `pohlavie`
  ADD PRIMARY KEY (`id_pohlavie`);

--
-- Indexy pre tabuľku `predpis`
--
ALTER TABLE `predpis`
  ADD PRIMARY KEY (`id_recept`),
  ADD KEY `fk_pacient` (`id_pacient`),
  ADD KEY `fk_lieky_1` (`id_liek_1`),
  ADD KEY `fk_davkovanie_1` (`id_davkovanie_1`),
  ADD KEY `fk_lekar` (`id_lekar`);

--
-- Indexy pre tabuľku `sklad`
--
ALTER TABLE `sklad`
  ADD PRIMARY KEY (`id_sklad`),
  ADD KEY `fk_lieky` (`id_liek`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `davkovanie`
--
ALTER TABLE `davkovanie`
  MODIFY `id_davkovanie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pre tabuľku `forma`
--
ALTER TABLE `forma`
  MODIFY `id_forma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `lekar`
--
ALTER TABLE `lekar`
  MODIFY `id_lekar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `lieky`
--
ALTER TABLE `lieky`
  MODIFY `id_liek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pre tabuľku `mesto`
--
ALTER TABLE `mesto`
  MODIFY `id_mesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `pacient`
--
ALTER TABLE `pacient`
  MODIFY `id_pacient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `pohlavie`
--
ALTER TABLE `pohlavie`
  MODIFY `id_pohlavie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `predpis`
--
ALTER TABLE `predpis`
  MODIFY `id_recept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pre tabuľku `sklad`
--
ALTER TABLE `sklad`
  MODIFY `id_sklad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `lieky`
--
ALTER TABLE `lieky`
  ADD CONSTRAINT `fk_davkovanie` FOREIGN KEY (`id_davkovanie`) REFERENCES `davkovanie` (`id_davkovanie`),
  ADD CONSTRAINT `fk_forma` FOREIGN KEY (`id_forma`) REFERENCES `forma` (`id_forma`);

--
-- Obmedzenie pre tabuľku `pacient`
--
ALTER TABLE `pacient`
  ADD CONSTRAINT `fk_mesto` FOREIGN KEY (`id_mesto`) REFERENCES `mesto` (`id_mesto`),
  ADD CONSTRAINT `fk_pohlavie` FOREIGN KEY (`id_pohlavie`) REFERENCES `pohlavie` (`id_pohlavie`);

--
-- Obmedzenie pre tabuľku `predpis`
--
ALTER TABLE `predpis`
  ADD CONSTRAINT `fk_davkovanie_1` FOREIGN KEY (`id_davkovanie_1`) REFERENCES `davkovanie` (`id_davkovanie`),
  ADD CONSTRAINT `fk_lekar` FOREIGN KEY (`id_lekar`) REFERENCES `lekar` (`id_lekar`),
  ADD CONSTRAINT `fk_lieky_1` FOREIGN KEY (`id_liek_1`) REFERENCES `lieky` (`id_liek`),
  ADD CONSTRAINT `fk_pacient` FOREIGN KEY (`id_pacient`) REFERENCES `pacient` (`id_pacient`);

--
-- Obmedzenie pre tabuľku `sklad`
--
ALTER TABLE `sklad`
  ADD CONSTRAINT `fk_lieky` FOREIGN KEY (`id_liek`) REFERENCES `lieky` (`id_liek`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
