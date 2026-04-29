const DATA_BASE = 'data/';

async function loadManifest() {
  const res = await fetch(`${DATA_BASE}manifest.json`);
  return await res.json();
}

async function loadProject(category, filename) {
  const res = await fetch(`${DATA_BASE}${category}/${filename}.json`);
  return await res.json();
}

async function renderProjects(containerId, category, limit = null) {
  const container = document.getElementById(containerId);
  if (!container) return;

  const manifest = await loadManifest();
  const list = manifest[category] || [];
  const projectsToShow = limit ? list.slice(0, limit) : list;

  let html = '';

  for (const filename of projectsToShow) {
    const p = await loadProject(category, filename);
    if (!p) continue;

    const collabLine = p.collaboration ? `<p>${p.collaboration}</p>` : '';

    html += `
      <div class="project shadow-large">
        <div class="project-image">
          <img src="${p.image}" alt="${p.title}" />
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

// For homepage (featured only)
document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('featured-installations')) {
    renderProjects('featured-installations', 'installations', 3);
  }
  if (document.getElementById('featured-performances')) {
    renderProjects('featured-performances', 'performances', 3);
  }

  // For full pages
  if (document.getElementById('all-installations')) {
    renderProjects('all-installations', 'installations');
  }
  if (document.getElementById('all-performances')) {
    renderProjects('all-performances', 'performances');
  }
});
