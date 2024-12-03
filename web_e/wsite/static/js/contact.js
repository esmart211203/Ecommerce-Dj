document.addEventListener("DOMContentLoaded", () => {
    const name = document.getElementById("name");
    const email = document.getElementById("email");
    const subject = document.getElementById("subject");
    const message = document.getElementById("message");
    const submit = document.getElementById("submit");
    
    submit.addEventListener("click", (e) => {
        e.preventDefault();
        
        const data = {
            name: name.value,
            email: email.value,
            subject: subject.value,
            message: message.value,
        };
        
        postGoogle(data);
    });
    
    async function postGoogle(data) {
        const formURL = "https://docs.google.com/forms/d/e/1FAIpQLSf1mmvujrkMGyxOgD62OJJ9rNR0L8n98bYEQd72jrjxX6QWrQ/formResponse";
        const formData = new FormData();
        
        formData.append("entry.242207959", data.name);
        formData.append("entry.113580451", data.email);
        formData.append("entry.194063398", data.subject);
        formData.append("entry.1215735323", data.message);
        
        await fetch(formURL, {
            method: "POST",
            body: formData,
        });
    }
});
document.addEventListener("DOMContentLoaded", function() {
    const submitBtn = document.getElementById("submit");
    const successMessage = document.getElementById("success-message");

    submitBtn.addEventListener("click", async function(e) {
        e.preventDefault();

        // Your existing code to submit form data
        const data = {
            name: document.getElementById("name").value,
            email: document.getElementById("email").value,
            subject: document.getElementById("subject").value,
            message: document.getElementById("message").value,
        };

        await postGoogle(data);

        // Show success message
        successMessage.classList.remove("d-none");

        // Hide success message after 1 seconds
        setTimeout(function() {
            successMessage.classList.add("d-none");
        }, 1000);
    });

    async function postGoogle(data) {
        // Your existing code to submit form data
        // This function should handle posting data to Google Form
    }
});