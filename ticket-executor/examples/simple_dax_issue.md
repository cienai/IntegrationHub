# Simple DAX Measure Fixture

## Summary
Fix a DAX measure that references the wrong governed rep-count measure.

## Ticket Type
DAX Measure

## Problem
The sample measure `Pilot Rep Count` is described as counting active sales reps, but the implementation currently references a nonexistent or wrong rep-count measure.

## Current Behavior
Running the verification query would fail or return a value that does not match the governed active-rep count.

## Expected Behavior
`Pilot Rep Count` should return the same value as the governed active-rep count for the same filter context.

## Affected Area
Fixture only. No production semantic model files may be modified during this pilot.

## Reproduction Steps
Review the ticket and produce a DAX repair plan. Do not run Power BI queries for this fixture.

## Source of Truth
The governed active-rep count measure named in a real ticket.

## Allowed Changes
For this fixture, only generate ticket-executor run artifacts.

## Prohibited Changes
Do not modify production reports, semantic models, PBIX files, or Agentic definitions.

## Verification Method
Verify that intake, classification, validation, execution plan, verification records, self-correction log, and handoff are generated.

## Acceptance Criteria
The fixture classifies as DAX Measure, uses the DAX repair executor, records that data verification was not run, and documents manual continuation steps.

## Notes
This fixture proves the executor path without touching governed model logic.
