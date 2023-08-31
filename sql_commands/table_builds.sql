CREATE TABLE
  characters (
	  id INT PRIMARY KEY NOT NULL,
		game_id TINYINT NOT NULL,
		display_name VARCHAR(30) DEFAULT N'',
		gender TINYINT,
		classing_type TINYINT DEFAULT 0,
		is_child BIT DEFAULT 0);

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

CREATE TABLE
	child (
	  id INT PRIMARY KEY NOT NULL,
		parent_id INT NOT NULL,
		alt_parent_id INT);

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

CREATE TABLE
  talents (
	  id INT PRIMARY KEY NOT NULL,
		class_name VARCHAR(30) DEFAULT N'',
		display_name VARCHAR(30) DEFAULT N'',
		class_set INT,
		gender TINYINT);

CREATE TABLE
  class_set (
	  id INT PRIMARY KEY NOT NULL,
		unpromoted_class INT,
		promoted_class1 INT,
		promoted_class2 INT,
		parallel_class INT);