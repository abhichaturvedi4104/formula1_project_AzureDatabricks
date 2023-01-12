-- Databricks notebook source
USE presentation

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ######All time most dominant driver

-- COMMAND ----------

SELECT driver_name,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
GROUP BY driver_name
HAVING total_races>=50
ORDER BY average DESC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ######Last 10 years most dominant driver

-- COMMAND ----------

SELECT driver_name,count(*) as total_races,sum(calculated_points) as total_points,avg(calculated_points) as average
FROM calculated_race_result
WHERE race_year BETWEEN 2011 and 2020
GROUP BY driver_name
HAVING total_races>=50
ORDER BY average DESC

-- COMMAND ----------

