public with sharing class InterviewSelector {
    public static List<Interview__c> SelectInterviewsForWeekByInterviewers(Set<Id> interviewIds){
        return [SELECT Id, To_Interview__c FROM Interview__c
            WHERE Time__c<NEXT_WEEK AND Time__c > LAST_WEEK
            AND Interviewer__c IN : interviewIds];
    }

    public static List<Interview__c> SelectInterviewsByVacancyId(Id vacancyId){
        return [SELECT Id FROM Interview__c WHERE Vacancy__c =:vacancyId];
    }

    public static List<Interview__c> SelectInterviewsByContactId(Id contactId){
        return [SELECT Id FROM Interview__c WHERE To_Interview__c =:contactId];
    }

    public static List<Interview__c> SelectInterviewsForWeekForCompany(Id companyId){
        List<Vacancy__c> ids = VacancySelector.SelectVacanciesByRelatedCompany(companyId);
        return [SELECT Id  FROM Interview__c
                            WHERE Vacancy__c IN :ids
                            AND Time__c<NEXT_WEEK AND Time__c>LAST_WEEK];
    }
}