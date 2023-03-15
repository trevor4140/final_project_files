DROP TABLE IF EXISTS video_games;
DROP TABLE IF EXISTS consoles;
DROP TABLE IF EXISTS user_group;
DROP TABLE IF EXISTS game_group;
DROP TABLE IF EXISTS user;


CREATE TABLE user (
user_id int not null auto_increment,
user_name varchar(25) not null,
user_email varchar(45) not null,
user_age int not null,
PRIMARY KEY (user_id)
);

CREATE TABLE game_group (
group_id int not null auto_increment,
group_name varchar(40) not null,
group_size int not null,
group_notes varchar(500),
PRIMARY KEY (group_id)
);

CREATE TABLE user_group (
user_group_id int not null auto_increment,
PRIMARY KEY (user_group_id),
FOREIGN KEY (group_id_fk) REFERENCES game_group (group_id) ON DELETE CASCADE,
FOREIGN KEY (user_id_fk) REFERENCES user (user_id) ON DELETE CASCADE
);

CREATE TABLE consoles (
console_id int not null auto_increment,
console_brand varchar(20) not null,
console_name varchar(20) not null,
PRIMARY KEY (console_id)
);

CREATE TABLE video_games(
game_id int not null auto_increment,
game_name varchar(60) not null,
genre enum('RPG', 'SHOOTER','FIGHTING', 'PUZZLE', 'ACTION','HORROR') not null,
ESRB_rating varchar(4),
PRIMARY KEY (game_id),
FOREIGN KEY (console_id_fk) REFERENCES consoles (console_id) ON DELETE CASCADE
);

