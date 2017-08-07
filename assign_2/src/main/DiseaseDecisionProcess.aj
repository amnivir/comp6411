package main;

public privileged aspect DiseaseDecisionProcess {



	before() : call(void *.incrementCount()) 
	{
		System.out.println("Count Incremented : "+thisJoinPoint.getTarget().getClass().getName());
	}

	before() : call (int *.getCount()) 
	{
		System.out.println(">Read count: " + thisJoinPoint.getTarget().getClass().getName());
	}

	before() : call(void Disease.addSymtomsToList(..)) {
		System.out.println("Symptoms captured from cmd arguments : " + thisJoinPoint);
	}



}