#!/usr/bin/env python3
from pathlib import Path
import json

projects_root = Path("projects")
manifest = {}

for category_folder in sorted(projects_root.iterdir()):
    if not category_folder.is_dir():
        continue
    
    category_name = category_folder.name
    project_list = []

    for project_folder in category_folder.iterdir():
        if not project_folder.is_dir():
            continue
        data_file = project_folder / "data.json"
        if not data_file.exists():
            continue
            
        with open(data_file, encoding="utf-8") as f:
            data = json.load(f)
        
        # Get date (convert to number for proper sorting)
        date_str = data.get("date", "0")
        try:
            date_value = int(date_str[:4])  # take first 4 digits (year)
        except:
            date_value = 0
        
        project_list.append((date_value, project_folder.name))

    # Sort by date descending (newest first)
    project_list.sort(key=lambda x: x[0], reverse=True)
    
    # Keep only the folder names
    manifest[category_name] = [slug for _, slug in project_list]

# Save manifest
with open("data/manifest.json", "w", encoding="utf-8") as f:
    json.dump(manifest, f, indent=2, ensure_ascii=False)

print(f"✅ Manifest regenerated with chronological order ({len(manifest)} categories)")
for cat, items in manifest.items():
    print(f"   • {cat}: {len(items)} projects (newest first)")
