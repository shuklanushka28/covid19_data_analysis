--viewing table covid_deaths
select * 
from covid_deaths
order by 5;

-- select data that will be used
select location, date, total_cases, new_cases, total_deaths, population
from covid_deaths
order by 1,2;

--total cases vs total deaths comparision 
select location, date, total_cases, total_deaths, population
from covid_deaths
order by 1,2;

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from covid_deaths
order by 1,2;

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage_asia
from covid_deaths
where location = 'Asia'
order by 1,2;

/*comparing total polulatio and total deaths to know the % of population 
affected by covid*/

select location, date, total_cases, population, (total_cases/population)*100 as population_infected
from covid_deaths
--where location like '_s%'
order by 1,2; 

--looking at countries with highest infestion rate compared to population
select location, population, MAX(total_cases) as max_cases, max((total_cases/population))*100 as max_case_percentage
from covid_deaths 
where continent is not null
group by location,population
order by max_case_percentage  DESC nulls last;

select location,sum(new_cases),sum(new_deaths), 
(sum(new_deaths)/sum(new_cases))*100 as total_death_percentage_per_location
from covid_deaths
where continent is not null
group by location
order by location nulls last;

-- looking for countries with the hightes deaths compared to it's population
select location, population, MAX(total_deaths) as max_deaths
from covid_deaths 
where continent is not null
group by location,population
order by max_deaths  DESC nulls last;

--grouping by continent
select location, MAX(total_deaths) as max_deaths
from covid_deaths 
where continent is  null
group by location 
order by max_deaths  DESC nulls last;

--reviewing over global data 
select sum(new_cases),sum(new_deaths), 
(sum(new_deaths)/sum(new_cases))*100 as total_worldwide_death_percentage
from covid_deaths
where continent is not null
order by 1,2;


--reviewing global deaths grouped by dates
select date, sum(new_cases) as sum_new_cases, sum(new_deaths) as sum_new_deaths,
(sum(new_deaths)/sum(new_cases))*100 as worldwide_death_percentage
from covid_deaths
where continent is not null
group by date 
order by 1,2;

--viewing covid_vaccination table 
select * 
from covid_vaccinations
order by location desc nulls last;

-- total population vs people vaccinated
select a.continent, a.location, a.date, a.population, b.new_vaccinations,
sum(b.new_vaccinations) over (partition by a.location order by a.location,
a.date) as rolling_people_vaccinated
from covid_deaths as a
join covid_vaccinations as b
on  a.location = b.location
and a.date = b.date
where a.continent is not null
order by 2,3;

--use CTE 
with PopvsVac (continent,location,date, population, new_vaccinations,rolling_people_vaccinated)
as 
(
select a.continent, a.location, a.date, a.population, b.new_vaccinations,
sum(b.new_vaccinations) over (partition by a.location order by a.location,
a.date) as rolling_people_vaccinated
from covid_deaths as a
join covid_vaccinations as b
on  a.location = b.location
and a.date = b.date
where a.continent is not null
order by 2,3 
)
select *, (rolling_people_vaccinated/population)*100 as rolling_percentage
from PopvsVac;

--TEMP table
create table #percent_population_vaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
prolling_people_vaccinated numeric
)



insert into #percent_population_vaccinated
select a.continent, a.location, a.date, a.population, b.new_vaccinations,
sum(b.new_vaccinations) over (partition by a.location order by a.location,
a.date) as rolling_people_vaccinated
from covid_deaths as a
join covid_vaccinations as b
on  a.location = b.location
and a.date = b.date
where a.continent is not null
order by 2,3 
select *, (rolling_people_vaccinated/population)*100 as rolling_percentage
from #percent_population_vaccinated;
