

psql -h localhost -p 5432 -U postgres;

```
create database chinook;
create user chi with password 'chi123';
grant all privileges on database "chinook" to chi;
```


psql -h localhost -p 5432 -U chi

