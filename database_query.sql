use Dallas;

# 1. checking the data and number of cases
select * from incidents;
select count(*) from incidents;
# --> 219 cases

select * from officers;
select count(*) from officers;
select count(distinct case_number) from officers;
# --> 370 officers involved, at least one officer per case
# checking if officers appear more than once (unfortunately no id to uniquely
# identify an officer, only first and last name (full name)
select full_name, count(case_number) as number_cases from officers
group by full_name
order by number_cases desc;
# --> 2 officers where involved 3 times, a few officers 2 times but vast majority only once.

select * from subjects;
select count(*) from subjects;
select count(distinct case_number) from subjects;
# --> 223 subjects involved, but only 216 cases 
# --> 3 cases seem to have no or an unknown subject
# again checking for multiple entries of subject by name
select full_name, count(case_number) as number_cases from subjects
group by full_name
order by number_cases desc;
# --> each subject appears only once, there are 16 'Unknown' subjects
# --> checking if data for race and gender is available for unknown subjects
select * from subjects
where full_name = 'Unknown';

# Checking the possible outcome of shootings
select distinct subject_statuses, count(case_number) as number from incidents
group by subject_statuses
order by number desc;
# --> 3 cases 'Others' might be the ones that have no subject?
# --> 3 cases with more than one status, multiple subjects only in 3 cases?

# Checking 3 status 'Other' entries
select * from incidents
where subject_statuses = 'Other';
# --> only one of the three cases has an unknown subject. Checking the summaries
# --> first case is a 'shoot and miss' but the subject seems to be unknown but is defined as B/M
# --> second case the subject shot and injured an officer than shot himself, no officer fired a weapon
# --> third case the subject shot and injured two officers, no officer fired a gun
 
# Checking how often there are multiple subjects involved
select subject_count, count(case_number)
from incidents
group by subject_count;
# --> there are 6 cases with more than 1 subject, but above there were only three cases with multiple status
# checking outcome of 2 + 3 subject count
select * from incidents
where subject_count > 1;

# For model building, only using 210 cases with one subject, 3 cases without subject and 6 cases
# with more than one subject will be excluded, also the 2 cases where no officer fired a weapon will
# be excluded, leaving 208 cases for the model.

# checking also the officer_count
select officer_count, count(case_number)
from incidents
group by officer_count;
# --> there a several cases with more than one officer involved, race and gender of officer
# could only be taken into model for the 151 cases of 1 involved officer, instead keeping
# 208 cases and taking number of officers involved into the equation.

# creating one table view to export, joining race and gender of subject to incidents table,
# for the 208 cases

select i.case_number, i.date, i.location, i.subject_statuses, i.subject_weapon,
i.subject_count, s.race as subject_race, s.gender as subject_gender, i.officer_count, i.latitude, i.longitude
from incidents as i
join subjects as s
on i.case_number = s.case_number
where i.subject_count = 1 and i.subject_statuses <> 'Other';







 