const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add("show");
        }
    });
}, {
    threshold: 0.15
});

document.querySelectorAll(
    ".service-card, .project-card, .tech-card, .timeline-item, .glass-card, .contact-card"
).forEach(el => observer.observe(el));