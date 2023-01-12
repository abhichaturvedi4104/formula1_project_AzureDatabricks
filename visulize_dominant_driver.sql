-- Databricks notebook source
-- MAGIC %python
-- MAGIC html = """<h1 style="color:Black;text-align:center;font-family:Ariel">Report on Dominant Formula 1 Drivers </h1>"""
-- MAGIC displayHTML(html)

-- COMMAND ----------

USE presentation

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW driver_rank
as
SELECT driver_name,count(*) as total_races,
sum(calculated_points) as total_points,
avg(calculated_points) as average,
rank() OVER(order by avg(calculated_points) desc)as rank
FROM calculated_race_result
GROUP BY driver_name
HAVING total_races>=50
ORDER BY average DESC

-- COMMAND ----------

SELECT race_year,driver_name,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE driver_name in (select driver_name from driver_rank where rank<=10 )
GROUP BY race_year,driver_name
ORDER BY race_year,average DESC

-- COMMAND ----------

SELECT race_year,driver_name,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE driver_name in (select driver_name from driver_rank where rank<=10 )
GROUP BY race_year,driver_name
ORDER BY race_year,average DESC

-- COMMAND ----------

SELECT race_year,driver_name,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE driver_name in (select driver_name from driver_rank where rank<=10 )
GROUP BY race_year,driver_name
ORDER BY race_year,average DESC

-- COMMAND ----------

