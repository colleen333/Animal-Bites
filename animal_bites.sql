/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000)
LEFT([bite_date], 10)
	  AS bite_date

      ,[SpeciesIDDesc]
	  AS Species
	  ,CASE
		  WHEN [BreedIDDesc] = '' THEN 'UNKNOWN'
		  ELSE [BreedIDDesc] END 
		  AS Breed

	  , CASE
		  WHEN [GenderIDDesc] = '' THEN 'UNKNOWN' 
		  WHEN [GenderIDDesc] = 'MALE' THEN 'MALE' 
		  WHEN [GenderIDDesc] = 'FEMALE' THEN 'FEMALE'
		  WHEN [GenderIDDesc] = 'UNKNOWN' THEN 'UNKNOWN'
		 
		  END
		  AS Gender
      ,[color]
      ,[vaccination_yrs]
	  , LEFT([victim_zip], 5) AS victim_zipcode
	  , LEFT([vaccination_date], 10)
	  AS vaccination_date

      ,[AdvIssuedYNDesc]
      ,[WhereBittenIDDesc]
		 AS WhereBitten
		 ,CASE
		WHEN
			FORMAT(CAST([quarantine_date] as DATE), 'yyyy-MM-dd') = '1900-01-01' THEN 'Not Quarantined'
			ELSE FORMAT(CAST([quarantine_date] as DATE), 'yyyy-MM-dd')
			END
			AS Quarantine_date

			
		  

		  

      ,[DispositionIDDesc]
	  AS Release_From_Quarantine
      ,[ResultsIDDesc]
	  AS Lab_Results
  FROM [animal_bites].[dbo].[Health_AnimalBites]

--  deleted head_sent and release date insufficient and irrelevent data.

--WHERE ResultsIDDesc is NOT NULL

--eliminated null values and unknowns

WHERE [WhereBittenIDDesc]!= '' AND [WhereBittenIDDesc]!= 'UNKNOWN' 

AND [AdvIssuedYNDesc]!= ''
AND [victim_zip]!= '' 
AND [vaccination_date]!= ''
AND [vaccination_yrs]!= '' 
AND [color]!= ''
AND [SpeciesIDDesc]!= ''


