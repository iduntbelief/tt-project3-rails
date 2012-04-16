insert into users (username, password, first_name, last_name, department, user_type) values 
         ('jodoe', md5('joed'), 'John', 'Doe', 'ICS', 'User'),
         ('smithda', md5('smithd'), 'David', 'Smith', 'ICS', 'User'),
         ('gatesb', md5('billg'), 'Bill', 'Gates', 'ICS', 'Technician'),
         ('ahloyc', md5('thebestuser'), 'Ahloy', 'Chang', 'ICS', 'Manager'),
         ('raymonder', md5('ericr'), 'Eric', 'Raymond', 'CENT', 'Technician')
         ;

insert into tickets (created_at, assigned_at, closed_at, creator_id, subject, description, tech_notes) values 
         ('2012-03-24',null,null,1,'Internet not working.','My Internet is not working, fix it now.','Layer 8 issue, PICNIC')
         ;

insert into users_tickets (user_id, ticket_id) values 
         (3,1),
         (4,1);
