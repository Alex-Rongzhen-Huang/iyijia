#!/bin/bash
dropdb -p 5432 -U postgres iyijia_development
createdb -p 5432 -U postgres iyijia_development
pg_restore -i -h localhost -p 5432 -U postgres -d iyijia_development -v %1
