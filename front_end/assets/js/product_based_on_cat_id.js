const fetchProductsByCategory = async (categoryId) => {
  try {
    const response = await fetch(
      `http://127.0.0.1:5000/api/products/category/${categoryId}`
    );
    if (!response.ok) {
      throw new Error("Network response was not ok " + response.statusText);
    }
    const data = await response.json();
    const container = document.getElementById("productContainer");
    container.innerHTML = ""; // Clear existing products
    data.forEach((product) => {
      const productHTML = `
                            <div class="col-lg-4">
                                <div class="item">
                                    <div class="thumb">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="single-product.html?id=${
                                                  product.id
                                                }"><i class="fa fa-eye"></i></a></li>
                                                <li><a href="single-product.html?id=${
                                                  product.id
                                                }"><i class="fa fa-star"></i></a></li>
                                                <li><a href="single-product.html?id=${
                                                  product.id
                                                }"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <img src="${
                                          product.photo ||
                                          "assets/images/default.jpg"
                                        }" alt="${product.name}">
                                    </div>
                                    <div class="down-content">
                                        <h4>${product.name}</h4>
                                        <span>$${product.price}</span>
                                        <ul class="stars">
                                            ${'<li><i class="fa fa-star"></i></li>'.repeat(
                                              5
                                            )} <!-- Assuming a 5-star rating -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        `;
      container.insertAdjacentHTML("beforeend", productHTML);
    });
  } catch (error) {
    console.error("Error fetching products:", error);
  }
};

const apiUrl = "http://127.0.0.1:5000/api/category";
const fetchCategories = async () => {
  try {
    const response = await fetch(apiUrl);
    if (!response.ok) {
      throw new Error("Network response was not ok " + response.statusText);
    }
    const categories = await response.json();
    const categoryList = document.getElementById("category-list");
    categoryList.innerHTML = "";
    categories.forEach((category) => {
      const li = document.createElement("li");
      const a = document.createElement("a");
      a.href = `products.html?category_id=${category.id}`; // Set the href as needed
      a.textContent = category.name; // Use the category name
      li.appendChild(a);
      categoryList.appendChild(li);
    });
  } catch (error) {
    console.error("There was a problem with the fetch operation:", error);
  }
};

window.onload = async () => {
  await fetchCategories(); // Fetch categories
  const params = new URLSearchParams(window.location.search);
  const categoryId = params.get("category_id");
  if (categoryId) {
    await fetchProductsByCategory(categoryId); // Fetch products based on category
  }
};
