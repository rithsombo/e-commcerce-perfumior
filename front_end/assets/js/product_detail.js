function getProductIdFromUrl() {
  const params = new URLSearchParams(window.location.search);
  return params.get("id"); // Replace 'id' with the actual query parameter if different
}

async function fetchProductDetails() {
  const productId = getProductIdFromUrl(); // Get product ID from URL
  const apiUrl = `http://127.0.0.1:5000/api/products/${productId}`; // Construct the API URL
  try {
    const response = await fetch(apiUrl);
    if (!response.ok) {
      throw new Error("Network response was not ok " + response.statusText);
    }
    const product = await response.json();

    // Display product details on the page
    document.getElementById("product-image").src = product.photo;
    document.getElementById("product-name").innerText = product.name;
    document.getElementById("product-price").innerText = `$${product.price}`;
    document.getElementById("product-description").innerText =
      product.description;
    document.getElementById(
      "total-price"
    ).innerText = `Price: $${product.price}`;

    // Handle ratings (assuming you have a rating system in place)
    const starsContainer = document.getElementById("product-rating");
    starsContainer.innerHTML = ""; // Clear previous stars
    // const starHtml = '<li><i class="fa fa-star"></i></li>'.repeat(5); // Adjust the rating logic as needed
    starsContainer.innerHTML = starHtml;
  } catch (error) {
    console.error("There was a problem with the fetch operation:", error);
  }
}

window.onload = async function () {
  await fetchProductDetails();
  await fetchCategories(); // Fetch categories after product details
};

async function addToCart() {
  const customerId = localStorage.getItem("user_id"); // Get customer ID from local storage
  const productId = getProductIdFromUrl(); // Get product ID from the URL
  const quantity = document.querySelector('input[name="quantity"]').value; // Get the quantity from the input field
  const price = document
    .getElementById("product-price")
    .innerText.replace("$", "");
  const sub_price = quantity*price; // Get price without the $ sign
  const description = document.getElementById("product-description").innerText; // Get the product description

  // Create the payload to send to the API
  const payload = {
    cus_id: customerId,
    product_id: productId,
    quantity: quantity,
    price: sub_price,
    description: description,
  };

  try {
    const response = await fetch("http://127.0.0.1:5000/api/add_to_cart", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(payload),
    });

    if (!response.ok) {
      throw new Error("Network response was not ok " + response.statusText);
    }

    const data = await response.json();
    if (data.success) {
      alert("Product added to cart successfully!");
    } else {
      alert("Error: " + (data.error || "Could not add to cart."));
    }
  } catch (error) {
    console.error("There was a problem with the fetch operation:", error);
    alert("Error: " + error.message);
  }
}
