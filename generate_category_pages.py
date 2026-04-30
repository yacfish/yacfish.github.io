#!/usr/bin/env python3
from pathlib import Path
import json
import shutil

projects_root = Path("projects")
template_file = Path("category.html")

if not template_file.exists():
    print("❌ category.html template not found!")
    exit(1)

# Load manifest
with open(projects_root / "manifest.json", encoding="utf-8") as f:
    manifest = json.load(f)

for category, cat_info in manifest.items():
    page_filename = f"{category}.html"
    page_path = Path(page_filename)
    
    # Read category title
    cat_config_file = projects_root / category / "data.json"
    title = cat_info.get("title", category.replace("-", " ").title())
    
    if cat_config_file.exists():
        with open(cat_config_file, encoding="utf-8") as f:
            config = json.load(f)
            title = config.get("title", title)

    # Read template and replace dynamic parts
    with open(template_file, encoding="utf-8") as f:
        html = f.read()

    # Replace title and container ID
    html = html.replace("Category - Yacine Sebti", f"{title} - Yacine Sebti")
    html = html.replace('id="dynamic-full-page"', f'id="full-{category}"')

    # Write the page
    with open(page_path, "w", encoding="utf-8") as f:
        f.write(html)

    print(f"✓ Generated {page_filename} → {title}")

print(f"\n✅ All {len(manifest)} category pages have been generated/updated.")
