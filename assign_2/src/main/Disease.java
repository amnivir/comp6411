/**
 * 
 */
package main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author eshinig
 *
 */
public abstract class Disease  implements Comparable<Disease>{

	protected String name = "NONE";
	protected int count = 0;
	
	protected List<String> diseases;

	public int getCount()
	{
		return count;
		
	}
	
	protected void incrementCount()
	{
		++count;
	}
	
	public String getName()
	{
		return name;
	}
	
	public float getCertainityFactor(float freqOfDisease)
	{
		return (freqOfDisease/this.getDiseaseList().size())*100;
	}
	
	public int compareTo(Disease d) {

		float compareQuantity = ((Disease) d).getCertainityFactor(d.getCount());

		return compareQuantity - this.count;
	}

	protected abstract List<String>  getDiseaseList();
	

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		List<String> symptoms = new ArrayList<>();
		addSymtomsToList(args, symptoms);
		
		List<Disease> disease = new ArrayList<>();
		disease.add(new Aids());
		disease.add(new HepatitisC());
		disease.add(new Influenza());
		disease.add(new Pregnancy());
		
		for(Disease d : disease)
		{
			intersection(d, symptoms);
		}
		
		for(Disease d : disease)
		{
			System.out.println(d.getCount());
		}
		
		Collections.sort(disease);
		
		for(Disease d : disease)
		{
			System.out.println((d.getCertainityFactor(d.getCount())));
		}

	}
	
	private static  void intersection( Disease d, List<String> symptoms) {   
	    
		for(String s : symptoms)
		{
			if(d.getDiseaseList().contains(s))
			{
				d.incrementCount();
			}
		}
	}

	/**
	 * @param args
	 * @param symptoms
	 */
	private static void addSymtomsToList(String[] args, List<String> symptoms) {
		for(int i = 0; i < args.length; i++) 
		 {
			 symptoms.add(args[i]);
		 }
	}

}
