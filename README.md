# README

## Run for development
1. `bundle install`
2. `bin/rails db:migrate`
3. `bin/rails db:seed`
4. `bin/rails server`

Then the api can be accessed in http://localhost:3000/

## Usage
- Search school name or description:
```
GET /projects/KEYWORD
```
- Filter by exact date/amount:
```
GET /projects/KEYWORD?filter=value
```
- Filter by exact date/amount range:
```
GET /projects/KEYWORD?filter_min=value
GET /projects/KEYWORD?filter_max=value
GET /projects/KEYWORD?filter_min=value1&filter_max=value2
```
where following filters are supported:
```
actual_start_date
actual_end_date
planned_end_date
budget
final_estimate
total_spending
```
And each of these filter can be suffixed by `_min` and `_max` to 
do (inclusive) range search. If both `filter` and `filter_min/max` 
are given, `filter_min/max` will be ignored.

## Run tests
1. `bin/rails db:migrate RAILS_ENV=TEST`
2. `bin/rails db:seed RAILS_ENV=test`
3. `bin/rails test`

## Run in production

This:
`  database: file:db/production.sqlite3?mode=memory&cache=shared`
while it's said in https://www.sqlite.org/inmemorydb.html
works, rails can't recognize it in `database.yml` and will create a file
named production.sqlite3?mode=memory&cache=shared
A work around I can think of is when deploy this rails app,
mount the db file in a mem filesystem.

Besides, other RDBMS has options to run in memory, but I feel they are 
too heavy in this small service.
