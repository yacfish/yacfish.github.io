#!/bin/bash

echo "🔄 Regenerating ALL JSON files with 100% exact original content from your HTML files..."

# ==================== INSTALLATIONS ====================

cat > data/installations/Oscillatory_Motion.json << 'EOF'
{
  "id": "oscillatory-motion",
  "title": "Oscillatory Motion",
  "date": "2021",
  "collaboration": "Beatrijs Albers and Reggy Timmermans",
  "description": "Interactive installation with three custom-built robots.",
  "longDescription": "Design of three robots' structures, drive trains and various other components using OpenSCAD / Structural parts machining on a CNC using Fusion360 at FabLAB iMAL / Drive train and other parts design and 3d printing / E-bike like lithium battery pack custom design using 18650 spot-welded and a BMS / Motor control and sensor data collection using two Arduinos on each robot / Sensors' data interpretation path planning and sound playback in MaxMSP running on a miniPC on each robot.",
  "technologies": ["OpenSCAD", "Fusion360", "Arduino", "MaxMSP", "miniPC", "CNC"],
  "links": { "blog": "https://index.nadine.be/oscillatory-motion/" },
  "image": "images/projects/oscillatory.jpg"
}
EOF

cat > data/installations/Locusts_PaperRain.json << 'EOF'
{
  "id": "locusts-paper-rain",
  "title": "Locusts / paperRain",
  "date": "2021",
  "collaboration": "George Van Dam and Various Artists",
  "description": "Interactive installation with music boxes and explosive video sequences.",
  "longDescription": "Dedicated Audio-Video player developed in MaxMSP / Interpretation of the output of 8 music boxes via piezos microphones / Interactive playback of an explosive video sequence and a quadraphonic soundtrack.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "blog": "https://various-artists-0v2g.squarespace.com/locusts" },
  "image": "images/projects/locust.jpg"
}
EOF

cat > data/installations/Inland_Wonderland.json << 'EOF'
{
  "id": "inland-wonderland",
  "title": "Inland Wonderland",
  "date": "2021",
  "collaboration": "Alexandra Dementieva",
  "description": "Interactive sculpture with accelerometer-driven 2D animation.",
  "longDescription": "Dedicated software developed in Godot game engine / Accelerometer data collection with an Arduino / Interactive 2d animation loop for the two screens within the sculpture using the sensor data as input to influence the scenario.",
  "technologies": ["Godot", "Arduino"],
  "links": { "blog": "https://alexdementieva.org/installationpages/i_inland_wonderland.html" },
  "image": "images/projects/inland.jpg"
}
EOF

cat > data/installations/Lagunas.json << 'EOF'
{
  "id": "lagunas",
  "title": "Lagunas",
  "date": "2017",
  "collaboration": "Laura Colmenares Guerra",
  "description": "Interactive video installation with parametric sequencer.",
  "longDescription": "Parametric video sequencer in MaxMSP-Jitter controlling three vertical displays / Arduino shield and C programming for IR sensors / GLSL Pixel Shader development.",
  "technologies": ["MaxMSP", "Jitter", "Arduino", "GLSL"],
  "links": { "blog": "https://ulara.org/selected-work/lagunas" },
  "image": "images/projects/lagunas.jpg"
}
EOF

cat > data/installations/Chove_Chuva.json << 'EOF'
{
  "id": "chove-chuva",
  "title": "Chove Chuva",
  "date": "2016",
  "collaboration": "Cildo Meireles",
  "description": "Technical direction for video/aquatic installation.",
  "longDescription": "Arduino actuated electro-vans for pseudo rain / OpenFrameworks video player / Kinect presence tracking.",
  "technologies": ["OpenFrameworks", "Arduino", "Kinect"],
  "links": { "blog": "https://www.galleriacontinua.com/artists/cildo-meireles-47" },
  "image": "images/projects/chovevhuva.jpg"
}
EOF

cat > data/installations/Moviola.json << 'EOF'
{
  "id": "moviola",
  "title": "Moviola",
  "date": "2015",
  "collaboration": "Marcio Ambrosio",
  "description": "Interactive multi-media sculpture with 3D engine.",
  "longDescription": "Custom interactive 3d engine in MaxMSP-Jitter / Arduino shield for IR sensors / MadMapper projection mapping.",
  "technologies": ["MaxMSP", "Jitter", "Arduino", "MadMapper"],
  "links": { "youtube": "https://www.youtube.com/watch?v=dm05CBiqTFY" },
  "image": "images/projects/moviola.jpg"
}
EOF

cat > data/installations/CycloRamaDrome.json << 'EOF'
{
  "id": "cycloramodrome",
  "title": "CycloRamaDrome",
  "date": "2013",
  "collaboration": "Alexandra Dementieva",
  "description": "360° interactive video installation.",
  "longDescription": "Software in MaxMSP duplicating and animating treadmill clips / Kinect tracking / MadMapper edge blending.",
  "technologies": ["MaxMSP", "Kinect", "MadMapper"],
  "links": { "youtube": "https://www.youtube.com/watch?v=4tIG63eDiDo" },
  "image": "images/projects/cyclorama.jpg"
}
EOF

cat > data/installations/Gestographe.json << 'EOF'
{
  "id": "gestographe",
  "title": "Gestographe",
  "date": "2013",
  "collaboration": "Fred Chemama",
  "description": "Interactive photographic installation with body drawing.",
  "longDescription": "Dedicated capture software in MaxMSP-Jitter with accumulation effect / Real-time projection and printing.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "youtube": "https://www.youtube.com/watch?v=TNBotIDTLyE" },
  "image": "images/projects/gesto.jpg"
}
EOF

cat > data/installations/CycloKino.json << 'EOF'
{
  "id": "cyclokino",
  "title": "CycloKino",
  "date": "2012",
  "collaboration": "Fred Chemama and Bettina Kussel",
  "description": "Stationary bicycles controlling 2D animations.",
  "longDescription": "Software in MaxMSP and Arduino linking visitor effort to animations.",
  "technologies": ["MaxMSP", "Arduino"],
  "links": { "youtube": "https://www.youtube.com/watch?v=zUDOoZthH4E" },
  "image": "images/projects/cyclokino.jpg"
}
EOF

cat > data/installations/PATMAP.json << 'EOF'
{
  "id": "patmap",
  "title": "PATMAP",
  "date": "2012",
  "collaboration": "Marcio Ambrosio",
  "description": "Interactive sculpture with iPad controller.",
  "longDescription": "Controller in OpenFrameworks / Arduino piezo array / MaxMSP-Jitter grid system / MadMapper.",
  "technologies": ["OpenFrameworks", "Arduino", "MaxMSP", "MadMapper"],
  "links": { "youtube": "https://www.youtube.com/watch?v=hAMke8dFTz4" },
  "image": "images/projects/patmap.jpg"
}
EOF

cat > data/installations/Mixed_Memory.json << 'EOF'
{
  "id": "mixed-memory",
  "title": "Mixed Memory",
  "date": "2011",
  "collaboration": "Julien Maire",
  "description": "Multi-media installation with moving mirrors.",
  "longDescription": "Dedicated softwares in MaxMSP-Jitter for looped score with moving mirrors interfering with projected film.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "blog": "https://julienmaire.blogspot.com/2011/06/here-is-online-documentation-from-my.html" },
  "image": "images/projects/mixedmemory.jpg"
}
EOF

cat > data/installations/Little_Pascal.json << 'EOF'
{
  "id": "little-pascal",
  "title": "Little Pascal",
  "date": "2011",
  "collaboration": "Iris Musel, Lola Maury, Nada Sabet, Eric Samothrakis and Ashley Charles",
  "description": "Series of interactive installations.",
  "longDescription": "Software development in MaxMSP for multiple interactive installations.",
  "technologies": ["MaxMSP"],
  "links": { "blog": "https://legacy.imal.org/en/activity/little-pascal" },
  "image": "images/projects/pascal.jpg"
}
EOF

cat > data/installations/12i.json << 'EOF'
{
  "id": "12i",
  "title": "12i",
  "date": "2011",
  "collaboration": "Marcio Ambrosio",
  "description": "Interactive animation loop recording installation.",
  "longDescription": "Kinect guided recording / iPad remote control / MaxMSP-Jitter playback and mapping.",
  "technologies": ["MaxMSP", "Jitter", "Kinect", "OpenFrameworks"],
  "links": { "youtube": "https://www.youtube.com/watch?v=F-pikRo4kqU" },
  "image": "images/projects/12i.jpg"
}
EOF

cat > data/installations/Lungs_The_Breather.json << 'EOF'
{
  "id": "lungs-the-breather",
  "title": "Lungs - The Breather",
  "date": "2008",
  "collaboration": "Laura Colmenares Guerra & Todor Todoroff",
  "description": "Breathing-controlled jellyfish animation.",
  "longDescription": "Realtime 2D NURBS animation in MaxMSP/Jitter controlled by pressure sensors in facemasks.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "web": "https://ulara.org/selected-work/lungs-breather" },
  "image": "images/projects/lungs.jpg"
}
EOF

cat > data/installations/Oups.json << 'EOF'
{
  "id": "oups",
  "title": "Oups!",
  "date": "2007",
  "collaboration": "Marcio Ambrosio",
  "description": "Motion tracking interactive video installation.",
  "longDescription": "MaxMSP-Jitter engine using silhouette analysis / Modular scene system with alpha and sound files.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "vimeo": "https://vimeo.com/3208200" },
  "image": "images/projects/oups.jpg"
}
EOF

cat > data/installations/Early_Works.json << 'EOF'
{
  "id": "early-works",
  "title": "Early Works",
  "date": "2004",
  "collaboration": "iMAL Arts Center",
  "description": "Collection of first interactive video installations.",
  "longDescription": "Early interactive video works developed in MaxMSP at iMAL.",
  "technologies": ["MaxMSP"],
  "links": { "web": "https://legacy.imal.org/yacine/" },
  "image": "images/projects/legacy.jpg"
}
EOF

# ==================== PERFORMANCES ====================

cat > data/performances/Save_the_Last_Trance_for_Me.json << 'EOF'
{
  "id": "save-the-last-trance-for-me",
  "title": "Save the Last Trance for Me",
  "date": "2018",
  "collaboration": "Matthaei & Konsorten",
  "description": "Audio visual performance with Kinect-tracked torch mapping.",
  "longDescription": "Dedicated video player in MaxMSP/Jitter and Ableton LIVE / Editable cues for playback triggers & smooth transitions / Editable video effect chains using pixel shaders inside MaxForLive modules / Kinect tracking a lamp torch and mapping of its position to the screens to reveal or hide live video clips.",
  "technologies": ["MaxMSP", "Jitter", "Ableton Live", "Kinect"],
  "links": { "vimeo": "https://vimeo.com/297064485" },
  "image": "images/projects/savethelast.jpg"
}
EOF

cat > data/performances/UBIQUE.json << 'EOF'
{
  "id": "ubique",
  "title": "UBIQUE",
  "date": "2016",
  "collaboration": "Ethnophonics / Singkhéo Panya",
  "description": "Ciné-Concert with multichannel video and percussive control.",
  "longDescription": "Dedicated multi-channel video player in MaxMSP/Jitter and Ableton LIVE / Editable cues and pixel shader effects / Fast video sampling from MIDI controller.",
  "technologies": ["MaxMSP", "Jitter", "Ableton Live"],
  "links": { "youtube": "https://www.youtube.com/watch?v=pQWGtWnpyrQ" },
  "image": "images/projects/ubique.jpg"
}
EOF

cat > data/performances/Infinite_Journey_In_This_Together.json << 'EOF'
{
  "id": "infinite-journey-in-this-together",
  "title": "Infinite Journey / In This Together…",
  "date": "2015",
  "collaboration": "Eveline Van Bauwel",
  "description": "Dance performance with realtime color compositions from Kinect.",
  "longDescription": "Software in OpenFrameworks for interactive color compositions / Kinect scanning dancers’ cloth / MadMapper projection merging.",
  "technologies": ["OpenFrameworks", "Kinect", "MadMapper"],
  "links": { "blog": "https://evelinevanbauwel.wordpress.com/2016/02/03/soon-more/" },
  "image": "images/projects/infinite.jpg"
}
EOF

cat > data/performances/Les_Yeux_d_Argos.json << 'EOF'
{
  "id": "les-yeux-d-argos",
  "title": "Les Yeux d'Argos",
  "date": "2014",
  "collaboration": "Selma and Soufiane Ouissi",
  "description": "Online remote dance performance.",
  "longDescription": "Software suite in MaxMSP-Jitter for remote dancers / Linux icecast server / Editable cues and transitions.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "youtube": "https://www.youtube.com/watch?v=rgWIuvyxOuY" },
  "image": "images/projects/argos.jpg"
}
EOF

cat > data/performances/The_Death_of_Tarelkin.json << 'EOF'
{
  "id": "the-death-of-tarelkin",
  "title": "The Death of Tarelkin",
  "date": "2014",
  "collaboration": "Alexandra Dementieva & MediaArtLab Moscow",
  "description": "Dance performance with multi-screen video mixing.",
  "longDescription": "Software in MaxMSP-Jitter controlling video playback and live cameras on seven screens with cues and smooth transitions.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "vimeo": "https://vimeo.com/109066574" },
  "image": "images/projects/tarelkin.jpg"
}
EOF

cat > data/performances/Perfectiøn.json << 'EOF'
{
  "id": "perfectiøn",
  "title": "Perfectiøn",
  "date": "2014",
  "collaboration": "Bud Blumenthal",
  "description": "Realtime silhouette lighting and video effects.",
  "longDescription": "Two Kinects + two projectors / Silhouette extraction and matching in MadMapper / Realtime video effects in MaxMSP-Jitter.",
  "technologies": ["MaxMSP", "Jitter", "Kinect", "MadMapper"],
  "links": { "vimeo": "https://vimeo.com/110996131" },
  "image": "images/projects/perfection.jpg"
}
EOF

cat > data/performances/7adda.json << 'EOF'
{
  "id": "7adda",
  "title": "7adda",
  "date": "2013",
  "collaboration": "Jaouad Essounani",
  "description": "Theatrical performance with realtime silhouette sampler.",
  "longDescription": "Realtime white silhouette using Kinect / Video sampler with accumulation / Cued DMX lighting controls.",
  "technologies": ["MaxMSP", "Jitter", "Kinect"],
  "links": { "youtube": "https://www.youtube.com/watch?v=erqi6bPbsF4" },
  "image": "images/projects/7adda.jpg"
}
EOF

cat > data/performances/Les_Mystères_de_l_Ouest.json << 'EOF'
{
  "id": "les-mystères-de-l-ouest",
  "title": "Les Mystères de l'Ouest",
  "date": "2012",
  "collaboration": "Singkheo Panya",
  "description": "Ciné-Concert with mapped video player.",
  "longDescription": "Dedicated video player in MaxMSP-Jitter / Cued playback and mapping module for varying projection angles.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "youtube": "https://www.youtube.com/watch?v=HKbWgTUTy7A" },
  "image": "images/projects/mysteres.jpg"
}
EOF

cat > data/performances/eVanescens.json << 'EOF'
{
  "id": "evanescens",
  "title": "eVanescens",
  "date": "2012",
  "collaboration": "Todor Todoroff & Laura Colmenares Guerra",
  "description": "Multi-media performance with dynamic data routing.",
  "longDescription": "Software in MaxMSP-Jitter / Dynamic data stream routing / Mapping from audio analysis and MIDI to video triggers and effects.",
  "technologies": ["MaxMSP", "Jitter"],
  "links": { "youtube": "https://www.youtube.com/watch?v=1X9haRegWJo" },
  "image": "images/projects/eva.jpg"
}
EOF

cat > data/performances/Fragments_43_44.json << 'EOF'
{
  "id": "fragments-43-44",
  "title": "Fragments#43-44",
  "date": "2012",
  "collaboration": "Gauthier Keyaerts & François Zajega",
  "description": "Multi-media performance with 25-channel spatialized audio.",
  "longDescription": "25 channels audio player / Kinect gesture and position mapping to audio effects and scene loading.",
  "technologies": ["MaxMSP", "Kinect"],
  "links": { "blog": "https://gauthierkeyaerts.com/blog/fragments-43-44/" },
  "image": "images/projects/frag.jpg"
}
EOF

# ==================== MANIFEST ====================

cat > data/manifest.json << 'EOF'
{
  "installations": [
    "Oscillatory_Motion","Locusts_PaperRain","Inland_Wonderland","Lagunas","Chove_Chuva",
    "Moviola","CycloRamaDrome","Gestographe","CycloKino","PATMAP","Mixed_Memory",
    "Little_Pascal","12i","Lungs_The_Breather","Oups","Early_Works"
  ],
  "performances": [
    "Save_the_Last_Trance_for_Me","UBIQUE","Infinite_Journey_In_This_Together",
    "Les_Yeux_d_Argos","The_Death_of_Tarelkin","Perfectiøn","7adda",
    "Les_Mystères_de_l_Ouest","eVanescens","Fragments_43_44"
  ]
}
EOF

echo "✅ DONE — All JSON files have been recreated with exact original content."
echo "Refresh http://localhost:8000 now."
