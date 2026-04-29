const DATA_BASE = 'projects/';

async function loadManifest() {
  const res = await fetch('data/manifest.json');
  return await res.json();
}

async function loadProject(category, slug) {
  const res = await fetch(`${DATA_BASE}${category}/${slug}/data.json`);
  const data = await res.json();
  
  // Auto-detect image file in the same folder
  const imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
  for (const ext of imageExtensions) {
    try {
      const imgRes = await fetch(`${DATA_BASE}${category}/${slug}/image${ext}`);
      if (imgRes.ok) {
        data.image = `${DATA_BASE}${category}/${slug}/image${ext}`;
        break;
      }
    } catch(e) {}
  }
  
  return data;
}

async function renderProjects(containerId, category, limit = null) {
  const container = document.getElementById(containerId);
  if (!container) return;

  const manifest = await loadManifest();
  const list = manifest[category] || [];
  const projectsToShow = limit ? list.slice(0, limit) : list;

  let html = '';

  for (const slug of projectsToShow) {
    const p = await loadProject(category, slug);
    if (!p) continue;

    const collabLine = p.collaboration ? `<p>${p.collaboration}</p>` : '';

    html += `
      <div class="project shadow-large">
        <div class="project-image">
          <img src="${p.image || ''}" alt="${p.title}" />
        </div>
        <div class="project-info">
          <h3>${p.title} - ${p.date}</h3>
          ${collabLine}
          <p>${p.description}</p>
          ${p.links && Object.keys(p.links).length ? 
            `<a href="${Object.values(p.links)[0]}" target="_blank">${Object.keys(p.links)[0] === 'blog' ? 'Blogpost' : Object.keys(p.links)[0]}</a>` : ''}
        </div>
      </div>`;
  }

  container.innerHTML = html;
}

// Auto-load on page ready
document.addEventListener('DOMContentLoaded', () => {
  renderProjects('featured-installations', 'installations', 3);
  renderProjects('featured-performances', 'performances', 3);
  if (document.getElementById('all-installations')) renderProjects('all-installations', 'installations');
  if (document.getElementById('all-performances')) renderProjects('all-performances', 'performances');
});
