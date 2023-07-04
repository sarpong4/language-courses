trigger LanguageCourseTrigger on Language_Course__c (after insert, after update, after delete) {

    Set<Id> recordIds = new Set<Id>();

    // Collect the record IDs based on the trigger event
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            for (Language_Course__c record: Trigger.new) {
                recordIds.add(record.Id);
            }
        }
        if (Trigger.isDelete) {
            for (Language_Course__c record : Trigger.old) {
                recordIds.add(record.Id);
            }
        }
    }

    // send the alert
    if (!recordIds.isEmpty()) {
        if (Trigger.isInsert) {
            String message = 'The following records have been inserted:\n';

            for (Id recordId: recordIds){
                message += recordId + '\n';
            }

            // Publish the notification
            System.debug(message);
        }

        if (Trigger.isUpdate) {
            String message = 'The following records have been updated:\n';

            for (Id recordId: recordIds){
                message += recordId + '\n';
            }

            // Publish the notification
            System.debug(message);
        }

        if (Trigger.isDelete) {
            String message = 'The following records have been deleted:\n';

            for (Id recordId: recordIds){
                message += recordId + '\n';
            }

            // Publish the notification
            System.debug(message);
        }
    }

}