function loginUser(event) {
  event.preventDefault();

  const form = document.getElementById("loginForm");
  const formData = new FormData(form);

  fetch("http://127.0.0.1:5000/api_login", {
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
        localStorage.setItem('user_id', data.id);
        window.location.href = "index.html"; // Redirect with user ID
      } else {
        alert("Error: " + (data.error || "Invalid login credentials"));
      }
    })
    .catch((error) => {
      alert("Error: " + error.message);
    });
}
