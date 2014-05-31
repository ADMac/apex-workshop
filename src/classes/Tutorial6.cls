public class Tutorial6 {

    //Lesson 3: Arrays and Lists
	public static void lesson_three_lists() {
        //two types of arrays - Lists, and Sets

        //https://www.salesforce.com/us/developer/docs/apexcode/Content/langCon_apex_collections_lists.htm
        //List: unordered collection of elements
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
}
