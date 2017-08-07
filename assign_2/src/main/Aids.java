/**
 * 
 */
package main;

import java.util.Arrays;
import java.util.List;

/**
 * @author eshinig
 *
 */
public class Aids extends Disease {
	
	

	@Override
	protected void incrementCount()
	{
		super.incrementCount();
	}
	
	@Override
	public int getCount()
	{
		return super.getCount();
	}
	
	@Override
	public String getName()
	{
		return name;
	}

	public Aids() {
		
		name = "Aids";
		diseases = Arrays.asList("fever","chills","rash","night_sweats","muscle_ache","sore_throat","fatigue","swollen_lymph_nodes","mouth_ulcers");
	}
	
	public List<String> getDiseaseList()
	{
		return diseases;
		
	}



}
