const DATA_BASE = 'projects/';

async function loadManifest() {
  const res = await fetch(`${DATA_BASE}manifest.json`);
  return await res.json();
}

async function loadProject(category, slug) {
  const res = await fetch(`${DATA_BASE}${category}/${slug}/data.json`);
  const data = await res.json();
  
  const exts = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
  for (const ext of exts) {
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
  const catData = manifest[category];
  if (!catData || !catData.projects) return;

  const list = catData.projects;
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

// Main logic
document.addEventListener('DOMContentLoaded', async () => {
  const manifest = await loadManifest();

  // HOMEPAGE - 3 featured per category
  const dynamicContainer = document.getElementById('dynamic-sections');
  if (dynamicContainer) {
    dynamicContainer.innerHTML = '';

    for (const [category, catInfo] of Object.entries(manifest)) {
      const sectionHTML = `
        <h2 class="heading shadow-pop-tr">${catInfo.title}</h2>
        <div class="container">
          <div class="row">
            <div id="featured-${category}"></div>
          </div>
          <a href="${category}.html" class="btn-rounded-white">More ${catInfo.title} →</a>
        </div>`;
      dynamicContainer.innerHTML += sectionHTML;
      await renderProjects(`featured-${category}`, category, 3);
    }
  }

  // FULL CATEGORY PAGE (e.g. gamedev.html)
  const fullContainer = document.querySelector('div[id^="full-"]');
  if (fullContainer) {
    const category = fullContainer.id.replace('full-', '');
    console.log(`Rendering full page for category: ${category}`);

    const catInfo = manifest[category];
    if (!catInfo) return;

    // Set nice title + back button
    fullContainer.innerHTML = `
      <h2 class="heading shadow-pop-tr">${catInfo.title}</h2>
      <div class="container">
        <div class="row">
          <div id="full-page-content"></div>
        </div>
        <a href="index.html" class="btn-rounded-white">← Back to Home</a>
      </div>`;

      await renderProjects("full-page-content", category);   // show ALL projects
    }
  }
);
