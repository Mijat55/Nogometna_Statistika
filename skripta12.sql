#c:\xampp\mysql\bin\mysql -uroot<C:\Users\Marko\Downloads\edu27\skripta12.sql
drop database if exists nogometnastatistika;
create database nogometnastatistika;
use nogometnastatistika;

create table Klub(
    klub_sifra int not null primary key auto_increment,
    naziv varchar(20) not null

);

create table Utakmica(
    sifra int not null primary key auto_increment,
    domaci_klub_sifra int not null,
    gosti_klub_sifra int not null,
    vrijeme_pocetka datetime not null,
    maksimalan_broj_navijaca decimal(18,2),
    stadion varchar(30)
    
   
);

create table Igrac(
    sifra int not null primary key auto_increment,
    ime varchar(10) not null,
    prezime varchar (15) not null,
    datum_rodjenja datetime,
    oib varchar(11),
    trenutna_vrijednost decimal(18,2),
    pozicija varchar(20),
    klub int not null
);

create table Dogadjaj(
    sifra int not null primary key auto_increment,
    minuta int not null,
    igrac int not null,
    utakmica int not null,
    vrsta int not null
);

create table Vrsta(
    sifra int not null primary key auto_increment,
    naziv varchar(30) not null,
    gol boolean
   

);

alter table utakmica add foreign key (domaci_klub_sifra) references klub(klub_sifra);
alter table utakmica add foreign key (gosti_klub_sifra) references klub(klub_sifra);
alter table igrac add foreign key (klub) references klub(klub_sifra);
alter table dogadjaj add foreign key (igrac) references igrac(sifra);
alter table dogadjaj add foreign key (utakmica) references utakmica(sifra);
alter table dogadjaj add foreign key (vrsta) references vrsta(sifra);