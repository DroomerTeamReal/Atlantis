// Loading Screen Animation
document.addEventListener('DOMContentLoaded', () => {
    const loadingScreen = document.getElementById('loading-screen');
    
    setTimeout(() => {
        loadingScreen.style.opacity = '0';
        loadingScreen.style.transition = 'opacity 0.5s ease';
        
        setTimeout(() => {
            loadingScreen.style.display = 'none';
        }, 500);
    }, 2000);
});

// Navbar Hide on Scroll
let lastScrollTop = 0;
const nav = document.querySelector('nav');

window.addEventListener('scroll', () => {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    
    if (scrollTop > lastScrollTop) {
        nav.classList.add('hidden');
    } else {
        nav.classList.remove('hidden');
    }
    
    lastScrollTop = scrollTop;
});

// Smooth Scroll with Offset
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        const offset = 80; // Height of fixed navbar
        const targetPosition = target.getBoundingClientRect().top + window.pageYOffset - offset;
        
        window.scrollTo({
            top: targetPosition,
            behavior: 'smooth'
        });
    });
});

// Platform Selection with Enhanced Animation
const platformSelect = document.getElementById('platform-select');
const downloadBtn = document.getElementById('download-btn');

const downloadLinks = {
    windows: 'https://www.mediafire.com/file/nsrm3wf2x4lc34p/Atlantis.zip/file',
    mac: 'coming soon',
    android: 'maybe',
    ios: 'maybe'
};

platformSelect.addEventListener('change', (e) => {
    const platform = e.target.value;
    if (platform) {
        downloadBtn.href = downloadLinks[platform];
        downloadBtn.removeAttribute('disabled');
        downloadBtn.style.opacity = '1';
        downloadBtn.style.transform = 'scale(1.05)';
        setTimeout(() => {
            downloadBtn.style.transform = 'scale(1)';
        }, 200);
    } else {
        downloadBtn.removeAttribute('href');
        downloadBtn.setAttribute('disabled', '');
        downloadBtn.style.opacity = '0.5';
    }
});

// Intersection Observer for Animations
const observerOptions = {
    threshold: 0.2,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
        }
    });
}, observerOptions);

// Observe elements for animation
document.querySelectorAll('.feature-card, .platform-selector, .faq-item, h2').forEach(element => {
    observer.observe(element);
});

// Enhanced FAQ Accordion with Smooth Animation
document.querySelectorAll('.faq-item').forEach(item => {
    const question = item.querySelector('.faq-question');
    
    question.addEventListener('click', () => {
        const isOpen = item.classList.contains('active');
        
        // Close all other items with smooth animation
        document.querySelectorAll('.faq-item').forEach(otherItem => {
            if (otherItem !== item) {
                otherItem.classList.remove('active');
            }
        });
        
        // Toggle current item with animation
        item.classList.toggle('active');
    });
});

// Parallax Effect with Enhanced Performance
const heroImage = document.querySelector('.hero-image');
let ticking = false;

window.addEventListener('scroll', () => {
    if (!ticking) {
        window.requestAnimationFrame(() => {
            const scrolled = window.pageYOffset;
            const rate = scrolled * 0.35;
            
            heroImage.style.transform = `translate3d(0, ${rate}px, 0)`;
            ticking = false;
        });
        
        ticking = true;
    }
});
