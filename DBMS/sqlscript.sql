REM   Script: 14th August #1
REM   FOREIGN KEY (Sailor, Boat and Reservation Table)

create table sailer(S_ID int primary key,S_Name varchar(50),rating int,age int);

create table boat(B_ID int primary key,B_NAME varchar(50),Colour varchar(50));

create table reservation(S_ID int,B_ID int,R_date date,foreign key(S_ID) references sailer(S_ID),foreign key(B_ID) references boat(B_ID));

insert into sailer values(29,'B',1,33);

insert into sailer values(31,'C',8,55);

insert into sailer values(22,'A',7,45);

insert into sailer values(32,'D',8,25);

insert into sailer values(58,'E',10,35);

insert into sailer values(64,'F',7,35);

insert into sailer values(71,'G',10,16);

insert into sailer values(74,'H',9,40);

insert into sailer values(85,'I',3,25);

insert into sailer values(95,'J',3,63);

select * from sailer;

select * from sailer order by S_ID;

insert into boat values(103,'cliper','green');

insert into boat values(101,'interlake','blue');

insert into boat values(102,'interlake','red');

insert into boat values(104,'marine','red');

select * from boat;

insert into reservation values(22,101,date '2022-10-10');

insert into reservation values(22,102,date '2021-10-10');

insert into reservation values(22,103,date '2014-08-15');

insert into reservation values(22,104,date '2015-07-10');

insert into reservation values(31,103,date '2008-06-11');

insert into reservation values(31,104,date '2008-12-11');

insert into reservation values(64,101,date '2010-05-09');

insert into reservation values(31,102,date '2009-10-11');

select * from boat order by B_ID;

select Colour from boat,reservation,sailer where reservation.B_ID=boat.B_ID AND sailer.S_ID=reservation.S_ID AND S_Name='C';

insert into reservation values(64,102,date '2008-08-09');

insert into reservation values(74,103,date '2009-08-09');

select * from reservation order by S_ID;

select S_Name,Age from sailer;

select * from sailer where rating>7;

select sailer.S_Name from sailer,reservation where sailer.S_ID=reservation.S_ID AND B_ID=103;

select S_ID from boat,reservation where reservation.B_ID=boat.B_ID AND Colour='red';

select Colour from boat,reservation,sailer where reservation.B_ID=boat.B_ID AND sailer.S_ID=reservation.S_ID AND S_Name='C';

select S_Name from boat,reservation,sailer where reservation.B_ID=boat.B_ID AND sailer.S_ID=reservation.S_ID AND colour='red';

