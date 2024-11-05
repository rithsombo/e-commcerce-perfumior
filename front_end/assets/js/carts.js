$(document).ready(function () {
  $("#header-placeholder").load("header.html", function () {
    $("#footer-placeholder").load("footer.html", function () {
      const customerId = localStorage.getItem("user_id");

      if (customerId) {
        fetch(`http://127.0.0.1:5000/api/cart-items?customerId=${customerId}`)
          .then((response) => response.json())
          .then((data) => {
            const cartContainer = document.querySelector(".col-lg-8");
            cartContainer.innerHTML = "";

            if (data.length > 0) {
              data.forEach((item) => {
                const cartItem = document.createElement("div");
                cartItem.classList.add("cart-item");
                cartItem.setAttribute("data-product-id", item.id);
                cartItem.setAttribute("data-price", item.price);

                cartItem.innerHTML = `
                  <h4 class="item-title">${item.name}</h4>
                  <p class="item-price">${item.price}$/item</p>
                  <div class="quantity">
                    <div class="quantity buttons_added">
                      <input
                        type="number"
                        step="1"
                        min="1"
                        name="quantity"
                        value="${item.quantity}"
                        class="input-text qty text"
                        size="4"
                      />
                    </div>
                  </div>
                  <button class="delete-button">Delete</button>
                `;

                cartContainer.appendChild(cartItem);
              });

              addCartEventListeners();
              updateOrderSummary(); // Calculate initial totals after loading items
              addOrderPlacementListener(); // Add listener to place order
            } else {
              cartContainer.innerHTML = "<p>Your cart is empty.</p>";
            }
          })
          .catch((error) => console.error("Error fetching cart items:", error));
      } else {
        const cartContainer = document.querySelector(".col-lg-8");
        cartContainer.innerHTML = "<p>Please log in to see your cart.</p>";
      }
    });
  });

  function addCartEventListeners() {
    // Handle quantity change
    document.querySelectorAll(".input-text.qty.text").forEach((input) => {
      input.addEventListener("change", function () {
        const quantity = Math.max(1, this.value); // Prevent negative quantities
        this.value = quantity; // Set value to prevent invalid input
        const customerId = localStorage.getItem("user_id");
        const productId =
          this.closest(".cart-item").getAttribute("data-product-id");
        const price_unit =
          this.closest(".cart-item").getAttribute("data-price");
        updateCartItemQuantity(productId, quantity, price_unit, customerId);
        updateOrderSummary(); // Update order summary on quantity change
      });
    });

    // Handle delete button
    document.querySelectorAll(".delete-button").forEach((button) => {
      button.addEventListener("click", function () {
        const productId =
          this.closest(".cart-item").getAttribute("data-product-id");
        if (productId) {
          deleteCartItem(productId);
        } else {
          console.error("Product ID not found");
        }
      });
    });
  }

  function updateOrderSummary() {
    let subtotal = 0;
    document.querySelectorAll(".cart-item").forEach((item) => {
      const price = parseFloat(item.getAttribute("data-price"));
      const quantity = parseInt(
        item.querySelector(".input-text.qty.text").value
      );
      subtotal += price * quantity;
    });

    const total = subtotal;
    // Update summary display
    document.getElementById(
      "subtotal"
    ).textContent = `Subtotal: $${subtotal.toFixed(2)}`;
    document.getElementById("total").textContent = `Total: $${total.toFixed(
      2
    )}`;
  }

  function updateCartItemQuantity(productId, quantity, price_unit, customerId) {
    fetch(`http://127.0.0.1:5000/api/cart-item/${productId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ quantity, price_unit, customerId }),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log("Quantity updated:", data);
      })
      .catch((error) => console.error("Error updating quantity:", error));
  }

  function deleteCartItem(productId) {
    const customerId = localStorage.getItem("user_id");

    fetch(
      `http://127.0.0.1:5000/api/cart-item/${productId}?customerId=${customerId}`,
      {
        method: "DELETE",
      }
    )
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((data) => {
        console.log("Item deleted:", data);
        document.querySelector(`[data-product-id="${productId}"]`).remove();
        updateOrderSummary(); // Update order summary after item deletion
      })
      .catch((error) => console.error("Error deleting item:", error));
  }
  const stripe = Stripe(
    "pk_test_51QCJODKPZ3Y6t8k24HodmqaVNbsyjdf1o5JZHe4W8HdjBaPi1NYIpSECBlEN3KWHwubx2taNYaVqyEfvQfotu6UD00v0hlGJR6"
  );
  function addOrderPlacementListener() {
    const placeOrderButton = document.getElementById("place-order-button");
    if (placeOrderButton) {
      placeOrderButton.addEventListener("click", function () {
        const customerId = localStorage.getItem("user_id");
        if (!customerId) {
          alert("Please log in to place an order.");
          return;
        }

        // Place order API call
        fetch(`http://127.0.0.1:5000/api/place-order`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ customerId }),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Failed to place order.");
            }
            return response.json();
          })
          .then((data) => {
            // Redirect to Stripe Checkout using the session ID
            return stripe.redirectToCheckout({
              sessionId: data.checkout_session_id,
            });
          })
          .then((result) => {
            if (result.error) {
              console.error(result.error.message);
            }
            else{
              window.location.href = 'carts.html';
            }
          })
          .catch((error) => console.error("Error placing order:", error));
      });
    }
  }

  function clearCart() {
    const cartContainer = document.querySelector(".col-lg-8");
    cartContainer.innerHTML = "<p>Your cart is empty.</p>";
    updateOrderSummary(); // Reset order summary
  }
});
