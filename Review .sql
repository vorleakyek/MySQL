
-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT * FROM CITY WHERE COUNTRYCODE = "USA" AND POPULATION > 100000; 

-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME 
  FROM CITY
  WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

-- Query all columns (attributes) for every row in the CITY table.
SELECT * FROM CITY;

-- You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
--   Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

-- Root: If node is root node.
-- Leaf: If node is leaf node.
-- Inner: If node is neither root nor leaf node.
WITH ParentNodes AS (
    SELECT DISTINCT P
    FROM BST
    WHERE P IS NOT NULL
)

SELECT 
    N,
    CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN N NOT IN (SELECT P FROM ParentNodes) THEN 'Leaf'
        ELSE 'Inner'
    END AS NodeType
FROM BST
ORDER BY N;
