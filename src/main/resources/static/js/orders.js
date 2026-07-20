const BASE_URL = "http://16.171.70.157:6060";

const user = JSON.parse(localStorage.getItem("loggedUser"));

const productId = localStorage.getItem("buyNowProductId");

const address = JSON.parse(localStorage.getItem("selectedAddress"));

window.onload = loadProduct;

// =======================
// LOAD PRODUCT
// =======================

async function loadProduct() {

    try {

        const response = await fetch(`${BASE_URL}/api/products/get`);

        const products = await response.json();

        const product = products.find(p => p.id == productId);

        if (!product) {

            showToast("Product Not Found");

            return;

        }

        document.getElementById("productImage").src = `${BASE_URL}/images/${product.imageUrl}`;

        document.getElementById("productName").innerText = product.productName;

        document.getElementById("brand").innerText = product.brand;

        document.getElementById("price").innerText = "₹" + product.price;

        document.getElementById("quantity").innerText = "1";

        // =======================
        // ORDER SUMMARY
        // =======================

        const subtotal = product.price;

        const shipping = 0;

        const platformFee = 0;

        const gst = subtotal * 0.18;

        const total = subtotal + shipping + platformFee + gst;

        document.getElementById("itemsPrice").innerText = "₹" + subtotal.toFixed(2);

        document.getElementById("subtotal").innerText = "₹" + subtotal.toFixed(2);

        document.getElementById("gst").innerText = "₹" + gst.toFixed(2);

        document.getElementById("grandTotal").innerText = "₹" + total.toFixed(2);

        document.getElementById("address").innerHTML = `
            <strong>${address.fullName}</strong><br>
            ${address.addressLine1}<br>
            ${address.addressLine2 ? address.addressLine2 + "<br>" : ""}
            ${address.city}, ${address.state}<br>
            ${address.pincode}<br>
            ${address.country}<br>
            📞 ${address.phone}
        `;

    }

    catch (error) {

        console.error(error);

    }

}

// =======================
// PLACE ORDER
// =======================

document.getElementById("placeOrderBtn").addEventListener("click", placeOrder);

async function placeOrder() {

    try {

        const response = await fetch(

            `${BASE_URL}/api/orders/add?userId=${user.id}&productId=${productId}&addressId=${address.id}&quantity=1`,

            {

                method: "POST"

            }

        );

        if (response.ok) {

            showToast("🎉 Order Placed Successfully");

            localStorage.removeItem("buyNowProductId");
            localStorage.removeItem("selectedAddress");

            window.location.href = "index.html";

        }

        else {

            showToast("Failed To Place Order");

        }

    }

    catch (error) {

        console.error(error);

    }

}