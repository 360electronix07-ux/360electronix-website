/*=========================================
360Electronix EmailJS
=========================================*/

// Initialize EmailJS
emailjs.init({
    publicKey: "tiPIztfhnt2eMJhco"
});

// Get the form
const quoteForm = document.getElementById("quoteForm");

// Listen for form submission
quoteForm.addEventListener("submit", function (e) {

    // Stop page refresh
    e.preventDefault();

    // Get submit button
    const button = quoteForm.querySelector("button");

    button.innerHTML = "Sending...";
    button.disabled = true;

    // Send the form
    emailjs.sendForm(
        "service_2zs6njy",
        "template_ztxyy8q",
        quoteForm
    )

    .then(function () {

        alert("✅ Thank you! Your inquiry has been sent successfully.");

        quoteForm.reset();

        button.innerHTML = "Request Free Quote";
        button.disabled = false;

    })

    .catch(function (error) {

        console.error(error);

        alert("❌ Failed to send inquiry.");

        button.innerHTML = "Request Free Quote";
        button.disabled = false;

    });

});