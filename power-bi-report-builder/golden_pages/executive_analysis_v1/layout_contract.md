# Executive Analysis v1 Layout Contract

Extracted from `powerbi/src/Closing the Loop Strategy Report.Report/definition/pages/RepOpportunityOverlap`.

## Canvas

| Property | Value |
|---|---:|
| Width | `1280` |
| Height | `1900` |
| Display option | `FitToWidth` |
| Page background | `#2D2E3B` |
| Background transparency | `0D` |
| Left content margin | `33.815` for primary content, `13.924` for footer content |
| Right content margin | `22.875` at full-width tables |
| Header band height | `44.755` |
| Footer band height | `76.699` |

## Page Zones

| Zone | X | Y | Width | Height | Notes |
|---|---:|---:|---:|---:|---|
| Header chrome | `0` | `0` | `1280` | `96.473` | Logo, report label, title, back button, top-right nav. |
| Executive summary | `27.848` | `106.418` | `1164.631` | `61.663` | Two-line text block under header. |
| Executive cards | `33.815` | `185.983` | `1223.310` | `154.157` | Three equal card visuals. |
| Primary analysis row | `33.815` | `360.031` | `1223.310` | `419.705` | Left table plus right chart. |
| Detail evidence table | `33.815` | `810.567` | `1223.310` | `526.123` | Full-width detail table. |
| Peek Inside / footer info | `9.946` | `1498.803` | `1246.926` | `312.292` | AI score legend, scores, config, notes. |
| Platform footer | `0.043` | `1821.656` | `1280.583` | `76.699` | Footer background, platform version, copyright. |

## Header

| Element | Source Visual ID | Type | X | Y | Width | Height | Formatting |
|---|---|---|---:|---:|---:|---:|---|
| Partner logo | `ccd7716126bdcaa30ade` | `cardVisual` | `3.978` | `0.000` | `167.086` | `57.685` | Image URL value from model; no outline. |
| Report label | `supertitle` | `textbox` | `556.954` | `2.984` | `165.097` | `40.777` | Segoe UI, `9pt`, `#D25D88`, centered. |
| Header band | `ce0771750e39aa075139` | `shape` | `0.000` | `43.761` | `1279.005` | `44.755` | Rectangle fill `#3C3D4F`, no outline. |
| Back button | `8d4d65586ac19bd1401a` | `actionButton` | `3.978` | `43.761` | `98.462` | `45.750` | Back icon, text `Back`, icon size `15D`, custom placement. |
| Page title | `499f411213e6e1c73e88` | `textbox` | `364.009` | `37.793` | `551.981` | `58.679` | Segoe Bold, `18pt`, `#F2F4F8`, centered. |
| Header nav button | `390035b402e99e76aa07` | `actionButton` | `1200.435` | `0.000` | `79.565` | `43.761` | Custom image button. |

## Executive Summary

| Element | Source Visual ID | Type | X | Y | Width | Height | Typography |
|---|---|---|---:|---:|---:|---:|---|
| Summary text | `summary` | `textbox` | `27.848` | `106.418` | `1164.631` | `61.663` | First line Segoe UI `10pt` `#E6E6E6`; second line Segoe UI `8pt` `#A0A5B1`. |

## Executive Cards

| Card | Source Visual ID | X | Y | Width | Height |
|---|---|---:|---:|---:|---:|
| Left | `540e0f4eec35dc956b5a` | `33.815` | `185.983` | `384.895` | `154.157` |
| Middle | `d1ec094846c5b185457d` | `453.520` | `185.983` | `384.895` | `154.157` |
| Right | `7089706eede02a181c5a` | `872.230` | `185.983` | `384.895` | `154.157` |

| Property | Value |
|---|---|
| Horizontal gutter | `34.810` between cards |
| Fill | `#343746` |
| Outline | Hidden |
| Layout | Orientation `0D`, row count `2L`, column count `1L`, alignment `top`, cell padding `2L`, style `Cards`, autoGrid `true` |
| Default value text | Segoe UI Semibold, `13D`, `#E6E6E6`, left |
| Primary metric value | `20D`, bold, centered, theme data color `0` |
| Supporting status value | `10D`, centered, wraps, Segoe UI, theme data color `9` at `0.4` |
| Labels | Hidden |

## Primary Analysis

| Element | Source Visual ID | Type | X | Y | Width | Height | Notes |
|---|---|---|---:|---:|---:|---:|---|
| Main table | `mainTable` | `tableEx` | `33.815` | `360.031` | `730.008` | `419.705` | Left-side primary comparison. |
| Chart | `deltaBar` | `barChart` | `811.562` | `360.031` | `445.563` | `419.705` | Right-side distribution/comparison chart. |

| Property | Value |
|---|---|
| Table/chart gutter | `47.739` |
| Top gap after cards | `19.891` |
| Chart axis labels | `#A0A5B1`, `8D` |
| Chart category title/gridlines | Hidden |
| Chart value title | Shown, `11D`, theme data color `9` at `0.4` |
| Chart legend/data labels | Hidden |

## Tables

| Element | Source Visual ID | Type | X | Y | Width | Height |
|---|---|---|---:|---:|---:|---:|
| Primary table | `mainTable` | `tableEx` | `33.815` | `360.031` | `730.008` | `419.705` |
| Detail table | `detailMatrix` | `tableEx` | `33.815` | `810.567` | `1223.310` | `526.123` |

| Property | Primary Table | Detail Table |
|---|---|---|
| Header font | Segoe UI, `9D`, bold | Segoe UI, `9D`, bold |
| Header color | `#DDE1E8` | `#DDE1E8` |
| Header background | `#4A4C60` | `#4A4C60` |
| Header wrap | `true` | `true` |
| Header alignment | Center | Default |
| Body font | Segoe UI, `10D` | Segoe UI, `9D` |
| Body text | Primary `#E6E6E6`, secondary `#A0A5B1` | Primary `#E6E6E6` |
| Body background | Primary `#2D2E3B`, secondary `#343746` | Primary `#2D2E3B`, secondary `#343746` |
| Grid | Vertical grid `true`, grid color `#4A4C60`, row padding `1D` | Same |
| Totals | Hidden | Hidden |

## Peek Inside And AI Score Area

| Element | Source Visual ID | Type | X | Y | Width | Height |
|---|---|---|---:|---:|---:|---:|
| Peek Inside header | `9db8e9f0273aaced523a` | `actionButton` | `9.946` | `1498.803` | `233.722` | `50.723` |
| AI score legend | `e88feb836d49472d4696` | `textbox` | `778.741` | `1503.776` | `500.264` | `54.701` |
| AI section title | `6dee5b0e7030a4c10c2a` | `textbox` | `13.924` | `1621.134` | `242.673` | `44.755` |
| AI score card | `1b9c8239210c9e3126c3` | `cardVisual` | `0.995` | `1693.737` | `222.782` | `72.603` |
| AI score label | `85ef41ec0d9224c2709d` | `textbox` | `18.897` | `1654.949` | `251.624` | `35.804` |
| AI score note | `48d3b94f987c8b4c6d43` | `textbox` | `19.891` | `1776.286` | `707.133` | `34.810` |
| Configuration title | `647502f2c56c97e1ad42` | `textbox` | `498.275` | `1621.134` | `239.689` | `44.755` |
| Configuration card | `eb31ba60598c059a50be` | `cardVisual` | `498.275` | `1654.949` | `320.249` | `150.179` |
| Notes title | `repOverlapOtherConsiderationsTitle` | `textbox` | `915.991` | `1619.145` | `327.211` | `48.733` |
| Notes body | `repOverlapOtherConsiderations` | `textbox` | `915.991` | `1655.944` | `305.330` | `149.184` |

## Footer

| Element | Source Visual ID | Type | X | Y | Width | Height | Formatting |
|---|---|---|---:|---:|---:|---:|---|
| Footer background | `96c85bdc3e94712c0f36` | `shape` | `0.043` | `1821.656` | `1280.583` | `76.699` | Fill `#27272C`, outline weight `0D`, z `0`. |
| Platform version | `575cb92e740592df37ae` | `cardVisual` | `13.503` | `1822.172` | `1254.427` | `51.146` | Five-column card, labels shown above values, `9D`, `#FEC300`, no fill/outline. |
| Release notes link | `1f7081b647589d980f71` | `textbox` | `20.289` | `1868.220` | `106.854` | `29.244` | Underlined link, `#FAA200`. |
| Copyright | `1d91444bd7cf5d2f8a9e` | `card` | `1.389` | `1873.319` | `1278.654` | `25.573` | Card using copyright measure; Segoe UI Semibold `8D`. |

## Alignment And Overflow Rules

| Rule | Value |
|---|---|
| Copy fixed chrome from the golden page | Required |
| Preserve page coordinates | Within `1px` unless an exception is declared |
| Keep visuals inside canvas | Required |
| Avoid overlap | Required except intentional header layering and footer background layering |
| Card row alignment | Same `y`, `width`, and `height` for all three cards |
| Table/chart row alignment | Same `y` and `height`; chart right edge near `1257.125` |
| Text wrapping | Summary and notes wrap; table values generally do not wrap |
| Minimum footer text | `7pt` for notes, `9pt` for score/configuration/footer cards |
| Maximum page title | `18pt`; shorten title before reducing below `16pt` |
