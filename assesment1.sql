create table suppliers(
sid integer,
sname varchar(100) not null,
address varchar(100) not null,
primary key (sid)
);

create table catalog(
sid integer,
pid varchar(10), 
cost integer not null,
foreign key (sid) references suppliers(sid),
primary key(sid, pid)
);

select sname
from suppliers
where sid in (select distict sid from catalog);

select sname from suppliers
where not exists (
(select distinct pid from catalog)
minus
(select pid from catalog where suppliers.id=catalog.id)
); 