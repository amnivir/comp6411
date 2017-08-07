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
	
	public float getCertainityFactor()
	{
		return ((float)this.getCount()/(float)this.getDiseaseList().size())*100;
	}
	
	public int compareTo(Disease d) {

		float c1 = ((Disease) d).getCertainityFactor();
		float c2 = this.getCertainityFactor();
		if(c1>c2)
			return 1;
		if(c1<c2)
			return -1;
		else
			return 0;
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
			System.out.println((d.getCertainityFactor()));
		}

		System.out.println("Most Probable Disease: " + disease.get(0).getName()+ "  with Certainity Factor: " + disease.get(0).getCertainityFactor()+ " %");
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
