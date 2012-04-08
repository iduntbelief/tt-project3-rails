insert into users (username, password, first_name, last_name, department, user_type) values 
         ('doeja', md5('janed'), 'Jane', 'Doe', 'Math', 'User'),
         ('doejo', md5('joed'), 'John', 'Doe', 'English', 'User'),
         ('smithda', md5('smithd'), 'David', 'Smith', 'English', 'User'),
         ('gatesbi', md5('billg'), 'Bill', 'Gates', 'ICS', 'Executive'),
         ('perensbr', md5('gatesb'), 'Bill', 'Gates', 'ICS', 'Manager'),
         ('laforero', md5('robl'), 'Robert', 'LaFore', 'EE', 'Manager'),
         ('raymonder', md5('ericr'), 'Eric', 'Raymond', 'CENT', 'Executive');

insert into tickets (created_at, assigned_at, closed_at, creator_id, subject, description, tech_notes) values 
         ('2012-03-24',null,null,1,'Internet not working.','My Internet is not working, fix it now.','Layer 8 issue, PICNIC');

insert into users_tickets (user_id, ticket_id) values 
         (5,1),
         (6,1);
