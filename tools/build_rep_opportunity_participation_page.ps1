param(
    [string]$ReportRoot = "powerbi\src\Tactical Report.Report"
)

$ErrorActionPreference = "Stop"
$entity = "rep_opportunity_participation_summary"
$pageId = "repOpportunityParticipationAnalysis"
$pagesRoot = Join-Path $ReportRoot "definition\pages"
$pageRoot = Join-Path $pagesRoot $pageId
$visualsRoot = Join-Path $pageRoot "visuals"

$prototype = @{
    Card = Join-Path $pagesRoot "59906192f28cbfea4b2b\visuals\e0596ac015d778a5a422\visual.json"
    Slicer = Join-Path $pagesRoot "59906192f28cbfea4b2b\visuals\99f267349468a71de053\visual.json"
    Table = Join-Path $pagesRoot "126ef4df0d10b0774486\visuals\140e0ab04c5003444006\visual.json"
    Bar = Join-Path $pagesRoot "b382d3f20753b36d2b0e\visuals\7873f80e8849bb109dbb\visual.json"
    Column = Join-Path $pagesRoot "79129d9692bb56e510ba\visuals\b3c7b38e8a9c33cdee05\visual.json"
    Donut = Join-Path $pagesRoot "79129d9692bb56e510ba\visuals\11585c26359d7eb5bb0e\visual.json"
    Scatter = Join-Path $pagesRoot "a96bf4945092a0cbc890\visuals\40a60f30c64bc3068007\visual.json"
}

function Copy-Object($value) {
    return ($value | ConvertTo-Json -Depth 100 | ConvertFrom-Json)
}

function Column-Projection([string]$property, [string]$label, [bool]$active = $false) {
    $projection = [ordered]@{
        field = [ordered]@{
            Column = [ordered]@{
                Expression = [ordered]@{ SourceRef = [ordered]@{ Entity = $entity } }
                Property = $property
            }
        }
        queryRef = "$entity.$property"
        nativeQueryRef = $label
        displayName = $label
    }
    if ($active) { $projection.active = $true }
    return $projection
}

function Measure-Projection([string]$property, [string]$label, [bool]$active = $false) {
    $projection = [ordered]@{
        field = [ordered]@{
            Measure = [ordered]@{
                Expression = [ordered]@{ SourceRef = [ordered]@{ Entity = $entity } }
                Property = $property
            }
        }
        queryRef = "$entity.$property"
        nativeQueryRef = $label
        displayName = $label
    }
    if ($active) { $projection.active = $true }
    return $projection
}

function Set-Position($visual, [string]$name, [double]$x, [double]$y, [double]$w, [double]$h, [int]$z) {
    $visual.name = $name
    $visual.position.x = $x
    $visual.position.y = $y
    $visual.position.width = $w
    $visual.position.height = $h
    $visual.position.z = $z
    $visual.position.tabOrder = $z
}

function Set-Title($visual, [string]$title) {
    if (-not $visual.visual.visualContainerObjects) {
        $visual.visual | Add-Member visualContainerObjects ([pscustomobject]@{})
    }
    $titleObject = [pscustomobject]@{
        properties = [pscustomobject]@{
            show = [pscustomobject]@{ expr = [pscustomobject]@{ Literal = [pscustomobject]@{ Value = "true" } } }
            text = [pscustomobject]@{ expr = [pscustomobject]@{ Literal = [pscustomobject]@{ Value = "'$title'" } } }
            fontColor = [pscustomobject]@{ solid = [pscustomobject]@{ color = [pscustomobject]@{ expr = [pscustomobject]@{ Literal = [pscustomobject]@{ Value = "'#F3F6FA'" } } } } }
            fontSize = [pscustomobject]@{ expr = [pscustomobject]@{ Literal = [pscustomobject]@{ Value = "11D" } } }
        }
    }
    $visual.visual.visualContainerObjects.title = @($titleObject)
}

function Remove-PrototypeQueryMetadata($visual) {
    @($visual.visual.query.PSObject.Properties.Name) |
        Where-Object { $_ -ne "queryState" } |
        ForEach-Object { $visual.visual.query.PSObject.Properties.Remove($_) }
}

function Save-Visual($visual) {
    if ($visual.PSObject.Properties.Name -contains "filterConfig") {
        $visual.PSObject.Properties.Remove("filterConfig")
    }
    # Keep the Tactical formatting copied from the prototype, but discard only
    # field-bound formatting selectors that still reference the prototype model.
    if ($visual.visual.objects -and ($visual.visual.objects -isnot [System.Collections.IDictionary])) {
        $legacyPattern = 'cal_end_dates|hat_leads|"opps"|quality_buckets|"ssr"|ssr_history|ssr_history_success_factors|"users"'
        foreach ($objectProperty in @($visual.visual.objects.PSObject.Properties)) {
            $cleanEntries = @(
                $objectProperty.Value | Where-Object {
                    ($_ | ConvertTo-Json -Depth 100) -notmatch $legacyPattern
                }
            )
            $visual.visual.objects.($objectProperty.Name) = $cleanEntries
        }
    }
    $dir = Join-Path $visualsRoot $visual.name
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $visual | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath (Join-Path $dir "visual.json") -Encoding utf8
}

function New-Textbox([string]$name, [string]$text, [double]$x, [double]$y, [double]$w, [double]$h, [int]$z, [int]$size) {
    return [pscustomobject][ordered]@{
        '$schema' = "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/visualContainer/2.6.0/schema.json"
        name = $name
        position = [ordered]@{ x=$x; y=$y; z=$z; height=$h; width=$w; tabOrder=$z }
        visual = [ordered]@{
            visualType = "textbox"
            objects = [ordered]@{
                general = @([ordered]@{
                    properties = [ordered]@{
                        paragraphs = @([ordered]@{
                            textRuns = @([ordered]@{
                                value = $text
                                textStyle = [ordered]@{
                                    fontFamily = "Segoe UI"
                                    fontSize = "$($size)pt"
                                    color = "#F3F6FA"
                                    fontWeight = if ($size -ge 18) { "bold" } else { "normal" }
                                }
                            })
                        })
                    }
                })
            }
            drillFilterOtherVisuals = $true
        }
    }
}

New-Item -ItemType Directory -Force -Path $visualsRoot | Out-Null

$page = [ordered]@{
    '$schema' = "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/page/2.0.0/schema.json"
    name = $pageId
    displayName = "Rep Opportunity Participation & Overlap Analysis"
    displayOption = "FitToWidth"
    height = 2100
    width = 1280
    objects = [ordered]@{
        background = @([ordered]@{ properties = [ordered]@{
            color = [ordered]@{ solid = [ordered]@{ color = [ordered]@{ expr = [ordered]@{ Literal = [ordered]@{ Value = "'#111927'" } } } } }
            transparency = [ordered]@{ expr = [ordered]@{ Literal = [ordered]@{ Value = "0D" } } }
        }})
    }
}
$page | ConvertTo-Json -Depth 30 | Set-Content -LiteralPath (Join-Path $pageRoot "page.json") -Encoding utf8

Save-Visual (New-Textbox "pageTitle" "Rep Opportunity Participation & Overlap Analysis" 20 16 1240 42 1000 22)
Save-Visual (New-Textbox "pageSubtitle" "Compare claimed opportunity ownership with measurable sales activity to identify unsupported pipeline and participation gaps." 20 58 1240 30 2000 10)

$slicers = @(
    @("slicerTeam","Team","Team",20),
    @("slicerManager","Manager","Manager",330),
    @("slicerStatus","Overall Participation Status","Overall Participation Status",640),
    @("slicerRep","Rep Name","Rep Name",950)
)
$z = 3000
foreach ($s in $slicers) {
    $v = Copy-Object (Get-Content -Raw $prototype.Slicer | ConvertFrom-Json)
    Set-Position $v $s[0] $s[3] 105 290 76 $z
    $v.visual.query.queryState.Values.projections = @(Column-Projection $s[1] $s[2] $true)
    Set-Title $v $s[2]
    Save-Visual $v
    $z += 1000
}

$cards = @(
    @("cardClaimed","Total Claimed Associations","Claimed Associations"),
    @("cardRate","Overall Confirmed Participation Rate","Confirmed Participation Rate"),
    @("cardNoEvidence","Total Claimed Without Evidence","Claimed Without Evidence"),
    @("cardUnsupported","Total Unsupported Pipeline","Unsupported Pipeline"),
    @("cardUnclaimed","Total Unclaimed Contributions","Unclaimed Contributors"),
    @("cardInactive","Total Inactive Contributors","Inactive Contributors")
)
$cardWidth = 196
for ($i=0; $i -lt $cards.Count; $i++) {
    $v = Copy-Object (Get-Content -Raw $prototype.Card | ConvertFrom-Json)
    Set-Position $v $cards[$i][0] (20 + $i*207) 205 $cardWidth 125 (8000 + $i*1000)
    $v.visual.query.queryState.Data.projections = @(Measure-Projection $cards[$i][1] $cards[$i][2] $true)
    if ($v.visual.query.PSObject.Properties.Name -contains "sortDefinition") { $v.visual.query.PSObject.Properties.Remove("sortDefinition") }
    Set-Title $v $cards[$i][2]
    Save-Visual $v
}

$table = Copy-Object (Get-Content -Raw $prototype.Table | ConvertFrom-Json)
Set-Position $table "representativeSummary" 20 355 1240 620 15000
$table.visual.query.queryState.Values.projections = @(
    Column-Projection "Rep Name" "Rep" $true
    Column-Projection "Team" "Team"
    Column-Projection "Manager" "Manager"
    Column-Projection "Claimed Opportunity Count" "Claimed Opps"
    Column-Projection "Confirmed Opportunity Count" "Confirmed Opps"
    Column-Projection "Light Participation Count" "Light"
    Column-Projection "Claimed - No Evidence Count" "No Evidence"
    Column-Projection "Inactive Contributor Count" "Inactive"
    Column-Projection "Unclaimed Contribution Count" "Unclaimed"
    Column-Projection "Confirmed Participation Rate" "Confirmation Rate"
    Column-Projection "Claimed Pipeline Amount" "Claimed Pipeline"
    Column-Projection "Unsupported Claimed Pipeline" "Unsupported Pipeline"
    Column-Projection "Average Participation Score" "Participation Score"
    Column-Projection "Overall Participation Status" "Status"
)
Remove-PrototypeQueryMetadata $table
$table.visual.query | Add-Member sortDefinition ([pscustomobject][ordered]@{
    sort = @([ordered]@{
        field = (Column-Projection "Unsupported Claimed Pipeline" "Unsupported Pipeline").field
        direction = "Descending"
    })
})
Set-Title $table "Representative Participation Summary"
Save-Visual $table

$bar = Copy-Object (Get-Content -Raw $prototype.Bar | ConvertFrom-Json)
Set-Position $bar "unsupportedByRep" 20 1010 400 420 16000
if ($bar.visual.PSObject.Properties.Name -contains "filterConfig") { $bar.visual.PSObject.Properties.Remove("filterConfig") }
$bar.visual.query.queryState = [ordered]@{
    Category = [ordered]@{ projections = @(Column-Projection "Rep Name" "Rep" $true) }
    Y = [ordered]@{ projections = @(Measure-Projection "Total Unsupported Pipeline" "Unsupported Pipeline") }
}
Remove-PrototypeQueryMetadata $bar
Set-Title $bar "Representatives with the Most Unsupported Pipeline"
Save-Visual $bar

$column = Copy-Object (Get-Content -Raw $prototype.Column | ConvertFrom-Json)
Set-Position $column "integrityByTeam" 440 1010 400 420 17000
if ($column.visual.PSObject.Properties.Name -contains "filterConfig") { $column.visual.PSObject.Properties.Remove("filterConfig") }
$column.visual.query.queryState = [ordered]@{
    Category = [ordered]@{ projections = @(Column-Projection "Team" "Team" $true) }
    Y = [ordered]@{ projections = @(Measure-Projection "Overall Confirmed Participation Rate" "Confirmed Participation Rate") }
    Tooltips = [ordered]@{ projections = @(Measure-Projection "Total Unsupported Pipeline" "Unsupported Pipeline") }
}
Remove-PrototypeQueryMetadata $column
Set-Title $column "Participation Integrity by Team"
Save-Visual $column

$donut = Copy-Object (Get-Content -Raw $prototype.Donut | ConvertFrom-Json)
Set-Position $donut "statusDistribution" 860 1010 400 420 18000
if ($donut.visual.PSObject.Properties.Name -contains "filterConfig") { $donut.visual.PSObject.Properties.Remove("filterConfig") }
$donut.visual.query.queryState = [ordered]@{
    Category = [ordered]@{ projections = @(Column-Projection "Overall Participation Status" "Status" $true) }
    Y = [ordered]@{ projections = @(Measure-Projection "Representative Count" "Representatives") }
}
Remove-PrototypeQueryMetadata $donut
Set-Title $donut "Representatives by Participation Status"
Save-Visual $donut

$scatter = Copy-Object (Get-Content -Raw $prototype.Scatter | ConvertFrom-Json)
Set-Position $scatter "scoreVsPipeline" 20 1465 820 520 19000
if ($scatter.visual.PSObject.Properties.Name -contains "filterConfig") { $scatter.visual.PSObject.Properties.Remove("filterConfig") }
$scatter.visual.query.queryState = [ordered]@{
    Category = [ordered]@{ projections = @(Column-Projection "Rep Name" "Rep" $true) }
    X = [ordered]@{ projections = @(Measure-Projection "Selected Average Participation Score" "Participation Score" $true) }
    Y = [ordered]@{ projections = @(Measure-Projection "Total Unsupported Pipeline" "Unsupported Pipeline") }
    Size = [ordered]@{ projections = @(Measure-Projection "Total Claimed Pipeline" "Claimed Pipeline") }
    Legend = [ordered]@{ projections = @(Column-Projection "Overall Participation Status" "Status") }
}
Remove-PrototypeQueryMetadata $scatter
Set-Title $scatter "Participation Quality vs Unsupported Pipeline"
Save-Visual $scatter

Save-Visual (New-Textbox "assumptions" "Key assumptions`nRecent participation: 90 days`nConfirmed score: 60+ and recent`nPipeline is representative-attributed`nOpportunity-level overlap requires an opportunity-grain query." 870 1480 370 250 20000 11)
Save-Visual (New-Textbox "statusDefinitions" "Status definition`nHealthy: strong confirmation and no unsupported pipeline`nMonitor: moderate participation integrity`nAt Risk: low confirmation or unsupported pipeline`nInsufficient Data: not enough evidence to evaluate" 870 1750 370 235 21000 11)

$pagesFile = Join-Path $pagesRoot "pages.json"
$pages = Get-Content -Raw $pagesFile | ConvertFrom-Json
$order = @($pages.pageOrder | Where-Object { $_ -ne $pageId })
$pages.pageOrder = @($order + $pageId)
$pages | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $pagesFile -Encoding utf8

Write-Output "Created Tactical Report page '$pageId' with $((Get-ChildItem $visualsRoot -Directory).Count) visuals."
