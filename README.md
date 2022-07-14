# Pewlett-Hackard-Analysis
## Analysis Goal
The goal of this anaylsis was to generate as list of employees that are eligible for retirement, and are likely to reitre within the next few years. This will help the company get a clear picture on how may new hires they may need to acquire. By including information as to the potenital retiree's position and departmrnt, the HR depeartment will be better prepared for their applicant search.
## Results
![titles_retiring](https://user-images.githubusercontent.com/102263341/178897223-4820a758-712d-4662-aca1-db22ca7bf2db.png)

- From deliverable 1. As you can see from this image, a lot of the retirees carry a senior title. This is of concern to the company as these positions may be harder to fill than more entry-level positions. It may behoove the company to begin to look for internal employees that may qualify for a promotion into these positions.

![managers_of_what_dept](https://user-images.githubusercontent.com/102263341/178898626-7eaa13b4-c847-4845-9073-9d39abcedf7d.png)

- Also from deliverable 1: Note that in the first image, two of the retirees are managers. By cross-referencing the unique_titles table and the better_dept_emp table using the emp_no entires, I was able to discover that the reiring managers are from the Sales and Research departments respectively. It may be important to notify these departments, but as they are led by these managers, I think perhaps they already know when they might retire. Instead, I might suggest that whoever is in charge of preparing the company for the 'silver tsunami' would sit down with these managers and ask them when they might be plamnning to retire. It would also be beneficial to ask what they are doing to prepare for handing off their duties when they retire, and what assistance they might need.

![available_mentors](https://user-images.githubusercontent.com/102263341/178900636-5423f031-0220-4df8-a229-0f3a08345e0a.png)

- This is a list of the number of employees grouped by their position title that are old enough to have experience in their position, but not so old that they will shortly retire. These are the the employees eligible to participate as mentors in the mentorship program. As an example there is 1 Senior Engineer in this group for every 100 retiting senior engingeers. If that one engineer is capapble fo mentoring 99, then the company might be okay, but I fear that they might instead be overwhelemd. I would recommend hiring or promoting sooner rathewr than later. Unfortunately this insight is limited by the fact that this table does not have dept_no as column, so we cannot sort by that parameter to see what departments these employees are from. This severly limits the usefulness of this table. I would recommend ammending this table to have this info as a next step.

![mentors_by_dept_and_title](https://user-images.githubusercontent.com/102263341/178903614-5b0c3cae-e318-4c6b-8250-07dff3de12e2.png)

- So I have doen the work I meantioned doing above. Please note you can find the .csv file for the mentorship_dept table I made for this little snippet. Aynway, now we can see how many eligible mentors ther are by title, and in whicih departments they work in. We could then sort by department and try to figure out which ones are in the most troublew (the ones with the least amount of eligible mentors) In this image I still have it sorted by title. For an example, let's look at the Senior Engineers. It seems that the departmenrs of Development and Production have the most potential mentors, while Research and Customer Service have the least. It would be best to look into the latter two to see how many Senior Engineers they really need to accurately gauge how in trouble they are.

![mentors_dept](https://user-images.githubusercontent.com/102263341/178903898-05ae1ac3-41e5-46b1-8f40-7a9ced135f1a.png)

- Not really part of my analysis, but just for curiosity's sake, here are the potenial metors by department alone. Developemnt is in the best position, while Finance is in the worst. Again the severity of this is largely dependent on how many employees these departyments really need, as in, how much of a percentage of the deprtment. That, however, si out of the scope of thios analysis.

## Summary
### Question 1: How many roles will need to be filled as the "silver tsunami" begins to make an impact?

The short answer is that 41380 employees are tob e retiring shortly, so the company will need that many positions will need to be filled. The long answer is, I suppose, up to the discretion of the deparmtents themselves. That is to say, a department may be losing, say 100 employees, but that does not necessarily mean they will need 100 to replace them exactly. They may find they need less employees to do the necessary work, or perhaps their separtment needs to expand so they will need more than 100. There is also the added complication that some of these roles may be replaced by internal promotion, which means it's the role the promotee is leaving that needs replaced. If that promotiuon counts as a replacement, then you have two "replacements" for one retiree. This complicates the picture. The positions the company really needs to look out for are the Senior Staff, Senior Engineers, and most importnalty, the 2 Managers.

### Question 2: Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

This is a interesting question as in the analysis, the potenital mentors were pulled based on a time frame that would mean that they are not quite yet retirement ready. If the retiring employees were required to stay to mentor the new hires as this question seems to imply, then of course there are enough to mentor. If you meant to ask if there were enough potential mentors based on the 1965 birstdate criteria, then I would have to say unlikely. Although my eariler analysis was based on titles, I think were the numbers to be looked at through a department lens, a similar picture would arise. I definitely would recommend hiring sooner rather than later so that the new hires can be mentored by the mentees in the mentorship_eligibility table as well as the employees set to retire but who haven't  yet done so. After all, not all of those that could retire will suddenly do so.
