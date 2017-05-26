-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2017 at 03:22 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geography`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjacentcity`
--

CREATE TABLE `adjacentcity` (
  `WBName` varchar(20) NOT NULL,
  `Adj_CityName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adjacentcontinent`
--

CREATE TABLE `adjacentcontinent` (
  `WBName` varchar(20) NOT NULL,
  `Adj_ContinentName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adjacentcountry`
--

CREATE TABLE `adjacentcountry` (
  `WBName` varchar(20) NOT NULL,
  `Adj_CountryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adjacentstate`
--

CREATE TABLE `adjacentstate` (
  `WBName` varchar(20) NOT NULL,
  `Adj_StateName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `CityName` varchar(20) NOT NULL,
  `StateName` varchar(20) NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  `CurrentPopulation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `continent`
--

CREATE TABLE `continent` (
  `ContinentName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `CountryName` varchar(20) NOT NULL,
  `ContinentName` varchar(20) NOT NULL,
  `CapitalCity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country_neighbouringcountries`
--

CREATE TABLE `country_neighbouringcountries` (
  `CountryName` varchar(20) NOT NULL,
  `Neighbour_CountryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country_populationhistory`
--

CREATE TABLE `country_populationhistory` (
  `Year` int(11) NOT NULL,
  `CountryName` varchar(20) NOT NULL,
  `Population` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `StateName` varchar(20) NOT NULL,
  `State_CapitalCity` varchar(20) NOT NULL,
  `CountryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state_neighbouringcountries`
--

CREATE TABLE `state_neighbouringcountries` (
  `StateName` varchar(20) NOT NULL,
  `Neighbour_CountryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state_neighbouringstates`
--

CREATE TABLE `state_neighbouringstates` (
  `StateName` varchar(20) NOT NULL,
  `Neighbour_StateName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state_populationhistory`
--

CREATE TABLE `state_populationhistory` (
  `Year` int(11) NOT NULL,
  `StateName` varchar(20) NOT NULL,
  `Population` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `waterbodies`
--

CREATE TABLE `waterbodies` (
  `WBName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjacentcity`
--
ALTER TABLE `adjacentcity`
  ADD PRIMARY KEY (`WBName`,`Adj_CityName`),
  ADD KEY `Adj_CityName` (`Adj_CityName`);

--
-- Indexes for table `adjacentcontinent`
--
ALTER TABLE `adjacentcontinent`
  ADD PRIMARY KEY (`WBName`,`Adj_ContinentName`),
  ADD KEY `Adj_ContinentName` (`Adj_ContinentName`);

--
-- Indexes for table `adjacentcountry`
--
ALTER TABLE `adjacentcountry`
  ADD PRIMARY KEY (`WBName`,`Adj_CountryName`),
  ADD KEY `Adj_CountryName` (`Adj_CountryName`);

--
-- Indexes for table `adjacentstate`
--
ALTER TABLE `adjacentstate`
  ADD PRIMARY KEY (`WBName`,`Adj_StateName`),
  ADD KEY `Adj_StateName` (`Adj_StateName`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityName`),
  ADD KEY `StateName` (`StateName`);

--
-- Indexes for table `continent`
--
ALTER TABLE `continent`
  ADD PRIMARY KEY (`ContinentName`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryName`),
  ADD KEY `ContinentName` (`ContinentName`);

--
-- Indexes for table `country_neighbouringcountries`
--
ALTER TABLE `country_neighbouringcountries`
  ADD PRIMARY KEY (`CountryName`,`Neighbour_CountryName`);

--
-- Indexes for table `country_populationhistory`
--
ALTER TABLE `country_populationhistory`
  ADD PRIMARY KEY (`Year`,`CountryName`),
  ADD KEY `CountryName` (`CountryName`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`StateName`),
  ADD KEY `CountryName` (`CountryName`);

--
-- Indexes for table `state_neighbouringcountries`
--
ALTER TABLE `state_neighbouringcountries`
  ADD PRIMARY KEY (`StateName`,`Neighbour_CountryName`);

--
-- Indexes for table `state_neighbouringstates`
--
ALTER TABLE `state_neighbouringstates`
  ADD PRIMARY KEY (`StateName`,`Neighbour_StateName`);

--
-- Indexes for table `state_populationhistory`
--
ALTER TABLE `state_populationhistory`
  ADD PRIMARY KEY (`Year`,`StateName`),
  ADD KEY `StateName` (`StateName`);

--
-- Indexes for table `waterbodies`
--
ALTER TABLE `waterbodies`
  ADD PRIMARY KEY (`WBName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjacentcity`
--
ALTER TABLE `adjacentcity`
  ADD CONSTRAINT `adjacentcity_ibfk_1` FOREIGN KEY (`WBName`) REFERENCES `waterbodies` (`WBName`),
  ADD CONSTRAINT `adjacentcity_ibfk_2` FOREIGN KEY (`Adj_CityName`) REFERENCES `city` (`CityName`);

--
-- Constraints for table `adjacentcontinent`
--
ALTER TABLE `adjacentcontinent`
  ADD CONSTRAINT `adjacentcontinent_ibfk_1` FOREIGN KEY (`WBName`) REFERENCES `waterbodies` (`WBName`),
  ADD CONSTRAINT `adjacentcontinent_ibfk_2` FOREIGN KEY (`Adj_ContinentName`) REFERENCES `continent` (`ContinentName`);

--
-- Constraints for table `adjacentcountry`
--
ALTER TABLE `adjacentcountry`
  ADD CONSTRAINT `adjacentcountry_ibfk_1` FOREIGN KEY (`Adj_CountryName`) REFERENCES `country` (`CountryName`),
  ADD CONSTRAINT `adjacentcountry_ibfk_2` FOREIGN KEY (`WBName`) REFERENCES `waterbodies` (`WBName`);

--
-- Constraints for table `adjacentstate`
--
ALTER TABLE `adjacentstate`
  ADD CONSTRAINT `adjacentstate_ibfk_1` FOREIGN KEY (`Adj_StateName`) REFERENCES `state` (`StateName`),
  ADD CONSTRAINT `adjacentstate_ibfk_2` FOREIGN KEY (`WBName`) REFERENCES `waterbodies` (`WBName`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`StateName`) REFERENCES `state` (`StateName`);

--
-- Constraints for table `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`ContinentName`) REFERENCES `continent` (`ContinentName`);

--
-- Constraints for table `country_neighbouringcountries`
--
ALTER TABLE `country_neighbouringcountries`
  ADD CONSTRAINT `country_neighbouringcountries_ibfk_1` FOREIGN KEY (`CountryName`) REFERENCES `country` (`CountryName`);

--
-- Constraints for table `country_populationhistory`
--
ALTER TABLE `country_populationhistory`
  ADD CONSTRAINT `country_populationhistory_ibfk_1` FOREIGN KEY (`CountryName`) REFERENCES `country` (`CountryName`);

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`CountryName`) REFERENCES `country` (`CountryName`);

--
-- Constraints for table `state_neighbouringcountries`
--
ALTER TABLE `state_neighbouringcountries`
  ADD CONSTRAINT `state_neighbouringcountries_ibfk_1` FOREIGN KEY (`StateName`) REFERENCES `state` (`StateName`);

--
-- Constraints for table `state_neighbouringstates`
--
ALTER TABLE `state_neighbouringstates`
  ADD CONSTRAINT `state_neighbouringstates_ibfk_1` FOREIGN KEY (`StateName`) REFERENCES `state` (`StateName`);

--
-- Constraints for table `state_populationhistory`
--
ALTER TABLE `state_populationhistory`
  ADD CONSTRAINT `state_populationhistory_ibfk_1` FOREIGN KEY (`StateName`) REFERENCES `state` (`StateName`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
