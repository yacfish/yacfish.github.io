#!/bin/bash
echo "🔄 Regenerating manifest from projects/ folder structure..."
python3 generate_manifest.py

echo ""
echo "🚀 Starting local server → http://localhost:8000"
echo "   Press Ctrl+C to stop"
python3 -m http.server 8000
