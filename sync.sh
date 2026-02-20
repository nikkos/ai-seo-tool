#!/usr/bin/env python3
"""
sync.sh — Sync skills/ to .claude/commands/

Reads every skill file in skills/, strips the "Input I Will Provide" /
"Output Instructions" trailing section, appends $ARGUMENTS, and writes
the result to the matching file in .claude/commands/.

Usage:
    python3 sync.sh
    # or make it executable and run directly:
    # chmod +x sync.sh && ./sync.sh
"""

import os
import re

SKILLS_DIR = os.path.join(os.path.dirname(__file__), "skills")
COMMANDS_DIR = os.path.join(os.path.dirname(__file__), ".claude", "commands")

TRAILING_MARKERS = [
    r"^Input I Will Provide:",
    r"^Input I will Provide:",
    r"^Input:",
]

SKILL_TO_COMMAND = {
    "analytics/ga4-content-performance.md":              "ga4-content.md",
    "analytics/ga4-conversion-analysis.md":              "ga4-conversions.md",
    "analytics/ga4-organic-traffic-analysis.md":         "ga4-traffic.md",
    "analytics/gsc-indexing-audit.md":                   "gsc-indexing.md",
    "analytics/gsc-links-report-analysis.md":            "gsc-links.md",
    "content-link-building/comparison-article.md":       "comparison-article.md",
    "content-link-building/content-calendar.md":         "content-calendar.md",
    "content-link-building/keyword-research.md":         "keyword-research.md",
    "content-link-building/outreach-email-template.md":  "outreach-email.md",
    "content-link-building/pillar-page-writer.md":       "pillar-page.md",
    "content-link-building/press-release.md":            "press-release.md",
    "content-link-building/topic-cluster-planner.md":    "topic-cluster.md",
    "content-link-building/unlinked-brand-mention-pitch.md": "brand-mention-pitch.md",
    "content-link-building/write-a-backlink-article.md": "backlink-article.md",
    "content-link-building/write-blog-post.md":          "write-blog.md",
    "ecommerce-seo/category-page-content-writer.md":     "category-page.md",
    "ecommerce-seo/product-description-writer.md":       "product-description.md",
    "ecommerce-seo/product-schema-generator.md":         "product-schema.md",
    "geo-llm/geo-ai-citation-analysis.md":               "geo-citations.md",
    "geo-llm/geo-brand-visibility-checker.md":           "geo-visibility.md",
    "geo-llm/geo-content-audit.md":                      "geo-audit.md",
    "geo-llm/geo-content-rewrite.md":                    "geo-rewrite.md",
    "geo-llm/geo-entity-definition.md":                  "geo-entity.md",
    "local-seo/google-business-profile-description.md":  "gbp-description.md",
    "local-seo/local-landing-page-writer.md":            "local-landing.md",
    "local-seo/review-response-templates.md":            "review-responses.md",
    "on-page-seo/content-brief.md":                      "content-brief.md",
    "on-page-seo/content-refresh.md":                    "content-refresh.md",
    "on-page-seo/faq-section-generator.md":              "faq-generator.md",
    "on-page-seo/heading-structure-audit.md":            "headings-audit.md",
    "on-page-seo/image-alt-text-generator.md":           "alt-text.md",
    "on-page-seo/thin-content-rewrite.md":               "thin-content.md",
    "on-page-seo/title-tag-rewrite.md":                  "title-rewrite.md",
    "on-page-seo/write-meta-descriptions.md":            "meta-descriptions.md",
    "reporting-analysis/competitor-analysis.md":         "competitor-analysis.md",
    "reporting-analysis/content-gap-analysis.md":        "content-gap.md",
    "reporting-analysis/google-search-console-analysis.md": "gsc-performance.md",
    "reporting-analysis/monthly-report-writer.md":       "monthly-report.md",
    "reporting-analysis/penalty-diagnosis.md":           "penalty-diagnosis.md",
    "technical-seo/canonical-tags-audit.md":             "canonical-audit.md",
    "technical-seo/check-server-app-logs.md":            "server-logs.md",
    "technical-seo/core-web-vitals-diagnosis.md":        "cwv-diagnosis.md",
    "technical-seo/hreflang-audit.md":                   "hreflang-audit.md",
    "technical-seo/internal-linking-audit.md":           "internal-links.md",
    "technical-seo/redirect-map-generator.md":           "redirect-map.md",
    "technical-seo/robots-txt-audit.md":                 "robots-audit.md",
    "technical-seo/schema-markup-generator.md":          "schema-generator.md",
    "technical-seo/xml-sitemap-audit.md":                "sitemap-audit.md",
}


def sync():
    updated = []
    skipped = []

    for skill_rel, cmd_name in SKILL_TO_COMMAND.items():
        skill_path = os.path.join(SKILLS_DIR, skill_rel)
        cmd_path = os.path.join(COMMANDS_DIR, cmd_name)

        if not os.path.exists(skill_path):
            skipped.append(f"  MISSING: {skill_rel}")
            continue

        with open(skill_path, "r") as f:
            lines = f.readlines()

        cut_idx = None
        for i, line in enumerate(lines):
            for marker in TRAILING_MARKERS:
                if re.match(marker, line.strip()):
                    cut_idx = i
                    while cut_idx > 0 and lines[cut_idx - 1].strip() == "":
                        cut_idx -= 1
                    break
            if cut_idx is not None:
                break

        body = "\n".join(l.rstrip("\n") for l in lines[:cut_idx]) if cut_idx else "".join(lines).rstrip()
        new_content = body.rstrip() + "\n\n---\n\n$ARGUMENTS\n"

        # Only write if content changed
        existing = open(cmd_path).read() if os.path.exists(cmd_path) else None
        if new_content != existing:
            with open(cmd_path, "w") as f:
                f.write(new_content)
            updated.append(f"  updated: {skill_rel} -> {cmd_name}")
        else:
            updated.append(f"  ok:      {skill_rel} -> {cmd_name}")

    print("\n=== Sync complete ===\n")
    for line in updated:
        print(line)
    for line in skipped:
        print(line)
    print(f"\n{len(updated)} processed, {len(skipped)} skipped.")


if __name__ == "__main__":
    sync()
