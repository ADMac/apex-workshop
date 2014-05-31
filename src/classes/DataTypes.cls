public class DataTypes {
    /* This class contains examples corresponding to Chapter 2 Tutorial 5 of the Apex Workbook */
    /* Primitive DataTypes and Variables */

    /*Lesson 1: String */
    public static void lesson_one(){
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

    /* Lesson 2: Boolean and Conditional Statements */
    public static void lesson_two(){
        /* initialize a boolean */
        Boolean bool = True;

        /* Boolean operators */
        /* https://www.salesforce.com/us/developer/docs/apexcode/Content/langCon_apex_expressions_operators_understanding.htm */
        String y = 'HELLO WORLD!';
        String z = 'HELLO';
        /* logical equality */
        Boolean y_comp = (y == 'HELLO WORLD!');
        /* logical inequality */
        Boolean yz_comp = (y == z);
        /* multiple condition logic expression */
        Boolean yz_and_comp = (True ==  (z == 'HELLO'));
        system.debug('Logical equality ' + y_comp);
        system.debug('Logical inequality ' + yz_comp);
        system.debug('Multiple conditions ' + yz_and_comp);

        /* String method boolean return */
        String str = 'Bob Loblaw Law Blog';
        Boolean str_contains = str.contains('Bob');
        system.debug('Contains ' + str_contains);

        /* if conditional statements */
        /* basic if */
        if(True){
             system.debug('This statement is true');
        }
        else{
            system.debug('I would never get here');
        }

        /* str condition expression */
        /* One liner can omit braces --- though consider the clarity impliations here */
        if(str.contains('Bob'))
            system.debug('Bob is at ' + str.indexOf('Bob'));
        
        /* Ternary statements */
        /* x ? y : z */
        Boolean has_bob = str.contains('Bob');
        String bob_str = 'Bob ' + (has_bob ? 'is here!' : 'isn\'t here');
        system.debug(bob_str);
    }

    /* Lesson 3: Time, Date, and Datetime */
    public static void lesson_three(){
        /* Initialize Dates, Times, and DateTimes */

        /* Date new instance */
        /* http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_date.htm#apex_System_Date_newInstance */
        Date new_date = Date.newInstance(1960, 2, 17);
        system.debug('New date ' + new_date);

        /* Time new instance */
        /* http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_time.htm#apex_System_Time_newInstance */
        Time new_time = Time.newInstance(18, 30, 2, 20);
        system.debug('New time ' + new_time);

        /* DateTime new instance */
        /* notice that there are several different versions of the new instance method */
        /* https://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_datetime.htm#apex_System_Datetime_newInstance_2 */
       
        /* init from a date and a time */
        DateTime from_dt = DateTime.newInstance(new_date, new_time);

        /* init at midnight from date integers */
        DateTime from_d_midnight = DateTime.newInstance(1960, 2, 17);

        /* init with date and time integers */
        DateTime from_int = datetime.newInstance(1960, 2, 17, 18, 30, 2);

        system.debug('From date time ' + from_dt);
        system.debug('From date at midnight ' + from_d_midnight);
        system.debug('From int ' + from_int);
        
        /* DateTime comparison */
        /* is same day also method on Date class */
        /* https://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_datetime.htm#apex_System_Datetime_isSameDay */
        system.debug(from_dt.isSameDay(from_int));

        /* Adding days to a date */
        /* Common use case, when would you want to do this? */
        /* Approach applies to datetime and date */

        /* Get today's date - for a datetime the equivilant would be Datetime.now() */
        Date today = Date.today();

        /* Set the date to be 30 days out */
        Date my_new_date = today.addDays(30);
        system.debug(my_new_date);

        /* Other useful date and date time examples */

        /*Date arithmetic */
        /* http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_date.htm#apex_System_Date_daysBetween */
        Integer days_between = today.daysBetween(my_new_date);
        system.debug('Days between ' + days_between); 

        /* Get a date at the first of the month of the supplied date */
        /* http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_date.htm#apex_System_Date_toStartOfMonth */
        Date month_first = today.toStartOfMonth();
        system.debug(month_first);
    }

    /* Lesson 4: Integer, Long, Double and Decimal */
    public static void lesson_four(){
        /* create instances of each type of mumeric data type */
        Integer i = 5;
        Long l = 2147483648L;
        Double d = 3.14159;
        Decimal dec = 19.23;

        /* arithmetic operators */
        /* https://www.salesforce.com/us/developer/docs/apexcode/Content/langCon_apex_expressions_operators_understanding.htm */
        /* addition, subtraction, mult, div */
        system.debug('Addition ' + (i + i));
        system.debug('Subtration ' + (i - i));
        system.debug('Multiplication ' + (i * i));
        system.debug('Division ' + (i / i));

        /* math with different types */
        system.debug('Integer plus double ' + (i + d));
        system.debug('Integer times double ' + (i * d)); /* notice the types of the products */
        system.debug('Decimal times double' + (d * dec));
        system.debug('Integer divided by decimal ' + (i/dec)); /* notice the type of the quotient */

        /* Important math exception to know */
        try{
            system.debug(10/0);
        }
        catch(MathException ex){
            system.debug(ex);
        }
        
        /* conversion */

        String str = '10';
        /* String to integer */
        Integer str_to_int = Integer.valueOf(str);

        /* Integer to double */ 
        Double int_to_dbl = Double.valueOf(str_to_int);

        /* Double to decimal */
        Decimal dbl_to_dec = Decimal.valueOf(int_to_dbl);

        /* and back to a string */
        String dbl_to_str = String.valueOf(dbl_to_dec);

        /* notice the value */
        system.debug(dbl_to_str);
        /* notice the result of comparing it to our original string though */
        system.debug(str == dbl_to_str);

        /* Decimal Instance methods */
        /* http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_decimal.htm */

        /* rounding */ 
        /* ROUNDING MODE MATTERS - notice different modes of rounding and resulting values */
        system.debug('Ceiling ' + dec.round(RoundingMode.CEILING));
        system.debug('Down ' + dec.round(RoundingMode.DOWN));
        system.debug('Floor ' + dec.round(RoundingMode.FLOOR));
        system.debug('Half down ' + dec.round(RoundingMode.HALF_DOWN));
        system.debug('Half even ' + dec.round(RoundingMode.HALF_EVEN));
        system.debug('Half up ' + dec.round(RoundingMode.UP));

        /* set scale */
        /* http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_decimal.htm#apex_System_Decimal_scale */
        system.debug('Scaled decimal up ' + dec.setScale(4));
        system.debug('Scaled decimal down ' + dec.setScale(1, RoundingMode.HALF_UP)); /* remember scaling down will force the decimal to be rounded and follow rounding rules */
    }
}
