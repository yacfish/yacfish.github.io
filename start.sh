#!/bin/bash

echo "🔄 Regenerating manifest from projects/ folder..."
python3 generate_manifest.py

echo "🔄 Generating all category HTML pages..."
python3 generate_category_pages.py

echo ""
echo "🚀 Starting local server → http://localhost:8000"
echo "   Press Ctrl+C to stop"
python3 -m http.server 8000
