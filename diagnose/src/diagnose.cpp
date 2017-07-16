//============================================================================
// Name        : diagnose.cpp
// Author      :
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

const char * influenzaSymptoms[] = {
		"fever",
		"cough",
		"sore_throat",
		"runny_nose",
		"muscle_ache",
		"body_ache",
		"headaches",
		"fatigue"};

const char * hepatitisCsymptoms[] = {
		"nausea",
		"vomiting",
		"stomach_pain",
		"muscle_pain",
		"urine_abnormality",
		"bowel_movements_abnormality",
		"skin_yellowing",
		"eyes_yellowing"};

const char * aidsSymptoms[] = {
		"fever",
		"chills",
		"rash",
		"night_sweats",
		"muscle_ache",
		"sore_throat",
		"fatigue",
		"swollen_lymph_nodes",
		"mouth_ulcers"
};

const char * pregnancySymptoms[] = {
		"mild_cramping_spotting",
		"missed period",
		"fatigue",
		"nausea",
		"tingling_breasts",
		"aching_breasts",
		"frequent_urination",
		"bloating",
		"motion_sickness",
		"mood_swings",
		"temperature_changes",
		"high_blood_pressure",
		"extreme_fatigue",
		"heartburn",
		"faster_heartbeat",
		"breast_changes",
		"nipple_changes",
		"acne",
		"noticeable_weight_gain",
		"pregnancy_glow"
};

#define noOfSymptomsInfluenza  (sizeof (influenzaSymptoms) / sizeof (const char *))
#define noOfSymptomsHepatitisC (sizeof (hepatitisCsymptoms) / sizeof (const char *))
#define noOfSymptomsPregnancy  (sizeof (pregnancySymptoms) / sizeof (const char *))
#define noOfSymptomsAids (sizeof (aidsSymptoms) / sizeof (const char *))
#define NUM_DECEASES 4
enum Deceases {INFLUENZA, HEPATITISC, AIDS, PREGNANCY};

struct deceaseInfo
{
	enum  Deceases decease;
	float certainityFactor;
	int count;
};

void printDeseaseName(deceaseInfo dInfo[NUM_DECEASES], int i) {
	switch (dInfo[i].decease) {
	case INFLUENZA:
		printf("INFLUENZA\n");
		break;
	case AIDS:
		printf("AIDS\n");
		break;
	case PREGNANCY:
		printf("PREGNANCY\n");
		break;
	case HEPATITISC:
		printf("HEPATITISC\n");
		break;
	}
}

int main ()
{
	unsigned int i;


	//max 20 symptoms supported
	char * patientSymptoms[20] = {};

	printf ("*******Influenza Symptoms*********\n");
	for (i = 0; i < noOfSymptomsInfluenza; i++)
	{
		printf ("%d: %s\n", i, influenzaSymptoms[i]);
	}

	printf ("*******HepatitisC Symptoms*********\n");
	for (i = 0; i < noOfSymptomsHepatitisC; i++)
	{
		printf ("%d: %s\n", i, hepatitisCsymptoms[i]);
	}

	printf ("*******Pregnancy Symptoms*********\n");
	for (i = 0; i < noOfSymptomsPregnancy; i++)
	{
		printf ("%d: %s\n", i, pregnancySymptoms[i]);
	}

	printf ("*******AIDS Symptoms*********\n");
	for (i = 0; i < noOfSymptomsAids; i++)
	{
		printf ("%d: %s\n", i, aidsSymptoms[i]);
	}


	char ch[256];
	const char *exit = "n\n"; // exit key word
	int k = 0;
	do
	{
		printf("Enter symptoms or 'n' show the decision :\n");
		fgets(ch, sizeof(ch), stdin);
		//int size = strlen(ch);
		//		printf("length of string:%d\n",size);
		if(strcmp(ch, exit) == 0 || k == 20)
			break;

		patientSymptoms [k] = (char *)malloc (100);
		strncpy(patientSymptoms[k], ch, strlen(ch));

		//		printf("%s",ch);
		k++;

	}while(1);


	printf ("*******Patient Symptoms*********\n");
	for(int i = 0; i<k;i++)
	{
		printf ("%d: %s\n", i, patientSymptoms[i]);
	}


	/*
	 * Initialize Decease Info for a patient
	 */
	deceaseInfo dInfo[NUM_DECEASES];
	for(int i =0;i<NUM_DECEASES;++i)
	{
		dInfo[i].count = 0;
		dInfo[i].certainityFactor = 0;

	}

	dInfo[INFLUENZA].decease =  INFLUENZA;
	dInfo[AIDS].decease =  AIDS;
	dInfo[HEPATITISC].decease =  HEPATITISC;
	dInfo[PREGNANCY].decease =  PREGNANCY;

	//Influenza
	for(int i = 0; i<k;i++)
	{
		for (unsigned int j = 0; j < noOfSymptomsInfluenza; j++)
		{
			//printf("comparing %s, %s\n",influenzaSymptoms[j],patientSymptoms[i]);
			//printf("size %d, %d\n", (int)strlen(influenzaSymptoms[j]),(int)strlen(patientSymptoms[i]));
			int match = strncmp(influenzaSymptoms[j], patientSymptoms[i],strlen(influenzaSymptoms[j]));
			//printf("match=%d\n",match);

			if ( match == 0 )
			{
				dInfo[INFLUENZA].count++;
				break;
			}
		}
	}
	dInfo[INFLUENZA].certainityFactor = 100 * ( (float)dInfo[INFLUENZA].count / (float)noOfSymptomsInfluenza );


	//HepatitisC
	for(int i = 0; i<k;i++)
	{
		for (unsigned int j = 0; j < noOfSymptomsHepatitisC; j++)
		{
			//printf("comparing %s, %s\n",influenzaSymptoms[j],patientSymptoms[i]);
			//printf("size %d, %d\n", (int)strlen(influenzaSymptoms[j]),(int)strlen(patientSymptoms[i]));
			int match = strncmp(hepatitisCsymptoms[j], patientSymptoms[i],strlen(hepatitisCsymptoms[j]));
			//printf("match=%d\n",match);

			if ( match == 0 )
			{
				dInfo[HEPATITISC].count++;
				break;
			}
		}
	}
	dInfo[HEPATITISC].certainityFactor = 100 * ( (float)dInfo[HEPATITISC].count / (float)noOfSymptomsHepatitisC );

	//AIDS
	for(int i = 0; i<k;i++)
	{
		for (unsigned int j = 0; j < noOfSymptomsAids; j++)
		{
			//printf("comparing %s, %s\n",influenzaSymptoms[j],patientSymptoms[i]);
			//printf("size %d, %d\n", (int)strlen(influenzaSymptoms[j]),(int)strlen(patientSymptoms[i]));
			int match = strncmp(aidsSymptoms[j], patientSymptoms[i],strlen(aidsSymptoms[j]));
			//printf("match=%d\n",match);

			if ( match == 0 )
			{
				dInfo[AIDS].count++;
				break;
			}
		}
	}
	dInfo[AIDS].certainityFactor = 100 * ( (float)dInfo[AIDS].count / (float)noOfSymptomsAids ) ;

	//Pregnancy
	for(int i = 0; i<k;i++)
	{
		for (unsigned int j = 0; j < noOfSymptomsPregnancy; j++)
		{
			//printf("comparing %s, %s\n",influenzaSymptoms[j],patientSymptoms[i]);
			//printf("size %d, %d\n", (int)strlen(influenzaSymptoms[j]),(int)strlen(patientSymptoms[i]));
			int match = strncmp(pregnancySymptoms[j], patientSymptoms[i],strlen(pregnancySymptoms[j]));
			//printf("match=%d\n",match);

			if ( match == 0 )
			{
				dInfo[PREGNANCY].count++;
				break;
			}
		}
	}
	dInfo[PREGNANCY].certainityFactor = 100 * ( (float)dInfo[PREGNANCY].count / (float)noOfSymptomsPregnancy );

	//Sort the structure
	deceaseInfo temp;
	for (int i = 1; i < NUM_DECEASES; i++)
		for (int j = 0; j < NUM_DECEASES - i; j++) {
			if (dInfo[j+1].count > dInfo[j].count ) {
				temp = dInfo[j];
				dInfo[j] = dInfo[j + 1];
				dInfo[j + 1] = temp;
			}
		}


	//Print the structure
	for(int i =0;i<NUM_DECEASES;++i)
	{
		printDeseaseName(dInfo, i);

		printf("Count=%d\n",dInfo[i].count);
		printf("Certainity Factor=%4.2f\n",dInfo[i].certainityFactor);
	}

	printf("Most Probable Desease: ");
	printDeseaseName(dInfo, 0);

	/**
	 * free the memory that was taken by symptoms
	 */
	for(int i =0; i<k;i++)
	{
		free(patientSymptoms[i]);
	}

	return 0;
}
