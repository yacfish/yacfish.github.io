// =============================================
// Dynamic Project Loader - Yacine Sebti Portfolio
// =============================================

const DATA_BASE = 'data/';

async function loadManifest() {
  try {
    const res = await fetch(`${DATA_BASE}manifest.json`);
    return await res.json();
  } catch (e) {
    console.error("Failed to load manifest", e);
    return { installations: [], performances: [] };
  }
}

async function loadProject(category, filename) {
  try {
    const res = await fetch(`${DATA_BASE}${category}/${filename}.json`);
    return await res.json();
  } catch (e) {
    console.error(`Failed to load ${filename}`, e);
    return null;
  }
}

// Main function to render projects into a container
async function renderProjects(containerId, category, limit = null) {
  const container = document.getElementById(containerId);
  if (!container) return;

  const manifest = await loadManifest();
  const list = manifest[category] || [];
  
  // Optional limit (for homepage "featured" section)
  const projectsToShow = limit ? list.slice(0, limit) : list;

  let html = '';

  for (const filename of projectsToShow) {
    const project = await loadProject(category, filename);
    if (!project) continue;

    html += `
      <div class="project-card" data-id="${project.id}">
        <a href="#" onclick="showProjectDetail('${category}', '${filename}'); return false;">
          <img src="${project.image}" alt="${project.title}" loading="lazy">
          <div class="project-info">
            <h3>${project.title}</h3>
            <p class="date">${project.date}</p>
            ${project.collaboration ? `<p class="collaboration">with ${project.collaboration}</p>` : ''}
            <p class="description">${project.description}</p>
          </div>
        </a>
      </div>
    `;
  }

  container.innerHTML = html;
}

// Optional: Lightbox / Detail modal
let currentProject = null;

async function showProjectDetail(category, filename) {
  currentProject = await loadProject(category, filename);
  if (!currentProject) return;

  // TODO: Create a nice modal with longDescription, technologies, links, etc.
  console.log("Opening project:", currentProject.title);
  alert(`Project: ${currentProject.title}\n\n${currentProject.longDescription}`);
  // We will improve this with a real modal later
}

// Auto-load on homepage when ready
document.addEventListener('DOMContentLoaded', () => {
  // Example: Load 3 featured installations on homepage
  if (document.getElementById('featured-installations')) {
    renderProjects('featured-installations', 'installations', 3);
  }
  if (document.getElementById('featured-performances')) {
    renderProjects('featured-performances', 'performances', 3);
  }
});
