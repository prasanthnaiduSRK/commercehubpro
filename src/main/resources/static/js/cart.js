const BASE_URL = "http://16.171.70.157:6060";

const user = JSON.parse(localStorage.getItem("loggedUser"));

const cartContainer = document.getElementById("cartItems");

if (!user) {
    showToast("Please Login");
    window.location.href = "login.html";
}

// =========================
// LOAD CART
// =========================

async function loadCart() {

    try {

        const response = await fetch(
            `${BASE_URL}/api/cartitems/get/${user.id}`
        );

        if (!response.ok) {
            throw new Error("Unable to load cart");
        }

        const cartItems = await response.json();
        displayCart(cartItems);

    } catch (error) {

        console.error(error);

    }

}

// =========================
// DISPLAY CART
// =========================

function displayCart(cartItems) {

    cartContainer.innerHTML = "";

    let total = 0;

    if (cartItems.length === 0) {

        cartContainer.innerHTML = "<h2>Your Cart is Empty</h2>";

        document.getElementById("itemCount").innerText = 0;
        document.getElementById("totalPrice").innerText = "₹0";

        return;

    }

    cartItems.forEach(item => {

        total += item.subtotal;

        cartContainer.innerHTML += `

        <div class="cart-card">

            <img src="${BASE_URL}/images/${item.product.imageUrl}" alt="${item.product.productName}">

            <div class="cart-details">

                <h3>${item.product.productName}</h3>

                <p>${item.product.brand}</p>

                <p>₹${item.price}</p>

                <div class="quantity">

                    <button onclick="updateQuantity(${item.id},-1)">-</button>
                    <span>${item.quantity}</span>
                    <button onclick="updateQuantity(${item.id},1)">+</button>

                </div>

                <h4>Subtotal : ₹${item.subtotal}</h4>

            </div>

        </div>

        `;

    });

    document.getElementById("itemCount").innerText = cartItems.length;

    document.getElementById("totalPrice").innerText = "₹" + total;

}

// =========================
// ADD TO CART
// =========================

async function addToCart(productId) {

    console.log("Product ID:", productId);
    console.log("User ID:", user.id);

    const url = `${BASE_URL}/api/cartitems/add/${user.id}?productId=${productId}`;

    console.log(url);

    try {

        const response = await fetch(url, {
            method: "POST"
        });

        console.log("Status:", response.status);

        const text = await response.text();

        console.log("Response:", text);

    } catch (error) {

        console.error(error);

    }

}

// =========================
// UPDATE QUANTITY
// =========================

async function updateQuantity(id, change) {

    try {

        const response = await fetch(
            `${BASE_URL}/api/cartitems/update/${id}?change=${change}`,
            {
                method: "PUT"
            }
        );

        if (response.ok) {

            loadCart();

        }

    } catch (error) {

        console.error(error);

    }

}

window.onload = loadCart;