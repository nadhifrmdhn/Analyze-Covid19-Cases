SELECT country, province_state, SUM(confirmed_day) AS total_confirmed
FROM Covid19.confirmed_covid2
WHERE country = "Indonesia"
GROUP BY country, province_state;

SELECT 
	*, 
	SUM(confirmed_day) OVER(
	PARTITION BY country, province_state
	ORDER BY date
	) AS running_total
FROM Covid19.confirmed_covid2
WHERE country = "Indonesia";

SELECT country, province_state, SUM(deaths_day)
FROM Covid19.deaths_covid2
GROUP BY country, province_state;

SELECT country, province_state, SUM(confirmed_day) AS "total_confirmed"
FROM Covid19.confirmed_covid2
GROUP BY country, province_state WITH ROLLUP;

SELECT
  *,
  LAG(confirmed_day) OVER(
    PARTITION BY country, province_state
    ORDER BY date)
  AS running_total
FROM Covid19.confirmed_covid2;

SELECT
  *,
  LAG(confirmed_day) OVER(
    PARTITION BY country, province_state
    ORDER BY date)
  AS confirmed_previous_day
FROM Covid19.confirmed_covid2;
