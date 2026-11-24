---
name: plan-session
description: Run an interactive planning discussion with the user — review all goals, exams, deadlines, and project progress in progress-hub, then work out together how to schedule study and work, and save the agreed plan. Use when the user wants to plan, prioritize, prepare for exams, plan what to learn for a project, or asks "how should I schedule this" (e.g. "plan session", "幫我規劃", "跟我討論行程", "/plan-session").
---

# Plan session

This is a conversation, not a one-shot report. Ask, propose, adjust, and only write once the user agrees.

## Find the hub folder

- If I gave a folder path in my request (e.g. "folder: <path>"), use it and save it as the only line of `~/.progress-hub/folder.txt` (create `~/.progress-hub/` if needed).
- Otherwise read the path from `~/.progress-hub/folder.txt`.
- If neither exists, ask me for the local path of my Google Drive "progress-hub" folder. Typical locations: macOS `~/Library/CloudStorage/GoogleDrive-<email>/My Drive/progress-hub`; Windows `G:\My Drive\progress-hub`. Do not guess.
- The folder contains `plans.md` and a `projects/` subfolder. Create `projects/` if missing; never create a second `plans.md` elsewhere.

## 1. Gather

Read `<folder>/plans.md` and every file in `<folder>/projects/`. If a calendar tool is available, read the next 14 days of events too. Read only at this stage.

## 2. Summarize the current picture

In a few lines: active goals, upcoming exams/deadlines (soonest first, with days remaining), each project's status and next step (with its key links from `## Links`, so the user can open the material), and anything overdue or stale (project not synced for 7+ days).

## 3. Fill the gaps — ask, don't assume

Ask only what is missing, a few questions at a time, for example:
- Exams: date and time, subjects/chapters covered, how confident the user feels per topic (e.g. 1–5), past weak spots.
- Projects that need learning: what must be learned, to what level, by when, and what "done" looks like.
- Capacity: hours available per weekday/weekend, fixed commitments, preferred study times, rest days.
- Priorities when things collide.

## 4. Propose a plan

- Work backwards from each deadline. Put the most study time where the exam is soonest × confidence is lowest.
- Exams: split into topics; schedule first pass, practice/past papers, and a final review 1–2 days before. Space repetitions; avoid cramming everything into the last day.
- Point study blocks to the material in each project's `## Links` (notes, artifacts, past exams) where relevant.
- Learning for projects: break into milestones with a small hands-on output each (e.g. "build a toy example of X"), tied to the project's Next Steps.
- Leave buffer (~20%) and at least one lighter day per week. Do not exceed the stated capacity.
- Show the plan as a compact week-by-week (or day-by-day for the next 7 days) table, and call out trade-offs or anything that doesn't fit.

## 5. Discuss and adjust

Ask what to change. Iterate until the user says it looks good. If something can't fit, say so plainly and offer options (drop, shrink, move).

## 6. Save (only after the user agrees)

Update `<folder>/plans.md` in English, keeping all other content unchanged:
- Exams and fixed-time sessions → `## Calendar Inbox` as `- Title | YYYY-MM-DD HH:mm (or all-day) | duration | notes` (e.g. study blocks `- Study: Linear Algebra ch.3 | 2026-12-02 19:00 | 2h | practice problems`). If a calendar tool is available and the user agrees, create the events directly instead and do not add them to the inbox.
- Tasks with due dates → `## Short-term To-dos` as `- [ ] Task (due: YYYY-MM-DD) [project: name]`.
- Bigger goals → `## Long-term Goals` as `- [ ] Goal (target: YYYY-MM or ongoing)`, with milestones as indented sub-items `  - [ ] Milestone (due: YYYY-MM-DD)`.
Never write passwords, keys, or tokens. Finish with a short recap of what was saved and the single most important thing to do next.

Reply in the user's language (default Traditional Chinese).
