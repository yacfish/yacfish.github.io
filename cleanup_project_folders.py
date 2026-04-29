#!/usr/bin/env python3
from pathlib import Path

projects_root = Path("projects")

# Mapping: old messy name → clean name
rename_map = {
    "locusts---paperrain": "locusts-paper-rain",
    "infinite-journey--in-this-together…": "infinite-journey-in-this-together",
    "les-mystères-de-louest": "les-mysteres-de-l-ouest",
    "fragments#43-44": "fragments-43-44",
    "oups!": "oups",
    # Add any other weird ones you see
}

for category in projects_root.iterdir():
    if not category.is_dir():
        continue
    for old_folder in category.iterdir():
        if not old_folder.is_dir():
            continue
        old_name = old_folder.name
        if old_name in rename_map:
            new_name = rename_map[old_name]
            new_folder = old_folder.parent / new_name
            if new_folder.exists():
                print(f"⚠️  Skipping {old_name} (target already exists)")
            else:
                old_folder.rename(new_folder)
                print(f"✓ Renamed: {old_name} → {new_name}")

print("\n✅ Folder cleanup completed!")
