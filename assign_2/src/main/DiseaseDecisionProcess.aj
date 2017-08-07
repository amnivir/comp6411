package main;

import java.util.Collections;

public privileged aspect DiseaseDecisionProcess {



	before() : call(void *.incrementCount()) 
	{
		System.out.println(">Count Incremented : "+thisJoinPoint.getTarget().getClass().getName());
	}

	before() : call (int *.getCount()) 
	{
		System.out.println(">Read count: " + thisJoinPoint.getTarget().getClass().getName());
	}

	before() : call(void Disease.addSymtomsToList(..)) {
		System.out.println(">Symptoms captured from cmd arguments : " + thisJoinPoint);
	}

	before() : call(* Collections.sort(..)) {
		System.out.println(">Sorting of diseases based on Certaininty Factor started : " + thisJoinPoint);
	}

	after() : call(* Collections.sort(..)) {
		System.out.println("<Sorting of diseases based on Certaininty Factor Finished : " + thisJoinPoint);
	}
	
	before() : call(* *.intersection(..)) {
		System.out.println(">Matching Patients Symptoms with existing Diseases Symptoms : " + thisJoinPoint);
	}
	
}