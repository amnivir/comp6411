disease(influenza, [fever, 
cough, 
sore_throat, 
runny_nose,
muscle_ache, 
body_ache, 
headaches, 
fatigue]).

disease(aids, [fever, 
chills, 
rash, 
night_sweats, 
muscle_ache, 
sore_throat, 
fatigue, 
swollen_lymph_nodes, 
mouth_ulcers]).

disease(hepatitisC, [nausea, 
vomiting, 
stomach_pain,
muscle_pain, 
urine_abnormality, 
bowel_movements_abnormality, 
skin_yellowing, 
eyes_yellowing]).

disease(pregnancy, [mild_cramping_spotting,
missed period,
fatigue, 
nausea,
tingling_breasts,
aching_breasts,
frequent_urination, 	
bloating, 	
motion_sickness, 
mood_swings, 	
temperature_changes,
high_blood_pressure,
extreme_fatigue,
heartburn,
faster_heartbeat,
breast_changes,
nipple_changes, 	
acne, 	
noticeable_weight_gain, 	
pregnancy_glow
]).


% find diseases from symptoms, sort by certainty factor
diagnose(Symptoms, Diseases) :-
     setof(CF-Disease, common_symptoms(Symptoms, Disease, CF), Diseases).

common_symptoms(Symptoms_Patient, Disease, CF) :-
    disease(Disease, Symptoms_Disease),
    intersection(Symptoms_Patient, Symptoms_Disease, Common_Symptoms),
    length(Common_Symptoms, NCS),
    length(Symptoms_Disease, NSD),
    CF is NCS / NSD * 100.



