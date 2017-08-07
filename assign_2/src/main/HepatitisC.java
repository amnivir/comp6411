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
public class HepatitisC extends Disease {
	
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

	public HepatitisC() 
	{
		
		name = "HepatitisC";
		diseases = Arrays.asList("nausea","vomit","stomach_pain","muscle_pain", 
				"urine_abnormality","bowel_movements_abnormality","skin_yellowing", 
				"eyes_yellowing");
	}
	
	public List<String> getDiseaseList()
	{
		return diseases;
		
	}
	
	

}
