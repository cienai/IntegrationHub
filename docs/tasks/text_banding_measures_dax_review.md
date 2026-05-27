# Text-Banding Measures DAX Review

## meas.adj_dur_confidence
Source table: ssr_history
```dax
	measure 'meas.adj_dur_confidence' = ```
			
			
			VAR _conf =  ROUND([meas.ssr_history_adj_dur_conf]*100,0)           // get the avg of ci time allocation confidence
			
			var _status_ = 
			    IF(
			    _conf >= 0 && _conf <= 49, "Limited",
			        IF(
			            _conf >=50 && _conf <= 74, "Fair",
			            IF(
			                _conf >=75 && _conf <= 84, "Good",
			                IF(
			                    _conf >=85 && _conf <= 94, "Great",
			                    "Excellent"
			                )
			            )
			        )
			)
			
			
			
			RETURN 
			IF(
			    _conf <>0,
			    _status_ & " (" & _conf & ")"  // Convert _conf to integer text format
			)
			```
		displayFolder: _opps_detail
		lineageTag: fb0ed675-10ef-49f1-bad0-809ded7cb87f

	/// Description: Returns the categorical status number derived from adjusted duration confidence scoring.
```

## meas.time_allocation_confidence
Source table: users_history
```dax
	measure 'meas.time_allocation_confidence' = ```
			
			
			var _conf = ROUND(AVERAGE(users_history[ci_time_alloc_conf]),2)*100    // get the avg of ci time allocation confidence
			
			var _status_ = 
			    IF(
			    _conf >= 0 && _conf <= 49, "Limited",
			        IF(
			            _conf >=50 && _conf <= 74, "Fair",
			            IF(
			                _conf >=75 && _conf <= 84, "Good",
			                IF(
			                    _conf >=85 && _conf <= 94, "Great",
			                    "Excellent"
			                )
			            )
			        )
			)
			
			
			
			RETURN 
			IF(
			    _conf <>0,
			    _status_ & " (" & _conf & ")"  // Convert _conf to integer text format
			)
			
			```
		displayFolder: _acl_ta_analysis
		lineageTag: 30522698-ba19-4d59-a3c0-a10e54a3a4ae

	/// Measure meas.peek_inside_text_supports_aab.
	/// Purpose: Returns peek inside text supports aab.
	/// Calculation Logic: Uses the DAX expression to return the result.
	/// Dynamic Behavior: Respects current filter context.
	/// Format/Type: Unspecified
```

## meas.ai_score_text_value
Source table: metadata_ai_scores
```dax
	measure 'meas.ai_score_text_value' =
			
			VAR _score = [meas.average_ai_score]
			VAR _label =
			    SWITCH(
			        TRUE(),
			        _score >= 95, "Excellent",
			        _score >= 85, "Great",
			        _score >= 75, "Good",
			        _score >= 50, "Fair",
			        _score >= 0,  "Limited",
			        BLANK()
			    )
			RETURN
			    IF(ISBLANK(_label), " - ", _label)
		lineageTag: 8989505c-ff92-4181-ba3d-07b1e14dd582

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Unique AI score identifier
	column _sys_doc_id
		dataType: string
		lineageTag: 0553404d-2d1b-483d-8165-0cda87efe66e
		summarizeBy: none
		sourceColumn: _sys_doc_id

		annotation SummarizationSetBy = Automatic

	/// Is Active
	column _sys_is_active
		dataType: string
		lineageTag: 3237ca1e-6587-4d4d-b895-9838a49499c0
		summarizeBy: none
		sourceColumn: _sys_is_active

		annotation SummarizationSetBy = Automatic

	/// Modified On Date
	column _sys_modified_on
		dataType: dateTime
		formatString: General Date
		lineageTag: e4929e32-cf6f-4149-93db-f3d771d03c10
		summarizeBy: none
		sourceColumn: _sys_modified_on

		variation Variation
			isDefault
			relationship: 48b7e184-c69d-4bd1-b42e-0b05677f044d
			defaultHierarchy: LocalDateTable_69fd8ce2-ea49-4d03-91e4-9a7d63e1ec7e.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Category
	column category
		dataType: string
		lineageTag: fb019989-fe9b-424c-8fd3-a7e7f2aae590
		summarizeBy: none
		sourceColumn: category

		annotation SummarizationSetBy = Automatic

	/// Score Name
	column score_name
		dataType: string
		lineageTag: a8567782-46a4-4de2-bc50-2652ade448ac
		summarizeBy: none
		sourceColumn: score_name

		annotation SummarizationSetBy = Automatic

	/// Description
	column description
		dataType: string
		lineageTag: b6dd3403-84ad-4b86-a3e7-cced39219da9
		summarizeBy: none
		sourceColumn: description

		annotation SummarizationSetBy = Automatic

	/// Sort
	column sort
		dataType: int64
		formatString: 0
		lineageTag: a3bb9fb1-37ee-4f8e-bf36-e15a8efb9f3f
		summarizeBy: sum
		sourceColumn: sort

		annotation SummarizationSetBy = Automatic

	/// Factor 1 Name
	column factor_1_name
		dataType: string
		lineageTag: 9bfc524c-cd48-47a6-94b6-101d507330c9
		summarizeBy: none
		sourceColumn: factor_1_name

		annotation SummarizationSetBy = Automatic

	/// Factor 2 Name
	column factor_2_name
		dataType: string
		lineageTag: dfae5997-5f65-44ee-93e9-bc73ea5040c0
		summarizeBy: none
		sourceColumn: factor_2_name

		annotation SummarizationSetBy = Automatic

	/// Factor 3 Name
	column factor_3_name
		dataType: string
		lineageTag: a32a4896-9e4b-45df-8798-6f6e728817be
		summarizeBy: none
		sourceColumn: factor_3_name

		annotation SummarizationSetBy = Automatic

	/// Notes
	column notes
		dataType: string
		lineageTag: 24d91298-91c6-46ec-96da-f286ca9607d6
		summarizeBy: none
		sourceColumn: notes

		annotation SummarizationSetBy = Automatic

	/// Boost Expo
	column boost_expo
		dataType: double
		lineageTag: 7754aa79-c7fb-4e29-b06f-8bfdc3b32657
		summarizeBy: sum
		sourceColumn: boost_expo

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Weight
	column weight
		dataType: double
		lineageTag: 788f39e0-5905-4e80-9abe-f87980071ba5
		summarizeBy: sum
		sourceColumn: weight

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	partition metadata_ai_scores = m
		mode: import
		source = ```
				let
				    dbTable = getDBTable("metadata_ai_scores"),      // get the right table
				    dbTableTyped = Table.TransformColumnTypes(dbTable,{
				        {"_sys_doc_id", type text},
				        {"_sys_is_active", type text},
				        {"_sys_modified_on", type datetime},
				        {"boost_expo", type number},
				        {"category", type text},
				        {"description", type text},
				        {"factor_1_name", type text},
				        {"factor_2_name", type text},
				        {"factor_3_name", type text},
				        {"notes", type text},
				        {"score_name", type text},
				        {"sort", Int64.Type},
				        {"weight", type number}       
				        })
				   
				in
				   dbTableTyped
				```

	annotation PBI_NavigationStepName = Navigation

	annotation PBI_ResultType = Table

```

## meas.ai_scores_text
Source table: metadata_ai_scores
```dax
	measure 'meas.ai_scores_text' = ```
			
			
			var score = [meas.ai_score]
			
			var score_text = IF(
			    score > 94, "Excellent", 
			        If(score > 84,  "Great", 
			            If(score > 74 ,"Good", 
			                if(score> 49, "Fair", "Limited" 
			            )
			        )
			    )
			)  // use the legend
			
			
			RETURN  score_text
			
			```
		lineageTag: 7492dfc0-7677-44be-a2c6-b97c45c16627

	/// Measure meas.average_ai_score.
	/// Purpose: Returns the measure value from its DAX expression.
	/// Calculation Logic: Uses VAR/RETURN, AVERAGEX, MAX, MIN.
	/// Dynamic Behavior: Respects current filter context.
	/// Format/Type: 0
```

## meas.getHeatmapConditionalColor
Source table: metadata_heatmap_items
```dax
	measure 'meas.getHeatmapConditionalColor' = ```
			
			var _ai_score = [meas.getHeatmapKPI_AIScore]        // get the validated and not validated
			var _heatmapScore = [meas.getHeatmapScore]          // get the heatmap score
			var res = IF(
			                _ai_score = "Limited",
			                1,
			                IF(
			                    _ai_score in {"Fair","Good", "Great", "Excellent"} && _heatmapScore >=0 && _heatmapScore < 30, 2,
			                    IF(
			                         _ai_score in {"Fair","Good", "Great", "Excellent"} && _heatmapScore >=30 && _heatmapScore < 45, 3,
			                        IF(
			                             _ai_score in {"Fair","Good", "Great", "Excellent"} && _heatmapScore >=45 && _heatmapScore < 50, 4,
			                            IF(
			                                 _ai_score in {"Fair","Good", "Great", "Excellent"}&& _heatmapScore >=50 && _heatmapScore < 65, 5,
			                                IF(
			                                     _ai_score in {"Fair","Good", "Great", "Excellent"} && _heatmapScore >=65 && _heatmapScore < 80, 6,
			                                    IF(
			                                         _ai_score in {"Fair","Good", "Great", "Excellent"} && _heatmapScore >=80 && _heatmapScore <= 100, 7
			                                    )
			                                )
			                            )
			                        )
			                    )
			                )
			)
			
			RETURN
			res
			
			```
		formatString: 0
		displayFolder: heatmap_kpis
		lineageTag: ac5452d6-99a7-4005-9ef0-0e28aa4df057

	/// Measure meas.getHeatmapConditionalColor_new.
	/// Description: Helper measure that returns conditional color values used by heatmap visuals.
```

## meas.getHeatmapKPI_AIScore
Source table: metadata_heatmap_items
```dax
	measure 'meas.getHeatmapKPI_AIScore' =
			
			VAR kpi1 = [meas.kpi1_ai_score_trust_value]   -- 0–100 scale
			VAR kpi2 = [meas.kpi2_ai_score_trust_value]   -- 0–100 scale
			
			-- KPI2 is truly missing only when it returns BLANK
			VAR _kpi2_missing =
			    ISBLANK(kpi2)
			
			VAR _combined =
			    IF(
			        _kpi2_missing,
			        kpi1,                                -- use only KPI1
			        ROUND( (kpi1 + kpi2) / 2, 0 )        -- average 0–100 scores
			    )
			
			VAR res =
			    SWITCH(
			        TRUE(),
			        ISBLANK(_combined) || _combined < 50, "Limited",
			        _combined < 75, "Fair",
			        _combined < 85, "Good",
			        _combined < 95, "Great",
			        "Excellent"
			    )
			
			RETURN
			    res
		formatString: 0.00
		displayFolder: heatmap_kpis
		lineageTag: c5d815dd-024f-4300-b354-bfb72811632a

	/// Measure meas.getHeatmapKPI1_formula_used.
	/// Description: Returns the scoring formula label used for KPI 1 in heatmap metadata.
```

## meas.hypothesis_is_confirmed_details
Source table: metadata_heatmap_items
```dax
	measure 'meas.hypothesis_is_confirmed_details' = ```
			
			VAR _score = [meas.getHeatmapScore]         // Get the heatmap score
			VAR _ai_score = [meas.getHeatmapKPI_AIScore] // AI Score
			
			VAR res = 
			        IF(
			            _ai_score = "Limited", 
			            "ND",
			            IF(
			                _ai_score IN {"Fair", "Good", "Great", "Excellent"} && _score < 45, 
			                "Yes", 
			                "No"
			            )
			        )
			
			
			RETURN res
			```
		displayFolder: _heatmap_details
		lineageTag: 32d5ad33-d04f-4627-bf87-c5f1db82716e

	/// Measure meas.trueai_kpi1_max.
	/// Description: Returns configured maximum boundary for KPI 1 normalization.
```

## meas.KPI1_AI_score_bucket
Source table: metadata_heatmap_items
```dax
	measure 'meas.KPI1_AI_score_bucket' =
			
			VAR _score = [meas.kpi1_ai_score_trust_value]   -- 0-100 score
			
			RETURN
			SWITCH(
			    TRUE(),
			    _score >= 95, "Excellent",
			    _score >= 85, "Great",
			    _score >= 75, "Good",
			    _score >= 50, "Fair",
			    _score >= 0,  "Limited",
			    BLANK()
			)
		displayFolder: heatmap_kpis
		lineageTag: 97a5e09a-34cc-450c-bf60-8dbdd581d164

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Measure meas.kpi1_ai_score_trust.
	/// Description: Returns trust status for KPI 1 AI score quality.
```

## meas.KPI2_AI_score_bucket
Source table: metadata_heatmap_items
```dax
	measure 'meas.KPI2_AI_score_bucket' =
			
			VAR _score = [meas.kpi2_ai_score_trust_value]   -- 0-100 score
			
			RETURN
			SWITCH(
			    TRUE(),
			    _score >= 95, "Excellent",
			    _score >= 85, "Great",
			    _score >= 75, "Good",
			    _score >= 50, "Fair",
			    _score >= 0,  "Limited",
			    BLANK()
			)
		displayFolder: heatmap_kpis
		lineageTag: 5248f2f7-65f4-4b40-b2d7-284c0fd05fba

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Measure meas.kpi2_ai_score_trust.
	/// Description: Returns trust status for KPI 2 AI score quality.
```

## meas.propensity_tier_conditional_auc
Source table: quality_buckets
```dax
	measure 'meas.propensity_tier_conditional_auc' = ```
			
			var pros_auc = [meas.propensity_tier_prospecting_auc]            // get the each step auc
			var new_auc= [meas.propensity_tier_new_logo_auc]
			var post_auc = [meas.propensity_tier_post_sales_auc]
			var exist_auc = [meas.propensity_tier_existing_customer_selling_auc]
			
			var step_name = CALCULATE(MAX(ssr_history[step_name]))
			
			var auc_score = SWITCH(
			    TRUE(),
			    step_name = "Prospecting" || step_name = "Untouched" ,pros_auc,
			    step_name = "New Logo Selling", new_auc,                        // condition 
			    step_name = "Post-Sales Support", post_auc,
			    step_name = "Existing Customer Selling", exist_auc
			)
			
			var _conf = ROUND(auc_score*100, 0)
			
			var _status_ = 
			    IF(
			    _conf >= 0 && _conf <= 49, "Limited",
			        IF(
			            _conf >=50 && _conf <= 74, "Fair",
			            IF(
			                _conf >=75 && _conf <= 84, "Good",
			                IF(
			                    _conf >=85 && _conf <= 94, "Great",
			                    "Excellent"
			                )
			            )
			        )
			)
			
			
			
			RETURN 
			IF(
			    _conf <>0,
			    _status_ & " (" & _conf & ")"  // Convert _conf to integer text format
			)
			```
		displayFolder: _quality_measures
		lineageTag: f907a2f8-5dd2-43ed-863b-29f52804383c

	/// Column _sys_doc_id.
	column _sys_doc_id
		dataType: string
		lineageTag: 2f315d1c-946f-443c-83d4-9c4dd7536b0e
		summarizeBy: none
		sourceColumn: _sys_doc_id

		annotation SummarizationSetBy = Automatic

	/// Column step_name.
	column step_name
		dataType: string
		lineageTag: efcb5ddf-b15d-4d34-b13e-f0d16d07fd5f
		summarizeBy: none
		sourceColumn: step_name

		annotation SummarizationSetBy = Automatic

	/// Column prob_lower_bound.
	column prob_lower_bound
		dataType: double
		lineageTag: 4b71e0f3-4ee3-497f-b291-d22996df7096
		summarizeBy: none
		sourceColumn: prob_lower_bound

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column prob_upper_bound.
	column prob_upper_bound
		dataType: double
		lineageTag: 93ec3add-ecdc-43a3-a929-725e08f3f985
		summarizeBy: none
		sourceColumn: prob_upper_bound

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column bucket.
	column bucket
		dataType: string
		lineageTag: c4d16a3f-7805-4b53-9c3a-b915859f659b
		summarizeBy: none
		sourceColumn: bucket
		sortByColumn: bucket_num

		changedProperty = SortByColumn

		annotation SummarizationSetBy = Automatic

	/// Column bucket_num.
	column bucket_num
		dataType: int64
		formatString: 0
		lineageTag: 50b0465e-d300-4710-9d88-cbce3515570c
		summarizeBy: none
		sourceColumn: bucket_num

		changedProperty = SortByColumn

		annotation SummarizationSetBy = Automatic

	/// Column step_name_bucket_num.
	column step_name_bucket_num
		dataType: string
		lineageTag: a9d91316-bba5-4243-be8c-9ad92705a216
		summarizeBy: none
		sourceColumn: step_name_bucket_num

		annotation SummarizationSetBy = Automatic

	/// Column 'col.propensity_min_max_tier' = ```.
	column 'col.propensity_min_max_tier' = ```
			
			var bucket = CALCULATE(
			    MAX(
			        quality_buckets[bucket]  // get the propensity
			    )
			)
			
			VAR lower_prob =CALCULATE(
			    MAX(
			        quality_buckets[prob_lower_bound]       // get the lower bound of prob
			    )
			)
			
			VAR upper_prob =CALCULATE(
			    MAX(
			        quality_buckets[prob_upper_bound]       // get the upper bound of prob 
			    )
			)
			var res =bucket & " " & "(" & FORMAT(lower_prob, "0%") & "-" & FORMAT(upper_prob,"#%") & ")"  // adding min and max tier pct values with bucket name. for min and max tier, used format to get the % values ol.quality_bucket_min_max 
			
			RETURN
			res
			```
		lineageTag: c45c315c-0d17-4129-9524-de7c69f55cb2
		summarizeBy: none
		sortByColumn: bucket_num

		changedProperty = SortByColumn

		annotation SummarizationSetBy = Automatic

	/// Column 'col.trueai_propensity_min_max_tier_pros' = ```.
	column 'col.trueai_propensity_min_max_tier_pros' =
			
			var bucket = CALCULATE(
			    MAX(
			        quality_buckets[bucket]  // get the propensity
			    )
			)
			
			VAR lower_prob =CALCULATE(
			    MAX(
			        quality_buckets[prob_lower_bound]       // get the lower bound of prob
			    )
			)
			
			VAR upper_prob =CALCULATE(
			    MAX(
			        quality_buckets[prob_upper_bound]       // get the upper bound of prob
			    )
			)
			var res =bucket & " " & "(" & FORMAT(lower_prob, "0%") & "-" & FORMAT(upper_prob,"#%") & ")"  // legacy alias kept for existing visuals
			
			RETURN
			res
		lineageTag: 2d9e4282-67ae-4682-b7bf-58f2c39bc428
		summarizeBy: none
		sortByColumn: bucket_num

		changedProperty = SortByColumn

		annotation SummarizationSetBy = Automatic

	partition quality_buckets = m
		mode: import
		source =
				let
				    Source = companies_history,
				    #"Sorted Rows" = Table.Sort(Source,{{"_sys_processed_as_of", Order.Descending}}),
				    #"Kept First Rows" = Table.FirstN(#"Sorted Rows",1),
				    newTable = Table.SelectColumns(#"Kept First Rows", {"_sys_doc_id", "di_pred_post_sales_propensity_tiers", "di_pred_prospecting_propensity_tiers", "di_pred_new_logo_propensity_tiers", "di_pred_existing_customer_propensity_tiers"}),
				    dbTableNoNull = Table.SelectRows(newTable, each [di_pred_post_sales_propensity_tiers] <> null),
				    Parsed_JSON = Table.TransformColumns(dbTableNoNull,{{"di_pred_post_sales_propensity_tiers", Json.Document}, {"di_pred_prospecting_propensity_tiers", Json.Document}, {"di_pred_new_logo_propensity_tiers", Json.Document}, {"di_pred_existing_customer_propensity_tiers", Json.Document}}),
				
				
				    postsalesTable = Table.SelectColumns(Parsed_JSON, {"_sys_doc_id", "di_pred_post_sales_propensity_tiers"}),
				    postSalesAddCol = Table.AddColumn(postsalesTable, "direction", each "Post-Sales Support"),
				    postSalesExpanded = Table.ExpandRecordColumn(postSalesAddCol, "di_pred_post_sales_propensity_tiers", {"Lowest", "Low", "Mid", "High", "Highest"}, {"Lowest", "Low", "Mid", "High", "Highest"}),
				
				    ProsTable = Table.SelectColumns(Parsed_JSON, {"_sys_doc_id", "di_pred_prospecting_propensity_tiers"}),
				    ProsAddCol = Table.AddColumn(ProsTable, "direction", each "Prospecting"),
				    ProsExpanded = Table.ExpandRecordColumn(ProsAddCol, "di_pred_prospecting_propensity_tiers", {"Lowest", "Low", "Mid", "High", "Highest"}, {"Lowest", "Low", "Mid", "High", "Highest"}),
				
				    NewLogoTable = Table.SelectColumns(Parsed_JSON, {"_sys_doc_id", "di_pred_new_logo_propensity_tiers"}),
				    NewLogoAddCol = Table.AddColumn(NewLogoTable, "direction", each "New Logo Selling"),
				    NewLogoExpanded = Table.ExpandRecordColumn(NewLogoAddCol, "di_pred_new_logo_propensity_tiers", {"Lowest", "Low", "Mid", "High", "Highest"}, {"Lowest", "Low", "Mid", "High", "Highest"}),
				
				    UpsellingTable = Table.SelectColumns(Parsed_JSON, {"_sys_doc_id", "di_pred_existing_customer_propensity_tiers"}),
				    UpsellingAddCol = Table.AddColumn(UpsellingTable, "direction", each "Existing Customer Selling"),
				    UpsellingExpanded = Table.ExpandRecordColumn(UpsellingAddCol, "di_pred_existing_customer_propensity_tiers", {"Lowest", "Low", "Mid", "High", "Highest"}, {"Lowest", "Low", "Mid", "High", "Highest"}),
				
				    combinedTable = Table.Combine({postSalesExpanded, ProsExpanded, NewLogoExpanded, UpsellingExpanded}),
				
				    combineNoNull = Table.SelectRows(combinedTable, each [Lowest] <> null),
				    RenamedTable = Table.RenameColumns(combineNoNull,{{"direction", "step_name"}}),
				
				    LowestTable = Table.SelectColumns(RenamedTable, {"_sys_doc_id","step_name", "Lowest"}),
				    LowestAddCol = Table.AddColumn(LowestTable, "bucket", each "Lowest"),
				    LowestExpanded = Table.ExpandRecordColumn(LowestAddCol, "Lowest", {"l", "u"}, {"prob_lower_bound", "prob_upper_bound"}),
				
				
				    LowTable = Table.SelectColumns(RenamedTable, {"_sys_doc_id","step_name", "Low"}),
				    LowAddCol = Table.AddColumn(LowTable, "bucket", each "Low"),
				    LowExpanded = Table.ExpandRecordColumn(LowAddCol, "Low", {"l", "u"}, {"prob_lower_bound", "prob_upper_bound"}),
				
				
				    MidTable = Table.SelectColumns(RenamedTable, {"_sys_doc_id","step_name", "Mid"}),
				    MidAddCol = Table.AddColumn(MidTable, "bucket", each "Mid"),
				    MidExpanded = Table.ExpandRecordColumn(MidAddCol, "Mid", {"l", "u"}, {"prob_lower_bound", "prob_upper_bound"}),
				
				
				    HighTable = Table.SelectColumns(RenamedTable, {"_sys_doc_id","step_name", "High"}),
				    HighAddCol = Table.AddColumn(HighTable, "bucket", each "High"),
				    HighExpanded = Table.ExpandRecordColumn(HighAddCol, "High", {"l", "u"}, {"prob_lower_bound", "prob_upper_bound"}),
				
				    HighestTable = Table.SelectColumns(RenamedTable, {"_sys_doc_id","step_name", "Highest"}),
				    HighestAddCol = Table.AddColumn(HighestTable, "bucket", each "Highest"),
				    HighestExpanded = Table.ExpandRecordColumn(HighestAddCol, "Highest", {"l", "u"}, {"prob_lower_bound", "prob_upper_bound"}),
				
				    NewcombinedTable = Table.Combine({LowestExpanded, LowExpanded, MidExpanded, HighExpanded,HighestExpanded}),
				    finalTablewithBucketNumber = Table.AddColumn(NewcombinedTable, "bucket_num", each if [bucket] = "Lowest" then 1 else if [bucket] = "Low" then 2 else if [bucket] = "Mid" then 3 else if [bucket] = "High" then 4 else if [bucket] = "Highest" then 5 else null),
				    #"Sorted Rows1" = Table.Sort(finalTablewithBucketNumber,{{"step_name", Order.Ascending},{"bucket_num", Order.Ascending}}),
				    ChangedType = Table.TransformColumnTypes(#"Sorted Rows1",{{"prob_lower_bound", type number}, {"prob_upper_bound", type number}, {"bucket", type text}, {"bucket_num", Int64.Type}, {"step_name", type text}}),
				    AddedCombineCol = Table.AddColumn(ChangedType, "step_name_bucket_num", each Text.Combine({[step_name], "-", [bucket]}))
				in
				    AddedCombineCol

	annotation PBI_ResultType = Exception

	annotation PBI_NavigationStepName = Navigation

```

## meas.propensity_tier_conditional_r2
Source table: quality_buckets
```dax
	measure 'meas.propensity_tier_conditional_r2' = ```
			
			var pros_r2 = [meas.propensity_tier_prospecting_r2]
			var new_r2 = [meas.propensity_tier_new_logo_r2]
			var post_r2 = [meas.propensity_tier_post_sales_r2]
			var exist_r2 = [meas.propensity_tier_existing_customer_selling_r2]
			
			var step_name = CALCULATE(MAX(ssr_history[step_name]))
			
			var r2_score = SWITCH(
			    TRUE(),
			    step_name = "Prospecting" || step_name = "Untouched" ,pros_r2,
			    step_name = "New Logo Selling", new_r2,
			    step_name = "Post-Sales Support", post_r2,
			    step_name = "Existing Customer Selling", exist_r2
			)
			
			var _conf = ROUND(r2_score*100, 0)
			
			var _status_ = 
			    IF(
			    _conf >= 0 && _conf <= 49, "Limited",
			        IF(
			            _conf >=50 && _conf <= 74, "Fair",
			            IF(
			                _conf >=75 && _conf <= 84, "Good",
			                IF(
			                    _conf >=85 && _conf <= 94, "Great",
			                    "Excellent"
			                )
			            )
			        )
			)
			
			
			
			RETURN 
			IF(
			    _conf <>0,
			    _status_ & " (" & _conf & ")"  // Convert _conf to integer text format
			)
			```
		displayFolder: _quality_measures
		lineageTag: 25e9c210-f17e-479a-9f65-8acce3eeb3c7

	/// Measure meas.quality_bucket_conditional_auc.
	/// Purpose: Compute the measure result from the DAX expression and current filter context.
	/// Calculation Logic: See DAX expression.
	/// Dynamic Behavior: See DAX expression.
	/// Format/Type: Unspecified
```

## meas.in_last_12m_from_reference_date
Source table: companies_history
```dax
	measure 'meas.in_last_12m_from_reference_date' =
			
			VAR _refDate =
			    MAX('companies_history'[_sys_reference_date])        // use each company's config date
			VAR _startDate =
			    EDATE(_refDate, -12)                                 // go back 12 months
			RETURN
			    IF(
			        MAX('companies_history'[_sys_filt_end_date]) >= _startDate &&
			        MAX('companies_history'[_sys_filt_end_date]) <= _refDate,
			        1,
			        0
			    )
		lineageTag: d4395789-04f8-40d3-9d0b-ff62ca2c45cb

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// The date of the last data request from the platform
	column _sys_as_of
		dataType: dateTime
		formatString: General Date
		lineageTag: bb2b6732-b5be-40aa-945d-10562f2dfd60
		summarizeBy: none
		sourceColumn: _sys_as_of

		variation Variation
			isDefault
			relationship: d8087f13-03e8-4fda-a396-3de3a699d27e
			defaultHierarchy: LocalDateTable_453f9a55-6d2c-4a3a-aed5-c88d1d988ac9.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// The Cien company ID
	column _sys_co_id
		dataType: string
		lineageTag: 4bd57827-856d-4cde-a0c1-c177558f4558
		summarizeBy: none
		sourceColumn: _sys_co_id

		annotation SummarizationSetBy = Automatic

	/// Unique record identifier
	column _sys_doc_id
		dataType: string
		lineageTag: c6e1bafe-6258-4749-a760-02404ee60542
		summarizeBy: none
		sourceColumn: _sys_doc_id

		annotation SummarizationSetBy = Automatic

	/// The end date of the record, stripped of time
	column _sys_filt_end_date
		dataType: dateTime
		formatString: Long Date
		lineageTag: 5e433655-bd26-45a3-853f-7c3ae4139013
		summarizeBy: none
		sourceColumn: _sys_filt_end_date

		variation Variation
			isDefault
			relationship: ffca7695-5bbf-457f-bad2-df9ba39926e6
			defaultHierarchy: LocalDateTable_98bd9f6a-b25a-4213-9dc4-832bf6d50574.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

		annotation UnderlyingDateTimeDataType = Date

	/// The start date of the record, stripped of time
	column _sys_filt_start_date
		dataType: dateTime
		formatString: Long Date
		lineageTag: e2fd8455-a974-40af-97cf-8a160b1cf333
		summarizeBy: none
		sourceColumn: _sys_filt_start_date

		variation Variation
			isDefault
			relationship: 9e3e13f4-423c-4d11-b26c-cf0a4bca8a2f
			defaultHierarchy: LocalDateTable_648389c1-a1c5-462a-a7c7-266a1c517540.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

		annotation UnderlyingDateTimeDataType = Date

	/// The date of the last data modification in the platform
	column _sys_last_modified_on
		dataType: dateTime
		formatString: Long Date
		lineageTag: 80c9f7f1-1491-45ac-8890-7cb14dea5754
		summarizeBy: none
		sourceColumn: _sys_last_modified_on

		variation Variation
			isDefault
			relationship: 4b3b34b3-b62a-49e4-8524-18f2aa9b74a2
			defaultHierarchy: LocalDateTable_91382215-9109-4075-bf03-b3036daa2743.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// The date of running the export
	column _sys_processed_as_of
		dataType: dateTime
		formatString: General Date
		lineageTag: 370421e0-58be-4cbc-835d-9574a7a50ac8
		summarizeBy: none
		sourceColumn: _sys_processed_as_of

		variation Variation
			isDefault
			relationship: 8dd9562a-8fb8-4d8a-bfee-56e1add92487
			defaultHierarchy: LocalDateTable_ded4ece7-1439-4c84-ab37-0bb006b8527e.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Company's currency
	column company_currency
		dataType: string
		lineageTag: 0cee561d-0952-4add-b500-7308145949b3
		summarizeBy: none
		sourceColumn: company_currency

		annotation SummarizationSetBy = Automatic

	/// Company name
	column company_name
		dataType: string
		lineageTag: 8c7c3b88-3dcf-4f8d-a252-a2a81a1be186
		summarizeBy: none
		sourceColumn: company_name

		annotation SummarizationSetBy = Automatic

	/// Company size factors impacting the ACV
	column di_acv_company_size_factors
		dataType: string
		lineageTag: af2745a8-e7b0-48d2-8640-1e7946bde4c6
		summarizeBy: none
		sourceColumn: di_acv_company_size_factors

		annotation SummarizationSetBy = Automatic

	/// Country factors impacting the ACV
	column di_acv_country_factors
		dataType: string
		lineageTag: cd57a65c-567f-4b3e-9b6b-7ec32f20f82f
		summarizeBy: none
		sourceColumn: di_acv_country_factors

		annotation SummarizationSetBy = Automatic

	/// Industry factors impacting the ACV
	column di_acv_industry_factors
		dataType: string
		lineageTag: 9f4be908-25a7-4651-96a8-73dd7dae9937
		summarizeBy: none
		sourceColumn: di_acv_industry_factors

		annotation SummarizationSetBy = Automatic

	/// Sum of booking amounts of opportunities won in the past 12 months
	column di_amt_won_last12months
		dataType: double
		lineageTag: 90bebe13-0452-4011-a0da-5c2d1c0b737e
		summarizeBy: sum
		sourceColumn: di_amt_won_last12months

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// AUC score of the probability of new logo win
	column di_pred_new_logo_auc
		dataType: double
		lineageTag: 9fd81794-8663-4390-96d0-1bfe31edc0c8
		summarizeBy: average
		sourceColumn: di_pred_new_logo_auc

		annotation SummarizationSetBy = User

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// R2 score of the probability of new logo win
	column di_pred_new_logo_r2
		dataType: double
		lineageTag: 1d51cae8-27a0-447a-a12e-37b704ea1e3b
		summarizeBy: average
		sourceColumn: di_pred_new_logo_r2

		annotation SummarizationSetBy = User

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// AUC score of the probability of next opportunity creation
	column di_pred_post_sales_auc
		dataType: double
		formatString: 0.00
		lineageTag: 12f6c76d-c922-4680-bc85-cb0cfabd3ee3
		summarizeBy: average
		sourceColumn: di_pred_post_sales_auc

		annotation SummarizationSetBy = User

	/// Tiers for the probability of next opportunity creation prediction buckets
	column di_pred_post_sales_propensity_tiers
		dataType: string
		lineageTag: 1c0e4c2c-d7ae-4f01-acdb-a928b2bb8e51
		summarizeBy: none
		sourceColumn: di_pred_post_sales_propensity_tiers

		annotation SummarizationSetBy = Automatic

	/// R2 score of the probability of next opportunity creation
	column di_pred_post_sales_r2
		dataType: double
		formatString: 0.00
		lineageTag: e5f64981-169b-41e5-8df0-bbc9f8705f3b
		summarizeBy: average
		sourceColumn: di_pred_post_sales_r2

		annotation SummarizationSetBy = User

	/// AUC score of the probability of conversion
	column di_pred_prospecting_auc
		dataType: double
		lineageTag: 76bdbd23-5067-42d0-9e87-8b75595487c7
		summarizeBy: average
		sourceColumn: di_pred_prospecting_auc

		annotation SummarizationSetBy = User

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Tiers for the probability of conversion prediction buckets
	column di_pred_prospecting_propensity_tiers
		dataType: string
		lineageTag: 6584a779-fb63-44ae-b66d-39c9560b0818
		summarizeBy: none
		sourceColumn: di_pred_prospecting_propensity_tiers

		annotation SummarizationSetBy = Automatic

	/// R2 score of the probability of conversion
	column di_pred_prospecting_r2
		dataType: double
		lineageTag: ebe87503-8962-4914-a4c7-3522e09ebc54
		summarizeBy: average
		sourceColumn: di_pred_prospecting_r2

		annotation SummarizationSetBy = User

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Partner company logo
	column partner_base64_logo
		dataType: string
		lineageTag: b2294df3-dd0e-48cc-b02c-f3f0be4514ef
		dataCategory: ImageUrl
		summarizeBy: none
		sourceColumn: partner_base64_logo

		annotation SummarizationSetBy = Automatic

	/// Partner company ID
	column partner_co_id
		dataType: string
		lineageTag: b180a878-35e0-4306-aaae-bc93e64cea84
		summarizeBy: none
		sourceColumn: partner_co_id

		annotation SummarizationSetBy = Automatic

	/// Partner company name
	column partner_name
		dataType: string
		lineageTag: 399be482-12d9-4ff0-bfc6-6aa1c6f06f78
		summarizeBy: none
		sourceColumn: partner_name

		annotation SummarizationSetBy = Automatic

	/// Partner company product name
	column partner_product_name
		dataType: string
		lineageTag: 98bd37c1-5715-40ac-9244-a7810271b053
		summarizeBy: none
		sourceColumn: partner_product_name

		annotation SummarizationSetBy = Automatic

	/// Date of last attempt to run the company's processing
	column processing_all_last_attempt
		dataType: dateTime
		formatString: General Date
		lineageTag: e39a5627-c251-4d7c-8829-5fa7ec796691
		summarizeBy: none
		sourceColumn: processing_all_last_attempt

		variation Variation
			isDefault
			relationship: bb21b255-5bdf-489e-8716-81eb76f76bb0
			defaultHierarchy: LocalDateTable_995ff945-6872-46e1-b943-ede9d0e6a9cb.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Date of last successful attempt to run the company's processing
	column processing_all_last_success
		dataType: dateTime
		formatString: General Date
		lineageTag: 4de8cda7-ebc8-4704-bac3-734a4d7660d1
		summarizeBy: none
		sourceColumn: processing_all_last_success

		variation Variation
			isDefault
			relationship: 2382c996-e8d6-4cfe-8685-b3a90462ec2a
			defaultHierarchy: LocalDateTable_8127ab82-e7dc-4af8-b410-1c0e859e77ad.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Time in seconds it took to run the company's processing
	column processing_all_last_success_time_sec
		dataType: double
		lineageTag: d7e78439-3e69-4667-9ef6-f58cc86ceb0f
		summarizeBy: sum
		sourceColumn: processing_all_last_success_time_sec

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Date of last attempt to run the company's API exports
	column processing_api_export_last_attempt
		dataType: dateTime
		formatString: General Date
		lineageTag: 1e53800d-2200-40f1-a752-d154c5f25953
		summarizeBy: none
		sourceColumn: processing_api_export_last_attempt

		variation Variation
			isDefault
			relationship: 1331aaf7-bbc0-4f1e-89f5-085131ed7633
			defaultHierarchy: LocalDateTable_97024d0d-e943-4ba7-ae94-a393b9fd234a.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Date of last successful attempt to run the company's API exports
	column processing_api_export_last_success
		dataType: dateTime
		formatString: General Date
		lineageTag: 263164df-dfeb-4a52-ae6f-5af81fca55ed
		summarizeBy: none
		sourceColumn: processing_api_export_last_success

		variation Variation
			isDefault
			relationship: b842b985-7467-4545-9f54-55566f6a6696
			defaultHierarchy: LocalDateTable_93d45a5e-99e8-4a2f-8562-e5c0f4f4f39d.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Time in seconds it took to run the company's API exports
	column processing_api_export_last_success_time_sec
		dataType: double
		lineageTag: f487863c-0d66-4b5e-af93-6fa429b9dbca
		summarizeBy: sum
		sourceColumn: processing_api_export_last_success_time_sec

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Latest system modstamp date on activities
	column processing_max_last_modified_on_act
		dataType: dateTime
		formatString: General Date
		lineageTag: 8ccd0cff-11b8-484b-b895-27cd51a5274d
		summarizeBy: none
		sourceColumn: processing_max_last_modified_on_act

		variation Variation
			isDefault
			relationship: 0d9a0534-63b6-486d-a2c9-e58a20946e1f
			defaultHierarchy: LocalDateTable_02207aa1-5929-4872-86b3-60ace1acd3c9.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Latest system modstamp date on opp_histories
	column processing_max_last_modified_on_opp_histories
		dataType: dateTime
		formatString: General Date
		lineageTag: 7e399514-508b-4766-8aae-413074f10fdc
		summarizeBy: none
		sourceColumn: processing_max_last_modified_on_opp_histories

		variation Variation
			isDefault
			relationship: 99c114ba-0a31-47e5-b576-612f2110b3f3
			defaultHierarchy: LocalDateTable_6c251f3d-30d4-4bda-8ff2-c2b021eaf2a6.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Latest system modstamp date on opps
	column processing_max_last_modified_on_opps
		dataType: dateTime
		formatString: General Date
		lineageTag: e80ac017-5a20-4826-86fd-811afb9784b2
		summarizeBy: none
		sourceColumn: processing_max_last_modified_on_opps

		variation Variation
			isDefault
			relationship: e7caa9ae-6cad-421a-b96e-e1d00297f0eb
			defaultHierarchy: LocalDateTable_bcf3df37-ac64-4d60-9de2-aa90782c5b34.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Latest system modstamp date on users
	column processing_max_last_modified_on_users
		dataType: dateTime
		formatString: General Date
		lineageTag: d34d3c3c-f98b-4600-94d9-476dbaee2a12
		summarizeBy: none
		sourceColumn: processing_max_last_modified_on_users

		variation Variation
			isDefault
			relationship: 8bf44e26-dbdf-4fae-8ae5-dba3b1015755
			defaultHierarchy: LocalDateTable_705f362c-05e5-4969-a961-edba265e78b0.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Date of last attempt to run the company's sync
	column processing_sync_last_attempt
		dataType: dateTime
		formatString: General Date
		lineageTag: 5fd71e15-6865-44c5-8e28-e917ed9893d8
		summarizeBy: none
		sourceColumn: processing_sync_last_attempt

		variation Variation
			isDefault
			relationship: 43dbdd5d-2e5c-4a6e-8898-9b5a836ccb2b
			defaultHierarchy: LocalDateTable_cd4eca78-e564-409a-ab88-1bd7007744c2.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Date of last successful attempt to run the company's sync
	column processing_sync_last_success
		dataType: dateTime
		formatString: General Date
		lineageTag: 36fd785d-eaf1-4a22-aa9f-78aae09acadb
		summarizeBy: none
		sourceColumn: processing_sync_last_success

		variation Variation
			isDefault
			relationship: 571b5a2e-07a0-4e65-a508-9bd5a582aa2f
			defaultHierarchy: LocalDateTable_e20718e3-6e2e-4668-9ef3-f88a8976dc2d.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Time in seconds it took to run the company's sync
	column processing_sync_last_success_time_sec
		dataType: double
		lineageTag: 26ea7f89-96d9-4278-927a-09bce31e085c
		summarizeBy: sum
		sourceColumn: processing_sync_last_success_time_sec

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Date of last attempt to run the company's raw transform
	column processing_transform_last_attempt
		dataType: dateTime
		formatString: General Date
		lineageTag: 0dde759c-d2aa-4e29-b131-7a90b6cc7f0a
		summarizeBy: none
		sourceColumn: processing_transform_last_attempt

		variation Variation
			isDefault
			relationship: cb562ab9-38fb-4957-9c51-ffe45b20abbf
			defaultHierarchy: LocalDateTable_49a6c191-c3cb-48df-a591-4233189b47f7.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Date of last successful attempt to run the company's raw transform
	column processing_transform_last_success
		dataType: dateTime
		formatString: General Date
		lineageTag: 0e2325f8-ffbc-41bf-ae45-5fa7c62c65f7
		summarizeBy: none
		sourceColumn: processing_transform_last_success

		variation Variation
			isDefault
			relationship: cd560ab0-b96c-4205-b3dc-c8921ae6a455
			defaultHierarchy: LocalDateTable_507f3238-b6af-427e-a15d-5fc3797ca082.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Time in seconds it took to run the company's raw transform
	column processing_transform_last_success_time_sec
		dataType: double
		lineageTag: fd433b92-f858-44e0-bd3b-aa3180e92c30
		summarizeBy: sum
		sourceColumn: processing_transform_last_success_time_sec

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Number of users
	column users
		dataType: int64
		formatString: 0
		lineageTag: ea95b0fe-b4f7-422a-966f-5a037497281c
		summarizeBy: sum
		sourceColumn: users

		annotation SummarizationSetBy = Automatic

	/// Number of active users
	column users_active
		dataType: int64
		formatString: 0
		lineageTag: 0f5cf7fa-a7a8-4ec6-a8a5-726656a19392
		summarizeBy: sum
		sourceColumn: users_active

		annotation SummarizationSetBy = Automatic

	/// Number of active sales users
	column users_sales
		dataType: int64
		formatString: 0
		lineageTag: 6c5d7bf4-6f69-4046-8162-6eada4801a6b
		summarizeBy: sum
		sourceColumn: users_sales

		annotation SummarizationSetBy = Automatic

	/// Processing mode
	column processing_mode
		dataType: string
		lineageTag: 3f37848e-d098-4a61-b62e-f1dbd3137c7f
		summarizeBy: none
		sourceColumn: processing_mode

		annotation SummarizationSetBy = Automatic

	/// The processing cluster imaging size
	column _sys_image_size
		dataType: string
		lineageTag: be11cefa-8a16-48af-a6fd-b36f407f3a94
		summarizeBy: none
		sourceColumn: _sys_image_size

		annotation SummarizationSetBy = Automatic

	/// The current release version
	column _sys_version
		dataType: string
		lineageTag: ff0eea27-8f5f-4bfb-8c40-2e084bdcce8e
		summarizeBy: none
		sourceColumn: _sys_version

		annotation SummarizationSetBy = Automatic

	/// The reference date used as benchmark for the calculations
	column _sys_reference_date
		dataType: dateTime
		formatString: Long Date
		lineageTag: 0d9e28a6-119a-423a-80be-5a538c775b9e
		summarizeBy: none
		sourceColumn: _sys_reference_date

		variation Variation
			isDefault
			relationship: be53254a-bb5c-48ce-8f71-0af0a214d070
			defaultHierarchy: LocalDateTable_946076f8-85fb-48d2-b200-27d2e6252f0c.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Boolean flag indicating whether the company is scheduled daily
	column _sys_scheduled_daily
		dataType: boolean
		formatString: """TRUE"";""TRUE"";""FALSE"""
		lineageTag: a84535c7-a64c-47f1-beab-aaef83f15045
		summarizeBy: none
		sourceColumn: _sys_scheduled_daily

		annotation SummarizationSetBy = Automatic

	/// Boolean flag indicating whether the company is scheduled weekly
	column _sys_scheduled_weekly
		dataType: boolean
		formatString: """TRUE"";""TRUE"";""FALSE"""
		lineageTag: d0560362-616c-4e44-866d-ea377c4ffd91
		summarizeBy: none
		sourceColumn: _sys_scheduled_weekly

		annotation SummarizationSetBy = Automatic

	/// Workspace or group name in powerBI
	column pbi_workspace_name
		dataType: string
		lineageTag: f078f032-6e6e-4c85-bb01-5dbb7c278aa8
		summarizeBy: none
		sourceColumn: pbi_workspace_name

		annotation SummarizationSetBy = Automatic

	/// Workspace or group url in powerBI
	column pbi_workspace_url
		dataType: string
		lineageTag: 949e82ee-6d96-4563-86fb-affe81395a13
		summarizeBy: none
		sourceColumn: pbi_workspace_url

		annotation SummarizationSetBy = Automatic

	/// AUC score of the probability of existing customer selling win
	column di_pred_existing_customer_selling_auc
		dataType: double
		lineageTag: 6850e370-7996-4521-85fa-de4d1bfb9e12
		summarizeBy: average
		sourceColumn: di_pred_existing_customer_selling_auc

		annotation SummarizationSetBy = User

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// R2 score of the probability of existing customer selling win
	column di_pred_existing_customer_selling_r2
		dataType: double
		lineageTag: 09c59a3e-28b1-4a81-a9f9-f277fe718012
		summarizeBy: average
		sourceColumn: di_pred_existing_customer_selling_r2

		annotation SummarizationSetBy = User

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column 'col.pred_successs_prospecting_score' = ```.
	column 'col.pred_successs_prospecting_score' = ```
			
			var r2 = [di_pred_prospecting_r2]               // get the prospecting r2
			var auc = [di_pred_prospecting_auc]             // get the prospecting auc
			var expo_val = 0.65 //  after the score  let's use this expo
			var rs_norm  = MAX(r2, 0) // let's removed the neg 
			var auc_norm  = (MAX((auc-0.5),0)) + 0.5  //  applying the formula rob mentioned
			
			var score  = ((rs_norm + auc_norm)/2) ^ expo_val  //  normalized score and  boosting
			var res = round(score * 100 ,0)  // rounding the nu,mber
			return res 
			```
		lineageTag: edb62ecb-8b69-46cc-9865-e7a3cad845f4
		summarizeBy: sum

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column 'col.pred_successs_new_logo_selling_score' = ```.
	column 'col.pred_successs_new_logo_selling_score' = ```
			
			var r2 = [di_pred_new_logo_r2]               // get the new logo selling r2
			var auc = [di_pred_new_logo_auc]             // get the new logo selling auc
			var expo_val = 0.65 //  after the score  let's use this expo
			var rs_norm  = MAX(r2, 0) // let's removed the neg 
			var auc_norm  = (MAX((auc-0.5),0)) + 0.5  //  applying the formula rob mentioned
			
			var score  = ((rs_norm + auc_norm)/2) ^ expo_val  //  normalized score and  boosting
			var res = round(score * 100 ,0)  // rounding the nu,mber
			return res 
			```
		lineageTag: 2a40efed-e621-4f03-88a5-e23e3863f0c8
		summarizeBy: sum

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column 'col.pred_successs_post_sales_support_score' = ```.
	column 'col.pred_successs_post_sales_support_score' = ```
			
			var r2 = [di_pred_post_sales_r2]               // get the post sales support r2
			var auc = [di_pred_post_sales_auc]             // get the post sales support auc
			var expo_val = 0.65 //  after the score  let's use this expo
			var rs_norm  = MAX(r2, 0) // let's removed the neg 
			var auc_norm  = (MAX((auc-0.5),0)) + 0.5  //  applying the formula rob mentioned
			
			var score  = ((rs_norm + auc_norm)/2) ^ expo_val  //  normalized score and  boosting
			var res = round(score * 100 ,0)  // rounding the nu,mber
			return res 
			```
		lineageTag: 2c7476e0-400d-4fe0-8e45-af51aa31b4e4
		summarizeBy: sum

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column 'col.pred_successs_existing_customer_selling_score' = ```.
	column 'col.pred_successs_existing_customer_selling_score' = ```
			
			var r2 = [di_pred_existing_customer_selling_r2]               // get the existing customer selling r2
			var auc = [di_pred_existing_customer_selling_auc]             // get the existing customer selling auc
			var expo_val = 0.65 //  after the score  let's use this expo
			var rs_norm  = MAX(r2, 0) // let's removed the neg 
			var auc_norm  = (MAX((auc-0.5),0)) + 0.5  //  applying the formula rob mentioned
			
			var score  = ((rs_norm + auc_norm)/2) ^ expo_val  //  normalized score and  boosting
			var res = round(score * 100 ,0)  // rounding the nu,mber
			return res 
			```
		lineageTag: cb69e5e9-23b6-426f-8b43-297331da6a60
		summarizeBy: sum

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column 'col.pred_success_score' = ```.
	column 'col.pred_success_score' = ```
			
			var temp_tbl  = {
			                    [col.pred_successs_prospecting_score],
			                    [col.pred_successs_new_logo_selling_score],
			                    [col.pred_successs_post_sales_support_score],       //creating a temp table 
			                    [col.pred_successs_existing_customer_selling_score]
			                } 
			            
			var score = AVERAGEX(temp_tbl,[Value]) // avg the values that are not null. col name is "Value" since not specified
			
			var res = round(score * 1 ,0) // make it an integer score
			return res 
			```
		lineageTag: 69bb1c23-179d-4d6a-af5d-61cb64637ce7
		summarizeBy: sum

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column 'col.pred_success_score_text' = ```.
	column 'col.pred_success_score_text' = ```
			
			var score = [col.pred_success_score] // get the pred_success_score
			
			var res =IF(
			    score > 94, "Excellent", 
			        If(score > 84,  "Great", 
			            If(score > 74 ,"Good", 
			                if(score> 49, "Fair", "Limited" 
			            )
			        )
			    )
			)  // use the legend
			return res 
			```
		lineageTag: dd2c1dab-15f5-4a1a-bc14-07fe2c84fb4a
		summarizeBy: none

		annotation SummarizationSetBy = Automatic

	/// Fiscal year offset
	column fiscal_year_offset
		dataType: int64
		formatString: 0
		lineageTag: f3b4e831-27a7-4c60-ab40-2302a0b3d76a
		summarizeBy: sum
		sourceColumn: fiscal_year_offset

		annotation SummarizationSetBy = Automatic

	/// Average AUC score of the success probability when training
	column di_success_prob_training_score
		dataType: double
		lineageTag: 6eaf0303-93c0-486e-8aa1-232fb425f78b
		summarizeBy: sum
		sourceColumn: di_success_prob_training_score

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Average AUC score of the success probability on the validation set
	column di_success_prob_validation_score
		dataType: double
		lineageTag: 5d615dbd-f1ca-4cf2-993b-1a8a47c48dfa
		summarizeBy: sum
		sourceColumn: di_success_prob_validation_score

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// STATUS
	column status
		dataType: string
		lineageTag: 6cc6c657-e6ef-4ca7-89a8-cc298b3c43b8
		summarizeBy: none
		sourceColumn: status

		annotation SummarizationSetBy = Automatic

	/// region
	column region
		dataType: string
		lineageTag: d847add2-dd7f-4b4d-871f-8a805a05eec7
		summarizeBy: none
		sourceColumn: region

		annotation SummarizationSetBy = Automatic

	/// Added On Date
	column added_on
		dataType: dateTime
		formatString: General Date
		lineageTag: b43274f9-9a8f-4cde-a5aa-a08130b28432
		summarizeBy: none
		sourceColumn: added_on

		variation Variation
			isDefault
			relationship: 087934f7-9f13-43d5-84e4-c6ccae4b0621
			defaultHierarchy: LocalDateTable_1c349e7f-5ccd-46ca-b4b5-15a9f36a653b.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// deactivated_on
	column deactivated_on
		dataType: dateTime
		formatString: General Date
		lineageTag: e7c02984-cbb5-4eee-a079-e5f4bf930b21
		summarizeBy: none
		sourceColumn: deactivated_on

		variation Variation
			isDefault
			relationship: 11d58592-680a-4958-b0d3-5c6ab00de5f8
			defaultHierarchy: LocalDateTable_58f9ddd7-a641-4d77-bcb4-84ec8de4fb99.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// purged_on
	column purged_on
		dataType: dateTime
		formatString: General Date
		lineageTag: 5abfe6ff-5009-4068-8b72-256c40902ab0
		summarizeBy: none
		sourceColumn: purged_on

		variation Variation
			isDefault
			relationship: 6c97ee3b-9661-4cba-bc46-97dcda992d08
			defaultHierarchy: LocalDateTable_78a834fb-36df-4d38-b23f-94167c2005c4.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// crm_conn_status
	column crm_conn_status
		dataType: string
		lineageTag: a204fec9-10fc-4fda-b185-bd84a2620a60
		summarizeBy: none
		sourceColumn: crm_conn_status

		annotation SummarizationSetBy = Automatic

	/// job_status
	column job_status
		dataType: string
		lineageTag: 2e961cee-f716-4a2e-a940-86d7d20bd9bb
		summarizeBy: none
		sourceColumn: job_status

		annotation SummarizationSetBy = Automatic

	/// erp_conn_status
	column erp_conn_status
		dataType: string
		lineageTag: e339bb13-772e-4af5-9dfc-c25523eefcf8
		summarizeBy: none
		sourceColumn: erp_conn_status

		annotation SummarizationSetBy = Automatic

	/// co_hq_country
	column co_hq_country
		dataType: string
		lineageTag: 97bfc392-9f57-46d6-9bfc-7708c2479434
		summarizeBy: none
		sourceColumn: co_hq_country

		annotation SummarizationSetBy = Automatic

	/// co_type_industry
	column co_type_industry
		dataType: string
		lineageTag: bebf0202-d315-492d-9d8c-f360801925ac
		summarizeBy: none
		sourceColumn: co_type_industry

		annotation SummarizationSetBy = Automatic

	/// co_target_market
	column co_target_market
		dataType: string
		lineageTag: 88f3892d-793b-47b9-b1e5-4371ebb2704a
		summarizeBy: none
		sourceColumn: co_target_market

		annotation SummarizationSetBy = Automatic

	/// co_target_geo
	column co_target_geo
		dataType: string
		lineageTag: 4c72a422-8089-4bb7-9861-0a26d0706d0c
		summarizeBy: none
		sourceColumn: co_target_geo

		annotation SummarizationSetBy = Automatic

	/// founded_year
	column founded_year
		dataType: int64
		formatString: 0
		lineageTag: 0c7e9548-6365-46c3-9931-de90707682d0
		summarizeBy: sum
		sourceColumn: founded_year

		annotation SummarizationSetBy = Automatic

	/// total_employees
	column total_employees
		dataType: int64
		formatString: 0
		lineageTag: 20c57c75-b971-44a9-b638-eac82caa04ba
		summarizeBy: sum
		sourceColumn: total_employees

		annotation SummarizationSetBy = Automatic

	/// ref_currency
	column ref_currency
		dataType: string
		lineageTag: 7e6072ee-5c36-41a7-aa3b-3cb8037a6b30
		summarizeBy: none
		sourceColumn: ref_currency

		annotation SummarizationSetBy = Automatic

	/// TTM_ref_date_revenue
	column ttm_ref_date_revenue
		dataType: int64
		formatString: 0
		lineageTag: d9655bb5-44c1-4481-b800-bbc32bf7fca0
		summarizeBy: sum
		sourceColumn: ttm_ref_date_revenue

		annotation SummarizationSetBy = Automatic

	/// TTM_ref_date_bookings
	column ttm_ref_date_bookings
		dataType: int64
		formatString: 0
		lineageTag: ccabd21e-bea9-4bcf-b4e2-e9f8a5d9b2b2
		summarizeBy: sum
		sourceColumn: ttm_ref_date_bookings

		annotation SummarizationSetBy = Automatic

	/// consolidation_status
	column consolidation_status
		dataType: string
		lineageTag: a91363a4-994b-44a0-892b-8121657bd9cc
		summarizeBy: none
		sourceColumn: consolidation_status

		annotation SummarizationSetBy = Automatic

	/// primary_contact
	column primary_contact
		dataType: string
		lineageTag: 4d8be83c-0649-439e-8433-8c32fe164cfe
		summarizeBy: none
		sourceColumn: primary_contact

		annotation SummarizationSetBy = Automatic

	/// users_hr_file
	column users_hr_file
		dataType: int64
		formatString: 0
		lineageTag: 1a554704-8d64-4adb-9faf-6ccc0f531e94
		summarizeBy: sum
		sourceColumn: users_hr_file

		annotation SummarizationSetBy = Automatic

	/// users_match_hr_id
	column users_match_hr_id
		dataType: int64
		formatString: 0
		lineageTag: 1e46ec31-ac30-41c6-be41-04d876ceaa57
		summarizeBy: sum
		sourceColumn: users_match_hr_id

		annotation SummarizationSetBy = Automatic

	/// users_match_hr_id_nd_role
	column users_match_hr_id_nd_role
		dataType: int64
		formatString: 0
		lineageTag: 76fb7722-5003-4ea7-981e-cc192f025bd7
		summarizeBy: sum
		sourceColumn: users_match_hr_id_nd_role

		annotation SummarizationSetBy = Automatic

	/// users_non_match_hr_id_won_deals
	column users_non_match_hr_id_won_deals
		dataType: int64
		formatString: 0
		lineageTag: 95734728-b60d-4940-a94d-4dc1c179f4f9
		summarizeBy: sum
		sourceColumn: users_non_match_hr_id_won_deals

		annotation SummarizationSetBy = Automatic

	/// users_non_match_hr_id_pipeline
	column users_non_match_hr_id_pipeline
		dataType: int64
		formatString: 0
		lineageTag: 6e1ca739-0889-494f-8e56-a4048c03fabf
		summarizeBy: sum
		sourceColumn: users_non_match_hr_id_pipeline

		annotation SummarizationSetBy = Automatic

	/// users_non_match_hr_id_leads
	column users_non_match_hr_id_leads
		dataType: int64
		formatString: 0
		lineageTag: e20ad3ce-21f9-49e2-9395-61f66be7139a
		summarizeBy: sum
		sourceColumn: users_non_match_hr_id_leads

		annotation SummarizationSetBy = Automatic

	/// Last time the post ssr jobstep was attempted
	column processing_post_ssr_ml_last_attempt
		dataType: dateTime
		formatString: General Date
		lineageTag: d6dfd295-7dfe-4d09-9e71-69c667e3d29f
		summarizeBy: none
		sourceColumn: processing_post_ssr_ml_last_attempt

		variation Variation
			isDefault
			relationship: d8a04a56-3ee1-4f9b-aeb5-f99099c689bf
			defaultHierarchy: LocalDateTable_f3cb3866-5b6b-4d36-a3fd-095ab6bf7312.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Last time the post ssr jobstep was successful
	column processing_post_ssr_ml_last_success
		dataType: dateTime
		formatString: General Date
		lineageTag: 31341bbc-bb5f-40be-bb3e-11e56afbf716
		summarizeBy: none
		sourceColumn: processing_post_ssr_ml_last_success

		variation Variation
			isDefault
			relationship: 5b71f284-6ea5-4c0f-8e03-64b3dba81f58
			defaultHierarchy: LocalDateTable_94aeb6c0-ce7b-4bf6-a0d1-2ab51c0a3075.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Time taken for the last time the post ssr jobstep was successful
	column processing_post_ssr_ml_last_success_time_sec
		dataType: double
		lineageTag: 09edbc27-2528-4a0c-b5cf-89643640728d
		summarizeBy: sum
		sourceColumn: processing_post_ssr_ml_last_success_time_sec

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Last time the pre ssr jobstep was attempted
	column processing_pre_ssr_ml_last_attempt
		dataType: dateTime
		formatString: General Date
		lineageTag: af8c0f23-de46-4ad3-88b2-2833a63750ad
		summarizeBy: none
		sourceColumn: processing_pre_ssr_ml_last_attempt

		variation Variation
			isDefault
			relationship: 48f2d8e3-8968-4ad6-8ed8-dba61376e09c
			defaultHierarchy: LocalDateTable_02446a86-10d2-446a-9e36-c18b45dab416.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Last time the pre ssr jobstep was successful
	column processing_pre_ssr_ml_last_success
		dataType: dateTime
		formatString: General Date
		lineageTag: d4af6550-e464-4ac6-b77f-ea49c5970151
		summarizeBy: none
		sourceColumn: processing_pre_ssr_ml_last_success

		variation Variation
			isDefault
			relationship: a22f40ae-250a-4288-a0bb-b104596daec7
			defaultHierarchy: LocalDateTable_5db8f38b-fd2b-4002-a3b6-6d39264e2f8c.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Time taken for the Last time the pre ssr jobstep was successful
	column processing_pre_ssr_ml_last_success_time_sec
		dataType: double
		lineageTag: 1e3c1a0d-d970-4d48-8f02-620077c78fea
		summarizeBy: sum
		sourceColumn: processing_pre_ssr_ml_last_success_time_sec

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Number of docs that require geocoding API requests
	column geo_required_leads
		dataType: int64
		formatString: 0
		lineageTag: 4bb68885-f893-4722-94d2-10b80d4010b3
		summarizeBy: sum
		sourceColumn: geo_required_leads

		annotation SummarizationSetBy = Automatic

	/// Number of docs that require geocoding API requests
	column geo_required_accounts
		dataType: int64
		formatString: 0
		lineageTag: 6fcdd628-d227-4c57-94cb-2346ee73ed1f
		summarizeBy: sum
		sourceColumn: geo_required_accounts

		annotation SummarizationSetBy = Automatic

	/// Number of docs that require geocoding API requests
	column geo_required_contacts
		dataType: int64
		formatString: 0
		lineageTag: 30d3a1d9-1734-455f-b633-2438767f81c4
		summarizeBy: sum
		sourceColumn: geo_required_contacts

		annotation SummarizationSetBy = Automatic

	/// Number of docs that require geocoding API requests
	column geo_required_users
		dataType: int64
		formatString: 0
		lineageTag: f46729d5-4431-4855-9f71-404ada6f778e
		summarizeBy: sum
		sourceColumn: geo_required_users

		annotation SummarizationSetBy = Automatic

	/// Number of docs that require geocoding API requests
	column geo_required_hr_users
		dataType: int64
		formatString: 0
		lineageTag: 91701913-f511-4fc2-a88f-d8bec52a0967
		summarizeBy: sum
		sourceColumn: geo_required_hr_users

		annotation SummarizationSetBy = Automatic

	/// Number of geocoding API requests sent
	column geo_api_requests_leads
		dataType: int64
		formatString: 0
		lineageTag: 5edaa992-6487-4195-9123-c8ce4be9c189
		summarizeBy: sum
		sourceColumn: geo_api_requests_leads

		annotation SummarizationSetBy = Automatic

	/// Number of geocoding API requests sent
	column geo_api_requests_accounts
		dataType: int64
		formatString: 0
		lineageTag: 6d3cd10e-21f4-4a18-9c80-4335908610df
		summarizeBy: sum
		sourceColumn: geo_api_requests_accounts

		annotation SummarizationSetBy = Automatic

	/// Number of geocoding API requests sent
	column geo_api_requests_contacts
		dataType: int64
		formatString: 0
		lineageTag: 444353e6-104c-4e44-92dd-8351cf1d6517
		summarizeBy: sum
		sourceColumn: geo_api_requests_contacts

		annotation SummarizationSetBy = Automatic

	/// Number of geocoding API requests sent
	column geo_api_requests_users
		dataType: int64
		formatString: 0
		lineageTag: 83fdd208-93a0-46c9-a510-627e58479829
		summarizeBy: sum
		sourceColumn: geo_api_requests_users

		annotation SummarizationSetBy = Automatic

	/// Number of geocoding API requests sent
	column geo_api_requests_hr_users
		dataType: int64
		formatString: 0
		lineageTag: 15a6f64e-0ed6-4fe6-9011-74643490f0b5
		summarizeBy: sum
		sourceColumn: geo_api_requests_hr_users

		annotation SummarizationSetBy = Automatic

	/// users_non_match_hr_id_nd_group
	column users_non_match_hr_id_nd_group
		dataType: int64
		formatString: 0
		lineageTag: 3e119c9b-e803-4773-a55c-0f213ead0cff
		summarizeBy: sum
		sourceColumn: users_non_match_hr_id_nd_group

		annotation SummarizationSetBy = Automatic

	/// PBI report version
	column pbi_version
		dataType: string
		lineageTag: a6881c82-b203-4ad7-82af-d0a1d1a49f25
		summarizeBy: none
		sourceColumn: pbi_version

		annotation SummarizationSetBy = Automatic

	/// PBI report page links
	column pbi_report_links
		dataType: string
		lineageTag: b6ee70d7-7680-42ab-b9d2-91ef9fa74c59
		summarizeBy: none
		sourceColumn: pbi_report_links

		annotation SummarizationSetBy = Automatic

	/// Column 'col.currency_format' = ```.
	column 'col.currency_format' = ```
			
			VAR CurrencyCode = [company_currency]
			RETURN 
			SWITCH(CurrencyCode,
			    "USD", "$",      // Shows as $123.5K
			    "EUR", "€",      // Shows as €123.5K
			    "$"              // Default: $123.5K
			)
			// VAR CurrencyCode = [company_currency]
			// RETURN 
			// SWITCH(CurrencyCode,
			//     "USD", "$#,0",
			//     "EUR", "€#,##0",
			//     "$#,##0"
			// )
			```
		lineageTag: 46632ceb-f313-4905-a74c-8cc0b1d1eb13
		summarizeBy: none

		annotation SummarizationSetBy = Automatic

	/// Percentage of matched accounts
	column matched_accounts_percentage
		dataType: double
		lineageTag: 9cd23976-c8f3-4e3b-ac9e-2d32325a07c2
		summarizeBy: sum
		sourceColumn: matched_accounts_percentage

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Average match confidence for accounts
	column accounts_avg_match_conf
		dataType: double
		lineageTag: 199dcea8-7501-40cb-9355-f8576aa95c59
		summarizeBy: sum
		sourceColumn: accounts_avg_match_conf

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Percentage of matched leads
	column matched_leads_percentage
		dataType: double
		lineageTag: 4c5d4b29-f67d-4522-869e-54ad9e260ec6
		summarizeBy: sum
		sourceColumn: matched_leads_percentage

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Average match confidence for leads
	column leads_avg_match_conf
		dataType: double
		lineageTag: 46b28c90-a9c9-49fc-8942-fd318cef7127
		summarizeBy: sum
		sourceColumn: leads_avg_match_conf

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Percentage of matched contacts
	column matched_contacts_percentage
		dataType: double
		lineageTag: ce6ee19a-7eea-42d0-841c-04bcfb1d9452
		summarizeBy: sum
		sourceColumn: matched_contacts_percentage

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Average match confidence for contacts
	column contacts_avg_match_conf
		dataType: double
		lineageTag: efb973bc-1519-4f6f-8383-b480a30ef302
		summarizeBy: sum
		sourceColumn: contacts_avg_match_conf

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Company's currency symbol
	column company_currency_symbol
		dataType: string
		lineageTag: 250e0463-39d1-48ca-9e20-09d5064a870e
		summarizeBy: none
		sourceColumn: company_currency_symbol

		annotation SummarizationSetBy = Automatic

	/// Quality score for new logo selling activities
	column di_pred_new_logo_score
		dataType: double
		lineageTag: 38e91438-b4d4-44ba-abbf-25589e296439
		summarizeBy: sum
		sourceColumn: di_pred_new_logo_score

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Quality score for post sales support activities
	column di_pred_post_sales_score
		dataType: double
		lineageTag: 0b000289-bd18-4420-84f8-c4840bf6ca31
		summarizeBy: sum
		sourceColumn: di_pred_post_sales_score

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Quality score for prospecting activities
	column di_pred_prospecting_score
		dataType: double
		lineageTag: 77bde7d9-b0ac-4257-93ad-7a981d98d83b
		summarizeBy: sum
		sourceColumn: di_pred_prospecting_score

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Quality score for existing customer selling activities
	column di_pred_existing_customer_selling_score
		dataType: double
		lineageTag: 44483654-2b49-4966-bbf5-9cea2854fb8d
		summarizeBy: sum
		sourceColumn: di_pred_existing_customer_selling_score

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Overall quality score
	column di_pred_all_score
		dataType: double
		lineageTag: aa955d9a-9554-4c71-b5ac-38b30041c95c
		summarizeBy: sum
		sourceColumn: di_pred_all_score

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Overall quality score label
	column di_pred_all_label
		dataType: string
		lineageTag: fdfe369f-4798-431f-96d9-00f82df89d16
		summarizeBy: none
		sourceColumn: di_pred_all_label

		annotation SummarizationSetBy = Automatic

	/// Column di_success_prob_reset_on.
	column di_success_prob_reset_on
		dataType: dateTime
		formatString: General Date
		lineageTag: 923a1b4f-26b6-42f0-8cc9-a67263ee6baf
		summarizeBy: none
		sourceColumn: di_success_prob_reset_on

		variation Variation
			isDefault
			relationship: 9cf2e560-83c7-49ef-bf03-19177bed3a7f
			defaultHierarchy: LocalDateTable_418e6829-0d4e-4794-a40e-dd18fc187206.'Date Hierarchy'

		annotation SummarizationSetBy = Automatic

	/// Column di_pred_new_logo_propensity_tiers.
	column di_pred_new_logo_propensity_tiers
		dataType: string
		lineageTag: bea98df5-618f-41a1-b28f-00ee6752f6fa
		summarizeBy: none
		sourceColumn: di_pred_new_logo_propensity_tiers

		annotation SummarizationSetBy = Automatic

	/// Column di_pred_existing_customer_propensity_tiers.
	column di_pred_existing_customer_propensity_tiers
		dataType: string
		lineageTag: 9038401d-bfc6-4189-bebe-e6e65be86ee0
		summarizeBy: none
		sourceColumn: di_pred_existing_customer_propensity_tiers

		annotation SummarizationSetBy = Automatic

	/// Column ref_date_potential_growth_rate.
	column ref_date_potential_growth_rate
		dataType: double
		lineageTag: 4128bc71-fd73-4c9f-86fc-03557c15bb08
		summarizeBy: sum
		sourceColumn: ref_date_potential_growth_rate

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Column min_ext_match_conf.
	column min_ext_match_conf
		dataType: double
		lineageTag: b9b69362-1057-43f8-8590-2d91682d159e
		summarizeBy: sum
		sourceColumn: min_ext_match_conf

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	/// Number of docs that require geocoding API requests
	column geo_required_erp_accounts
		dataType: int64
		formatString: 0
		lineageTag: 610d1f69-4cef-4302-ba98-370234305b6d
		summarizeBy: sum
		sourceColumn: geo_required_erp_accounts

		annotation SummarizationSetBy = Automatic

	/// Number of geocoding API requests sent
	column geo_api_requests_erp_accounts
		dataType: int64
		formatString: 0
		lineageTag: 74be5a3e-135a-4160-975c-8879829876bb
		summarizeBy: sum
		sourceColumn: geo_api_requests_erp_accounts

		annotation SummarizationSetBy = Automatic

	/// Column di_compound_score_all.
	column di_compound_score_all
		dataType: double
		lineageTag: 80cc9d60-f67c-4d3e-a7b9-5247df71a5eb
		summarizeBy: sum
		sourceColumn: di_compound_score_all

		annotation SummarizationSetBy = Automatic

		annotation PBI_FormatHint = {"isGeneralNumber":true}

	column ml_training_scores_value_pred_booking_amt_reset_on
		dataType: string
		lineageTag: 60efbd86-421a-4e66-a5cc-82af86c4a90d
		summarizeBy: none
		sourceColumn: ml_training_scores_value_pred_booking_amt_reset_on

		annotation SummarizationSetBy = Automatic

	column di_pred_booking_amt_reset_on
		dataType: string
		lineageTag: 52156b23-2142-4335-b22f-5cf6da4761ec
		summarizeBy: none
		sourceColumn: di_pred_booking_amt_reset_on

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_won_reset_on
		dataType: string
		lineageTag: 591efaa2-c92e-4ef4-8ef1-0241e3c56117
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_won_reset_on

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_lost_reset_on
		dataType: string
		lineageTag: 4bb4ad22-af95-4ead-aa4c-141c30f25d1c
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_lost_reset_on

		annotation SummarizationSetBy = Automatic

	column di_pred_booking_amt_training_score
		dataType: string
		lineageTag: b8744800-f5dd-4b0f-ac0e-06084551ec7d
		summarizeBy: none
		sourceColumn: di_pred_booking_amt_training_score

		annotation SummarizationSetBy = Automatic

	column di_pred_booking_amt_validation_score
		dataType: string
		lineageTag: 6eabf855-d5e2-42e8-b795-0ee6d0251a38
		summarizeBy: none
		sourceColumn: di_pred_booking_amt_validation_score

		annotation SummarizationSetBy = Automatic

	column di_pred_booking_amt_test_score
		dataType: string
		lineageTag: 9fc3d7e7-40c6-4c79-94d1-ddc4727584ab
		summarizeBy: none
		sourceColumn: di_pred_booking_amt_test_score

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_won_training_score
		dataType: string
		lineageTag: 3dff906e-01fe-4ff8-9ad9-767f6a436461
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_won_training_score

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_won_validation_score
		dataType: string
		lineageTag: fe2fa62f-3dcb-4105-a7c9-245a291f24bd
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_won_validation_score

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_won_test_score
		dataType: string
		lineageTag: 19069c18-6d77-4e54-9628-fe04c2570ed9
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_won_test_score

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_lost_training_score
		dataType: string
		lineageTag: 921daebf-fea9-414c-9900-b039041ed444
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_lost_training_score

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_lost_validation_score
		dataType: string
		lineageTag: 39c64295-e54f-444a-ac9b-f6a0d8a9e346
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_lost_validation_score

		annotation SummarizationSetBy = Automatic

	column di_pred_close_date_if_lost_test_score
		dataType: string
		lineageTag: 032a7f71-01fa-498b-8f2e-089b344d4d8d
		summarizeBy: none
		sourceColumn: di_pred_close_date_if_lost_test_score

		annotation SummarizationSetBy = Automatic

	column storage_used_gb
		dataType: string
		lineageTag: 2ff2d0db-7b75-44e1-8eaf-66e3af691677
		summarizeBy: none
		sourceColumn: storage_used_gb

		annotation SummarizationSetBy = Automatic

	column booking_calibration_score
		dataType: string
		lineageTag: 4eb26f7f-c075-4f94-bbf4-00f7fd4e56b0
		summarizeBy: none
		sourceColumn: booking_calibration_score

		annotation SummarizationSetBy = Automatic

	column calibration_score
		dataType: string
		lineageTag: 8f3af5f3-8cc8-4148-a91d-0d6ec32cdd89
		summarizeBy: none
		sourceColumn: calibration_score

		annotation SummarizationSetBy = Automatic

	column rep_org_calibration_score
		dataType: string
		lineageTag: 5a5e1714-7602-4c6a-93e7-6ae34388b31d
		summarizeBy: none
		sourceColumn: rep_org_calibration_score

		annotation SummarizationSetBy = Automatic

	column revenue_calibration_score
		dataType: string
		lineageTag: 9eb469f1-cc74-4f3f-a4fa-6f8f9cf2cc81
		summarizeBy: none
		sourceColumn: revenue_calibration_score

		annotation SummarizationSetBy = Automatic

	partition companies_history = m
		mode: import
		source =
				let
				    dbTable = getDBTable("companies_history"),
				
				    // Ensure this column always exists in the output rowset (prevents Tabular "rowset column does not exist" errors)
				    // If more missing columns show up, add them to this list.
				    RequiredCols = {
				        "ml_training_scores_value_pred_booking_amt_reset_on",
				        "booking_calibration_score",
				        "calibration_score",
				        "rep_org_calibration_score",
				        "revenue_calibration_score"
				    },
				
				    #"Ensure Required Columns" =
				        List.Accumulate(
				            RequiredCols,
				            dbTable,
				            (state as table, colName as text) =>
				                if List.Contains(Table.ColumnNames(state), colName)
				                then state
				                else Table.AddColumn(state, colName, each null, type nullable text)
				        ),
				
				    // Sales Performance type mapping list (from the list you provided earlier)
				    TypePairs = {
				      {"_sys_as_of", type datetime},
				      {"_sys_co_id", type text},
				      {"_sys_doc_id", type text},
				      {"_sys_filt_end_date", type date},
				      {"_sys_filt_start_date", type date},
				      {"_sys_image_size", type text},
				      {"_sys_last_modified_on", type datetime},
				      {"_sys_processed_as_of", type datetime},
				      {"_sys_reference_date", type datetime},
				      {"_sys_scheduled_daily", type logical},
				      {"_sys_scheduled_weekly", type logical},
				      {"_sys_version", type text},
				      {"accounts_avg_match_conf", type number},
				      {"added_on", type datetime},
				      {"co_hq_country", type text},
				      {"co_target_geo", type text},
				      {"co_target_market", type text},
				      {"co_type_industry", type text},
				      {"company_currency", type text},
				      {"company_currency_symbol", type text},
				      {"company_name", type text},
				      {"consolidation_status", type text},
				      {"contacts_avg_match_conf", type number},
				      {"crm_conn_status", type text},
				      {"deactivated_on", type datetime},
				      {"di_acv_company_size_factors", type text},
				      {"di_acv_country_factors", type text},
				      {"di_acv_industry_factors", type text},
				      {"di_amt_won_last12months", type number},
				      {"di_compound_score_all", type number},
				      {"di_pred_all_label", type text},
				      {"di_pred_all_score", type number},
				      {"di_pred_existing_customer_propensity_tiers", type text},
				      {"di_pred_existing_customer_selling_auc", type number},
				      {"di_pred_existing_customer_selling_r2", type number},
				      {"di_pred_existing_customer_selling_score", type number},
				      {"di_pred_new_logo_auc", type number},
				      {"di_pred_new_logo_propensity_tiers", type text},
				      {"di_pred_new_logo_r2", type number},
				      {"di_pred_new_logo_score", type number},
				      {"di_pred_post_sales_auc", type number},
				      {"di_pred_post_sales_propensity_tiers", type text},
				      {"di_pred_post_sales_r2", type number},
				      {"di_pred_post_sales_score", type number},
				      {"di_pred_prospecting_auc", type number},
				      {"di_pred_prospecting_propensity_tiers", type text},
				      {"di_pred_prospecting_r2", type number},
				      {"di_pred_prospecting_score", type number},
				      {"di_success_prob_reset_on", type datetime},
				      {"di_success_prob_training_score", type number},
				      {"di_success_prob_validation_score", type number},
				      {"erp_conn_status", type text},
				      {"fiscal_year_offset", Int64.Type},
				      {"founded_year", Int64.Type},
				      {"geo_api_requests_accounts", Int64.Type},
				      {"geo_api_requests_contacts", Int64.Type},
				      {"geo_api_requests_erp_accounts", Int64.Type},
				      {"geo_api_requests_hr_users", Int64.Type},
				      {"geo_api_requests_leads", Int64.Type},
				      {"geo_api_requests_users", Int64.Type},
				      {"geo_required_accounts", Int64.Type},
				      {"geo_required_contacts", Int64.Type},
				      {"geo_required_erp_accounts", Int64.Type},
				      {"geo_required_hr_users", Int64.Type},
				      {"geo_required_leads", Int64.Type},
				      {"geo_required_users", Int64.Type},
				      {"job_status", type text},
				      {"leads_avg_match_conf", type number},
				      {"matched_accounts_percentage", type number},
				      {"matched_contacts_percentage", type number},
				      {"matched_leads_percentage", type number},
				      {"min_ext_match_conf", type number},
				      {"partner_base64_logo", type text},
				      {"partner_co_id", type text},
				      {"partner_name", type text},
				      {"partner_product_name", type text},
				      {"pbi_report_links", type text},
				      {"pbi_version", type text},
				      {"pbi_workspace_name", type text},
				      {"pbi_workspace_url", type text},
				      {"primary_contact", type text},
				      {"processing_all_last_attempt", type datetime},
				      {"processing_all_last_success", type datetime},
				      {"processing_all_last_success_time_sec", type number},
				      {"processing_api_export_last_attempt", type datetime},
				      {"processing_api_export_last_success", type datetime},
				      {"processing_api_export_last_success_time_sec", type number},
				      {"processing_max_last_modified_on_act", type datetime},
				      {"processing_max_last_modified_on_opp_histories", type datetime},
				      {"processing_max_last_modified_on_opps", type datetime},
				      {"processing_max_last_modified_on_users", type datetime},
				      {"processing_mode", type text},
				      {"processing_post_ssr_ml_last_attempt", type datetime},
				      {"processing_post_ssr_ml_last_success", type datetime},
				      {"processing_post_ssr_ml_last_success_time_sec", type number},
				      {"processing_pre_ssr_ml_last_attempt", type datetime},
				      {"processing_pre_ssr_ml_last_success", type datetime},
				      {"processing_pre_ssr_ml_last_success_time_sec", type number},
				      {"processing_sync_last_attempt", type datetime},
				      {"processing_sync_last_success", type datetime},
				      {"processing_sync_last_success_time_sec", type number},
				      {"processing_transform_last_attempt", type datetime},
				      {"processing_transform_last_success", type datetime},
				      {"processing_transform_last_success_time_sec", type number},
				      {"purged_on", type datetime},
				      {"ref_currency", type text},
				      {"ref_date_potential_growth_rate", type number},
				      {"region", type text},
				      {"status", type text},
				      {"total_employees", Int64.Type},
				      {"ttm_ref_date_bookings", Int64.Type},
				      {"ttm_ref_date_revenue", Int64.Type},
				      {"users", Int64.Type},
				      {"users_active", Int64.Type},
				      {"users_hr_file", Int64.Type},
				      {"users_match_hr_id", Int64.Type},
				      {"users_match_hr_id_nd_role", Int64.Type},
				      {"users_non_match_hr_id_leads", Int64.Type},
				      {"users_non_match_hr_id_nd_group", Int64.Type},
				      {"users_non_match_hr_id_pipeline", Int64.Type},
				      {"users_non_match_hr_id_won_deals", Int64.Type},
				      {"users_sales", Int64.Type},
				
				      // Type the ensured columns (they now always exist)
				      {"ml_training_scores_value_pred_booking_amt_reset_on", type text},
				      {"booking_calibration_score", type text},
				      {"calibration_score", type text},
				      {"rep_org_calibration_score", type text},
				      {"revenue_calibration_score", type text}
				    },
				
				    // Safe typing: only apply mappings for columns that exist at refresh time
				    ExistingCols = Table.ColumnNames(#"Ensure Required Columns"),
				    SafeTypePairs = List.Select(TypePairs, each List.Contains(ExistingCols, _{0})),
				    #"Changed Type" = Table.TransformColumnTypes(#"Ensure Required Columns", SafeTypePairs),
				
				    // Safe remove (won't error if missing)
				    #"Removed Columns" =
				        Table.RemoveColumns(
				            #"Changed Type",
				            {"di_pred_prospecting_model_reset_on"},
				            MissingField.Ignore
				        ),
				AllowedModelColumns = {
				        "_sys_as_of",
				        "_sys_co_id",
				        "_sys_doc_id",
				        "_sys_filt_end_date",
				        "_sys_filt_start_date",
				        "_sys_last_modified_on",
				        "_sys_processed_as_of",
				        "company_currency",
				        "company_name",
				        "di_acv_company_size_factors",
				        "di_acv_country_factors",
				        "di_acv_industry_factors",
				        "di_amt_won_last12months",
				        "di_pred_new_logo_auc",
				        "di_pred_new_logo_r2",
				        "di_pred_post_sales_auc",
				        "di_pred_post_sales_propensity_tiers",
				        "di_pred_post_sales_r2",
				        "di_pred_prospecting_auc",
				        "di_pred_prospecting_propensity_tiers",
				        "di_pred_prospecting_r2",
				        "partner_base64_logo",
				        "partner_co_id",
				        "partner_name",
				        "partner_product_name",
				        "processing_all_last_attempt",
				        "processing_all_last_success",
				        "processing_all_last_success_time_sec",
				        "processing_api_export_last_attempt",
				        "processing_api_export_last_success",
				        "processing_api_export_last_success_time_sec",
				        "processing_max_last_modified_on_act",
				        "processing_max_last_modified_on_opp_histories",
				        "processing_max_last_modified_on_opps",
				        "processing_max_last_modified_on_users",
				        "processing_sync_last_attempt",
				        "processing_sync_last_success",
				        "processing_sync_last_success_time_sec",
				        "processing_transform_last_attempt",
				        "processing_transform_last_success",
				        "processing_transform_last_success_time_sec",
				        "users",
				        "users_active",
				        "users_sales",
				        "processing_mode",
				        "_sys_image_size",
				        "_sys_version",
				        "_sys_reference_date",
				        "_sys_scheduled_daily",
				        "_sys_scheduled_weekly",
				        "pbi_workspace_name",
				        "pbi_workspace_url",
				        "di_pred_existing_customer_selling_auc",
				        "di_pred_existing_customer_selling_r2",
				        "col.pred_successs_prospecting_score",
				        "col.pred_successs_new_logo_selling_score",
				        "col.pred_successs_post_sales_support_score",
				        "col.pred_successs_existing_customer_selling_score",
				        "col.pred_success_score",
				        "col.pred_success_score_text",
				        "fiscal_year_offset",
				        "di_success_prob_training_score",
				        "di_success_prob_validation_score",
				        "status",
				        "region",
				        "added_on",
				        "deactivated_on",
				        "purged_on",
				        "crm_conn_status",
				        "job_status",
				        "erp_conn_status",
				        "co_hq_country",
				        "co_type_industry",
				        "co_target_market",
				        "co_target_geo",
				        "founded_year",
				        "total_employees",
				        "ref_currency",
				        "ttm_ref_date_revenue",
				        "ttm_ref_date_bookings",
				        "consolidation_status",
				        "primary_contact",
				        "users_hr_file",
				        "users_match_hr_id",
				        "users_match_hr_id_nd_role",
				        "users_non_match_hr_id_won_deals",
				        "users_non_match_hr_id_pipeline",
				        "users_non_match_hr_id_leads",
				        "processing_post_ssr_ml_last_attempt",
				        "processing_post_ssr_ml_last_success",
				        "processing_post_ssr_ml_last_success_time_sec",
				        "processing_pre_ssr_ml_last_attempt",
				        "processing_pre_ssr_ml_last_success",
				        "processing_pre_ssr_ml_last_success_time_sec",
				        "geo_required_leads",
				        "geo_required_accounts",
				        "geo_required_contacts",
				        "geo_required_users",
				        "geo_required_hr_users",
				        "geo_api_requests_leads",
				        "geo_api_requests_accounts",
				        "geo_api_requests_contacts",
				        "geo_api_requests_users",
				        "geo_api_requests_hr_users",
				        "users_non_match_hr_id_nd_group",
				        "pbi_version",
				        "pbi_report_links",
				        "col.currency_format",
				        "matched_accounts_percentage",
				        "accounts_avg_match_conf",
				        "matched_leads_percentage",
				        "leads_avg_match_conf",
				        "matched_contacts_percentage",
				        "contacts_avg_match_conf",
				        "company_currency_symbol",
				        "di_pred_new_logo_score",
				        "di_pred_post_sales_score",
				        "di_pred_prospecting_score",
				        "di_pred_existing_customer_selling_score",
				        "di_pred_all_score",
				        "di_pred_all_label",
				        "di_success_prob_reset_on",
				        "di_pred_new_logo_propensity_tiers",
				        "di_pred_existing_customer_propensity_tiers",
				        "ref_date_potential_growth_rate",
				        "min_ext_match_conf",
				        "geo_required_erp_accounts",
				        "geo_api_requests_erp_accounts",
				        "di_compound_score_all",
				        "ml_training_scores_value_pred_booking_amt_reset_on",
				        "booking_calibration_score",
				        "calibration_score",
				        "rep_org_calibration_score",
				        "revenue_calibration_score",
				        "di_pred_booking_amt_reset_on",
				        "di_pred_close_date_if_won_reset_on",
				        "di_pred_close_date_if_lost_reset_on",
				        "di_pred_booking_amt_training_score",
				        "di_pred_booking_amt_validation_score",
				        "di_pred_booking_amt_test_score",
				        "di_pred_close_date_if_won_training_score",
				        "di_pred_close_date_if_won_validation_score",
				        "di_pred_close_date_if_won_test_score",
				        "di_pred_close_date_if_lost_training_score",
				        "di_pred_close_date_if_lost_validation_score",
				        "di_pred_close_date_if_lost_test_score",
				        "storage_used_gb"
				    },
				#"Selected Model Columns" = Table.SelectColumns(#"Removed Columns", AllowedModelColumns, MissingField.Ignore)
				in
				    #"Selected Model Columns"

	annotation PBI_ResultType = Exception

	annotation PBI_NavigationStepName = Navigation

```

