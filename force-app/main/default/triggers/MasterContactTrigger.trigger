trigger MasterContactTrigger on Contact (
  	before insert, after insert, 
  	before update, after update, 
  	before delete, after delete) {

  	if (Trigger.isBefore) {
    	if (Trigger.isInsert) {
      		// Call class logic here!
      		AutoAccountforContact autoAccount = 
          		new AutoAccountforContact(Trigger.new);
      		autoAccount.autoCreateAccount();
    	} 
    	if (Trigger.isUpdate) {
      		// Call class logic here!
    	}
    	if (Trigger.isDelete) {
      		// Call class logic here!
    	}
  	}

  	if (Trigger.isAfter) {
    	if (Trigger.isInsert) {
      		// Call class logic here!
    	} 
    	if (Trigger.isUpdate) {
      		// Call class logic here!
    	}
    	if (Trigger.isDelete) {
      		// Call class logic here!
    	}
  	}
}