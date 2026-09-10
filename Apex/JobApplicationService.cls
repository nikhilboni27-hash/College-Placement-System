public class JobApplicationService {

    public static void checkEligibility(List<Job_Application__c> applications) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for (Job_Application__c app : applications) {

            if (app.Student__c != null) {
                studentIds.add(app.Student__c);
            }

            if (app.Job_Opening__c != null) {
                jobIds.add(app.Job_Opening__c);
            }
        }

        Map<Id, Student__c> students = new Map<Id, Student__c>([
            SELECT Id, CGPA__c
            FROM Student__c
            WHERE Id IN :studentIds
        ]);

        Map<Id, Job_Opening__c> jobs = new Map<Id, Job_Opening__c>([
            SELECT Id, Minimum_CGPA__c
            FROM Job_Opening__c
            WHERE Id IN :jobIds
        ]);

        for (Job_Application__c app : applications) {

            Student__c student = students.get(app.Student__c);
            Job_Opening__c job = jobs.get(app.Job_Opening__c);

            if (student != null && job != null &&
                student.CGPA__c != null && job.Minimum_CGPA__c != null) {

                if (student.CGPA__c >= job.Minimum_CGPA__c) {
                    app.Eligibility_Status__c = 'Eligible';
                }
                else {
                    app.Eligibility_Status__c = 'Not Eligible';
                }
            }
        }
    }
}
