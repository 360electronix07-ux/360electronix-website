/*==================================================
360Electronix - SOM Project
==================================================*/

document.addEventListener("DOMContentLoaded", () => {

    /*==============================================
      SMOOTH SCROLL
    ==============================================*/

    document.querySelectorAll('a[href^="#"]').forEach(anchor => {

        anchor.addEventListener("click", function(e){

            const target = document.querySelector(this.getAttribute("href"));

            if(!target) return;

            e.preventDefault();

            target.scrollIntoView({
                behavior:"smooth"
            });

        });

    });




    /*==============================================
      SCROLL ANIMATION
    ==============================================*/

    const observer = new IntersectionObserver((entries)=>{

        entries.forEach(entry=>{

            if(entry.isIntersecting){

                entry.target.classList.add("show");

            }

        });

    },{

        threshold:0.15

    });


    document.querySelectorAll(
        "section,.gallery-card,.info-card,.tech-card,.timeline-item,.application-card,.highlight-card"
    ).forEach(item=>{

        item.classList.add("hidden");

        observer.observe(item);

    });





    /*==============================================
      LIGHTBOX
    ==============================================*/

    const lightbox = document.getElementById("lightbox");

    const lightboxImg = document.getElementById("lightbox-img");

    const closeBtn = document.getElementById("close-lightbox");

    document.querySelectorAll(".gallery-card img").forEach(img=>{

        img.addEventListener("click",()=>{

            lightbox.classList.add("show");

            lightboxImg.src = img.src;

            lightboxImg.alt = img.alt;

            document.body.style.overflow="hidden";

        });

    });



    if(closeBtn){

        closeBtn.addEventListener("click",()=>{

            lightbox.classList.remove("show");

            document.body.style.overflow="auto";

        });

    }


    if(lightbox){

        lightbox.addEventListener("click",(e)=>{

            if(e.target===lightbox){

                lightbox.classList.remove("show");

                document.body.style.overflow="auto";

            }

        });

    }





    /*==============================================
      HERO IMAGE EFFECT
    ==============================================*/

    const heroImage = document.querySelector(".hero-right img");

    if(heroImage){

        heroImage.addEventListener("mousemove",(e)=>{

            const rect = heroImage.getBoundingClientRect();

            const x = e.clientX - rect.left;

            const y = e.clientY - rect.top;

            heroImage.style.transform =

            `rotateX(${-(y-rect.height/2)/30}deg)
             rotateY(${(x-rect.width/2)/30}deg)
             scale(1.03)`;

        });

        heroImage.addEventListener("mouseleave",()=>{

            heroImage.style.transform="rotateX(0) rotateY(0) scale(1)";

        });

    }





    /*==============================================
      BACK TO TOP BUTTON
    ==============================================*/

    const topBtn = document.createElement("button");

    topBtn.id="topButton";

    topBtn.innerHTML='<i class="fas fa-arrow-up"></i>';

    document.body.appendChild(topBtn);


    window.addEventListener("scroll",()=>{

        if(window.scrollY>500){

            topBtn.classList.add("show");

        }

        else{

            topBtn.classList.remove("show");

        }

    });


    topBtn.addEventListener("click",()=>{

        window.scrollTo({

            top:0,

            behavior:"smooth"

        });

    });





    /*==============================================
      ACTIVE NAVIGATION
    ==============================================*/

    const sections = document.querySelectorAll("section");

    const navLinks = document.querySelectorAll("nav a");

    window.addEventListener("scroll",()=>{

        let current="";

        sections.forEach(section=>{

            const top = section.offsetTop - 120;

            if(window.scrollY >= top){

                current = section.id;

            }

        });

        navLinks.forEach(link=>{

            link.classList.remove("active");

            if(link.getAttribute("href")==="#"+current){

                link.classList.add("active");

            }

        });

    });

});




/*==================================================
PAGE LOADED
==================================================*/

window.addEventListener("load",()=>{

    document.body.classList.add("loaded");

});