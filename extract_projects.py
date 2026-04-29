#!/usr/bin/env python3
from bs4 import BeautifulSoup
import json
import os
from pathlib import Path

# Paths
PROJECT_ROOT = Path(".")
HTML_INSTALL = PROJECT_ROOT / "interactive-installations.html"
HTML_PERF   = PROJECT_ROOT / "live-performances.html"
DATA_DIR    = PROJECT_ROOT / "data"

DATA_DIR.mkdir(parents=True, exist_ok=True)
(DATA_DIR / "installations").mkdir(exist_ok=True)
(DATA_DIR / "performances").mkdir(exist_ok=True)

def normalize_image_path(img_src):
    """Convert old p_xxx.jpg to the short name we have in images/projects/"""
    filename = img_src.split('/')[-1].replace('p_', '').lower()
    # known mappings from your current folder
    mapping = {
        "oscillatory.jpg": "oscillatory.jpg",
        "locust.jpg": "locust.jpg",
        "inland.jpg": "inland.jpg",
        "lagunas.jpg": "lagunas.jpg",
        "chovevhuva.jpg": "chovevhuva.jpg",
        "moviola.jpg": "moviola.jpg",
        "cyclorama.jpg": "cyclorama.jpg",
        "gesto.jpg": "gesto.jpg",
        "cyclokino.jpg": "cyclokino.jpg",
        "patmap.jpg": "patmap.jpg",
        "mixedmemory.jpg": "mixedmemory.jpg",
        "pascal.jpg": "pascal.jpg",
        "12i.jpg": "12i.jpg",
        "lungs.jpg": "lungs.jpg",
        "oups.jpg": "oups.jpg",
        "legacy.jpg": "legacy.jpg",
        "savethelast.jpg": "savethelast.jpg",
        "ubique.jpg": "ubique.jpg",
        "infinite.jpg": "infinite.jpg",
        "argos.jpg": "argos.jpg",
        "tarelkin.jpg": "tarelkin.jpg",
        "perfection.jpg": "perfection.jpg",
        "7adda.jpg": "7adda.jpg",
        "mysteres.jpg": "mysteres.jpg",
        "eva.jpg": "eva.jpg",
        "frag.jpg": "frag.jpg",
    }
    return f"images/projects/{mapping.get(filename, filename)}"

def parse_page(html_file, category):
    with open(html_file, "r", encoding="utf-8") as f:
        soup = BeautifulSoup(f, "lxml")

    projects = []
    for project_div in soup.find_all("div", class_="project"):
        img_tag = project_div.find("img")
        h3 = project_div.find("h3")
        ps = project_div.find_all("p")
        a_tag = project_div.find("a")

        if not h3:
            continue

        title_text = h3.get_text(strip=True)
        title = title_text.split(" - ")[0].strip()
        date = title_text.split(" - ")[-1].strip() if " - " in title_text else ""

        collab = ps[0].get_text(strip=True) if len(ps) > 0 else ""
        description = ps[1].get_text(strip=True) if len(ps) > 1 else ""

        link = {}
        if a_tag and a_tag.get("href"):
            href = a_tag["href"]
            text = a_tag.get_text(strip=True).lower()
            if "blog" in text or "blogpost" in text:
                link = {"blog": href}
            elif "vimeo" in href:
                link = {"vimeo": href}
            elif "youtube" in href:
                link = {"youtube": href}
            else:
                link = {"link": href}

        image = normalize_image_path(img_tag["src"]) if img_tag else ""

        project = {
            "id": title.lower().replace(" ", "-").replace("/", "-").replace("'", ""),
            "title": title,
            "date": date,
            "collaboration": collab,
            "description": description,
            # "longDescription": description,   # for now we use the full paragraph
            "technologies": [],
            "links": link,
            "image": image
        }
        projects.append(project)

        # Save individual JSON
        filename = title.replace(" ", "_").replace("/", "_").replace("'", "").replace("#", "")
        json_path = DATA_DIR / category / f"{filename}.json"
        with open(json_path, "w", encoding="utf-8") as f:
            json.dump(project, f, indent=2, ensure_ascii=False)

    return projects

print("📄 Extracting Interactive Installations...")
install_projects = parse_page(HTML_INSTALL, "installations")

print("📄 Extracting Live Performances...")
perf_projects = parse_page(HTML_PERF, "performances")

# Create manifest
manifest = {
    "installations": [p["id"].replace("-", "_").title().replace("_", "") for p in install_projects],
    "performances": [p["id"].replace("-", "_").title().replace("_", "") for p in perf_projects]
}

with open(DATA_DIR / "manifest.json", "w", encoding="utf-8") as f:
    json.dump(manifest, f, indent=2, ensure_ascii=False)

print(f"✅ Done! Extracted {len(install_projects)} installations and {len(perf_projects)} performances.")
print("   All JSON files are now in data/ folder.")
print("   Refresh http://localhost:8000")
