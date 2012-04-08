/*createDatabase.sql
**
*/

-- Drop and create database.
drop database if exists ttaker;;
create database ttaker;

-- Drop and create user.
drop user if exists ttuser;
create user ttuser with encrypted password 'password';

-- Grant priviledges to user
alter database ttaker owner to ttuser;
