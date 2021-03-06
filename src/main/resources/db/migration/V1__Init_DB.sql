create sequence hibernate_sequence start 1 increment 1;

create table about_items (
    id int8 not null,
    description varchar(255) not null,
    icon_link varchar(255) not null,
    title varchar(255) not null,
    primary key (id)
);

create table appeals (
    id int8 generated by default as identity,
    appeal_category varchar(255) not null,
    appeal_status varchar(255) not null,
    creation_date timestamp not null,
    recipient varchar(255) not null,
    title varchar(255) not null,
    author_id int8,
    primary key (id)
);

create table contact_item (
    id int8 not null,
    address varchar(255),
    category varchar(255) not null,
    email varchar(255) not null,
    name varchar(255) not null,
    phone_number_1 varchar(255) not null,
    phone_number_2 varchar(255),
    position varchar(255) not null,
    primary key (id)
);

create table messages (
    id int8 generated by default as identity,
    creation_date timestamp,
    text varchar(255),
    author_id int8,
    primary key (id)
);

create table messages_communication (
    appeal_id int8 not null,
    message_id int8 not null
);

create table news_items (
    id int8 not null,
    creation_date timestamp not null,
    description varchar(255) not null,
    photo_link varchar(255) not null,
    title varchar(255) not null,
    primary key (id)
);

create table qa_items (
    id int8 not null,
    answer varchar(255) not null,
    question varchar(255) not null,
    primary key (id)
);

create table rooms (
    id int8 generated by default as identity,
    available_places int4,
    dorm varchar(255),
    gender varchar(255),
    places int4,
    room_number int4,
    stage int4,
    primary key (id)
);

create table slider_items (
    id int8 not null,
    description varchar(255) not null,
    photo_link varchar(255) not null,
    title varchar(255) not null,
    primary key (id)
);

create table users (
    id int8 generated by default as identity,
    balance float8,
    email varchar(255) not null,
    first_name varchar(255) not null,
    gender varchar(255) not null,
    group_name varchar(255),
    institute varchar(255),
    password varchar(64) not null,
    position varchar(255) not null,
    role varchar(255) not null,
    second_name varchar(255) not null,
    status varchar(255) not null,
    tariff varchar(255),
    userpic varchar(255),
    room_id int8,
    primary key (id)
);

alter table if exists messages_communication add constraint message_communication_fk unique (message_id);

alter table if exists appeals add constraint appeals_fk foreign key (author_id) references users;

alter table if exists messages add constraint messages_fk foreign key (author_id) references users;

alter table if exists messages_communication add constraint messages_communication_fk foreign key (message_id) references messages;

alter table if exists messages_communication add constraint messages_communication_fk foreign key (appeal_id) references appeals;

alter table if exists users add constraint users_fk foreign key (room_id) references rooms;