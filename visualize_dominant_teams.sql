-- Databricks notebook source
-- MAGIC %python
-- MAGIC html = """<h1 style="color:Black;text-align:center;font-family:Ariel">Report on most Dominant Formula 1 Teams </h1>"""
-- MAGIC displayHTML(html)

-- COMMAND ----------

USE presentation

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW team_dominant
as
SELECT team,
count(*) as total_races,
sum(calculated_points) as total_points,
avg(calculated_points) as average,
rank() OVER(order by avg(calculated_points) desc)as rank
FROM calculated_race_result
GROUP BY team
HAVING total_races>=50
ORDER BY average DESC

-- COMMAND ----------

SELECT race_year,team,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE team in (select team from team_dominant where rank<=5 )
GROUP BY race_year,team
ORDER BY race_year,average DESC

-- COMMAND ----------

SELECT race_year,team,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE team in (select team from team_dominant where rank<=5 )
GROUP BY race_year,team
ORDER BY race_year,average DESC

-- COMMAND ----------

SELECT race_year,team,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE team in (select team from team_dominant where rank<=5 )
GROUP BY race_year,team
ORDER BY race_year,average DESC

-- COMMAND ----------

