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
       u_id                 varchar(20) not null unique, #id
       u_password           varchar(20) , # pw
       u_name               varchar(10) , # 이름
       u_email              varchar(30) , # 이메일
       u_phone              varchar(20) , #전화번호
       u_age                int , # 나이
       u_date               datetime , # 회원가입일
       u_sex                varchar(3) , #성별 남성/여성
       u_reviews            int , #리뷰쓴갯수
       u_collections        int , # 콜렉션갯수
       u_liked_collections  int , # 좋아요누른 콜렉션 갯수
       u_tickets            int, # 예매갯수
       u_admin              varchar(3) , # 관리자여부
PRIMARY KEY (u_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ticket(
       t_idx                int NOT NULL auto_increment, #티켓번호
       u_id                varchar(20) NOT NULL, #유저아이디
       m_idx                int , #영화코드(API)
       t_date               datetime , #예매시간
       theater_idx          int , # 영화관코드
       seat_idx             int, # 좌석코드
PRIMARY KEY (t_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE seat (
       seat_idx             int NOT NULL, #좌석코드
       t_idx                int , #티켓번호
       theater_idx          int , # 영화관번호
PRIMARY KEY (seat_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE collection(
       col_idx              int NOT NULL auto_increment, #콜렉션 코드
       u_id                varchar(20), # 유저명
       col_title            varchar(25) , #콜렉션이름
       col_memo             varchar(100) , #콜렉션설명
       col_movie1_idx       int , #콜렉션에 담을 영화는 10개까지
       col_movie2_idx       int ,
       col_movie3_idx       int ,
       col_movie4_idx       int ,
       col_movie5_idx       int ,
       col_movie6_idx       int ,
       col_movie7_idx       int ,
       col_movie8_idx       int ,
       col_movie9_idx       int ,
       col_movie10_idx      int ,
       col_likes INT NULL,
PRIMARY KEY (col_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE theater (
       theater_idx          int NOT NULL, # 영화관코드
       theater_location     varchar(50) , # 영화관주소
       theater_seats        int , # 좌석수
PRIMARY KEY (theater_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE schedule ( #상영일자
       s_idx                int NOT NULL,  
       s_date               datetime , #상영일자
       m_idx                int , #영화코드
       theater_idx          int , #영화관코드
PRIMARY KEY (s_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE review (
       r_idx                int NOT NULL auto_increment, #리뷰코드
       u_id                varchar(20) not NULL, # 유저아이디
       m_idx              int , # 영화코드
       r_star               int not NULL, # 리뷰별 수
       r_date              datetime not NULL, #리뷰등록일
       r_likes              int , # 좋아요갯수
       r_hits               int , # 조회수
       r_comments      INT NULL DEFAULT NULL , # 댓글수
       r_memo VARCHAR(300) NULL , #리뷰내용
       r_spoiler VARCHAR(3) NULL, #스포일러
PRIMARY KEY (r_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE comment (
       c_idx                int NOT NULL auto_increment, #코맨트번호
       u_id                varchar(20) , # 유저아이디
       r_idx                int , # 리뷰코드
       c_memo               varchar(150) not NULL, # 댓글내용
 PRIMARY KEY (c_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE reviewlike (
  r_idx INT NULL,
  u_id VARCHAR(20) NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table collectionlike(
 col_idx int null,
 u_id varchar(20) null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


