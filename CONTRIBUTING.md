# Contributing to AI SEO Skills

Thanks for taking the time to contribute. Every improvement — whether it's a better prompt, a bug fix, or a new skill — makes this library more useful for everyone.

---

## Ways to contribute

- **Improve an existing prompt** — better instructions, more accurate output, fixes for edge cases
- **Add a new prompt** — a skill that's missing from the library
- **Fix a bug** — something broken in a command or context file
- **Improve documentation** — clearer setup instructions, better examples
- **Share ideas** — open an issue with a suggestion or request

---

## Before you start

- Check the [open issues](https://github.com/nikkos/ai-seo-skills/issues) to avoid duplicating work
- For new prompts, open an issue first to discuss the idea before building it
- Keep prompts focused — one clear objective per skill file

---

## How to submit a contribution

1. Fork the repository
2. Create a branch: `git checkout -b my-improvement`
3. Make your changes (see guidelines below)
4. Push and open a Pull Request with a clear description of what you changed and why

---

## Prompt guidelines

Every prompt in `skills/` should follow this structure:

```
Role:
[Who the AI is — e.g. "You are a senior technical SEO specialist..."]

Objective:
[One sentence describing the goal of the prompt]

Core Requirements:
[Numbered list of specific instructions]

Input I Will Provide:
[What the user will paste or reference]

Output Instructions:
[How the output should be structured]
```

Keep in mind:
- Write for a technically literate SEO professional — no need to explain basics
- Use severity labels (CRITICAL / WARNING / INFO) for audit-type prompts
- Output should be actionable — findings, fixes, and ready-to-use code or copy
- Do not hardcode language — output language should follow `brand-voice.md`
- Use `[PLACEHOLDER: description]` for anything site-specific

---

## Adding a new skill

1. Add the skill file to the correct category folder under `skills/`:
   - `skills/technical-seo/`
   - `skills/on-page-seo/`
   - `skills/content-link-building/`
   - `skills/local-seo/`
   - `skills/ecommerce-seo/`
   - `skills/analytics/`
   - `skills/reporting-analysis/`
   - `skills/geo-llm/`

2. Name the file descriptively without the `seo-` prefix, e.g. `page-speed-audit.md`

3. Create the corresponding slash command in `.claude/commands/` — same content but replace the `Input I Will Provide` / `Output Instructions` section with:
   ```
   ---

   $ARGUMENTS
   ```

4. Add the command to `.claude/commands/help.md`

5. Update `CLAUDE.md`, `GEMINI.md`, and `chatgpt.md` with the new skill

6. Update `README.md` — add a row to the relevant Prompt Reference table

---

## Questions or ideas?

Open an issue or send a message directly — always happy to discuss.
