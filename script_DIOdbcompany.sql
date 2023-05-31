-- Informações dos indices por tabela
SHOW INDEX FROM departament FROM dbcompany;
SHOW INDEX FROM dependent FROM dbcompany;
SHOW INDEX FROM dept_locations FROM dbcompany;
SHOW INDEX FROM employee FROM dbcompany;
SHOW INDEX FROM project FROM dbcompany;

SELECT DISTINCT TABLE_NAME, INDEX_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'dbcompany'
ORDER BY TABLE_NAME, INDEX_NAME;

-- Qual o departamento com maior número de pessoas?
SELECT e.Dno, d.Dname, count(*) As NPessoas
FROM employee e
INNER JOIN departament d ON d.Dnumber = e.Dno
GROUP BY e.Dno, d.Dname
ORDER BY NPessoas DESC; 

-- Quais são os departamentos por cidade?
SELECT d.Dnumber, d.Dname, l.Dlocation
FROM departament d
INNER JOIN dept_locations l ON l.Dnumber = d.Dnumber
ORDER BY Dname, Dlocation;

-- Relação de empregados por departamento
SELECT e.Ssn, e.Fname, e.Lname, e.Address, e.Dno, d.Dname
FROM employee e
INNER JOIN departament d ON d.Dnumber = e.Dno
ORDER BY e.Fname, e.Lname;

/*
  Indices 
  Uma boa prática é criar indice no campo com relações
  Neste caso pode ser um indice BTREE porque existe cardinalidade no campo
*/  
CREATE INDEX idx_employee_Dno ON employee(Dno);