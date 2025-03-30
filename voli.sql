-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 30, 2025 alle 17:02
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voli`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `biglietto`
--

CREATE TABLE `biglietto` (
  `Id_biglietto` varchar(50) NOT NULL,
  `codice_biglietto` varchar(50) DEFAULT NULL,
  `classe` varchar(50) NOT NULL,
  `data_di_emissione` varchar(50) NOT NULL,
  `prezzo` varchar(50) NOT NULL,
  `stato_del_biglietto` varchar(50) NOT NULL,
  `Id_prenotazione` varchar(50) DEFAULT 'NOT NULL',
  `Id_volo` varchar(50) DEFAULT 'NOT NULL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `biglietto`
--

INSERT INTO `biglietto` (`Id_biglietto`, `codice_biglietto`, `classe`, `data_di_emissione`, `prezzo`, `stato_del_biglietto`, `Id_prenotazione`, `Id_volo`) VALUES
('B1', 'B01', 'Economy', '11/03/2025', '€ 450,00', 'Emesso', 'X1', 'FR 1927'),
('B2', 'B02', 'Economy', '25/02/2025', '€ 240,00', 'Annullato', 'X2', 'U2 8282'),
('B3', 'B03', 'Economy', '07/01/2025', '€ 300,00', 'Utilizzato', 'X3', 'EZ S112'),
('B4', 'B04', 'Economy', '15/12/2024', '€ 500,00', 'Emesso', 'X4', 'FR 1289'),
('B5', 'B05', 'Economy', '01/12/2024', '€ 320,00', 'Emesso', 'X5', 'FR 9005'),
('B6', 'B06', 'Business', '28/10/2024', '€ 2500,00', 'Emesso', 'X6', 'AZ 1602');

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE `passeggero` (
  `Id_passeggero` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_di_nascita` varchar(50) NOT NULL,
  `indirizzo_email` varchar(50) NOT NULL,
  `numero_di_telefono` int(11) NOT NULL,
  `tipo_di_documento` varchar(50) NOT NULL,
  `numero_di_documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `passeggero`
--

INSERT INTO `passeggero` (`Id_passeggero`, `nome`, `cognome`, `data_di_nascita`, `indirizzo_email`, `numero_di_telefono`, `tipo_di_documento`, `numero_di_documento`) VALUES
(1, 'Lorenzo', 'Costa', '12/07/1994', 'lc@gmail.com', 123456789, 'Passaporto', 'AA01'),
(2, 'Rossana', 'Ferri', '08/12/1985', 'rf@gmail.com', 987654321, 'Carta d’identità', 'AA02'),
(3, 'Enrico', 'Dellucci', '03/10/1990', 'ed@gmail.com', 1029384756, 'Passaporto', 'AA03'),
(4, 'Giorgio', 'Manna', '10/02/1978', 'gm@gmail.com', 192837465, 'Carta d’identità', 'AA04'),
(5, 'Amalia', 'Toscano', '28/01/1988', 'at@gmail.com', 1829364756, 'Carta d’identità', 'AA05'),
(6, 'Matilde', 'Folliero', '28/04/1998', 'mf@gmail.com', 2147483647, 'Passaporto', 'AA06');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `Id_prenotazione` varchar(50) NOT NULL,
  `data_prenotazione` varchar(50) NOT NULL,
  `stato_prenotazione` varchar(50) NOT NULL,
  `numero_posti_prenotati` int(11) NOT NULL,
  `tipo_di_biglietto` varchar(50) NOT NULL,
  `metodo_di_pagamento` varchar(50) NOT NULL,
  `Id_volo` varchar(50) DEFAULT 'NOT NULL',
  `Id_passeggero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prenotazione`
--

INSERT INTO `prenotazione` (`Id_prenotazione`, `data_prenotazione`, `stato_prenotazione`, `numero_posti_prenotati`, `tipo_di_biglietto`, `metodo_di_pagamento`, `Id_volo`, `Id_passeggero`) VALUES
('X1', '11/03/2025', 'Confermata', 5, 'Economy', 'Carta di credito', 'FR 1927', 1),
('X2', '25/02/2025', 'In attesa', 2, 'Economy', 'PayPal', 'U2 8282', 2),
('X3', '07/01/2025', 'Confermata', 2, 'Economy', 'Carta di credito', 'EZ S112', 3),
('X4', '15/12/2024', 'In attesa', 5, 'Economy', 'Carta di credito', 'FR 1289', 4),
('X5', '01/12/2024', 'In attesa', 4, 'Economy', 'PayPal', 'FR 9005', 5),
('X6', '28/10/2024', 'Confermata', 5, 'Business', 'Bonifico', 'AZ 1602', 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `scalo`
--

CREATE TABLE `scalo` (
  `Id_scalo` varchar(50) NOT NULL,
  `aeroporto_di_scalo` varchar(50) NOT NULL,
  `Id_volo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `scalo`
--

INSERT INTO `scalo` (`Id_scalo`, `aeroporto_di_scalo`, `Id_volo`) VALUES
('S1', 'Milano Malpensa', 'AZ 1602');

-- --------------------------------------------------------

--
-- Struttura della tabella `volo`
--

CREATE TABLE `volo` (
  `Id_volo` varchar(7) NOT NULL,
  `codice_volo` char(6) DEFAULT NULL,
  `partenza` varchar(50) NOT NULL,
  `arrivo` varchar(50) NOT NULL,
  `compagnia_aerea` varchar(50) NOT NULL,
  `stato_volo` varchar(50) NOT NULL,
  `prezzo_base` varchar(50) NOT NULL,
  `tipo_di_volo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `volo`
--

INSERT INTO `volo` (`Id_volo`, `codice_volo`, `partenza`, `arrivo`, `compagnia_aerea`, `stato_volo`, `prezzo_base`, `tipo_di_volo`) VALUES
('AZ 1602', 'DGEILS', 'Bari', 'New York', 'ITA Airways', 'Imbarco', '€ 500,00', 'Con scalo'),
('EZ S112', 'SWBEGS', 'Bari', 'Basilea', 'EasyJet', 'Atterrato', '€ 150,00', 'Diretto'),
('FR 1289', 'LCXGFI', 'Bari', 'Parigi', 'Ryanair', 'Imbarco', '€ 100,00', 'Diretto'),
('FR 1927', 'DWWYRZ', 'Bari', 'Londra Stansted', 'Ryanair', 'Imbarco', '€ 90,00', 'Diretto'),
('FR 9005', 'PCGXGF', 'Bari', 'Vienna', 'Ryanair', 'Imbarco', '€ 80,00', 'Diretto'),
('U2 8282', 'BDBXZZ', 'Bari', 'Berlino', 'EasyJet', 'Atterrato', '€ 120,00', 'Diretto');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `biglietto`
--
ALTER TABLE `biglietto`
  ADD PRIMARY KEY (`Id_biglietto`),
  ADD UNIQUE KEY `codice_biglietto` (`codice_biglietto`),
  ADD KEY `fk_Id_prenotazione` (`Id_prenotazione`),
  ADD KEY `fk_Id_volo` (`Id_volo`) USING BTREE;

--
-- Indici per le tabelle `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`Id_passeggero`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`Id_prenotazione`),
  ADD KEY `fk_Id_passeggero` (`Id_passeggero`),
  ADD KEY `fk_Id_volo` (`Id_volo`);

--
-- Indici per le tabelle `scalo`
--
ALTER TABLE `scalo`
  ADD PRIMARY KEY (`Id_scalo`),
  ADD KEY `fk_Id_volo` (`Id_volo`);

--
-- Indici per le tabelle `volo`
--
ALTER TABLE `volo`
  ADD PRIMARY KEY (`Id_volo`),
  ADD UNIQUE KEY `codice_volo` (`codice_volo`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `biglietto`
--
ALTER TABLE `biglietto`
  ADD CONSTRAINT `fk_Id_prenotazione` FOREIGN KEY (`Id_prenotazione`) REFERENCES `prenotazione` (`Id_prenotazione`);

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `fk_Id_passeggero` FOREIGN KEY (`Id_passeggero`) REFERENCES `passeggero` (`Id_passeggero`),
  ADD CONSTRAINT `fk_Id_volo` FOREIGN KEY (`Id_volo`) REFERENCES `volo` (`Id_volo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
