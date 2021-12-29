@isTest 
public class AutoAccountforContactTest {
    static testMethod void testContacts() {
		// Let's create our records from scratch!
       	Contact c   = new Contact();
       	c.FirstName = 'Stephen';
       	c.LastName  = 'Curry';
       	c.Email     = 'stephcurry@gsw.com';
       	insert c;
        
        Account acc = [SELECT Name,
                              (SELECT LastName
                                 FROM Contacts)
                         FROM Account
                        WHERE Name = :c.LastName];
        system.assertEquals(c.LastName, acc.Name);
    }
}