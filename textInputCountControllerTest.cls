@isTest
private with sharing class textInputCountControllerTest {
    
    @isTest
    private static void testSampleMethod() { 

        String sampleInput = 'test,xxx ,test, hello';
        Map<String,Integer> testResult = textInputCountController.countValuesFromString(sampleInput);
        Map<String,Integer> testResultToCompare = new Map<String,Integer>{'hello'=>1, 'test'=>2, 'xxx'=>1};
        System.assertEquals(testResultToCompare, testResult);

    }

}
