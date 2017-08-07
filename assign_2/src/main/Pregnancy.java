package main;

import java.util.Arrays;
import java.util.List;

public class Pregnancy extends Disease {
	
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

	public Pregnancy() 
	{
		
		name = "Pregnancy";
		diseases = Arrays.asList("mild_cramping_spotting","missed_period",
				"fatigue","nausea","tingling_breasts","aching_breasts",
				"frequent_urination","bloating","motion_sickness", 
				"mood_swings","temperature_changes","high_blood_pressure",
				"extreme_fatigue","heartburn","faster_heartbeat",
				"breast_changes","nipple_changes","acne", 	
				"noticeable_weight_gain","pregnancy_glow");
	}
	
	public List<String> getDiseaseList()
	{
		return diseases;
		
	}
	
	

}
