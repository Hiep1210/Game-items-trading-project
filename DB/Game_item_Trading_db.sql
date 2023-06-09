drop database if exists game_items_trading;
create database game_items_trading;
use game_items_trading;

CREATE TABLE Role(
	id INT not null auto_increment,
    primary key(id),
	role_name VARCHAR(50)
);

CREATE TABLE UserAccount(
	id int not null auto_increment,
    primary key(id),
	username VARCHAR(50),
	password VARCHAR(50),
    dob DATE,
	email VARCHAR(100),
	gender VARCHAR(10),
	avatar VARCHAR(50),
    role_id int,
    money_amount double,
	foreign key(role_id) references Role(id)
);

CREATE TABLE GameItems(
	id INT not null auto_increment,
    primary key(id),
	skin_name VARCHAR(50),
	item_name VARCHAR(50),
	type VARCHAR(50),
	rarity VARCHAR(50),
    exterior varchar(50),
    img varchar(50)
);

CREATE TABLE Notification (
    id INT NOT NULL auto_increment,
    PRIMARY KEY (id),
    date date,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES UserAccount (id),
    noti_content VARCHAR(10000),
    content_type VARCHAR(50)
);

create table MarketItems(
	id int not null auto_increment,
    primary key(id),
    user_id int,
    foreign key(user_id) references UserAccount(id),
    item_id int,
    price double,
    foreign key(item_id) references GameItems(id)
);

create table PaymentRequest (
	id int not null auto_increment,
    primary key(id),
    user_id int,
    money double,
    date date,
    foreign key(user_id) references UserAccount(id),
    img varchar(50)
);

create table RetrieveRequest(
	id int not null auto_increment,
    primary key (id),
    user_id int,
    date date,
    foreign key(user_id) references UserAccount(id),
    retrieve_amount double,
    bank_details varchar(50) 
);

-- create table TradeItems(
-- 	id int not null auto_increment,
--     primary key(id),
--     give_id int,
--     foreign key(give_id) references useritem(id),
--     rec_id int,
--     foreign key(rec_id) references gameitems(id)
-- );

INSERT INTO role (`id`, `role_name`) VALUES ('1', 'user');
INSERT INTO role (`id`, `role_name`) VALUES ('2', 'admin');

insert into UserAccount(id, username, password, dob, email, gender, avatar, role_id, money_amount) values (1, 'admin', '123456', '2003-03-21', 'admin@domain.com', 'Male', 'img', 2, 10000);
insert into UserAccount(id, username, password, dob, email, gender, avatar, role_id, money_amount) values (2, 'user', '123456', '2003-03-21', 'user@domain.com', 'Female', 'img', 1, 10000);
insert into UserAccount(id, username, password, dob, email, gender, avatar, role_id, money_amount) values (3, 'lamphung', '123456', '2003-03-21', 'lamphung@domain.com', 'Female', 'img', 1, 10000);
insert into UserAccount(id, username, password, dob, email, gender, avatar, role_id, money_amount) values (4, 'hoanghiep', '123456', '2003-03-21', 'hoanghiep@domain.com', 'Female', 'img', 1, 10000);
insert into UserAccount(id, username, password, dob, email, gender, avatar, role_id, money_amount) values (5, 'thehung', '123456', '2003-03-21', 'thehung@domain.com', 'Female', 'img', 1, 10000);
insert into UserAccount(id, username, password, dob, email, gender, avatar, role_id, money_amount) values (6, 'theluong', '123456', '2003-03-21', 'theluong@domain.com', 'Female', 'img', 1, 10000);
insert into UserAccount(id, username, password, dob, email, gender, avatar, role_id, money_amount) values (7, 'chitrung', '123456', '2003-03-21', 'chitrung@domain.com', 'Female', 'img', 1, 10000);

INSERT INTO notification (`date`, `user_id`, `noti_content`, `content_type`) VALUES ('2023-05-01', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'admin');
INSERT INTO notification (`date`, `user_id`, `noti_content`, `content_type`) VALUES ('2023-05-01', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'admin');
INSERT INTO notification (`date`, `user_id`, `noti_content`, `content_type`) VALUES ('2023-05-01', '3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'admin');
INSERT INTO notification (`date`, `user_id`, `noti_content`, `content_type`) VALUES ('2023-05-01', '4', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'admin');
INSERT INTO notification (`date`, `user_id`, `noti_content`, `content_type`) VALUES ('2023-05-01', '2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'buy');
INSERT INTO notification (`date`, `user_id`, `noti_content`, `content_type`) VALUES ('2023-05-01', '3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'buy');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Victoria','CZ75-Auto','Pistol','Covert', 'Factory New', 'CZ75-Auto_Victoria');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Victoria','CZ75-Auto','Pistol','Covert', 'Minimal Wear', 'CZ75-Auto_Victoria');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Victoria','CZ75-Auto','Pistol','Covert', 'Field-Tested', 'CZ75-Auto_Victoria');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Victoria','CZ75-Auto','Pistol','Covert', 'Well-Worn', 'CZ75-Auto_Victoria');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Victoria','CZ75-Auto','Pistol','Covert', 'Battle-Scarred', 'CZ75-Auto_Victoria');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Code Red','Desert Eagle','Pistol','Covert', 'Factory New', 'Desert Eagle_Code Red');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Code Red','Desert Eagle','Pistol','Covert', 'Minimal Wear', 'Desert Eagle_Code Red');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Code Red','Desert Eagle','Pistol','Covert', 'Field-Tested','Desert Eagle_Code Red');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Code Red','Desert Eagle','Pistol','Covert', 'Well-Worn','Desert Eagle_Code Red');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Code Red','Desert Eagle','Pistol','Covert', 'Battle-Scarred','Desert Eagle_Code Red');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Mecha Industries','Desert Eagle','Pistol','Classified', 'Factory New','Desert Eagle_Mecha Industries');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Mecha Industries','Desert Eagle','Pistol','Classified', 'Minimal Wear','Desert Eagle_Mecha Industries');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Mecha Industries','Desert Eagle','Pistol','Classified', 'Field-Tested','Desert Eagle_Mecha Industries');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Mecha Industries','Desert Eagle','Pistol','Classified', 'Well-Worn','Desert Eagle_Mecha Industries');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Mecha Industries','Desert Eagle','Pistol','Classified', 'Battle-Scarred','Desert Eagle_Mecha Industries');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cobra Strike','Dual Berettas','Pistol','Classified', 'Factory New','Dual Berettas_Cobra Strike');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cobra Strike','Dual Berettas','Pistol','Classified', 'Minimal Wear','Dual Berettas_Cobra Strike');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cobra Strike','Dual Berettas','Pistol','Classified', 'Field-Tested','Dual Berettas_Cobra Strike');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cobra Strike','Dual Berettas','Pistol','Classified', 'Well-Worn','Dual Berettas_Cobra Strike');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cobra Strike','Dual Berettas','Pistol','Classified', 'Battle-Scarred','Dual Berettas_Cobra Strike');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Nightshade','Five-SeveN','Pistol','Mil-spec', 'Factory New','Five-SeveN_Nightshade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Nightshade','Five-SeveN','Pistol','Mil-spec', 'Minimal Wear','Five-SeveN_Nightshade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Nightshade','Five-SeveN','Pistol','Mil-spec', 'Field-Tested','Five-SeveN_Nightshade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Nightshade','Five-SeveN','Pistol','Mil-spec', 'Well-Worn','Five-SeveN_Nightshade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Nightshade','Five-SeveN','Pistol','Mil-spec', 'Battle-Scarred','Five-SeveN_Nightshade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Red Tire','Glock-18','Pistol','Industrial', 'Factory New','Glock-18_Red Tire');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Red Tire','Glock-18','Pistol','Industrial', 'Minimal Wear','Glock-18_Red Tire');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Red Tire','Glock-18','Pistol','Industrial', 'Field-Tested','Glock-18_Red Tire');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Red Tire','Glock-18','Pistol','Industrial', 'Well-Worn','Glock-18_Red Tire');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Red Tire','Glock-18','Pistol','Industrial', 'Battle-Scarred','Glock-18_Red Tire');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Acid Etched','P2000','Pistol','Restricted', 'Factory New','P2000_Acid Etched');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Acid Etched','P2000','Pistol','Restricted', 'Minimal Wear','P2000_Acid Etched');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Acid Etched','P2000','Pistol','Restricted', 'Field-Tested','P2000_Acid Etched');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Acid Etched','P2000','Pistol','Restricted', 'Well-Worn','P2000_Acid Etched');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Acid Etched','P2000','Pistol','Restricted', 'Battle-Scarred','P2000_Acid Etched');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Apep Curse','P250','Pistol','Classified', 'Factory New','P250_Apep Curse');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Apep Curse','P250','Pistol','Classified', 'Minimal Wear','P250_Apep Curse');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Apep Curse','P250','Pistol','Classified', 'Field-Tested','P250_Apep Curse');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Apep Curse','P250','Pistol','Classified', 'Well-Worn','P250_Apep Curse');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Apep Curse','P250','Pistol','Classified', 'Battle-Scarred','P250_Apep Curse');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Cannon','R8 Revolver','Pistol','Restricted', 'Factory New','R8 Revolver_Banana Cannon');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Cannon','R8 Revolver','Pistol','Restricted', 'Minimal Wear','R8 Revolver_Banana Cannon');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Cannon','R8 Revolver','Pistol','Restricted', 'Field-Tested','R8 Revolver_Banana Cannon');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Cannon','R8 Revolver','Pistol','Restricted', 'Well-Worn','R8 Revolver_Banana Cannon');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Cannon','R8 Revolver','Pistol','Restricted', 'Battle-Scarred','R8 Revolver_Banana Cannon');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fire Serpent','AK-47','Rifle','Covert', 'Factory New','AK-47_Fire Serpant');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fire Serpent','AK-47','Rifle','Covert', 'Minimal Wear','AK-47_Fire Serpant');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fire Serpent','AK-47','Rifle','Covert', 'Field-Tested','AK-47_Fire Serpant');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fire Serpent','AK-47','Rifle','Covert', 'Well-Worn','AK-47_Fire Serpant');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fire Serpent','AK-47','Rifle','Covert', 'Battle-Scarred','AK-47_Fire Serpant');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jet Set','AK-47','Rifle','Classified', 'Factory New','AK-47_Jet Set');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jet Set','AK-47','Rifle','Classified', 'Minimal Wear','AK-47_Jet Set');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jet Set','AK-47','Rifle','Classified', 'Field-Tested','AK-47_Jet Set');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jet Set','AK-47','Rifle','Classified', 'Battle-Scarred','AK-47_Jet Set');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Radiation Hazard','AUG','Rifle','Industrial', 'Factory New','AUG_Radiation Hazard');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Radiation Hazard','AUG','Rifle','Industrial', 'Minimal Wear','AUG_Radiation Hazard');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Radiation Hazard','AUG','Rifle','Industrial', 'Field-Tested','AUG_Radiation Hazard');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Radiation Hazard','AUG','Rifle','Industrial', 'Well-Worn','AUG_Radiation Hazard');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Radiation Hazard','AUG','Rifle','Industrial', 'Battle-Scarred','AUG_Radiation Hazard');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','AWP','Rifle','Covert', 'Factory New','AWP_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','AWP','Rifle','Covert', 'Minimal Wear','AWP_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','AWP','Rifle','Covert', 'Field-Tested','AWP_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','AWP','Rifle','Covert', 'Well-Worn','AWP_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','AWP','Rifle','Covert', 'Battle-Scarred','AWP_Fade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Safari Mesh','G3SG1','Rifle','Consumer', 'Factory New','G3SG1_Safari Mesh');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Safari Mesh','G3SG1','Rifle','Consumer', 'Minimal Wear','G3SG1_Safari Mesh');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Safari Mesh','G3SG1','Rifle','Consumer', 'Field-Tested','G3SG1_Safari Mesh');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Safari Mesh','G3SG1','Rifle','Consumer', 'Well-Worn','G3SG1_Safari Mesh');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Safari Mesh','G3SG1','Rifle','Consumer', 'Battle-Scarred','G3SG1_Safari Mesh');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Eco','Galil AR','Rifle','Classified', 'Factory New','Galil AR_Eco');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Eco','Galil AR','Rifle','Classified', 'Minimal Wear','Galil AR_Eco');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Eco','Galil AR','Rifle','Classified', 'Field-Tested','Galil AR_Eco');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Eco','Galil AR','Rifle','Classified', 'Well-Worn','Galil AR_Eco');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Eco','Galil AR','Rifle','Classified', 'Battle-Scarred','Galil AR_Eco');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','M4A1-S','Rifle','Covert', 'Factory New','M4A1-S_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','M4A1-S','Rifle','Covert', 'Minimal Wear','M4A1-S_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','M4A1-S','Rifle','Covert', 'Field-Tested','M4A1-S_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','M4A1-S','Rifle','Covert', 'Well-Worn','M4A1-S_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','M4A1-S','Rifle','Covert', 'Battle-Scarred','M4A1-S_Hyper Beast');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Basilisk','M4A1-S','Rifle','Restricted', 'Factory New','M4A1-S_Basilisk');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Basilisk','M4A1-S','Rifle','Restricted', 'Minimal Wear','M4A1-S_Basilisk');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Basilisk','M4A1-S','Rifle','Restricted', 'Field-Tested','M4A1-S_Basilisk');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Basilisk','M4A1-S','Rifle','Restricted', 'Well-Worn','M4A1-S_Basilisk');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Basilisk','M4A1-S','Rifle','Restricted', 'Battle-Scarred','M4A1-S_Basilisk');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neo-Noir','M4A4','Rifle','Covert', 'Factory New','M4A4_Neo-Noir');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neo-Noir','M4A4','Rifle','Covert', 'Minimal Wear','M4A4_Neo-Noir');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neo-Noir','M4A4','Rifle','Covert', 'Field-Tested','M4A4_Neo-Noir');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neo-Noir','M4A4','Rifle','Covert', 'Well-Worn','M4A4_Neo-Noir');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neo-Noir','M4A4','Rifle','Covert', 'Battle-Scarred','M4A4_Neo-Noir');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jungle Slipstream','SCAR-20','Rifle','Mil-spec', 'Factory New','SCAR-20_Jungle Slipstream');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jungle Slipstream','SCAR-20','Rifle','Mil-spec', 'Minimal Wear','SCAR-20_Jungle Slipstream');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jungle Slipstream','SCAR-20','Rifle','Mil-spec', 'Field-Tested','SCAR-20_Jungle Slipstream');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jungle Slipstream','SCAR-20','Rifle','Mil-spec', 'Well-Worn','SCAR-20_Jungle Slipstream');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Jungle Slipstream','SCAR-20','Rifle','Mil-spec', 'Battle-Scarred','SCAR-20_Jungle Slipstream');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cyberforce','SG 553','Rifle','Mil-spec', 'Factory New','SG 553_Cyberforce');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cyberforce','SG 553','Rifle','Mil-spec', 'Minimal Wear','SG 553_Cyberforce');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cyberforce','SG 553','Rifle','Mil-spec', 'Field-Tested','SG 553_Cyberforce');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cyberforce','SG 553','Rifle','Mil-spec', 'Well-Worn','SG 553_Cyberforce');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Cyberforce','SG 553','Rifle','Mil-spec', 'Battle-Scarred','SG 553_Cyberforce');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slashed','SSG 08','Rifle','Mil-spec', 'Factory New','SSG 08_Slashed');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slashed','SSG 08','Rifle','Mil-spec', 'Minimal Wear','SSG 08_Slashed');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slashed','SSG 08','Rifle','Mil-spec', 'Field-Tested','SSG 08_Slashed');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slashed','SSG 08','Rifle','Mil-spec', 'Well-Worn','SSG 08_Slashed');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slashed','SSG 08','Rifle','Mil-spec', 'Battle-Scarred','SSG 08_Slashed');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neon Rider','MAC-10','SMGs','Covert', 'Factory New','MAC-10_Neon Rider');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neon Rider','MAC-10','SMGs','Covert', 'Minimal Wear','MAC-10_Neon Rider');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neon Rider','MAC-10','SMGs','Covert', 'Field-Tested','MAC-10_Neon Rider');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neon Rider','MAC-10','SMGs','Covert', 'Well-Worn','MAC-10_Neon Rider');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Neon Rider','MAC-10','SMGs','Covert', 'Battle-Scarred','MAC-10_Neon Rider');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Sakkaku','MAC-10','SMGs','Restricted', 'Factory New','MAC-10_Sakkaku');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Sakkaku','MAC-10','SMGs','Restricted', 'Minimal Wear','MAC-10_Sakkaku');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Sakkaku','MAC-10','SMGs','Restricted', 'Field-Tested','MAC-10_Sakkaku');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Sakkaku','MAC-10','SMGs','Restricted', 'Well-Worn','MAC-10_Sakkaku');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Sakkaku','MAC-10','SMGs','Restricted', 'Battle-Scarred','MAC-10_Sakkaku');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Dirt Drop','MP5-SD','SMGs','Consumer', 'Factory New','MP5-SD_Dirt Drop');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Dirt Drop','MP5-SD','SMGs','Consumer', 'Minimal Wear','MP5-SD_Dirt Drop');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Dirt Drop','MP5-SD','SMGs','Consumer', 'Field-Tested','MP5-SD_Dirt Drop');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Dirt Drop','MP5-SD','SMGs','Consumer', 'Well-Worn','MP5-SD_Dirt Drop');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Dirt Drop','MP5-SD','SMGs','Consumer', 'Battle-Scarred','MP5-SD_Dirt Drop');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Abyssal Apparition','MP7','SMGs','Classified', 'Factory New','MP7_Abyssal Apparition');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Abyssal Apparition','MP7','SMGs','Classified', 'Minimal Wear','MP7_Abyssal Apparition');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Abyssal Apparition','MP7','SMGs','Classified', 'Field-Tested','MP7_Abyssal Apparition');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Abyssal Apparition','MP7','SMGs','Classified', 'Well-Worn','MP7_Abyssal Apparition');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Abyssal Apparition','MP7','SMGs','Classified', 'Battle-Scarred','MP7_Abyssal Apparition');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hot Rod','MP9','SMGs','Mil-spec', 'Factory New','MP9_Hot Rod');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hot Rod','MP9','SMGs','Mil-spec', 'Minimal Wear','MP9_Hot Rod');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hot Rod','MP9','SMGs','Mil-spec', 'Field-Tested','MP9_Hot Rod');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hot Rod','MP9','SMGs','Mil-spec', 'Well-Worn','MP9_Hot Rod');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hot Rod','MP9','SMGs','Mil-spec', 'Battle-Scarred','MP9_Hot Rod');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Judgement of Anubis','PP-Bizon','SMGs','Covert', 'Factory New','PP-Bizon_Judgement of Anubis');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Judgement of Anubis','PP-Bizon','SMGs','Covert', 'Minimal Wear','PP-Bizon_Judgement of Anubis');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Judgement of Anubis','PP-Bizon','SMGs','Covert', 'Field-Tested','PP-Bizon_Judgement of Anubis');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Judgement of Anubis','PP-Bizon','SMGs','Covert', 'Well-Worn','PP-Bizon_Judgement of Anubis');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Judgement of Anubis','PP-Bizon','SMGs','Covert', 'Battle-Scarred','PP-Bizon_Judgement of Anubis');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blind Spot','P90','SMGs','Restricted', 'Factory New','P90_Blind Spot');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blind Spot','P90','SMGs','Restricted', 'Minimal Wear','P90_Blind Spot');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blind Spot','P90','SMGs','Restricted', 'Field-Tested','P90_Blind Spot');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blind Spot','P90','SMGs','Restricted', 'Well-Worn','P90_Blind Spot');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blind Spot','P90','SMGs','Restricted', 'Battle-Scarred','P90_Blind Spot');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Asiimov','P90','SMGs','Covert', 'Factory New','P90_Asiimov');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Asiimov','P90','SMGs','Covert', 'Minimal Wear','P90_Asiimov');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Asiimov','P90','SMGs','Covert', 'Field-Tested','P90_Asiimov');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Asiimov','P90','SMGs','Covert', 'Well-Worn','P90_Asiimov');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Asiimov','P90','SMGs','Covert', 'Battle-Scarred','P90_Asiimov');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Chainmail','MAG-7','Heavy','Industrial', 'Factory New','MAG-7_Chainmail');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Chainmail','MAG-7','Heavy','Industrial', 'Minimal Wear','MAG-7_Chainmail');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Chainmail','MAG-7','Heavy','Industrial', 'Field-Tested','MAG-7_Chainmail');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Chainmail','MAG-7','Heavy','Industrial', 'Well-Worn','MAG-7_Chainmail');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Chainmail','MAG-7','Heavy','Industrial', 'Battle-Scarred','MAG-7_Chainmail');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','Nova','Heavy','Classified', 'Factory New','Nova_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','Nova','Heavy','Classified', 'Minimal Wear','Nova_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','Nova','Heavy','Classified', 'Field-Tested','Nova_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','Nova','Heavy','Classified', 'Well-Worn','Nova_Hyper Beast');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Hyper Beast','Nova','Heavy','Classified', 'Battle-Scarred','Nova_Hyper Beast');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Clear Polymer','Nova','Heavy','Industrial', 'Factory New','Nova_Clear Polymer');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Clear Polymer','Nova','Heavy','Industrial', 'Minimal Wear','Nova_Clear Polymer');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Clear Polymer','Nova','Heavy','Industrial', 'Field-Tested','Nova_Clear Polymer');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Clear Polymer','Nova','Heavy','Industrial', 'Well-Worn','Nova_Clear Polymer');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Clear Polymer','Nova','Heavy','Industrial', 'Battle-Scarred','Nova_Clear Polymer');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('The Kraken','Sawed-Off','Heavy','Covert', 'Factory New','Sawed-Off_The Kraken');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('The Kraken','Sawed-Off','Heavy','Covert', 'Minimal Wear','Sawed-Off_The Kraken');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('The Kraken','Sawed-Off','Heavy','Covert', 'Field-Tested','Sawed-Off_The Kraken');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('The Kraken','Sawed-Off','Heavy','Covert', 'Well-Worn','Sawed-Off_The Kraken');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('The Kraken','Sawed-Off','Heavy','Covert', 'Battle-Scarred','Sawed-Off_The Kraken');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Leaf','XM1014','Heavy','Industrial', 'Factory New','XM1014_Banana Leaf');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Leaf','XM1014','Heavy','Industrial', 'Minimal Wear','XM1014_Banana Leaf');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Leaf','XM1014','Heavy','Industrial', 'Field-Tested','XM1014_Banana Leaf');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Leaf','XM1014','Heavy','Industrial', 'Well-Worn','XM1014_Banana Leaf');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Banana Leaf','XM1014','Heavy','Industrial', 'Battle-Scarred','XM1014_Banana Leaf');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('System Lock','M249','Heavy','Mil-spec', 'Factory New','M249_System Lock');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('System Lock','M249','Heavy','Mil-spec', 'Minimal Wear','M249_System Lock');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('System Lock','M249','Heavy','Mil-spec', 'Field-Tested','M249_System Lock');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('System Lock','M249','Heavy','Mil-spec', 'Well-Worn','M249_System Lock');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('System Lock','M249','Heavy','Mil-spec', 'Battle-Scarred','M249_System Lock');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Power Loader','Negev','Heavy','Restricted', 'Factory New','Negev_Power Loader');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Power Loader','Negev','Heavy','Restricted', 'Minimal Wear','Negev_Power Loader');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Power Loader','Negev','Heavy','Restricted', 'Field-Tested','Negev_Power Loader');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Power Loader','Negev','Heavy','Restricted', 'Well-Worn','Negev_Power Loader');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Power Loader','Negev','Heavy','Restricted', 'Battle-Scarred','Negev_Power Loader');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Autotronic','Bayonet','Knife','Covert', 'Factory New','Bayonet_Autotronic');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Autotronic','Bayonet','Knife','Covert', 'Minimal Wear','Bayonet_Autotronic');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Autotronic','Bayonet','Knife','Covert', 'Field-Tested','Bayonet_Autotronic');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Autotronic','Bayonet','Knife','Covert', 'Well-Worn','Bayonet_Autotronic');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Autotronic','Bayonet','Knife','Covert', 'Battle-Scarred','Bayonet_Autotronic');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blue Steel','Shadow Daggers','Knife','Covert', 'Factory New','Shadow Daggers_Blue Steel');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blue Steel','Shadow Daggers','Knife','Covert', 'Minimal Wear','Shadow Daggers_Blue Steel');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blue Steel','Shadow Daggers','Knife','Covert', 'Field-Tested','Shadow Daggers_Blue Steel');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blue Steel','Shadow Daggers','Knife','Covert', 'Well-Worn','Shadow Daggers_Blue Steel');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Blue Steel','Shadow Daggers','Knife','Covert', 'Battle-Scarred','Shadow Daggers_Blue Steel');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Survival Knife','Knife','Covert', 'Factory New','Survival Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Survival Knife','Knife','Covert', 'Minimal Wear','Survival Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Survival Knife','Knife','Covert', 'Field-Tested','Survival Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Survival Knife','Knife','Covert', 'Well-Worn','Survival Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Survival Knife','Knife','Covert', 'Battle-Scarred','Survival Knife_Fade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slaughter','Butterfly Knife','Knife','Covert', 'Factory New','Butterfly_Knife_Slaughter');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slaughter','Butterfly Knife','Knife','Covert', 'Minimal Wear','Butterfly_Knife_Slaughter');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slaughter','Butterfly Knife','Knife','Covert', 'Field-Tested','Butterfly_Knife_Slaughter');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slaughter','Butterfly Knife','Knife','Covert', 'Well-Worn','Butterfly_Knife_Slaughter');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Slaughter','Butterfly Knife','Knife','Covert', 'Battle-Scarred','Butterfly_Knife_Slaughter');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Butterfly Knife','Knife','Covert', 'Factory New','Butterfly_Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Butterfly Knife','Knife','Covert', 'Minimal Wear','Butterfly_Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Butterfly Knife','Knife','Covert', 'Field-Tested','Butterfly_Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Butterfly Knife','Knife','Covert', 'Well-Worn','Butterfly_Knife_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Butterfly Knife','Knife','Covert', 'Battle-Scarred','Butterfly_Knife_Fade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Butterfly Knife','Knife','Covert', 'Factory New','Butterfly_Knife_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Butterfly Knife','Knife','Covert', 'Minimal Wear','Butterfly_Knife_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Butterfly Knife','Knife','Covert', 'Field-Tested','Butterfly_Knife_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Butterfly Knife','Knife','Covert', 'Well-Worn','Butterfly_Knife_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Butterfly Knife','Knife','Covert', 'Battle-Scarred','Butterfly_Knife_Doppler');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Butterfly Knife','Knife','Covert', 'Factory New','Butterfly_Knife_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Butterfly Knife','Knife','Covert', 'Minimal Wear','Butterfly_Knife_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Butterfly Knife','Knife','Covert', 'Field-Tested','Butterfly_Knife_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Butterfly Knife','Knife','Covert', 'Well-Worn','Butterfly_Knife_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Butterfly Knife','Knife','Covert', 'Battle-Scarred','Butterfly_Knife_Marble_Fade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Karambit','Knife','Covert', 'Factory New','Karambit_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Karambit','Knife','Covert', 'Minimal Wear','Karambit_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Karambit','Knife','Covert', 'Field-Tested','Karambit_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Karambit','Knife','Covert', 'Well-Worn','Karambit_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Doppler','Karambit','Knife','Covert', 'Battle-Scarred','Karambit_Doppler');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Gamma Doppler','Karambit','Knife','Covert', 'Factory New','Karambit_Gamma_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Gamma Doppler','Karambit','Knife','Covert', 'Field-Tested','Karambit_Gamma_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Gamma Doppler','Karambit','Knife','Covert', 'Field-Tested','Karambit_Gamma_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Gamma Doppler','Karambit','Knife','Covert', 'Well-Worn','Karambit_Gamma_Doppler');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Gamma Doppler','Karambit','Knife','Covert', 'Battle-Scarred','Karambit_Gamma_Doppler');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Karambit','Knife','Covert', 'Factory New','Karambit_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Karambit','Knife','Covert', 'Minimal Wear','Karambit_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Karambit','Knife','Covert', 'Field-Tested','Karambit_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Karambit','Knife','Covert', 'Well-Worn','Karambit_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Karambit','Knife','Covert', 'Battle-Scarred','Karambit_Fade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Karambit','Knife','Covert', 'Factory New','Karambit_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Karambit','Knife','Covert', 'Minimal Wear','Karambit_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Karambit','Knife','Covert', 'Field-Tested','Karambit_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Karambit','Knife','Covert', 'Well-Worn','Karambit_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Karambit','Knife','Covert', 'Battle-Scarred','Karambit_Lore');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Bayonet','Knife','Covert', 'Factory New','Bayonet_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Bayonet','Knife','Covert', 'Minimal Wear','Bayonet_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Bayonet','Knife','Covert', 'Field-Tested','Bayonet_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Bayonet','Knife','Covert', 'Well-Worn','Bayonet_Marble_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Marble Fade','Bayonet','Knife','Covert', 'Battle-Scarred','Bayonet_Marble_Fade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Bayonet','Knife','Covert', 'Factory New','Bayonet_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Bayonet','Knife','Covert', 'Minimal Wear','Bayonet_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Bayonet','Knife','Covert', 'Field-Tested','Bayonet_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Bayonet','Knife','Covert', 'Well-Worn','Bayonet_Fade');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Fade','Bayonet','Knife','Covert', 'Battle-Scarred','Bayonet_Fade');

INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Bayonet','Knife','Covert', 'Factory New','Bayonet_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Bayonet','Knife','Covert', 'Minimal Wear','Bayonet_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Bayonet','Knife','Covert', 'Field-Tested','Bayonet_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Bayonet','Knife','Covert', 'Well-Worn','Bayonet_Lore');
INSERT INTO gameItems(skin_name, item_name, type, rarity, exterior, img) values ('Lore','Bayonet','Knife','Covert', 'Battle-Scarred','Bayonet_Lore');
