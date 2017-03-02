-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2017 at 02:03 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `body` text NOT NULL,
  `veiwcount` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `author`, `date`, `body`, `veiwcount`) VALUES
(1, 'Crowdfunding Will Make Non-profit Giving Affordable, Transparent And Organized In India', 'Nureen', 'December 05, 2014', 'The divine and sacrosanct way of doing a no profit business is followed by the NGOs/NPOs. The NGOs start off with the motive of welfare to the society unlike the very ubiquitous motive of any business organization – profit. Now the point to ponder about is when the intention is crystal clear and sacrosanct what are the factors that restrict the functioning of any NGO? The money for obvious reasons but there are many other factors.\r\n \r\nThe substantial reason for any NGO to become dysfunctional or cash strapped is definitely lack of visibility. Since the NGOs are non-profit organizations, they can hardly afford to market themselves. Every means of marketing comes at a hefty price and even if an NGO had that hefty amount it would prefer spending it for some welfare activity rather than marketing itself. Thanks to the advent of technology the NGOs are gaining visibility to a great extent due to several social media marketing places like social networking sites, e-commerce websites, video sharing websites etc. But all these come at a price that is sometimes beyond the affordable range.\r\n \r\nAny NGO till recently would initially form up a group which would then scourge for funds by door to door marketing of their initiative. The conversion rate (number of people getting convinced/number of people marketed for) is substantially low. Ultimately the results wouldn’t be satisfactory and hence resulting in the closure of few NGOs due to lack of funds.\r\n \r\nTo get these NGOs into the limelight it is very important that people are made cognizant of the initiative before even thinking of drawing funds from them. Crowdfunding comes as an all-in-one solution for them. On these crowdfunding websites the NGOs can raise their voice and make themselves visible and audible to the world around. When it is funding it is all about connecting or more precisely conveying the intention clearly. Once this happens the NGOs get the desired visibility at minimum marketing cost. The takeaway here is that marketing is being done without any time lag. Once the content is online the funds start pouring in.\r\n \r\nOne organization that has been able to raise funds to crowdfunding is Stop Acid Attacks (SAA). SAA is an organization that actively campaigns against acid attack violence. They also help to provide medical aid and care to acid attack survivors. SAA is currently running a fundraiser on FundDreamsIndia.com through will they have been able to raise around Rs. 3,41,690 to date. As the word is spreading, more people are expected to contribute to the cause. Utilizing these funds, they have started a café in Agra- “Sheroes” which is run by acid attack survivors. The money collected through the café would again we spent in survivors’ welfare. ', 56),
(2, 'edslkjdkl;adssj', 'test', '2017/03/02', '        Super Audio CD (SACD) is a read-only optical disc for audio storage, introduced in 1999. It was developed jointly by Sony and Philips Electronics, and intended to be the successor to their Compact Disc (CD) format. While the SACD format can offer more channels (e.g. surround sound), and a longer playing time than CD, research published in 2007 found no significant difference in audio quality between SACD and standard CD at ordinary volume levels.[1]\r\n\r\nHaving made little impact in the consumer audio market, by 2007 SACD was deemed to be a failure by the press.[2] A small market for SACD has remained, serving the audiophile community.[3]', 2);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `user` varchar(50) NOT NULL,
  `date` varchar(20) NOT NULL,
  `imgurl` varchar(20) NOT NULL DEFAULT 'pranjal.jpeg',
  `blogid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `text`, `user`, `date`, `imgurl`, `blogid`) VALUES
(1, 'You rightly mentioned that to get these NGOs into the limelight it is very important that people are made cognizant of the initiative before even thinking of drawing funds from them. This is what something should come from within. There is a crowdfunding platform Impact Guru that looks after the same. It enables an individual to draw an initiative and work towards making the society better. https://goo.gl/YyFaCI', 'Pawan Yadav', '1/2/17', 'pranjal.jpeg', 1),
(2, '\r\n    tresyghkjg', 'test', '2017/03/02', 'pranjal.jpeg', 1),
(3, '\r\n    jbsackbdms', 'test', '2017/03/02', 'pranjal.jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `permissions`) VALUES
(1, 'Standard User', ''),
(2, 'Administrator', '{\r\n"admin": 1,\r\n"moderator" : 1\r\n}');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`) VALUES
(1, 'abs@gmail.com'),
(2, 'abs@gmail.com'),
(3, 'amn@gmail.com'),
(4, 'caksa@gmail.com'),
(5, 'jyhgdas@gmail.com'),
(6, 'test@gmail.com'),
(7, 'nest@gmail.com'),
(8, 'fest@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `joined` datetime NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `salt`, `joined`, `group`) VALUES
(16, 'test', 'ert', 'fc095344bf3e3495531f71b42dbe935cdfda75a7a27c4da2297641708b880cd9', '‹YÃÂh¤±¼fÿz_f‡õø2G“{zÈ#SƒÐËÃ', '2017-02-04 16:57:29', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
