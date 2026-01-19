---
name: Correlation Scores Decision-Ready
about: Improve interpretability and actionability of the Correlation Scores screen
title: "Make Performance Metrics – Correlation Scores decision-ready"
labels: enhancement
assignees: mrandersssson
---

Card: Make Performance Metrics – Correlation Scores decision-ready

Why

The Correlation Scores screen is analytically powerful but requires expert interpretation. Users must manually scan the matrix to understand what matters and why. We need to add light structure and guidance so insights are obvious, trustworthy, and actionable.

⸻

Problem
	•	No clear results anchor (everything correlates with everything)
	•	Weak vs strong correlations are visually similar
	•	Users must scan the entire matrix to identify key drivers
	•	No guidance on what to look at or what to do next

⸻

What to add

1. Results Anchor
	•	Add a selector to focus analysis on a single outcome metric (e.g. Bookings Won, ARR, Win Rate)
	•	Visually emphasize correlations tied to the selected outcome

Outcome: turns exploration into goal-driven analysis

⸻

2. Correlation Strength Interpretation
	•	Introduce explicit strength bands (e.g. strong / moderate / weak)
	•	Optional toggle to show only meaningful correlations

Outcome: reduces noise and prevents over-interpretation

⸻

3. Top Drivers Summary
	•	Surface the top positive and negative drivers for the selected outcome
	•	Ranked list derived from the matrix

Outcome: users get answers in seconds, not minutes

⸻

4. Contextual Guidance (lightweight)
	•	Add short tooltips or callouts explaining why key correlations may matter
	•	No heavy statistical language

Outcome: improves understanding and trust

⸻

Acceptance Criteria
	•	User can select a results metric and immediately see its strongest drivers
	•	Weak correlations can be visually de-emphasized or filtered out
	•	Top drivers are clearly visible without scanning the full matrix
	•	Screen supports faster interpretation without changing underlying data

⸻

Notes
	•	No changes to metric calculations
	•	No redesign of the core matrix
	•	Focus is interpretability, prioritization, and actionability
	•	This lays groundwork for future CIEN agent insights
