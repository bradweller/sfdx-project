public class AutoAccountforContact{
    List<Contact> triggerList = new List<Contact>();
    // This is the constructor

    public AutoAccountforContact(Contact[] newConts) {
      	triggerList = newConts;
  	}
    
    public void autoCreateAccount() {
    	//Collect List Of Contacts Being Inserted without an Account  
   		List<Contact> conList = new List<Contact>();
        for (Contact conObj : triggerList) {
     		if (String.isBlank(conObj.accountid)) {  
       			conList.add(conObj);  
     		}  
   		}  
   		if (conList.size() > 0) {  
    		List<Account> newAccounts = new List<Account>();  
    		Map<String, Contact> contactsByNameKeys = new Map<String, Contact>();  
     		//Create Account For Each Contact  
     		for (Contact con : conList) {               
       			String accountName = con.LastName;  
       			contactsByNameKeys.put(accountName, con);  
       			Account accObj = new Account();
                accObj.Name = accountName;  
       			newAccounts.add(accObj);  
     		}  
     		insert newAccounts;  
     		for (Account acc : newAccounts) {  
       			system.debug('mapContainsKey ' + contactsByNameKeys.containsKey(acc.Name));
                //Put Account Id's on Contacts  
       			if (contactsByNameKeys.containsKey(acc.Name)) {  
         			contactsByNameKeys.get(acc.Name).accountId = acc.Id;  
                }
       		}  
     	}  
   	}   
}