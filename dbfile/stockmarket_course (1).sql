-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2024 at 04:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stockmarket_course`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modulenames`
--

CREATE TABLE `modulenames` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `moduleNames` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modulenames`
--

INSERT INTO `modulenames` (`id`, `course_id`, `module_id`, `moduleNames`, `createdAt`, `updatedAt`) VALUES
(1, 2, 1, 'Basics of Trading', '2024-10-16 10:42:40', '2024-10-16 10:42:40'),
(2, 2, 2, 'Bullish Candle Patterns\r\n', '2024-10-16 10:43:28', '2024-10-16 10:43:28'),
(3, 2, 3, 'Bearish Candlestick Patterns', '2024-10-18 09:49:46', '2024-10-18 09:49:46'),
(4, 2, 4, 'fundamental Analysis for long term investment', '2024-10-18 09:51:24', '2024-10-18 09:51:24'),
(5, 2, 5, 'Technical indicators', '2024-10-18 09:52:47', '2024-10-18 09:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_and_terms`
--

CREATE TABLE `privacy_and_terms` (
  `id` int(11) NOT NULL,
  `termsText` varchar(255) DEFAULT NULL,
  `PrivacyText` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `privacy_and_terms`
--

INSERT INTO `privacy_and_terms` (`id`, `termsText`, `PrivacyText`, `createdAt`, `updatedAt`) VALUES
(1, NULL, 'All content on this application /Website is for educational purposes only and does not constitute financial advice. Investing in stocks involves risks, including the loss of principal. Past performance is not indicative of future results and is influenced', '2024-10-19 10:52:16', '2024-10-19 10:52:16'),
(2, NULL, 'As stipulated by law, we can not and do not make any guarantees about your ability to get results or earn any money with our ideas, information, tools or strategies. We just want to help you by giving great content, direction and strategies that worked we', '2024-10-19 10:13:14', '2024-10-19 10:50:07'),
(12, 'The website or any of our sites are solely for providing education about stock market. We only provide educational services about stock market. We focus on providing general education and information about stock market concepts, without offering personali', NULL, '2024-10-19 10:53:42', '2024-10-19 10:53:42'),
(13, 'Decisions based on information presented in our products, courses, events, services, or Sites should be made with the understanding that participants may experience risk or losses, just like any entrepreneurial endeavor. We are neither responsible nor lia', NULL, '2024-10-19 10:54:12', '2024-10-19 10:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20241010150014-create-user.js'),
('20241010150253-create-course.js'),
('20241012071242-create-syallabus.js'),
('20241012084152-create-module-name.js'),
('20241016081559-create-module-names.js'),
('20241019100545-create-privacy-and-terms.js');

-- --------------------------------------------------------

--
-- Table structure for table `syallabuses`
--

CREATE TABLE `syallabuses` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `audiopath` varchar(255) DEFAULT 'null',
  `pdfpath` varchar(255) DEFAULT NULL,
  `chapter_name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `syallabuses`
--

INSERT INTO `syallabuses` (`id`, `course_id`, `chapter_id`, `module_id`, `audiopath`, `pdfpath`, `chapter_name`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 1, 'uploads\\audiofile\\1729684408032-CHAPTER_1_-_INTRODUCTION_TO_SHARE_MARKET.mp3', 'uploads\\documents\\1729684408166-Chapter_1-_Introduction_to_Share_Market.pdf', 'Introduction to Share Market', '2024-10-23 11:53:28', '2024-10-23 11:53:28'),
(2, 1, 2, 1, 'uploads\\audiofile\\1729684624511-CHAPTER_2-_SHARE_MARKET_TIMINGS_IN_INDIA.mp3', 'uploads\\documents\\1729684624537-Chapter_2-Share_Market_Timings_in_India.pdf', 'Share Market Timings in India', '2024-10-23 11:57:04', '2024-10-23 11:57:04'),
(3, 1, 3, 1, 'uploads\\audiofile\\1729684700273-CHAPTER_3-_WHAT_IS_NIFTY.mp3', 'uploads\\documents\\1729684700294-Chapter_3-What_is_Nifty.pdf', 'What is Nifty', '2024-10-23 11:58:20', '2024-10-23 11:58:20'),
(4, 1, 4, 1, 'uploads\\audiofile\\1729684796125-CHAPTER_4-_WHAT_IS_SENSEX.mp3', 'uploads\\documents\\1729684796156-Chapter_4-What_is_SENSEX.pdf', 'What is SENSEX', '2024-10-23 11:59:56', '2024-10-23 11:59:56'),
(5, 1, 5, 1, 'uploads\\audiofile\\1729684839093-CHAPTER_5_-_WHAT_IS_TRADING.mp3', 'uploads\\documents\\1729684839119-Chapter_5-What_isTrading.pdf', 'WHAT IS TRADING', '2024-10-23 12:00:39', '2024-10-23 12:00:39'),
(7, 1, 6, 1, 'uploads\\audiofile\\1729684919546-CHAPTER_6_-_WHAT_IS_OPTION_TRADING.mp3', 'uploads\\documents\\1729684919571-Chapter_6-What_is_Option_Trading.pdf', 'WHAT IS OPTION TRADING', '2024-10-23 12:01:59', '2024-10-23 12:01:59'),
(8, 1, 7, 1, 'uploads\\audiofile\\1729684984099-CHAPTER_7_-A_BEGINER\'S_GUIDE_TO_DAY_TRADING.mp3', 'uploads\\documents\\1729684984124-Chapter_7-A_beginner\'s_guide_to_day_trading.pdf', 'A BEGINER\'S GUIDE TO DAY TRADING', '2024-10-23 12:03:04', '2024-10-23 12:03:04'),
(9, 1, 8, 1, 'uploads\\audiofile\\1729685033771-CHAPTER_8_-_WHAT_IS_TECHNICAL_ANALYSIS.mp3', 'uploads\\documents\\1729685033797-Chapter_8-What_is_Technical_Analysis.pdf', 'WHAT IS TECHNICAL ANALYSIS', '2024-10-23 12:03:53', '2024-10-23 12:03:53'),
(10, 1, 9, 1, 'uploads\\audiofile\\1729685071179-CHAPTER_9_-_TRADING_VOLUME_IN_SHARE_MARKET.mp3', 'uploads\\documents\\1729685071194-Chapter_9-What_is_Trading_Volume_in_Share_Market.pdf', ' TRADING VOLUME IN SHARE MARKET', '2024-10-23 12:04:31', '2024-10-23 12:04:31'),
(11, 1, 10, 1, 'uploads\\audiofile\\1729685111816-CHAPTER_10_-_WHAT_IS_EXCHANGE_TRADED_FUNDS(ETF\'s).mp3', 'uploads\\documents\\1729685111844-Chapter_10-What_is_Exchange_Traded_Funds(ETF\'s).pdf', 'WHAT IS EXCHANGE TRADED FUNDS(ETF\'s)', '2024-10-23 12:05:11', '2024-10-23 12:05:11'),
(12, 1, 11, 1, 'uploads\\audiofile\\1729685162040-CHAPTER_11-_WHY_IS_THE_SHARE_MARKET_DOWN.mp3', 'uploads\\documents\\1729685162060-Chapter_11-Why_is_the_Share_Market_Down.pdf', 'Why is the Share Market Down', '2024-10-23 12:06:02', '2024-10-23 12:06:02'),
(13, 1, 12, 1, 'uploads\\audiofile\\1729685205931-CHAPTER_12_-_WHAT_IS_COMMDITY_TRADING.mp3', 'uploads\\documents\\1729685205953-Chapter_12-_What_is_Commodity_Trading.pdf', 'WHAT IS COMMDITY TRADING', '2024-10-23 12:06:45', '2024-10-23 12:06:45'),
(14, 2, 1, 1, 'uploads\\audiofile\\1729685285505-CHAPTER_1.mp3', 'uploads\\documents\\1729685285509-Module_1-_Chapter_1-What_is_Technical_Analysis.pdf', 'WHAT IS Technical Analysis', '2024-10-23 12:08:05', '2024-10-23 12:08:05'),
(15, 2, 2, 1, 'uploads\\audiofile\\1729685338014-CHAPTER_2.mp3', 'uploads\\documents\\1729685338018-Module_1-_Chapter_2_-_Key_Terms_in_Technical_Analysis.pdf', 'Key Terms in Technical Analysis', '2024-10-23 12:08:58', '2024-10-23 12:08:58'),
(16, 2, 3, 1, 'uploads\\audiofile\\1729685402300-CHAPTER_3.mp3', 'uploads\\documents\\1729685402306-Module_1-_Chapter_2_-_Key_Terms_in_Technical_Analysis.pdf', 'Limitations of Technical Analysis', '2024-10-23 12:10:02', '2024-10-23 12:10:02'),
(17, 2, 4, 1, 'uploads\\audiofile\\1729685446342-CHAPTER_4.mp3', 'uploads\\documents\\1729685446348-Module_1-_Chapter_4-_How_to_Read_Candlesticks_Pattern.pdf', 'How to Read Candlesticks Pattern', '2024-10-23 12:10:46', '2024-10-23 12:10:46'),
(18, 2, 5, 1, 'uploads\\audiofile\\1729685485493-CHAPTER_5.mp3', 'uploads\\documents\\1729685485502-Module_1-_Chapter_5_-_Charting_on_Diffrent_Time_Frames.pdf', 'Charting on Diffrent Time Frames', '2024-10-23 12:11:25', '2024-10-23 12:11:25'),
(19, 2, 6, 1, 'uploads\\audiofile\\1729685529886-CHAPTER_6.mp3', 'uploads\\documents\\1729685529892-Module_1_-_Chapter_6-_How_to_Identify_Up_&_Down_Trends.pdf', 'How to Identify Up & Down Trends', '2024-10-23 12:12:09', '2024-10-23 12:12:09'),
(20, 2, 7, 1, 'uploads\\audiofile\\1729685561534-CHAPTER_7.mp3', 'uploads\\documents\\1729685561543-Module_1_-_Chapter_7-Support_&_Resistance.pdf', 'Support & Resistance', '2024-10-23 12:12:41', '2024-10-23 12:12:41'),
(21, 2, 8, 1, 'uploads\\audiofile\\1729685597052-CHAPTER_8.mp3', 'uploads\\documents\\1729685597058-Module_1_-_Chapter_8-Introduction_to_Trend_Lines.pdf', 'Introduction to Trend Lines', '2024-10-23 12:13:17', '2024-10-23 12:13:17'),
(22, 2, 9, 1, 'uploads\\audiofile\\1729685654106-CHAPTER_9.mp3', 'uploads\\documents\\1729685654118-Module_1-Chapter_9_-_The_Role_of_Volume_in_Technical_Analysis.pdf', 'The Role of Volume in Technical Analysis', '2024-10-23 12:14:14', '2024-10-23 12:14:14'),
(23, 2, 10, 1, 'uploads\\audiofile\\1729685682776-CHAPTER_10.mp3', 'uploads\\documents\\1729685682785-Module_1-_Chapter_10-Gap_Analysis_in_Charts.pdf', 'Gap Analysis in Charts', '2024-10-23 12:14:42', '2024-10-23 12:14:42'),
(24, 2, 11, 1, 'uploads\\audiofile\\1729685739128-CHAPTER_11.mp3', 'uploads\\documents\\1729685739139-Module_1-_Chapter_11-_Breakouts_&_Breakdowns.pdf', 'Breakouts & Breakdowns', '2024-10-23 12:15:39', '2024-10-23 12:15:39'),
(25, 2, 12, 1, 'uploads\\audiofile\\1729685791920-CHAPTER_12.mp3', 'uploads\\documents\\1729685791940-Module_1-_Chapter_12-Elliott_Wave_Theory.pdf', 'Elliott Wave Theory', '2024-10-23 12:16:31', '2024-10-23 12:16:31'),
(26, 2, 13, 1, 'uploads\\audiofile\\1729685844254-CHAPTER_13.mp3', 'uploads\\documents\\1729685844266-Module_1-_Chapter_13-Position_Sizing_For_Successful_Trading.pdf', 'Position Sizing For Successful Trading', '2024-10-23 12:17:24', '2024-10-23 12:17:24'),
(27, 2, 14, 1, 'uploads\\audiofile\\1729685896450-CHAPTER_14.mp3', 'uploads\\documents\\1729685896464-Module_1-_Chapter_14-Risk_Management.pdf', 'Risk Management', '2024-10-23 12:18:16', '2024-10-23 12:18:16'),
(28, 2, 15, 1, 'uploads\\audiofile\\1729685947121-CHAPTER_15.mp3', 'uploads\\documents\\1729685947129-Module_1-_Chapter_15-_Trading_Stategies.pdf', 'Trading Stategies', '2024-10-23 12:19:07', '2024-10-23 12:19:07'),
(29, 2, 1, 2, 'uploads\\audiofile\\1729686033465-CHAPTER_15.mp3', 'uploads\\documents\\1729686033473-Module_1-_Chapter_15-_Trading_Stategies.pdf', 'Hammer', '2024-10-23 12:20:33', '2024-10-23 12:20:33'),
(30, 2, 2, 2, 'uploads\\audiofile\\1729686064413-CHAPTER_2.mp3', 'uploads\\documents\\1729686064431-Module_2_-_Chapter_2_-_Morning_Star.pdf', 'Morning Star', '2024-10-23 12:21:04', '2024-10-23 12:21:04'),
(31, 2, 3, 2, 'uploads\\audiofile\\1729686098855-CHAPTER_3.mp3', 'uploads\\documents\\1729686098866-Module_2_-_Chapter_3_-_Three_White_Soldiers.pdf', 'Three White Soldiers', '2024-10-23 12:21:38', '2024-10-23 12:21:38'),
(32, 2, 4, 2, 'uploads\\audiofile\\1729686169935-CHAPTER_3.mp3', 'uploads\\documents\\1729686169941-Module_2_-_Chapter_3_-_Three_White_Soldiers.pdf', 'Bullish Engulfing', '2024-10-23 12:22:49', '2024-10-23 12:22:49'),
(33, 2, 5, 2, 'uploads\\audiofile\\1729686207233-CHAPTER_5.mp3', 'uploads\\documents\\1729686207247-Module_2_-_Chapter_5_-_Bullish_Three_Line_Strike.pdf', ' Bullish Three Line Strike', '2024-10-23 12:23:27', '2024-10-23 12:23:27'),
(34, 2, 6, 2, 'uploads\\audiofile\\1729686299849-CHAPTER_6.mp3', 'uploads\\documents\\1729686299859-Module_2_-_Chapter_6_-_Three_Inside_Up.pdf', 'Three Inside Up', '2024-10-23 12:24:59', '2024-10-23 12:24:59'),
(35, 2, 7, 2, 'uploads\\audiofile\\1729686336433-CHAPTER_7.mp3', 'uploads\\documents\\1729686336450-Module_2_-_Chapter_7_-_Dragonfly_Doji.pdf', 'Dragonfly Doji', '2024-10-23 12:25:36', '2024-10-23 12:25:36'),
(36, 2, 8, 2, 'uploads\\audiofile\\1729686367963-CHAPTER_8.mp3', 'uploads\\documents\\1729686367970-Module_2_-_Chapter_8_-_The_Piercing_Line_Pattern.pdf', 'The Piercing Line Pattern', '2024-10-23 12:26:07', '2024-10-23 12:26:07'),
(37, 2, 9, 2, 'uploads\\audiofile\\1729686733713-CHAPTER_9.mp3', 'uploads\\documents\\1729686733721-Module_2_-_Chapter_9_-_Bullish_Marubozu_Pattern.pdf', 'Bullish Marubozu Pattern', '2024-10-23 12:32:13', '2024-10-23 12:32:13'),
(38, 2, 10, 2, 'uploads\\audiofile\\1729686779381-CHAPTER_10.mp3', 'uploads\\documents\\1729686779387-Module_2_-_Chapter_10_-_Bullish_Abandoned_Baby.pdf', 'Bullish Abandoned Baby', '2024-10-23 12:32:59', '2024-10-23 12:32:59'),
(39, 2, 11, 2, 'uploads\\audiofile\\1729686821227-CHAPTER_11.mp3', 'uploads\\documents\\1729686821242-Module_2_-_Chapter_11_-_Rising_Window.pdf', 'Rising Window', '2024-10-23 12:33:41', '2024-10-23 12:33:41'),
(41, 2, 2, 3, 'uploads\\audiofile\\1729686993837-CHAPTER_2.mp3', 'uploads\\documents\\1729686993844-Module_3-Chapter_2-_Three_Black_Crows_Pattern.pdf', 'hree Black Crows Pattern', '2024-10-23 12:36:33', '2024-10-23 12:36:33'),
(42, 2, 1, 3, 'uploads\\audiofile\\1729687036149-CHAPTER_2.mp3', 'uploads\\documents\\1729687036194-Module_3-Chapter_1-_The_Evening_Star_Pattern.pdf', 'The Evening Star Pattern', '2024-10-23 12:37:16', '2024-10-23 12:37:16'),
(43, 2, 3, 3, 'uploads\\audiofile\\1729687128339-CHAPTER_3.mp3', 'uploads\\documents\\1729687128349-Module_3-Chapter_3-_The_Hanging_Man_Pattern.pdf', 'The Hanging Man Pattern', '2024-10-23 12:38:48', '2024-10-23 12:38:48'),
(44, 2, 4, 3, 'uploads\\audiofile\\1729687198128-CHAPTER_4.mp3', 'uploads\\documents\\1729687198134-Module_3-Chapter_4-_The_Shooting_Star_Pattern.pdf', 'Shooting Star Pattern', '2024-10-23 12:39:58', '2024-10-23 12:39:58'),
(45, 2, 5, 3, 'uploads\\audiofile\\1729687233366-CHAPTER_5.mp3', 'uploads\\documents\\1729687233380-Module_3-Chapter_5-_Bearish_Engulfing_Pattern.pdf', 'Bearish Engulfing Pattern', '2024-10-23 12:40:33', '2024-10-23 12:40:33'),
(46, 2, 6, 3, 'uploads\\audiofile\\1729687300217-CHAPTER_6.mp3', 'uploads\\documents\\1729687300227-Module_3-Chapter_6-_Bearish_Three_Line_Strike_Pattern.pdf', 'Bearish Three Line Strike Pattern', '2024-10-23 12:41:40', '2024-10-23 12:41:40'),
(47, 2, 7, 3, 'uploads\\audiofile\\1729687335345-CHAPTER_7.mp3', 'uploads\\documents\\1729687335355-Module_3-Chapter_7-_Bearish_Three_Inside_Room_Pattern.pdf', 'Bearish Three Inside Room Pattern', '2024-10-23 12:42:15', '2024-10-23 12:42:15'),
(48, 2, 8, 3, 'uploads\\audiofile\\1729687388607-CHAPTER_8.mp3', 'uploads\\documents\\1729687388618-Module_3-Chapter_8-_The_Gravestone_Doji_Pattern.pdf', 'The Gravestone Doji Pattern', '2024-10-23 12:43:08', '2024-10-23 12:43:08'),
(49, 2, 9, 3, 'uploads\\audiofile\\1729687414794-CHAPTER_9.mp3', 'uploads\\documents\\1729687414808-Module_3-Chapter_9-_The_Dark_Cloud_Cover_Pattern.pdf', ' The Dark Cloud Cover Pattern', '2024-10-23 12:43:34', '2024-10-23 12:43:34'),
(50, 2, 10, 3, 'uploads\\audiofile\\1729687464005-CHAPTER_10.mp3', 'uploads\\documents\\1729687464013-Module_3-Chapter_10-_The_Bearish_Marubozu_Pattern.pdf', 'The Bearish Marubozu Pattern', '2024-10-23 12:44:24', '2024-10-23 12:44:24'),
(51, 2, 11, 3, 'uploads\\audiofile\\1729687504978-CHAPTER_11.mp3', 'uploads\\documents\\1729687504984-Module_3-Chapter_11-_The_Bearish_Abandoned_Baby_Pattern.pdf', 'The Bearish Abandoned Baby Pattern', '2024-10-23 12:45:04', '2024-10-23 12:45:04'),
(52, 2, 12, 3, 'uploads\\audiofile\\1729687541082-CHAPTER_12.mp3', 'uploads\\documents\\1729687541088-Module_3-Chapter_12-_The_Falling_Window_Pattern.pdf', 'The Falling Window Pattern', '2024-10-23 12:45:41', '2024-10-23 12:45:41'),
(53, 2, 1, 4, 'uploads\\audiofile\\1729687635801-CHAPTER_1.mp3', 'uploads\\documents\\1729687635809-Module_4-Chapter_1-_Fundamental_Analysis_Basics.pdf', 'The Falling Window Pattern', '2024-10-23 12:47:15', '2024-10-23 12:47:15'),
(54, 2, 2, 4, 'uploads\\audiofile\\1729687765109-CHAPTER_2.mp3', 'uploads\\documents\\1729687765117-Module_4-Chapter_2-_Financial_Statements.pdf', 'Financial Statements', '2024-10-23 12:49:25', '2024-10-23 12:49:25'),
(55, 2, 3, 4, 'uploads\\audiofile\\1729687813396-CHAPTER_3.mp3', 'uploads\\documents\\1729687813403-Module_4-Chapter_3-_Company_Fundamentals.pdf', ' Company Fundamentals', '2024-10-23 12:50:13', '2024-10-23 12:50:13'),
(56, 2, 4, 4, 'uploads\\audiofile\\1729687847458-CHAPTER_4.mp3', 'uploads\\documents\\1729687847467-Module_4-Chapter_4-_Industry_Analysis.pdf', 'Industry Analysis', '2024-10-23 12:50:47', '2024-10-23 12:50:47'),
(57, 2, 5, 4, 'uploads\\audiofile\\1729688203035-CHAPTER_5.mp3', 'uploads\\documents\\1729688203052-Module_4-Chapter_5-_Valuation_Techniques.pdf', 'Valuation Techniques', '2024-10-23 12:56:43', '2024-10-23 12:56:43'),
(58, 2, 6, 4, 'uploads\\audiofile\\1729688229659-CHAPTER_6.mp3', 'uploads\\documents\\1729688229701-Module_4-Chapter_6-_Accounting_Principles.pdf', 'Accounting Principles', '2024-10-23 12:57:09', '2024-10-23 12:57:09'),
(59, 2, 7, 4, 'uploads\\audiofile\\1729688253370-CHAPTER_7.mp3', 'uploads\\documents\\1729688253379-Module_4-Chapter_7-_Market_Analysis.pdf', 'Market Analysis', '2024-10-23 12:57:33', '2024-10-23 12:57:33'),
(60, 2, 8, 4, 'uploads\\audiofile\\1729688301589-CHAPTER_8.mp3', 'uploads\\documents\\1729688301597-Module_4-Chapter_8-_Event_Analysis.pdf', 'EventAnalysis', '2024-10-23 12:58:21', '2024-10-23 12:58:21'),
(61, 2, 9, 4, 'uploads\\audiofile\\1729688331542-CHAPTER_9.mp3', 'uploads\\documents\\1729688331551-Module_4-Chapter_9-_Volume_Analysis.pdf', 'Volume  Analysis', '2024-10-23 12:58:51', '2024-10-23 12:58:51'),
(62, 2, 10, 4, 'uploads\\audiofile\\1729688356368-CHAPTER_10.mp3', 'uploads\\documents\\1729688356379-Module_4-Chapter_10-_Dividend_Analysis.pdf', 'Dividend Analysis', '2024-10-23 12:59:16', '2024-10-23 12:59:16'),
(63, 2, 11, 4, 'uploads\\audiofile\\1729688381658-CHAPTER_11.mp3', 'uploads\\documents\\1729688381667-Module_4-Chapter_11-_Mergers_&_Acquisitions_Analysis.pdf', 'Mergers & Acquisitions Analysis', '2024-10-23 12:59:41', '2024-10-23 12:59:41'),
(64, 2, 12, 4, 'uploads\\audiofile\\1729688430504-CHAPTER_12.mp3', 'uploads\\documents\\1729688430520-Module_4-Chapter_12-_SectorRotation_Analysis.pdf', 'Sector Roatation Analysis', '2024-10-23 13:00:30', '2024-10-23 13:00:30'),
(66, 2, 13, 4, 'uploads\\audiofile\\1729688497199-CHAPTER_13.mp3', 'uploads\\documents\\1729688497209-Module_4-Chapter_13-_Stock_Buybacks.pdf', 'Stock Buybacks', '2024-10-23 13:01:37', '2024-10-23 13:01:37'),
(67, 2, 14, 4, 'uploads\\audiofile\\1729688522124-CHAPTER_14.mp3', 'uploads\\documents\\1729688522145-Module_4-Chapter_14-_Earnings_Per_Share_(EPS).pdf', 'EPS', '2024-10-23 13:02:02', '2024-10-23 13:02:02'),
(68, 2, 15, 4, 'uploads\\audiofile\\1729688559504-CHAPTER_15.mp3', 'uploads\\documents\\1729688559526-Module_4-Chapter_15-_Environmental,_Social_&_Governance(ESG).pdf', 'Environmental, Social & Governance(ESG)', '2024-10-23 13:02:39', '2024-10-23 13:02:39'),
(69, 2, 16, 4, 'uploads\\audiofile\\1729688590707-CHAPTER_16.mp3', 'uploads\\documents\\1729688590718-Module_4-Chapter_16-_Price_to_Earnings_Ratio_Analysis.pdf', 'Price to Earnings Ratio Analysis', '2024-10-23 13:03:10', '2024-10-23 13:03:10'),
(70, 2, 17, 4, 'uploads\\audiofile\\1729688752144-CHAPTER_17.mp3', 'uploads\\documents\\1729688752150-Module_4-Chapter_17-_Debt-to-Equity_Ratio_insights.pdf', 'Debt-to-Equity Ratio insights', '2024-10-23 13:05:52', '2024-10-23 13:05:52'),
(71, 2, 18, 4, 'uploads\\audiofile\\1729688779728-CHAPTER_18.mp3', 'uploads\\documents\\1729688779734-Module_4-Chapter_18-_Comparative_Analysis_of_Companies_in_the_Same_Sector.pdf', 'Comparative Analysis of Companies in the Same Sector', '2024-10-23 13:06:19', '2024-10-23 13:06:19'),
(72, 2, 1, 5, 'uploads\\audiofile\\1729688837688-CHAPTER_1.mp3', 'uploads\\documents\\1729688837697-Module_5-Chapter_1-_Moving_Averages.pdf', 'Moving Averages', '2024-10-23 13:07:17', '2024-10-23 13:07:17'),
(73, 2, 2, 5, 'uploads\\audiofile\\1729688869049-CHAPTER_2.mp3', 'uploads\\documents\\1729688869059-Module_5-Chapter_2-_Relative_Strength_Index_(RSI).pdf', 'Relative Strength Index (RSI)', '2024-10-23 13:07:49', '2024-10-23 13:07:49'),
(74, 2, 3, 5, 'uploads\\audiofile\\1729688909955-CHAPTER_3.mp3', 'uploads\\documents\\1729688909963-Module_5-Chapter_3-_Stochastic_Oscillator.pdf', 'Stochastic Oscillator', '2024-10-23 13:08:29', '2024-10-23 13:08:29'),
(75, 2, 4, 5, 'uploads\\audiofile\\1729688944892-CHAPTER_4.mp3', 'uploads\\documents\\1729688944898-Module_5-Chapter_4-_Bollinger_Bands.pdf', 'Stochastic Oscillator', '2024-10-23 13:09:04', '2024-10-23 13:09:04'),
(76, 2, 5, 5, 'uploads\\audiofile\\1729688974594-CHAPTER_5.mp3', 'uploads\\documents\\1729688974621-Module_5-Chapter_5-_MACD.pdf', 'MACD', '2024-10-23 13:09:34', '2024-10-23 13:09:34'),
(77, 2, 6, 5, 'uploads\\audiofile\\1729689002400-CHAPTER_6.mp3', 'uploads\\documents\\1729689002408-Module_5-Chapter_6-_Fibonacci_Retracement.pdf', 'Fibonacci Retracement', '2024-10-23 13:10:02', '2024-10-23 13:10:02'),
(78, 2, 7, 5, 'uploads\\audiofile\\1729689035254-CHAPTER_7.mp3', 'uploads\\documents\\1729689035262-Module_5-Chapter_7-_Average_True_Range_Indicator(ATR).pdf', '- Average True Range Indicator(ATR)', '2024-10-23 13:10:35', '2024-10-23 13:10:35'),
(79, 2, 8, 5, 'uploads\\audiofile\\1729689068152-CHAPTER_8.mp3', 'uploads\\documents\\1729689068161-Module_5-Chapter_8-_Money_Flow_Index(MFI).pdf', 'Money Flow Index(MFI)', '2024-10-23 13:11:08', '2024-10-23 13:11:08'),
(80, 2, 9, 5, 'uploads\\audiofile\\1729689098580-CHAPTER_9.mp3', 'uploads\\documents\\1729689098586-Module_5-Chapter_9-_SuperTrend_Indicator(STR).pdf', 'SuperTrend Indicator(STR)', '2024-10-23 13:11:38', '2024-10-23 13:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bod` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `subscriptionId` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `bod`, `password`, `profile_pic`, `subscriptionId`, `createdAt`, `updatedAt`) VALUES
(1, 'John Doe', '7410741012', NULL, '$2b$10$wDEG4pt36sDoQJb99qcoVORAvNeJsr8FoFuF9qLHVxBJDIi6Nwipi', NULL, 0, '2024-10-11 04:49:59', '2024-10-19 09:28:30'),
(2, 'Suyog Bhosale', '1234567890', '12-jan-2002', '$2b$10$XtxB.w34tZWIatAXapN1w.ZrJvu2cVw4QdxHhrhx5HaXapUXLeevi', 'uploads\\\\profile_img\\\\1729323248980.JPEG', 0, '2024-10-11 05:01:58', '2024-10-19 09:38:38'),
(3, 'sb', '7387107829', NULL, '$2b$10$CgI1X3TDXUK6wXq5DALi0.AQtEIssoMy3iHJZVJaNW21GDpNDndJ2', NULL, 0, '2024-10-17 07:30:03', '2024-10-17 07:30:03'),
(4, 'sb', '7768860976', NULL, '$2b$10$PYOUnSVpzJXVFI39g37w.OcPnt6wnmadbMF8EU/Z8aX.VTwHJxeYe', NULL, 0, '2024-10-17 07:30:13', '2024-10-17 07:30:13'),
(6, 'pass', '7768860676', NULL, '$2b$10$4UvH2edUtUDcjJcDU18K.eEzG0TpPZttP0UouZSeH3xfwwrMBizya', 'uploads\\profile_img\\1729323264691.jpeg', 0, '2024-10-19 07:26:51', '2024-10-19 07:34:24'),
(7, 'tejas', '9146598209', NULL, '$2b$10$qrqfCkxowY.gJIrOJtwC6OlLe8sQftCIY.eCxlY5FHGv5RzG7jSTy', NULL, 0, '2024-10-19 09:39:33', '2024-10-19 09:39:33'),
(8, 'sb', '7387107820', NULL, '$2b$10$7FZ6rWl7Mc027PbOwnmPUuTp0ut02jmTF.hHq5ngwgYF7oAKrfSNK', NULL, 0, '2024-10-19 10:17:12', '2024-10-19 10:17:12'),
(9, 'sb', '73871078299', NULL, '$2b$10$PjgZG09/BVL1Fcjzt8dvlupH/zy3/lXUl2a1Ys5C1OVqWoyUtDkzi', NULL, 0, '2024-10-19 10:24:07', '2024-10-19 10:24:07'),
(10, 'tejas', '9146598201', NULL, '$2b$10$WQOEO1ICGMDEC6Y0fu.bouJLVL0MDXotBGM3PWpMkPnqBlMaYiIWe', NULL, 0, '2024-10-19 10:57:20', '2024-10-19 10:57:20'),
(11, 'Test User', '7777888878', '12-jun-2001', '$2b$10$cBJtJNXYDkaHyfyL28VXHeicxahWy/rk/JIR2ahA/xvLeY9Uxs/Ja', 'uploads\\\\profile_img\\\\1729323248980.JPEG', 1, '2024-10-24 17:36:42', '2024-10-24 17:36:42'),
(12, 'sb', '1234567891', '12-jun-2001', '$2b$10$nAKwlojBZIMtnDUCXQYBp.LoivDsM3Fe4i6PIs9IGTLZplwjQd9jm', NULL, 1, '2024-10-26 09:29:31', '2024-10-29 05:28:54'),
(13, 'suyog', '9822974552', NULL, '$2b$10$W7ZoS.RC4mvjjtR6kAEVhOAnzAQq9Ihqu/X2x4kBYgXGgV77f9D2W', NULL, 0, '2024-10-26 11:12:01', '2024-10-26 11:12:01'),
(14, '7777888878', 'rtt', NULL, '$2b$10$Bzwy.xYfinmMzYeNZO0osemMIVyINt5DEWJY4g7Nu8yS8y5fAv9EC', NULL, 0, '2024-10-29 14:15:23', '2024-10-29 14:15:23'),
(15, '7777888878', 'yyg', NULL, '$2b$10$Kt4an49DBjY3DvHQ9juUouclcuBCxe7FWcRMK1Y8fnNQJ7BUB3bPS', NULL, 0, '2024-10-29 14:17:11', '2024-10-29 14:17:11'),
(16, 'new test', 'ghgg', NULL, '$2b$10$cOPtDYRfjo0JzyJVk05X3OxMLJYFAgqYCm55kB1GZZ3cQzGb.gFhC', NULL, 0, '2024-11-05 05:47:28', '2024-11-05 05:47:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modulenames`
--
ALTER TABLE `modulenames`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_and_terms`
--
ALTER TABLE `privacy_and_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `syallabuses`
--
ALTER TABLE `syallabuses`
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
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modulenames`
--
ALTER TABLE `modulenames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `privacy_and_terms`
--
ALTER TABLE `privacy_and_terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `syallabuses`
--
ALTER TABLE `syallabuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
