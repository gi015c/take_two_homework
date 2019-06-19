
#(Q1) Import as Variable
$Users = Import-Csv -Path .\Users.csv 

#Table Format
$Users | Format-Table

#Get Properties
$Users | Get-Member

#(Q2) Total number of users = 148
$Users | Measure-Object -Property UserPrincipalName | fl Count

$Users.Count

#(Q3) Total Size of all Mailboxes = 3936.56GB
$Users | select -ExpandProperty MailboxSizeGB | Measure-Object -Sum | fl Sum

$users | Select-Object -ExpandProperty MailboxSizeGB | Measure-Object -Average -Sum -Maximum -Minimum


#(Q4) How many accounts exist with non-identical EmailAddress/UserPrincipalName? Be mindful of case sensitivity.

#(Q4.a)With CaseSensitive = 10
$Count = Compare-object -ReferenceObject ($Users | select -ExpandProperty EmailAddress) -DifferenceObject ($Users | select -ExpandProperty UserPrincipalName) -CaseSensitive
$Count.count

$Count = Compare-object -ReferenceObject ($Users | Select-Object -ExpandProperty EmailAddress) -DifferenceObject ($Users | Select-Object -ExpandProperty UserPrincipalName) | Sort {$_.InputObject.ReadCount}


$DiffEmail = $Users | select -ExpandProperty Emailaddress
$DiffUPN = $Users | Select -ExpandProperty UserPrincipalName
Compare-Object -RefercenceObject ($DiffEmail) -DifferenceObject ($DiffUPN)


#(Q4.b)Without CaseSensitive = 6
$CountCS = Compare-object -ReferenceObject ($Users | select -ExpandProperty EmailAddress) -DifferenceObject ($Users | select -ExpandProperty UserPrincipalName)
$CountCS.count

#(Q5) Same as question 3, but limited only to Site: NYC = 938.9GB
$Users | where Site -eq NYC | select -ExpandProperty MailboxSizeGB | Measure-Object -Sum | fl Sum
$Users | where Site -EQ NYC | Select-Object -ExpandProperty MailboxSizeGB | Measure-Object -Average -Sum -Maximum -Minimum


#(Q6) How many Employees (AccountType: Employee) have mailboxes larger than 10 GB?  (remember MailboxSizeGB is already in GB.) = 39

$CountOver10 = $Users | where AccountType -eq Employee | Select @{'n'='MailboxSizeGB' ; e={$_.MailboxSizeGB -as [Int]}} | where MailboxSizeGB -GT 10 
$countOver10.count



#(Q7) Provide a list of the top 10 users with EmailAddress @domain2.com in Site: NYC by mailbox size, descending.

$Top10NYC = $Users | where {($_.EmailAddress -like '*Domain2.com') -AND $_.site -eq 'NYC'} | sort MailboxSizeGB -Descending | select -First 10 -ExpandProperty EmailAddress

$Top10NYC.Replace("@domain2.com","")



 #(Q8) Create a new CSV file that summarizes Sites, using the following headers: Site, TotalUserCount, EmployeeCount, ContractorCount, TotalMailboxSizeGB, AverageMailboxSizeG

<#
TypeName: System.Management.Automation.PSCustomObject

Name              MemberType   Definition                                   
----              ----------   ----------                                   
Equals            Method       bool Equals(System.Object obj)               
GetHashCode       Method       int GetHashCode()                            
GetType           Method       type GetType()                               
ToString          Method       string ToString()                            
AccountType       NoteProperty string AccountType=Contractor                
EmailAddress      NoteProperty string EmailAddress=4FunBird@domain3.com     
MailboxSizeGB     NoteProperty string MailboxSizeGB=10                      
Site              NoteProperty string Site=TOR                              
UserPrincipalName NoteProperty string UserPrincipalName=4FunBird@domain3.com

#>



#(Q3) Total Size of all Mailboxes
$Users | Group-Object -Property AccountType,EmailAddress,MailboxSizeGB,Site | Format-Table;

$Users | Group-Object -Property Site | Select-Object Name,Count | Sort-Object Name | Format-Table -AutoSize

$Users | Group-Object -Property AccountType | Select-Object Name,Count | Sort-Object Name | Format-Table -AutoSize

$users | Select-Object -ExpandProperty MailboxSizeGB | Measure-Object -Average -Sum -Maximum -Minimum


