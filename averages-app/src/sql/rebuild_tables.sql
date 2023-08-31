IF OBJECT_ID(N'dbo.characters', N'U') IS NOT NULL
	DROP TABLE [dbo].characters;
GO

CREATE TABLE
  characters (
		id INT NOT NULL,
		game_id INT NOT NULL,
		display_name VARCHAR(30),
		gender TINYINT,
		classing_type TINYINT,
		is_child BIT);

IF OBJECT_ID(N'dbo.stats', N'U') IS NOT NULL
	DROP TABLE[dbo].stats;
GO

CREATE TABLE
  stats (
	  id INT PRIMARY KEY NOT NULL,
		class_id INT NOT NULL,
		base_lvl TINYINT DEFAULT 1,
		base_hp TINYINT,
		base_str TINYINT,
		base_mag TINYINT,
		base_skl TINYINT,
		base_spd TINYINT,
		base_lck TINYINT,
		base_def TINYINT,
		base_res TINYINT,
		growth_hp SMALLINT,
		growth_str SMALLINT,
		growth_mag SMALLINT,
		growth_skl SMALLINT,
		growth_spd SMALLINT,
		growth_lck SMALLINT,
		growth_def SMALLINT,
		growth_res SMALLINT,
		max_str TINYINT,
		max_mag TINYINT,
		max_skl TINYINT,
		max_spd TINYINT,
		max_lck TINYINT,
		max_def TINYINT,
		max_res TINYINT,
		class_set1 INT,
		class_set2 INT,
		class_set3 INT);

IF OBJECT_ID(N'dbo.class', N'U') IS NOT NULL
	DROP TABLE[dbo].class;
GO

CREATE TABLE
	class (
		id INT PRIMARY KEY NOT NULL,
		class_name VARCHAR(30) DEFAULT N'',
		display_name VARCHAR(30) DEFAULT N'',
		is_promoted BIT DEFAULT 0,
		is_special BIT DEFAULT 0,
		gender TINYINT DEFAULT 0,
		base_hp TINYINT,
		base_str TINYINT,
		base_mag TINYINT,
		base_skl TINYINT,
		base_spd TINYINT,
		base_lck TINYINT,
		base_def TINYINT,
		base_res TINYINT,
		base_mov TINYINT,
		growth_hp SMALLINT,
		growth_str SMALLINT,
		growth_mag SMALLINT,
		growth_skl SMALLINT,
		growth_spd SMALLINT,
		growth_lck SMALLINT,
		growth_def SMALLINT,
		growth_res SMALLINT,
		max_hp TINYINT,
		max_str TINYINT,
		max_mag TINYINT,
		max_skl TINYINT,
		max_spd TINYINT,
		max_lck TINYINT,
		max_def TINYINT,
		max_res TINYINT);

IF OBJECT_ID(N'dbo.child', N'U') IS NOT NULL
	DROP TABLE[dbo].child;
GO

CREATE TABLE
	child (
	  id INT PRIMARY KEY NOT NULL,
		parent_id INT NOT NULL,
		alt_parent_id INT);

IF OBJECT_ID(N'dbo.boons', N'U') IS NOT NULL
	DROP TABLE[dbo].boons;
GO

CREATE TABLE
  boons (
	  stat VARCHAR(5) PRIMARY KEY NOT NULL,
		display_name VARCHAR(30) DEFAULT N'',
		base_hp TINYINT,
		base_str TINYINT,
		base_mag TINYINT,
		base_skl TINYINT,
		base_spd TINYINT,
		base_lck TINYINT,
		base_def TINYINT,
		base_res TINYINT,
		growth_hp SMALLINT,
		growth_str SMALLINT,
		growth_mag SMALLINT,
		growth_skl SMALLINT,
		growth_spd SMALLINT,
		growth_lck SMALLINT,
		growth_def SMALLINT,
		growth_res SMALLINT,
		max_str TINYINT,
		max_mag TINYINT,
		max_skl TINYINT,
		max_spd TINYINT,
		max_lck TINYINT,
		max_def TINYINT,
		max_res TINYINT);

IF OBJECT_ID(N'dbo.banes', N'U') IS NOT NULL
	DROP TABLE[dbo].banes;
GO

CREATE TABLE
  banes (
	  stat VARCHAR(5) PRIMARY KEY NOT NULL,
		display_name VARCHAR(30) DEFAULT N'',
		base_hp TINYINT,
		base_str TINYINT,
		base_mag TINYINT,
		base_skl TINYINT,
		base_spd TINYINT,
		base_lck TINYINT,
		base_def TINYINT,
		base_res TINYINT,
		growth_hp SMALLINT,
		growth_str SMALLINT,
		growth_mag SMALLINT,
		growth_skl SMALLINT,
		growth_spd SMALLINT,
		growth_lck SMALLINT,
		growth_def SMALLINT,
		growth_res SMALLINT,
		max_str TINYINT,
		max_mag TINYINT,
		max_skl TINYINT,
		max_spd TINYINT,
		max_lck TINYINT,
		max_def TINYINT,
		max_res TINYINT);

IF OBJECT_ID(N'dbo.talents', N'U') IS NOT NULL
	DROP TABLE[dbo].talents;
GO

CREATE TABLE
  talents (
	  id INT PRIMARY KEY NOT NULL,
		class_name VARCHAR(30) DEFAULT N'',
		display_name VARCHAR(30) DEFAULT N'',
		class_set INT,
		gender TINYINT);

IF OBJECT_ID(N'dbo.class_set', N'U') IS NOT NULL
	DROP TABLE[dbo].class_set;
GO

CREATE TABLE
  class_set (
	  id INT PRIMARY KEY NOT NULL,
		unpromoted_class INT,
		promoted_class1 INT,
		promoted_class2 INT,
		parallel_class INT);