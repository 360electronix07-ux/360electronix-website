document.addEventListener("DOMContentLoaded",()=>{


/* =========================
LOADER
========================= */

const loader = document.getElementById("loader");

if(loader){

    window.addEventListener("load",()=>{

        loader.style.display="none";

    });

}



/* =========================
BACK TO TOP
========================= */

const topBtn=document.getElementById("top");


if(topBtn){

    window.addEventListener("scroll",()=>{


        if(window.scrollY>300){

            topBtn.style.display="flex";

        }
        else{

            topBtn.style.display="none";

        }


    });



    topBtn.onclick=()=>{

        window.scrollTo({

            top:0,
            behavior:"smooth"

        });

    };


}




/* =========================
PORTFOLIO LIGHTBOX
========================= */


const images=document.querySelectorAll(".portfolio-popup");

const lightbox=document.getElementById("lightbox");

const lightboxImg=document.getElementById("lightbox-img");

const close=document.getElementById("close-lightbox");



if(images.length && lightbox){


images.forEach(img=>{


img.onclick=(e)=>{

e.preventDefault();

lightbox.style.display="flex";

lightboxImg.src=img.href;


};


});



if(close){

close.onclick=()=>{

lightbox.style.display="none";

};


}



lightbox.onclick=(e)=>{


if(e.target===lightbox){

lightbox.style.display="none";

}


};



}



});