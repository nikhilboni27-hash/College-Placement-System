@IsTest
public class JobApplicationServiceTest {

    @IsTest
    static void testEligibleStudent() {

        Student__c student = new Student__c(
            Full_Name__c = 'Test Student',
            Email__c = 'teststudent123@gmail.com',
            Branch__c = 'CSE',
            CGPA__c = 8.50,
            Graduation_Year__c = 2027,
            Placement_Status__c = 'Not Placed'
        );
        insert student;

        Company__c company = new Company__c(
            Company_Name__c = 'Test Company',
            Industry__c = 'IT Services',
            Location__c = 'Hyderabad',
            HR_Email__c = 'hr123@testcompany.com'
        );
        insert company;

        Job_Opening__c job = new Job_Opening__c(
            Job_Title__c = 'Test Salesforce Developer',
            Company__c = company.Id,
            Minimum_CGPA__c = 7.00,
            Required_Skills__c = 'Salesforce, Apex, SOQL',
            Job_Location__c = 'Hyderabad',
            Job_Type__c = 'Full Time',
            Status__c = 'Open'
        );
        insert job;

        Job_Application__c application = new Job_Application__c(
            Student__c = student.Id,
            Job_Opening__c = job.Id,
            Application_Date__c = Date.today(),
            Status__c = 'Applied',
            Remarks__c = 'Test application'
        );

        insert application;

        Job_Application__c savedApplication = [
            SELECT Id, Eligibility_Status__c
            FROM Job_Application__c
            WHERE Id = :application.Id
        ];

        System.assertEquals(
            'Eligible',
            savedApplication.Eligibility_Status__c
        );
    }
}
