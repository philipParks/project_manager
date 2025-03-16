-- create and drop the projects schema
DROP SCHEMA IF EXISTS projects;
CREATE SCHEMA projects;
USE projects;

-- create and drop the user table
DROP TABLE IF EXISTS user;
CREATE TABLE user (
	user_id int NOT NULL auto_increment,
  user_name varchar(50) UNIQUE NOT NULL,
  user_fname varchar(20) NOT NULL,
  user_lname varchar(20) NOT NULL,
  email varchar(30) NOT NULL,
  password varchar(20) NOT NULL,
  admin_account boolean NOT NULL DEFAULT false,
  last_modified_timestamp timestamp NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
  created_timestamp timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (user_id)
);

-- create and drop the project table
DROP TABLE IF EXISTS project;
CREATE TABLE project (
	project_id int NOT NULL auto_increment,
  project_title varchar(50) NOT NULL,
  project_manager int NOT NULL,
  last_modified_timestamp timestamp NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
  modified_by int NOT NULL,
  created_timestamp timestamp NOT NULL DEFAULT current_timestamp,
  created_by int NOT NULL,
  PRIMARY KEY (project_id),
  FOREIGN KEY (project_manager) REFERENCES user(user_id),
  FOREIGN KEY (created_by) REFERENCES user(user_id),
  FOREIGN KEY (modified_by) REFERENCES user(user_id)
);

-- create and drop the task table
DROP TABLE IF EXISTS task;
CREATE TABLE task (
	task_id int NOT NULL auto_increment,
  project_id int NOT NULL,
  task_title varchar(50) NOT NULL,
  owner_id int NOT NULL,
  status varchar(20) NOT NULL,
  department varchar(20) NOT NULL,
  deliverable varchar(50) NOT NULL,
  created_timestamp timestamp NOT NULL DEFAULT current_timestamp,
  created_by int NOT NULL,
  start_date timestamp NOT NULL DEFAULT current_timestamp,
  end_date timestamp NOT NULL,
  last_modified_timestamp timestamp NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
  modified_by int NOT NULL,
  PRIMARY KEY (task_id),
  FOREIGN KEY (project_id) REFERENCES project(project_id),
  FOREIGN KEY (owner_id) REFERENCES user(user_id),
  FOREIGN KEY (created_by) REFERENCES user(user_id),
  FOREIGN KEY (modified_by) REFERENCES user(user_id)
);