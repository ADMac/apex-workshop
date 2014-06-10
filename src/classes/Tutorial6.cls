public class Tutorial6 {

    //Lesson 3: Arrays and Lists
	public static void lesson_three_lists() {
        //two types of arrays - Lists, and Sets

        //https://www.salesforce.com/us/developer/docs/apexcode/Content/langCon_apex_collections_lists.htm
        //List: ordered collection of elements - accessible by index
        //initialize empty - List<DataType> list_name = new List<String>();
        List<String> empty_list = new List<String>();
        system.debug('Empty list ' + empty_list);

        //initialize list with values
        List<String> filled_list = new List<String>{'a', 'b', 'c'};
        system.debug('Filled list ' + filled_list);

        //initialize with a set length 
        List<String> set_length_list = new List<String>(5);

        //alternate initialization method
        String[] alt_string = new List<String>();
        system.debug('Alternative initilization ' + alt_string);

        //add elements to an array via the the add method
        empty_list.add('a');
        system.debug('No longer empty list ' + empty_list);

        //added by index
        empty_list[1] = 'c';
        system.debug('One added ' + empty_list);
    }

    public static void lesson_three_sets() {
        //https://www.salesforce.com/us/developer/docs/apexcode/Content/langCon_apex_collections_sets.htm
        //Set: unordered collection of elements (with some extra apex magic)

        //initialize empty 
        Set<String> empty_set = new Set<String>();
        system.debug('Empty set ' + empty_set);

        //initialize set with values
        Set<String> filled_set = new Set<String>{'a', 'b', 'c'};
        system.debug('Filled set ' + filled_set);

        //add elements to an array via the the add method
        empty_set.add('a');
        system.debug('No longer empty set ' + empty_set);

        //Now how are sets different and when would you use a set vs a list
        //remember the property of a list is that it's ordered meaning that you can access elements via an index

        //consider a situation where you have two list of items that always should be the same length and have the same elements at the same index
        //You want to test whether the elements at x are equal
        //REMEMBER THIS EXAMPLE BECAUSE IT WILL BE IMPORTANT
        List<String> list_a = new List<String>{'a', 'b', 'c'};
        List<String> list_b = new List<String> {'b', 'a', 'c'};
        Integer x = 0;
        if(list_a[x] == list_b[x]){
            system.debug('Elements at ' + x + ' are the same');
        }

        //Now consider a situation where you have a known element and a collection of elements
        //You need to find out if the element is in that collection
        //REMEMBER THIS TOO!!!!!!
        String s = 'A'; //try changing this to 'a'
        Set<String> string_set = new Set<String>{'A', 'B', 'C'};
        if(string_set.contains(s)){
            system.debug('Set contains ' + s);
        }

        //ONE MORE BIG DIFFERENCE!!!!
        //sets are unique, they cannot contain duplicates
        string_set.add('A');
        system.debug('Still the same set ' + string_set);

        //don't jump ahead, but consider how this can help you as a tool for deduplication in your code
        //on the flip side, consider how it could also cause you to lose data if you forget this important property of sets
    }

    //lesson 5 maps - I'm going out of order for a reason :)
    public static void lesson_five() {
        //Maps aka hashes, dictionaries are collections of key value pairs. Keys are primitive data types and are unique
        //use to associate elements by keys

        //initialize an empty map
        Map<String,String> empty_map = new Map<String,String>();
        system.debug('an empty map ' + empty_map);

        //map with values
        Map<String,String> alphabet_map = new Map<String,String>{'a' => 'A', 'b' => 'B'};

        //retrieve an element from a map
        system.debug('The capital of b is ' + alphabet_map.get('b'));

        //adding an element to a map
        alphabet_map.put('c','C');
        system.debug('Alphabet map ' + alphabet_map);

        //more map methods
        //http://www.salesforce.com/us/developer/docs/dbcom_apex250/Content/apex_methods_system_map.htm

        //check if a map contains an element as a key
        system.debug('Map contains h ' + alphabet_map.containsKey('h'));
    }

    //lesson four - loops
    public static void lesson_four_loops() {
        //loops are used to repetadly execute code
        //three types - do while, while and for

        //briefly examples of while and do while, focus on for for now
        Integer count = 1;
        do {
            System.debug(count);
            count++;
        } while (count < 11);

        //for loops - three types
        //traditional
        for (Integer i = 1; i <= 10; i++){
            System.debug(i);
        }

        Integer[] myInts = new Integer[]{10,20,30,40,50,60,70,80,90,100};
        for (Integer i: myInts) {
            system.debug(i);
        }

        //the third type we will go over next
        //rather than linger on the topic of loops, lets move on to the next section where we can apply it

    }
    //moving off the workbook now to learn something that will tie in 
    public static void learning_soql() {
        //hopefully you are familiar with SOQL: Salesforce Object Query Language
        //similar to SQL: Structure Query Language, but has big differences
        //structure is familiar if you have sql knowledge
        //SELECT rows/fields FROM table/object

        //unlike other languages, where you have to use database connectors and other fun things, apex lets you issue database commands inline
        // so let's start with queries
        /* MOST OF THE TIME WHEN YOU ISSUE A QUERY A LIST WILL BE RETURNED */

        //basic query
        List<Account> accts = [SELECT Id,Name FROM Account];
        system.debug('Our query result ' + accts);

        //how do we inspect fields? buzzword is dot notation for future reference
        //object_var.field
        system.debug('Account name is ' + accts[0].name);

        //now we can change that account name 
        //first let's assign that account at list index 0 to a variable
        Account a = accts[0];
        system.debug('Our account ' + a);
        //now let's change that name
        a.Name = 'Named from apex';
        system.debug('new account name ' + a.Name);

        //Now we have that change stored in memory, but once this execution context ends that is gone
        //so let's get it committed to the database
        //apex has database commands that you use to interact with records - DML(Database manipulation language)
        //insert, update, delete
        //since we have the account already, we only want to update it 
        update a;
        //now go look at your account

        //soql in bulk
        //we can use a for loop to iterate through out accounts and change all the names
        for(Account acct : accts){
            acct.Name = 'Name changed in loop from ' + acct.Name;
        }

        //we can do a dml statement on a list too
        update accts;

        //we can also use a query as an iterator
        //we need to have a  collection update from!
        //let's try deduping!!!
        Set<String> acct_names = new Set<String>();
        //I always name my collection I plan to do dml on as operation_object
        List<Account> update_accts = new List<Account>();
        for(Account acct : [SELECT Id,Name FROM Account]){
            if(!acct_names.contains(acct.Name)){
                acct.Name = 'Name changed again in loop from ' + acct.Name;
                update_accts.add(acct);
                acct_names.add(a.name);
            }
        }

        update update_accts;
    }

    //The next step is to write a trigger combining all of this, to update records 
    //The trigger should update a field if a field has changed, and it should also check for duplicates of another field. The goal here is to make a trigger that combines the things we have been going over
    //First you need to know just a little bit more about special context variables in triggers
    //https://www.salesforce.com/us/developer/docs/apexcode/Content/apex_triggers_context_variables.htm
}

