# SEO Prompts — Gemini CLI Context

This repository contains a library of professional SEO prompts organized by category in the `skills/` folder.

## How to run a prompt

Point Gemini at the prompt file and provide your data or context:

```
Read skills/technical-seo/robots-audit.md and follow its instructions.
[paste your robots.txt here]
```

```
Read skills/analytics/ga4-traffic.md and follow its instructions.
The GA4 data is in data/ga4-export.csv. Site: acme.com. Period: last 3 months vs prior 3 months.
```

## Available prompts

### Technical SEO — `skills/technical-seo/`

- `robots-audit.md` — audit robots.txt for blocked resources, syntax errors, and crawl budget issues
- `sitemap-audit.md` — audit XML sitemaps for non-200 URLs, noindex conflicts, and structural issues
- `schema-generator.md` — generate valid JSON-LD for any schema type
- `canonical-audit.md` — audit canonical tags for chains, conflicts, and mismatches
- `hreflang-audit.md` — audit hreflang annotations for missing return links and incorrect codes
- `cwv-diagnosis.md` — diagnose LCP, INP, and CLS failures with code-level fixes
- `redirect-map.md` — generate redirect maps and server config rules
- `internal-links.md` — audit internal link structure for orphaned pages and anchor text issues
- `server-logs.md` — analyze server logs for 404s, 5xx errors, and crawl waste
- `crawl-budget.md` — analyze crawl budget waste and produce a prioritized crawl efficiency action plan

### On-Page SEO — `skills/on-page-seo/`

- `title-rewrite.md` — rewrite title tags for improved CTR and keyword placement
- `headings-audit.md` — audit H1–H3 structure for keyword coverage and skipped levels
- `alt-text.md` — generate SEO-optimized, accessibility-compliant alt text
- `content-brief.md` — create a detailed writer-ready content brief
- `content-refresh.md` — produce a section-by-section content refresh plan
- `faq-generator.md` — generate PAA-targeted FAQ sections with FAQPage JSON-LD
- `thin-content.md` — diagnose and rewrite thin content pages
- `meta-descriptions.md` — generate click-optimized meta descriptions

### Content & Link Building — `skills/content-link-building/`

- `keyword-research.md` — full keyword research with intent classification and cluster suggestions
- `write-blog.md` — write a 1,200–1,800 word SEO-optimized blog post
- `pillar-page.md` — write a 2,500–4,000 word pillar page
- `topic-cluster.md` — design a complete topic cluster with internal linking map
- `content-calendar.md` — build an SEO content calendar in markdown table format
- `comparison-article.md` — write a commercial comparison article with head-to-head table
- `outreach-email.md` — produce outreach email sequences for 6 link building campaign types
- `brand-mention-pitch.md` — write pitches to convert unlinked mentions into backlinks
- `press-release.md` — write a newswire-ready press release in AP style
- `backlink-article.md` — write an editorial article with a natural backlink placement

### Local SEO — `skills/local-seo/`

- `gbp-description.md` — write 3 GBP description variants with optimization checklist
- `local-landing.md` — write a local landing page for a service + city combination
- `review-responses.md` — generate a library of 12 review response templates

### E-commerce SEO — `skills/ecommerce-seo/`

- `product-description.md` — write product descriptions in three formats plus meta elements
- `category-page.md` — write above- and below-the-fold category page content
- `product-schema.md` — generate complete Product JSON-LD with Offer and AggregateRating

### Analytics & Data — `skills/analytics/`

- `ga4-traffic.md` — analyze GA4 organic traffic trends and landing page quality
- `ga4-conversions.md` — identify which organic pages drive the most conversions
- `ga4-content.md` — map content into a traffic × engagement matrix
- `gsc-indexing.md` — diagnose GSC Coverage report exclusions with fixes
- `gsc-links.md` — analyze GSC link data for equity distribution and anchor text risks

### Reporting & Analysis — `skills/reporting-analysis/`

- `competitor-analysis.md` — full competitive intelligence report with 3-month action plan
- `content-gap.md` — identify keyword and topic gaps with a prioritized content roadmap
- `gsc-performance.md` — analyze GSC performance for trends and opportunities
- `monthly-report.md` — write a client-ready monthly SEO report
- `penalty-diagnosis.md` — diagnose traffic drops and produce a recovery action plan

### GEO & LLM Optimization — `skills/geo-llm/`

- `geo-audit.md` — audit a page across 7 GEO dimensions and return a GEO Readiness Score
- `geo-rewrite.md` — rewrite a page to maximize AI citation chances
- `geo-entity.md` — create a complete entity definition package with JSON-LD
- `geo-visibility.md` — generate a query test set and brand visibility score across AI tools
- `geo-citations.md` — analyze which sources AI tools cite and produce a Citation Opportunity Map

## Brand voice

If a `brand-voice.md` file exists in the current directory, read it before running any content prompt and match the brand's tone, vocabulary, and language throughout the output.

Example:

```
Read brand-voice.md and then read skills/content-link-building/write-blog.md and follow its instructions.
Primary keyword: "project management software", site: acme.com
```

## Working with client data

Data files are stored in the `data/` folder. Always check there first when the user references a file without a path. Supported file types include CSV exports, screenshots, log files, and any other client data.

Common file patterns:
- `data/gsc-performance*.csv` → use with `gsc-performance.md`
- `data/ga4-organic*.csv` → use with `ga4-traffic.md` or `ga4-content.md`
- `data/screaming-frog*.csv` → use with `internal-links.md` or `canonical-audit.md`
- `data/server-logs*` or `data/*.log` → use with `server-logs.md`
- `data/*.png` / `data/*.jpg` → screenshots (PageSpeed, GSC, GA4, etc.)

## Saving outputs

After running any prompt, save the output as a markdown file in the `outputs/` folder. Use a descriptive filename that includes the prompt name and date, for example:

- `outputs/gsc-performance-2026-02.md`
- `outputs/write-blog-email-marketing-2026-02.md`
- `outputs/robots-audit-acme-2026-02.md`

If the user specifies a filename, use that instead.

## Important notes

- Always review AI output before publishing, deploying, or sending to a client. LLMs can make mistakes — URLs, schema syntax, redirect rules, and facts may be incorrect.
- Never share client data (analytics exports, crawl reports, GSC data) with any AI tool without explicit client permission.
- Placeholders in output are marked `[PLACEHOLDER: description]` — search for `[` before treating any output as final.
