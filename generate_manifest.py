#!/usr/bin/env python3
from pathlib import Path
import json

projects_root = Path("projects")
manifest = {}

for category_folder in sorted(projects_root.iterdir()):
    if not category_folder.is_dir() or category_folder.name == "manifest.json":
        continue

    category_name = category_folder.name
    
    # Load category config
    cat_config_file = category_folder / "data.json"
    if cat_config_file.exists():
        with open(cat_config_file, encoding="utf-8") as f:
            cat_config = json.load(f)
    else:
        cat_config = {"title": category_name.title(), "order": 999}

    # Get projects
    project_list = []
    for project_folder in category_folder.iterdir():
        if not project_folder.is_dir() or project_folder.name == "data.json":
            continue
        data_file = project_folder / "data.json"
        if data_file.exists():
            with open(data_file, encoding="utf-8") as f:
                data = json.load(f)
            date_str = str(data.get("date", "0"))
            year = int(date_str[:4]) if date_str[:4].isdigit() else 0
            project_list.append((year, project_folder.name))

    project_list.sort(key=lambda x: x[0], reverse=True)

    manifest[category_name] = {
        "title": cat_config.get("title", category_name.title()),
        "order": cat_config.get("order", 999),
        "projects": [slug for _, slug in project_list]
    }

# Sort categories by order
sorted_manifest = dict(sorted(manifest.items(), key=lambda x: x[1]["order"]))

with open(projects_root / "manifest.json", "w", encoding="utf-8") as f:
    json.dump(sorted_manifest, f, indent=2, ensure_ascii=False)

print("✅ Manifest regenerated with category titles and ordering")
for cat, info in sorted_manifest.items():
    print(f"   • {info['title']} ({cat}): {len(info['projects'])} projects")
