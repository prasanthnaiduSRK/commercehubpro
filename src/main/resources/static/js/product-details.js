const BASE_URL = "http://16.171.70.157:6060";

const params = new URLSearchParams(window.location.search);

const productId = params.get("id");

let currentCategoryId = null;

// =======================
// LOAD PRODUCT
// =======================

async function loadProduct() {

    try {

        const response = await fetch(`${BASE_URL}/api/products/get`);

        const products = await response.json();

        const product = products.find(p => p.id == productId);

        if (!product) {

            return;

        }

        document.getElementById("productImage").src = `${BASE_URL}/images/${product.imageUrl}`;
        document.getElementById("productName").innerText = product.productName;
        document.getElementById("category").innerText = product.category.categoryname;
        document.getElementById("description").innerText = product.description;
        document.getElementById("price").innerText = "₹" + product.price;
        document.getElementById("brand").innerText = product.brand;
        document.getElementById("stock").innerText = product.stock;

        currentCategoryId = product.category.id;

        loadRelatedProducts(products);

    }

    catch (error) {

        console.log(error);

    }

}

// =======================
// RELATED PRODUCTS
// =======================

function loadRelatedProducts(products) {

    const container = document.getElementById("relatedProducts");

    container.innerHTML = "";

    const related = products.filter(p =>

        p.category.id === currentCategoryId &&

        p.id != productId

    );

    related.forEach(product => {

        container.innerHTML += `

        <div class="related-card" onclick="openProduct(${product.id})">

            <img src="${BASE_URL}/images/${product.imageUrl}" alt="${product.productName}">

            <div class="related-info">

                <h3>${product.productName}</h3>

                <p>${product.brand}</p>

                <div class="related-price">

                    ₹${product.price}

                </div>

            </div>

        </div>

        `;

    });

}

// =======================
// OPEN PRODUCT
// =======================

function openProduct(id) {

    window.location.href = `product-details.html?id=${id}`;

}

// =======================
// ADD TO CART
// =======================

document.getElementById("cartBtn").onclick = async () => {

    const user = JSON.parse(localStorage.getItem("loggedUser"));

    if (!user) {

        showToast("Please Login");

        window.location.href = "login.html";

        return;

    }

    const response = await fetch(

        `${BASE_URL}/api/cartitems/add/${user.id}?productId=${productId}`,

        {

            method: "POST"

        }

    );

    if (response.ok) {

        showToast("Added To Cart");

    }

};

// =======================
// ADD TO WISHLIST
// =======================

document.getElementById("wishlistBtn").onclick = () => {

    showToast("Added to Wishlist");

};

window.onload = loadProduct;

// =======================
// BUY NOW
// =======================

document.getElementById("buyNowBtn").onclick = () => {

    const user = JSON.parse(localStorage.getItem("loggedUser"));

    if (!user) {

        showToast("Please Login");

        window.location.href = "login.html";

        return;

    }

    localStorage.setItem("buyNowProductId", productId);

    window.location.href = "Adress.html";

};