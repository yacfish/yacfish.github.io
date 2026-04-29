#!/usr/bin/env python3
from pathlib import Path
import shutil
import json

old_data = Path("data")
old_images = Path("images/projects")
new_root = Path("projects")

new_root.mkdir(exist_ok=True)

def migrate_category(old_folder, category_name):
    new_cat = new_root / category_name
    new_cat.mkdir(exist_ok=True)
    
    for json_file in old_folder.glob("*.json"):
        with open(json_file, encoding="utf-8") as f:
            data = json.load(f)
        
        # Create clean slug from id or filename
        slug = data.get("id") or json_file.stem.lower().replace(" ", "-").replace("_", "-")
        
        project_folder = new_cat / slug
        project_folder.mkdir(exist_ok=True)
        
        # === Clean data.json (optimized structure) ===
        clean_data = {
            "title": data.get("title", ""),
            "date": data.get("date", ""),
            "collaboration": data.get("collaboration", ""),
            "description": data.get("longDescription") or data.get("description", ""),
            "technologies": data.get("technologies", []),
            "links": data.get("links", {})
        }
        
        # Save optimized data.json
        with open(project_folder / "data.json", "w", encoding="utf-8") as f:
            json.dump(clean_data, f, indent=2, ensure_ascii=False)
        
        # === Move image ===
        old_image_path = None
        if "image" in data:
            old_image_path = old_images / Path(data["image"]).name
        
        if old_image_path and old_image_path.exists():
            ext = old_image_path.suffix
            shutil.copy2(old_image_path, project_folder / f"image{ext}")
            print(f"✓ Migrated: {slug} + image")
        else:
            print(f"⚠️  No image found for: {slug}")

print("🚀 Starting migration to optimized structure...")

migrate_category(old_data / "installations", "installations")
migrate_category(old_data / "performances", "performances")

print("\n✅ Migration completed!")
print("New structure created in 'projects/' folder")
print("You can now delete the old 'data/' folder if everything looks good.")
