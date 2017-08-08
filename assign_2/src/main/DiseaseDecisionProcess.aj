package main;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Collections;

public privileged aspect DiseaseDecisionProcess 
{
	private BufferedWriter writer;
	final String logFile = "Aspect.log";

	public DiseaseDecisionProcess()
	{

		try 
		{
		    writer = new BufferedWriter(new FileWriter(logFile));
		     
		} catch (IOException e) {

			e.printStackTrace();
		};

	}


	before() : call(void *.incrementCount()) 
	{
		try {
			writer.write(">>Count Incremented : "+thisJoinPoint.getTarget().getClass().getName() + "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	before() : call (int *.getCount()) 
	{
		try {
			writer.write(">>Read count: " + thisJoinPoint.getTarget().getClass().getName()+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	before() : call(void Disease.addSymtomsToList(..)) {
		try {
			writer.write(">>Symptoms captured from cmd arguments : " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	before() : call(* Collections.sort(..)) {
		try {
			writer.write(">>Start Sorting of diseases based on Certaininty Factor started : " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	after() : call(* Collections.sort(..)) {
		try {
			writer.write("<<Finished Sorting of diseases based on Certaininty Factor : " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	before() : call(* *.intersection(..)) {
		try {
			writer.write(">>Start Matching Patients Symptoms with existing Diseases Symptoms : " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	after() : call(* *.intersection(..)) {
		try {
			writer.write("<<Finished Matching Patients Symptoms with existing Diseases Symptoms : " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	before() : call(* *.calculateCertainityFactor(..)) {
		try {
			writer.write(">>Start calculating Certaininty Factor for a disease : " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	after() : call(* *.calculateCertainityFactor(..)) {
		try {
			writer.write("<<Finished calculating Certaininty Factor for a disease: " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	before() : call(* *.getMostProbableDisease(..)) {
		try {
			writer.write(">>Get most probable disease : " + thisJoinPoint+ "\n");
			writer.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	

}