use mydb;
select questionId
from category NATURAL JOIN question
where categoryName = "Administração"