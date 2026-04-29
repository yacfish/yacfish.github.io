#!/usr/bin/env python3
from pathlib import Path
import json

data_dir = Path("data")

def get_filenames(folder):
    return sorted([f.stem for f in folder.glob("*.json")])

installations = get_filenames(data_dir / "installations")
performances = get_filenames(data_dir / "performances")

manifest = {
    "installations": installations,
    "performances": performances
}

with open(data_dir / "manifest.json", "w", encoding="utf-8") as f:
    json.dump(manifest, f, indent=2, ensure_ascii=False)

print(f"✅ Manifest regenerated!")
print(f"   Installations : {len(installations)} files")
print(f"   Performances  : {len(performances)} files")
print("   → data/manifest.json updated")
