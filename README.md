# take_two_homework
Take Two Homework
Take-Two PowerShell Scripting Evaluation
 
This test will be used to evaluate your PowerShell skill set. Please do not take more than two hours to do this evaluation. We are not looking for a perfect solution, we are looking for something that showcases your ability to write code and solve problems.
Review the scenario below and provide answers and/or deliverables to each of the following questions. Be sure to include the PowerShell code you used to get to the results.
 
Scenario:
 
You are given the attached file, Users.csv that looks like this:
 
EmailAddress	UserPrincipalName	Site	MailboxSizeGB	AccountType
user@domain.com
user@domain.com
NYC	10.44	Employee
Contractor1@domain.com
Contractor1@domain.com
NYC	35	Contractor
Etc…
 
•	First thing’s first, import the csv as a variable.  Use this variable for all subsequent tasks.
•	How many users are there?
•	What is the total size of all mailboxes?
•	How many accounts exist with non-identical EmailAddress/UserPrincipalName? Be mindful of case sensitivity.
•	Same as question 3, but limited only to Site: NYC
•	How many Employees (AccountType: Employee) have mailboxes larger than 10 GB?  (remember MailboxSizeGB is already in GB.)
•	Provide a list of the top 10 users with EmailAddress @domain2.com in Site: NYC by mailbox size, descending.
2.	The boss already knows that they’re @domain2.com; he wants to only know their usernames, that is, the part of the EmailAddress before the “@” symbol.  There is suspicion that IT Admins managing domain2.com are a quirky bunch and are encoding hidden messages in their directory via email addresses.  Parse out these usernames (in the expected order) and place them in a single string, separated by spaces – should look like: “user1 user2 … user10”
•	Create a new CSV file that summarizes Sites, using the following headers: Site, TotalUserCount, EmployeeCount, ContractorCount, TotalMailboxSizeGB, AverageMailboxSizeGB
50.	Create this CSV file based off of the original Users.csv.  Note that the boss is picky when it comes to formatting – make sure that AverageMailboxSizeGB is formatted to the nearest tenth of a GB (e.g. 50.124124 is formatted as 50.1).  You must use PowerShell to format this because Excel is down for maintenance.
