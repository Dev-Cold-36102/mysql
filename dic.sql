create database dictionary;
use dictionary;
create table dic (
idWord int unique,
pronounce varchar(20) not null,
type varchar(20),
mean varchar(50),
constraint id_pk primary key(idWord)
);
drop table dic;
insert into dic values (1,"/fdgdfg/","noun","sfgdhkgugyugyusfg");
insert into dic values (2,"/dgdf/","verb","khai");
select * from dic;
alter table dic
drop column type; 

create table book(
pageBook int  unique,
check (pageBook between 0 and 300)
);
insert into book values ( 44);
insert into book values ( 300);


create table word(
idWord int unique,
pageBook int  unique,
constraint idWord_fk foreign key( idWord) references dic(idWord),
constraint pageBook_fk foreign key(pageBook) references book(pageBook),
constraint word_pk  primary key( idWord,pageBook)
);
drop table word;
select * from word;
insert into word values (1,44);
 
update  book set pageBook = 1 where pageBook =44;
update word set idWord=2 where idWord=1;
select idWord
from word;
select *  
from dic left join word 
on dic.idWord =word.idWord;
alter table dic
change  Mean mean varchar(100);

