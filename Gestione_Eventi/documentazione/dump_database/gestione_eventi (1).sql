-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 19, 2024 alle 14:17
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
-- Database: `gestione_eventi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `evento`
--

CREATE TABLE `evento` (
  `id` bigint(20) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `evento`
--

INSERT INTO `evento` (`id`, `categoria`, `data`, `descrizione`, `nome`) VALUES
(1, 'Musica', '2024-01-20', 'Un concerto rock imperdibile', 'Concerto Rock'),
(2, 'Tecnologia', '2024-02-15', 'Corso base di programmazione Python', 'Workshop Python'),
(3, 'Arte', '2024-03-10', 'Esposizione di opere contemporanee', 'Mostra di arte'),
(4, 'Tecnologia', '2024-04-05', 'Discussione sulla intelligenza artificiale', 'Conferenza AI'),
(5, 'Sport', '2024-05-12', 'Evento sportivo per tutta la famiglia', 'Maratona Cittadina');

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipanti`
--

CREATE TABLE `partecipanti` (
  `id_evento` bigint(20) NOT NULL,
  `id_utente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `partecipanti`
--

INSERT INTO `partecipanti` (`id_evento`, `id_utente`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` bigint(20) NOT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `cognome`, `email`, `nome`, `password`) VALUES
(1, 'Rossi', 'marco.rossi@example.com', 'Marco', 'password123'),
(2, 'Bianchi', 'giulia.bianchi@example.com', 'Giulia', 'securepass'),
(3, 'Verdi', 'luca.verdi@example.com', 'Luca', 'pass2024'),
(4, 'Neri', 'anna.neri@example.com', 'Anna', 'qwerty');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `partecipanti`
--
ALTER TABLE `partecipanti`
  ADD KEY `FKss9l14yyw8j5uwrskfbeyqxhn` (`id_utente`),
  ADD KEY `FK1gishbxsobqormyjby4wg3ln9` (`id_evento`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `evento`
--
ALTER TABLE `evento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `partecipanti`
--
ALTER TABLE `partecipanti`
  ADD CONSTRAINT `FK1gishbxsobqormyjby4wg3ln9` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id`),
  ADD CONSTRAINT `FKss9l14yyw8j5uwrskfbeyqxhn` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
