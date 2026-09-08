# Yacine Sebti — Portfolio

Personal portfolio site (GitHub Pages): art, installations, performances, game development, and software.

## Adding a project

1. Create a folder under the right category, e.g. `projects/software/my-project/`.
2. Add `data.json` with at least `title`, `date`, `description`, and optional `technologies`, `links`, `collaboration`.
3. Add an image next to it: `image.jpg` / `.png` / `.webp` / `.gif` / `.svg` (first match wins; order is jpg, jpeg, png, gif, webp, svg).
4. Regenerate the manifest and category pages:

```bash
python3 generate_manifest.py
python3 generate_category_pages.py
```

5. Commit and push to `main`.

Category order is set in each category's `projects/<category>/data.json` (`title`, `order`).
