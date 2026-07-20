const BASE_URL = "http://16.171.70.157:6060";

const user = JSON.parse(localStorage.getItem("loggedUser"));

const wishlistContainer = document.getElementById("wishlistItems");

if (!user) {
    showToast("Please Login First");
    window.location.href = "login.html";
}

// =======================
// LOAD WISHLIST
// =======================

async function loadWishlist() {

    try {

        const response = await fetch(`${BASE_URL}/api/wishlist/get/${user.id}`);

        if (!response.ok) {
            throw new Error("Unable to load wishlist");
        }

        const wishlist = await response.json();

        displayWishlist(wishlist);

    } catch (error) {

        console.error(error);

    }

}

// =======================
// DISPLAY WISHLIST
// =======================

function displayWishlist(wishlist) {

    wishlistContainer.innerHTML = "";

    if (wishlist.length === 0) {

        wishlistContainer.innerHTML = "<h2>Your Wishlist is Empty ❤️</h2>";

        return;

    }

    wishlist.forEach(item => {

        wishlistContainer.innerHTML += `

        <div class="wishlist-card">

            <img src="${BASE_URL}/images/${item.product.imageUrl}" alt="${item.product.productName}">

            <div class="wishlist-info">

                <h3>${item.product.productName}</h3>

                <p>${item.product.brand}</p>

                <h4>₹${item.product.price}</h4>

                <div class="wishlist-buttons">

                    <button onclick="addToCart(${item.product.id})">

                        🛒 Add To Cart

                    </button>

                    <button onclick="removeWishlist(${item.product.id})">

                        ❌ Remove

                    </button>

                </div>

            </div>

        </div>

        `;

    });

}

// =======================
// ADD TO WISHLIST
// =======================

async function addWishlist(productId) {

    try {

        const response = await fetch(

            `${BASE_URL}/api/wishlist/add/${user.id}?productId=${productId}`,

            {
                method: "POST"
            }

        );

        if (response.ok) {

            showToast("Added To Wishlist ❤️");

            loadWishlist();

        }

    } catch (error) {

        console.error(error);

    }

}

// =======================
// REMOVE WISHLIST
// =======================

async function removeWishlist(productId) {

    try {

        const response = await fetch(

            `${BASE_URL}/api/wishlist/remove/${user.id}?productId=${productId}`,

            {
                method: "DELETE"
            }

        );

        if (response.ok) {

            loadWishlist();

        }

    } catch (error) {

        console.error(error);

    }

}

// =======================
// ADD TO CART
// =======================

async function addToCart(productId) {

    try {

        const response = await fetch(

            `${BASE_URL}/api/cartitems/add/${user.id}?productId=${productId}`,

            {
                method: "POST"
            }

        );

        if (response.ok) {

            showToast("Added To Cart 🛒");

        }

    } catch (error) {

        console.error(error);

    }

}

window.onload = loadWishlist;