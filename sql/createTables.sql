drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;
drop sequence if exists ticket_id_seq cascade;
create sequence ticket_id_seq;

drop table if exists users cascade;
create table users(
  id integer not null default nextval('user_id_seq'),
  username varchar(10),
  password text,
  first_name varchar(40),
  last_name varchar(40),
  department varchar(15),
  user_type varchar(20),
  primary key(id)
);

drop table if exists tickets cascade;
create table tickets(
  id integer not null default nextval('ticket_id_seq'),
  created_at timestamp,
  assigned_at timestamp,
  closed_at timestamp,
  creator_id integer references users(id),
  subject varchar(30),
  description text,
  tech_notes text,
  primary key(id)
);

--table showing user IDs assigned to tickets by ID
drop table if exists users_tickets cascade;
create table users_tickets(
  user_id integer references users(id),
  ticket_id integer references tickets(id),
  unique(user_id,ticket_id)
);

-- view showing ticket information
drop view if exists show_tickets cascade;
create view show_tickets as 
  select tickets.id as t_id, tickets.creator_id, users.first_name , users.last_name, 
  users.department, users.user_type, tickets.created_at, tickets.assigned_at, 
  tickets.closed_at, tickets.subject, tickets.description, tickets.tech_notes 
  from users inner join tickets on users.id=tickets.creator_id
;

-- view showing ticket assignments
/* drop view if exists show_assignments cascade;
create view show_assignments as
  select user
*/
