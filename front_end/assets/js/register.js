function submitForm(event) {
  const form = document.getElementById("signupForm");
  const formData = new FormData(form);

  fetch("http://127.0.0.1:5000/api_create_customer", {
    method: "POST",
    body: formData,
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then((data) => {
      if (data.success) {
        form.reset();
        window.location.href = "login.html";
      } else {
        alert("Error: " + (data.error || "Unable to create account"));
      }
    })
    .catch((error) => {
      alert("Error: " + error.message);
    });
}

// Add event listener to handle form submission
document.getElementById("signupForm").addEventListener("submit", submitForm);
