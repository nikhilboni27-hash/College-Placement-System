trigger JobApplicationTrigger on Job_Application__c (before insert, before update) {

    JobApplicationService.checkEligibility(Trigger.new);

}
