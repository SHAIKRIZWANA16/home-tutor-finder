// public/script.js

// DOM elements
const classFilter = document.getElementById('classFilter');
const subjectFilter = document.getElementById('subjectFilter');
const filterBtn = document.getElementById('filterBtn');
const tutorsGrid = document.getElementById('tutorsGrid');
const subjectCards = document.querySelectorAll('.subject-card');
const noResultsMsg = document.getElementById('noResultsMsg');

// Fetch tutors from backend (MySQL) with optional filters
async function loadTutors(filters = {}) {
  try {
    const params = new URLSearchParams();
    if (filters.class) params.append('class', filters.class);
    if (filters.subject) params.append('subject', filters.subject);

    const url = '/api/tutors' + (params.toString() ? `?${params.toString()}` : '');
    
    const res = await fetch(url);
    const data = await res.json();

    displayTutors(data);
  } catch (err) {
    console.error('Error loading tutors:', err);
    tutorsGrid.innerHTML = '';
    noResultsMsg.style.display = 'block';
    noResultsMsg.textContent = 'Error loading tutors. Please try again.';
  }
}

// Display tutors on page
function displayTutors(tutorList) {
  tutorsGrid.innerHTML = '';

  if (!tutorList || tutorList.length === 0) {
    noResultsMsg.style.display = 'block';
    noResultsMsg.textContent = 'No tutors found for this combination. Try another class or subject.';
    return;
  }

  noResultsMsg.style.display = 'none';

  tutorList.forEach(tutor => {
    const card = createTutorCard(tutor);
    tutorsGrid.appendChild(card);
  });
}

// Create one tutor card
function createTutorCard(tutor) {
  const card = document.createElement('div');
  card.className = 'tutor-card';
  card.innerHTML = `
    <div class="tutor-header">
        <div class="tutor-avatar">${tutor.avatar}</div>
        <h3>${tutor.name}</h3>
        <div class="tutor-class">Class ${tutor.class} • ${formatSubject(tutor.subject)}</div>
    </div>
    <div class="tutor-body">
        <div class="tutor-details">
            <div class="detail-row">
                <i class="fas fa-briefcase detail-icon"></i>
                <span>${tutor.experience} experience</span>
            </div>
            <div class="detail-row">
                <i class="fas fa-map-marker-alt detail-icon"></i>
                <span>${tutor.location}</span>
            </div>
            <div class="cost">${tutor.cost}</div>
        </div>
        <button class="contact-btn" onclick="contactTutor('${tutor.phone}','${tutor.name}')">
            <i class="fas fa-phone"></i> Call Tutor Now
        </button>
    </div>
  `;
  return card;
}

// Map subject codes to names
function formatSubject(code) {
  switch (code) {
    case 'math': return 'Mathematics';
    case 'science': return 'Science';
    case 'english': return 'English';
    case 'social': return 'Social Studies';
    case 'telugu': return 'Telugu';
    default: return code;
  }
}

// Called when user clicks Find Tutors or changes filters
function filterTutors() {
  const selectedClass = classFilter.value;
  const selectedSubject = subjectFilter.value;

  loadTutors({
    class: selectedClass || undefined,
    subject: selectedSubject || undefined
  });

  document.getElementById('tutors').scrollIntoView({ behavior: 'smooth' });
}

// Contact tutor (phone link)
function contactTutor(phone, name) {
  if (confirm(`Contact ${name}? Phone: ${phone}`)) {
    window.location.href = `tel:${phone}`;
  }
}

// Subject cards quick filter
subjectCards.forEach(card => {
  card.addEventListener('click', () => {
    const subject = card.dataset.subject;
    subjectFilter.value = subject;
    filterTutors();
  });
});

// Events
filterBtn.addEventListener('click', filterTutors);
classFilter.addEventListener('change', filterTutors);
subjectFilter.addEventListener('change', filterTutors);

// Navbar scroll effect
window.addEventListener('scroll', () => {
  const navbar = document.querySelector('.navbar');
  if (window.scrollY > 100) {
    navbar.style.background = 'rgba(102, 126, 234, 0.95)';
    navbar.style.backdropFilter = 'blur(10px)';
  } else {
    navbar.style.background = 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)';
    navbar.style.backdropFilter = 'none';
  }
});

// Initial load – all tutors
loadTutors();
