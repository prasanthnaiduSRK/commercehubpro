const BASE_URL = "http://16.171.70.157:6060";
const API_URL = `${BASE_URL}/api/products/get`;

const params = new URLSearchParams(window.location.search);
const selectedCategory = params.get("category");

const productsGrid = document.getElementById("productsGrid");
const searchInput = document.getElementById("search");
const searchBtn = document.getElementById("searchBtn");

const user = JSON.parse(localStorage.getItem("loggedUser"));

window.onload = function () {

    loadProducts();

};

// ============================
// LOAD PRODUCTS
// ============================

async function loadProducts() {

    try {

        productsGrid.innerHTML = `

       <div class="loading-container">

           <div class="loader"></div>

       </div>

       `;

        const response = await fetch(API_URL);

        if (!response.ok) {

            throw new Error("Failed to fetch products");

        }

        const products = await response.json();

        if (selectedCategory) {

            const filteredProducts = products.filter(product =>

                product.category.categoryname.toLowerCase() === selectedCategory.toLowerCase()

            );

            displayProducts(filteredProducts);

        }

        else {

            displayProducts(products);

        }

    }

    catch (error) {

        console.error(error);

        productsGrid.innerHTML = `

        <div class="loading-container">

            <h2 style="color:red">

                Failed To Load Products

            </h2>

        </div>

        `;

    }

}

// ============================
// DISPLAY PRODUCTS
// ============================

function displayProducts(products) {

    productsGrid.innerHTML = "";

    if (products.length === 0) {

        productsGrid.innerHTML = `

       <div class="loading-container">

           <div>

               <h2 style="color:#2563eb;text-align:center;">

                   🔍 No Products Found

               </h2>

               <p style="margin-top:15px;text-align:center;color:#666;">

                   Try another keyword or category.

               </p>

           </div>

       </div>

       `;

        return;

    }

    products.forEach(product => {

        productsGrid.innerHTML += `

        <div class="product-card" onclick="openProduct(${product.id})">

            <div class="product-image">

                <img src="${BASE_URL}/images/${product.imageUrl}" alt="${product.productName}">

            </div>

            <div class="product-details">

                <span class="category">

                    ${product.category.categoryname}

                </span>

                <h3>

                    ${product.productName}

                </h3>

                <p>

                    ${product.description}

                </p>

                <p>

                    <strong>Brand :</strong>

                    ${product.brand}

                </p>

                <p>

                    <strong>Stock :</strong>

                    ${product.stock}

                </p>

                <div class="price">

                    ₹${product.price}

                </div>

                <div class="product-buttons">

                    <button onclick="event.stopPropagation();addToCart(${product.id})">

                        🛒 Add To Cart

                    </button>

                    <button class="wishlist-btn" onclick="event.stopPropagation();addWishlist(${product.id})">

                        ❤️ Wishlist

                    </button>

                </div>

            </div>

        </div>

        `;

    });

}

// ============================
// SEARCH
// ============================

searchInput.addEventListener("input", searchProducts);

async function searchProducts() {

    const keyword = searchInput.value.trim();

    if (keyword === "") {

        loadProducts();

        return;

    }

    try {

        const response = await fetch(

            `${BASE_URL}/api/products/search?keyword=${encodeURIComponent(keyword)}`

        );

        const products = await response.json();

        displayProducts(products);

    }

    catch (error) {

        console.error(error);

    }

}

// ============================
// PRODUCT DETAILS
// ============================

function openProduct(id) {

    window.location.href = `product-details.html?id=${id}`;

}

// ============================
// ADD TO CART
// ============================

async function addToCart(productId) {

    if (!user) {

        showToast("Please Login First");

        window.location.href = "login.html";

        return;

    }

    try {

        const response = await fetch(

            `${BASE_URL}/api/cartitems/add/${user.id}?productId=${productId}`,

            {

                method: "POST"

            }

        );

        if (response.ok) {

            showToast("Product Added To Cart");

        }

        else {

            const msg = await response.text();

            alert(msg);

        }

    }

    catch (error) {

        console.error(error);

    }

}

// ============================
// ADD TO WISHLIST
// ============================

async function addWishlist(productId) {

    if (!user) {

        showToast("Please Login First");

        window.location.href = "login.html";

        return;

    }

    try {

        const response = await fetch(

            `${BASE_URL}/api/wishlist/add/${user.id}?productId=${productId}`,

            {

                method: "POST"

            }

        );

        if (response.ok) {

            showToast("❤️ Added To Wishlist");

        }

        else {

            const msg = await response.text();

            alert(msg);

        }

    }

    catch (error) {

        console.error(error);

    }

}