-- Databricks notebook source
USE presentation

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ######All time most dominant team

-- COMMAND ----------

SELECT team,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
GROUP BY team
HAVING total_races>=50
ORDER BY average DESC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ######Last 10 years most dominant team

-- COMMAND ----------

SELECT team,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE race_year BETWEEN 2001 AND 2010
GROUP BY team
HAVING total_races>=50
ORDER BY average DESC

-- COMMAND ----------

