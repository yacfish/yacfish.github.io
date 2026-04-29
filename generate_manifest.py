#!/usr/bin/env python3
from pathlib import Path
import json

projects_root = Path("projects")
manifest = {}

for category_folder in sorted(projects_root.iterdir()):
    if not category_folder.is_dir() or category_folder.name == "manifest.json":
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
        
        # Extract date for sorting (take year at minimum)
        date_str = str(data.get("date", "0"))
        try:
            year = int(date_str[:4])
        except:
            year = 0
        
        project_list.append((year, project_folder.name))

    # Sort by date descending (newest first)
    project_list.sort(key=lambda x: x[0], reverse=True)
    
    manifest[category_name] = [slug for _, slug in project_list]

# Save manifest inside projects/
with open(projects_root / "manifest.json", "w", encoding="utf-8") as f:
    json.dump(manifest, f, indent=2, ensure_ascii=False)

print(f"✅ Manifest regenerated with chronological order")
for cat, items in manifest.items():
    print(f"   • {cat}: {len(items)} projects (newest first)")
