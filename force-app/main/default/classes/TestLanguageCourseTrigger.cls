@isTest
public with sharing class TestLanguageCourseTrigger {
    @isTest
    public TestLanguageCourseTrigger() {
        List<Language_Course__c> courses = new List<Language_Course__c>();

        for (Integer i = 0; i < 3; i++){
            Language_Course__c course = new Language_Course__c(Name = 'Test Course' + i);
            courses.add(course)
        }

        insert course;

        // Call the trigger
        Test.startTest();
        delete courses;
        Test.stopTest();

        // verify the alert
        List<Log__c> logs = [SELECT Message__c From Log__c];
        System.assertEquals(3, logs.size());
    }
}