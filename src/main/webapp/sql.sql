set FOREIGN_KEY_CHECKS = 0;
drop table member;
drop table cinema;
drop table collection;
drop table comment;
drop table movie;
drop table ott;
drop table review;
drop table schedule;
drop table seat;
drop table ticket;
 set FOREIGN_KEY_CHECKS = 1;

CREATE TABLE member(
       u_idx                int NOT NULL auto_increment,
       u_id                 varchar(20) ,
       u_password           varchar(20) ,
       u_name               varchar(10) ,
       u_email              varchar(30) ,
       u_phone              varchar(20) ,
       u_age                int ,
       u_date               datetime ,
       u_sex                varchar(3) ,
       u_reviews            int ,
       u_collections        int ,
       u_liked_collections  int ,
       u_tickets            int,
       u_admin              varchar(3) ,
PRIMARY KEY (u_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ticket(
       t_idx                int NOT NULL auto_increment,
       u_idx                int NOT NULL,
       m_idx                int ,
       t_date               datetime ,
       theater_idx          int ,
       seat_idx             int,
PRIMARY KEY (t_idx),
FOREIGN KEY (u_idx) REFERENCES member (u_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE seat (
       seat_idx             int NOT NULL,
       t_idx                int ,
       theater_idx          int ,
PRIMARY KEY (seat_idx),
FOREIGN KEY (t_idx) REFERENCES ticket (t_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE collection(
       col_idx              int NOT NULL auto_increment,
       u_idx                int ,
       col_title            varchar(25) ,
       col_memo             varchar(100) ,
       col_movie1_idx       int ,
       col_movie2_idx       int ,
       col_movie3_idx       int ,
       col_movie4_idx       int ,
       col_movie5_idx       int ,
       col_movie6_idx       int ,
       col_movie7_idx       int ,
       col_movie8_idx       int ,
       col_movie9_idx       int ,
       col_movie10_idx      int ,
PRIMARY KEY (col_idx),
FOREIGN KEY (u_idx) REFERENCES member (u_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE cinema (
       theater_idx          int NOT NULL,
       theater_location     varchar(50) ,
       theater_seats        int ,
PRIMARY KEY (theater_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE schedule (
       s_idx                int NOT NULL,
       s_date               datetime ,
       m_idx                int ,
       theater_idx          int ,
PRIMARY KEY (s_idx),
FOREIGN KEY (theater_idx) REFERENCES cinema (theater_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ott (
       o_idx                int NOT NULL,
       ott1                 varchar(10) ,
       ott2                 varchar(10) ,
       ott3                 varchar(10) ,
       ott4                 varchar(10) ,
       ott5                 varchar(10) ,
       ott6                 varchar(10) ,
       ott7                 varchar(10) ,
       ott1_url             varchar(200) ,
       ott2_url             varchar(200) ,
       ott3_url             varchar(200) ,
       ott4_url             varchar(200) ,
       ott5_url             varchar(200) ,
 PRIMARY KEY (o_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE review (
       r_idx                int NOT NULL auto_increment,
       u_idx                int not NULL,
       m_title              varchar(30) ,
       m_date               datetime not NULL,
       r_star               int not NULL,
       r_date               datetime not NULL,
       r_likes              int ,
       r_hits               int ,
       r_comments           varchar(300) ,
PRIMARY KEY (r_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE comment (
       c_idx                int NOT NULL auto_increment,
       u_idx                int ,
       r_idx                int ,
       c_memo               varchar(150) not NULL,
 PRIMARY KEY (c_idx),
FOREIGN KEY (r_idx) REFERENCES review (r_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE movie (
       m_idx                int NOT NULL,
       m_title              varchar(30) ,
       m_date               datetime ,
       m_director           varchar(10) ,
       m_actor1             varchar(10) ,
       m_actor2             varchar(10) ,
       m_actor3             varchar(10) ,
       m_actor4             varchar(10) ,
       m_actor5             varchar(10) ,
       m_actor6             varchar(10) ,
       m_actor7             varchar(10) ,
       m_actor8             varchar(10) ,
       o_idx                int NOT NULL,
       s_idx                int ,
       m_story              varchar(100) ,
PRIMARY KEY (m_idx),
FOREIGN KEY (s_idx) REFERENCES schedule (s_idx),
FOREIGN KEY (o_idx) REFERENCES ott (o_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


select * from member;

ALTER TABLE `movieingwalk`.`review` 
CHANGE COLUMN `m_title` `m_idx` VARCHAR(30) NULL DEFAULT NULL ;

ALTER TABLE `movieingwalk`.`ott` 
CHANGE COLUMN `o_idx` `m_idx` INT NOT NULL ;

ALTER TABLE `movieingwalk`.`review` 
DROP COLUMN `m_date`;

ALTER TABLE `movieingwalk`.`review` 
ADD COLUMN `r_memo` VARCHAR(300) NULL AFTER `r_comments`,
CHANGE COLUMN `r_comments` `r_comments` INT NULL DEFAULT NULL ;

alter table member change column u_id  u_id varchar(20) not null unique;

update member set u_admin='Y' where u_idx=1;
update member set u_admin='N' where u_idx=2;









