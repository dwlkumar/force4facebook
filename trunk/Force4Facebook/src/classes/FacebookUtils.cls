public class FacebookUtils {
    
    public static boolean triggerFirstRun = true;
    
    public static Datetime epochToDatetime(Long epoch) {
        return Datetime.newInstance(epoch * 1000);
    }
    
    public static String epochToString(Long epoch) {
        return epochToDatetime(epoch).format('yyyy-MM-dd\'T\'HH:mm:ss.SS z');
    }
    
    public static Long stringToEpoch(String dateString) {
        return Datetime.valueOf(dateString).getTime() / 1000;
    }
    
    public static Long dateTimeToEpoch(Datetime theDate) {
        return theDate.getTime() / 1000;
    }
     
    public static Datetime stringToDatetime(String dateString) {
        return Datetime.newInstance(stringToEpoch(dateString));
    }
    
    public static String stringifyDate(Datetime d) {
		Date theD = date.newinstance(d.year(), d.month(), d.day());
		if (Date.today().isSameDay(theD)) {
			return 'Today ' + d.format('hh:mm a');
		} else {
			if (Date.today().daysBetween(theD) == 1) {
				return 'Tomorrow';
			} else if (Date.today().daysBetween(theD) == -1) {
				return 'Yesterday';
			} else {
				return d.format('dd MMM. yyyy');
			}
		}
	}
    
    public static String mapOut(Map<String, String> theMap) {
    	String out = '';
    	for (String key : theMap.keySet()) {
    		out += key + '=' + theMap.get(key) + '\n';
    	}
    	return out;
    }
}