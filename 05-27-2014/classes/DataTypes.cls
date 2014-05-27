public class DataTypes {
    /* This class contains examples corresponding to Chapter 2 Tutorial 5 of the Apex Workbook */
    /* Primitive DataTypes and Variables */

    public static lesson_one(){
        /* initialize strings and compare them */
        String x = 'Hello World!';
        String y = 'HELLO WORLD!';
        String z = 'HELLO';
        system.debug(x == y);
        system.debug(x != z);

        /* Concatenation of two strings */
        String my_name = 'KC';
        system.debug('My name is ' + my_name);

        /* Convert other data types to strings */
        Date today = Date.today();
        Integer i = 1;
        system.debug('Date converted to string is ' + String.valueOf(today));
        system.debug('Integer conerted to string is ' + String.valueOf(i));

        /* String instance methods */
        /* http://www.salesforce.com/us/developer/docs/dbcom_apex250/Content/apex_methods_system_string.htm */
        String str = 'Bob Loblaw Law Blog';
        system.debug(str.length());
        system.debug(str.contains('Bob'));
        system.debug(str.subString(0,5));
        /* try some more of the methods at the link above on the string */


    }
}
