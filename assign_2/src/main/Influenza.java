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
public class Influenza extends Disease {
	
	

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

	public Influenza()
	{
		name = "Influenza";
		diseases = Arrays.asList("fever","cough","sore_throat","runny_nose",
				"muscle_ache","body_ache","headaches","fatigue");
	}
	
	public List<String> getDiseaseList()
	{
		return diseases;
		
	}
	

}
