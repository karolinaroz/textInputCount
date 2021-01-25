public with sharing class textInputCountController {

    @AuraEnabled
    public static Map<String,Integer> countValuesFromString(String inputValue) {

        String valueProvidedByUser = inputValue.deleteWhitespace(); //in this version taken String is case sensitive
        //String valueProvidedByUser = inputValue.deleteWhitespace().toLowerCase(); --- in this version taken String is case insensitive
        List<String> splitInput = valueProvidedByUser.split(',');
        Map<String,Integer> countMap = new Map<String,Integer>();

        for(String key : splitInput)
        {
            if(!countMap.containsKey(key)) {
                countMap.put(key,0);
            }
            Integer currentInt = countMap.get(key) + 1;
            countMap.put(key,currentInt);
        }

        return countMap;
    }

}
