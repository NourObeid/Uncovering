BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `web_post` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`text`	text NOT NULL,
	`created_date`	datetime NOT NULL,
	`published_date`	datetime,
	`author_id`	integer NOT NULL,
	FOREIGN KEY(`author_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `web_places` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 250 ) NOT NULL,
	`r_score`	varchar ( 250 ) NOT NULL,
	`c_score`	varchar ( 250 ) NOT NULL,
	`wikiId`	varchar ( 500 ) NOT NULL
);
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar ( 40 ) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
INSERT INTO `django_session` VALUES ('1jl9e8vo6ppu5tqcihx3am8rh6o7aulv','OWNkZmQyNDg0ODdhNjAzMTVlMTA1MTA1MWZhMTBkMDEwYTBkOTEzNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTJhZDVhMjM5YmViODYxYTRhNTU1MmNiZGYxNzgyYzA4MzI5ODA1In0=','2018-03-30 15:36:17.848891');
INSERT INTO `django_session` VALUES ('k5o6dootp2z4zto7bhggxxxi0woekkvi','OWNkZmQyNDg0ODdhNjAzMTVlMTA1MTA1MWZhMTBkMDEwYTBkOTEzNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTJhZDVhMjM5YmViODYxYTRhNTU1MmNiZGYxNzgyYzA4MzI5ODA1In0=','2018-03-30 18:29:33.970969');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-16 15:32:07.547725');
INSERT INTO `django_migrations` VALUES (2,'auth','0001_initial','2018-03-16 15:32:07.587295');
INSERT INTO `django_migrations` VALUES (3,'admin','0001_initial','2018-03-16 15:32:07.622138');
INSERT INTO `django_migrations` VALUES (4,'admin','0002_logentry_remove_auto_add','2018-03-16 15:32:07.656457');
INSERT INTO `django_migrations` VALUES (5,'contenttypes','0002_remove_content_type_name','2018-03-16 15:32:07.699027');
INSERT INTO `django_migrations` VALUES (6,'auth','0002_alter_permission_name_max_length','2018-03-16 15:32:07.713800');
INSERT INTO `django_migrations` VALUES (7,'auth','0003_alter_user_email_max_length','2018-03-16 15:32:07.740597');
INSERT INTO `django_migrations` VALUES (8,'auth','0004_alter_user_username_opts','2018-03-16 15:32:07.762313');
INSERT INTO `django_migrations` VALUES (9,'auth','0005_alter_user_last_login_null','2018-03-16 15:32:07.787186');
INSERT INTO `django_migrations` VALUES (10,'auth','0006_require_contenttypes_0002','2018-03-16 15:32:07.791854');
INSERT INTO `django_migrations` VALUES (11,'auth','0007_alter_validators_add_error_messages','2018-03-16 15:32:07.811864');
INSERT INTO `django_migrations` VALUES (12,'auth','0008_alter_user_username_max_length','2018-03-16 15:32:07.831791');
INSERT INTO `django_migrations` VALUES (13,'auth','0009_alter_user_last_name_max_length','2018-03-16 15:32:07.866687');
INSERT INTO `django_migrations` VALUES (14,'sessions','0001_initial','2018-03-16 15:32:07.876943');
INSERT INTO `django_migrations` VALUES (15,'web','0001_initial','2018-03-16 15:32:07.900752');
INSERT INTO `django_migrations` VALUES (16,'web','0002_profile','2018-03-16 15:32:07.925420');
INSERT INTO `django_migrations` VALUES (17,'web','0003_auto_20180212_2129','2018-03-16 15:32:07.958045');
INSERT INTO `django_migrations` VALUES (18,'web','0004_remove_post_title','2018-03-16 15:32:07.977047');
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app_label`	varchar ( 100 ) NOT NULL,
	`model`	varchar ( 100 ) NOT NULL
);
INSERT INTO `django_content_type` VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` VALUES (2,'auth','permission');
INSERT INTO `django_content_type` VALUES (3,'auth','group');
INSERT INTO `django_content_type` VALUES (4,'auth','user');
INSERT INTO `django_content_type` VALUES (5,'contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (6,'sessions','session');
INSERT INTO `django_content_type` VALUES (7,'web','places');
INSERT INTO `django_content_type` VALUES (8,'web','post');
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`object_id`	text,
	`object_repr`	varchar ( 200 ) NOT NULL,
	`action_flag`	smallint unsigned NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_time`	datetime NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`password`	varchar ( 128 ) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`username`	varchar ( 150 ) NOT NULL UNIQUE,
	`first_name`	varchar ( 30 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`last_name`	varchar ( 150 ) NOT NULL
);
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$zbD3TWtk0rgM$OxTwY5so0FZT+l1TkR/7Zozt/Hp8M9QXsh2L983KtNc=','2018-03-16 18:29:33.963182',0,'nour','','nour@nour.com',0,1,'2018-03-16 15:36:09.526416','');
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar ( 100 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO `auth_permission` VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO `auth_permission` VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO `auth_permission` VALUES (4,2,'add_permission','Can add permission');
INSERT INTO `auth_permission` VALUES (5,2,'change_permission','Can change permission');
INSERT INTO `auth_permission` VALUES (6,2,'delete_permission','Can delete permission');
INSERT INTO `auth_permission` VALUES (7,3,'add_group','Can add group');
INSERT INTO `auth_permission` VALUES (8,3,'change_group','Can change group');
INSERT INTO `auth_permission` VALUES (9,3,'delete_group','Can delete group');
INSERT INTO `auth_permission` VALUES (10,4,'add_user','Can add user');
INSERT INTO `auth_permission` VALUES (11,4,'change_user','Can change user');
INSERT INTO `auth_permission` VALUES (12,4,'delete_user','Can delete user');
INSERT INTO `auth_permission` VALUES (13,5,'add_contenttype','Can add content type');
INSERT INTO `auth_permission` VALUES (14,5,'change_contenttype','Can change content type');
INSERT INTO `auth_permission` VALUES (15,5,'delete_contenttype','Can delete content type');
INSERT INTO `auth_permission` VALUES (16,6,'add_session','Can add session');
INSERT INTO `auth_permission` VALUES (17,6,'change_session','Can change session');
INSERT INTO `auth_permission` VALUES (18,6,'delete_session','Can delete session');
INSERT INTO `auth_permission` VALUES (19,7,'add_places','Can add places');
INSERT INTO `auth_permission` VALUES (20,7,'change_places','Can change places');
INSERT INTO `auth_permission` VALUES (21,7,'delete_places','Can delete places');
INSERT INTO `auth_permission` VALUES (22,8,'add_post','Can add post');
INSERT INTO `auth_permission` VALUES (23,8,'change_post','Can change post');
INSERT INTO `auth_permission` VALUES (24,8,'delete_post','Can delete post');
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 80 ) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS `web_post_author_id_cf4ad009` ON `web_post` (
	`author_id`
);
CREATE INDEX IF NOT EXISTS `django_session_expire_date_a5c62663` ON `django_session` (
	`expire_date`
);
CREATE UNIQUE INDEX IF NOT EXISTS `django_content_type_app_label_model_76bd3d3b_uniq` ON `django_content_type` (
	`app_label`,
	`model`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_user_id_c564eba6` ON `django_admin_log` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (
	`content_type_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `auth_user_user_permissions` (
	`user_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_a95ead1b` ON `auth_user_user_permissions` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_permission_id_1fbb5f2c` ON `auth_user_user_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `auth_user_groups` (
	`user_id`,
	`group_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_user_id_6a12ed8b` ON `auth_user_groups` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_group_id_97559544` ON `auth_user_groups` (
	`group_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_permission_content_type_id_codename_01ab375a_uniq` ON `auth_permission` (
	`content_type_id`,
	`codename`
);
CREATE INDEX IF NOT EXISTS `auth_permission_content_type_id_2f476e4b` ON `auth_permission` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_permission_id_84c5c92e` ON `auth_group_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `auth_group_permissions` (
	`group_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_group_id_b120cbf9` ON `auth_group_permissions` (
	`group_id`
);
COMMIT;
