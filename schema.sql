DROP DATABASE IF EXISTS Bugme;
CREATE DATABASE BugMe;

/* Setting a Default database access user */
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON BugMe.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

USE BugMe;


DROP TABLE IF EXISTS `Issue`;

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
	`userID` int NOT NULL AUTO_INCREMENT,
	`firstname` varchar(255) NOT NULL,
	`lastname` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL UNIQUE,
	`date_joined` DATETIME NOT NULL,
	PRIMARY KEY (`userID`)
);



CREATE TABLE `Issue` (
	`issueID` int NOT NULL AUTO_INCREMENT,
	`title` varchar(255),
	`description` TEXT(255),
	`issueType` varchar(255),
	`priority` varchar(255),
	`status` varchar(255),
	`assigned_to` int NOT NULL,
	`created_by` int NOT NULL,
	`created` DATETIME NOT NULL,
	`updated` DATETIME NOT NULL,
	PRIMARY KEY (`issueID`)
);

/* Initialize Admin Credentials (Password hashed using MD5) Password = 'password'*/
INSERT INTO User(firstname,lastname, password, email, date_joined) values('Admin', ' ', 'afc285bebb3dd733796cb06db01cd59a', 'admin@project2.com', '2020-12-01');

/* Dummy User Data */
INSERT INTO
	User(firstname,lastname, password, email, date_joined) 
VALUES
	('Tom', 'Brady', 'afc285bebb3dd733796cb06db01cd59a', 'tom@project2.com', '2020-12-01'),
	('Jan', 'Brady', 'afc285bebb3dd733796cb06db01cd59a', 'jan@project2.com', '2020-12-01'),
	('Marsha', 'Brady', 'afc285bebb3dd733796cb06db01cd59a', 'marsha@project2.com', '2020-12-01'),
	('Mike', 'Brady', 'afc285bebb3dd733796cb06db01cd59a', 'mike@project2.com', '2020-12-01'),
	('Marcia', 'Brady', 'afc285bebb3dd733796cb06db01cd59a', 'marcia@project2.com', '2020-12-01');

/* Dummy Issue Data */
INSERT INTO 
	Issue(title,description,issueType,priority,status,assigned_to,created_by,created,updated) 
VALUES
	('XSS Vulnerability in Add User Form','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut lectus arcu bibendum at. Nulla at volutpat diam ut venenatis tellus in metus. Mi sit amet mauris commodo quis imperdiet massa tincidunt. Diam donec adipiscing tristique risus nec feugiat in fermentum. Sit amet nisl purus in mollis nunc sed. Porta non pulvinar neque laoreet suspendisse. Amet aliquam userID diam maecenas ultricies. Mauris pellentesque pulvinar pellentesque habitant morbi tristique. Viverra tellus in hac habitasse. Aliquet sagittis userID consectetur purus ut.','Bug','MAJOR','OPEN',(SELECT userID FROM User WHERE email="admin@project2.com"),(SELECT userID FROM User WHERE email="tom@project2.com"),'2019-11-01','2019-11-01'),
	("Location Service isn't working",'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut lectus arcu bibendum at. Nulla at volutpat diam ut venenatis tellus in metus. Mi sit amet mauris commodo quis imperdiet massa tincidunt. Diam donec adipiscing tristique risus nec feugiat in fermentum. Sit amet nisl purus in mollis nunc sed. Porta non pulvinar neque laoreet suspendisse. Amet aliquam userID diam maecenas ultricies. Mauris pellentesque pulvinar pellentesque habitant morbi tristique. Viverra tellus in hac habitasse. Aliquet sagittis userID consectetur purus ut.','Bug','MAJOR','OPEN',(SELECT userID FROM User WHERE email="admin@project2.com"),(SELECT userID FROM User WHERE email="jan@project2.com"),'2019-10-15','2019-11-01'),
	('Setup Logger','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut lectus arcu bibendum at. Nulla at volutpat diam ut venenatis tellus in metus. Mi sit amet mauris commodo quis imperdiet massa tincidunt. Diam donec adipiscing tristique risus nec feugiat in fermentum. Sit amet nisl purus in mollis nunc sed. Porta non pulvinar neque laoreet suspendisse. Amet aliquam userID diam maecenas ultricies. Mauris pellentesque pulvinar pellentesque habitant morbi tristique. Viverra tellus in hac habitasse. Aliquet sagittis userID consectetur purus ut.','Proposal','MAJOR','CLOSED',(SELECT userID FROM User WHERE email="admin@project2.com"),(SELECT userID FROM User WHERE email="marsha@project2.com"),'2019-08-10','2019-11-01'),
	('Create API Documentation','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut lectus arcu bibendum at. Nulla at volutpat diam ut venenatis tellus in metus. Mi sit amet mauris commodo quis imperdiet massa tincidunt. Diam donec adipiscing tristique risus nec feugiat in fermentum. Sit amet nisl purus in mollis nunc sed. Porta non pulvinar neque laoreet suspendisse. Amet aliquam userID diam maecenas ultricies. Mauris pellentesque pulvinar pellentesque habitant morbi tristique. Viverra tellus in hac habitasse. Aliquet sagittis userID consectetur purus ut.','Proposal','MAJOR','IN PROGRESS',(SELECT userID FROM User WHERE email="admin@project2.com"),(SELECT userID FROM User WHERE email="mike@project2.com"),'2019-10-29','2019-11-01'),
	('Allow results to be sorted','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut lectus arcu bibendum at. Nulla at volutpat diam ut venenatis tellus in metus. Mi sit amet mauris commodo quis imperdiet massa tincidunt. Diam donec adipiscing tristique risus nec feugiat in fermentum. Sit amet nisl purus in mollis nunc sed. Porta non pulvinar neque laoreet suspendisse. Amet aliquam userID diam maecenas ultricies. Mauris pellentesque pulvinar pellentesque habitant morbi tristique. Viverra tellus in hac habitasse. Aliquet sagittis userID consectetur purus ut.','Proposal','MAJOR','IN PROGRESS',(SELECT userID FROM User WHERE email="admin@project2.com"),(SELECT userID FROM User WHERE email="marcia@project2.com"),'2019-10-20','2019-11-01');

/* Foreign keys creation for Created_By and Assigned_To to be referenced in the User table */
ALTER TABLE `Issue` ADD CONSTRAINT `Issue_fk0` FOREIGN KEY (`assigned_to`) REFERENCES `User`(`userID`);

ALTER TABLE `Issue` ADD CONSTRAINT `Issue_fk1` FOREIGN KEY (`created_by`) REFERENCES `User`(`userID`);



