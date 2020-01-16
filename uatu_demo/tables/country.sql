
CREATE TABLE country (
	code CHAR(3) NOT NULL, 
	name TEXT NOT NULL, 
	continent TEXT NOT NULL, 
	region TEXT NOT NULL, 
	surface_area REAL NOT NULL, 
	indep_year SMALLINT, 
	population INTEGER NOT NULL, 
	life_expectancy REAL, 
	gnp NUMERIC(10, 2), 
	gnp_old NUMERIC(10, 2), 
	local_name TEXT NOT NULL, 
	government_form TEXT NOT NULL, 
	head_of_state TEXT, 
	capital INTEGER, 
	code2 CHAR(2) NOT NULL, 
	CONSTRAINT country_continent_check CHECK ((continent = 'Asia'::text) OR (continent = 'Europe'::text) OR (continent = 'North America'::text) OR (continent = 'Africa'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'South America'::text))
)

;

