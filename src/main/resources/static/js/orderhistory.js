const BASE_URL = "http://16.171.70.157:6060";

const user = JSON.parse(localStorage.getItem("loggedUser"));

window.onload = loadOrders;

async function loadOrders() {

    try {

        const response = await fetch(

            `${BASE_URL}/api/orders/get/${user.id}`

        );

        const orders = await response.json();

        const container = document.getElementById("ordersContainer");

        container.innerHTML = "";

        if (orders.length === 0) {

            container.innerHTML = "<h2>No Orders Found</h2>";

            return;

        }

        orders.forEach(order => {

            container.innerHTML += `

            <div class="order-card">

                <div class="order-top">

                    <div>

                        <h3>Order #${order.id}</h3>

                        <span class="status delivered">

                            Delivered

                        </span>

                    </div>

                    <div>

                        ${new Date(order.createdAt).toLocaleDateString()}

                    </div>

                </div>

                <div class="order-body">

                    <div class="order-image">

                        <img src="${BASE_URL}/images/${order.product.imageUrl}" alt="${order.product.productName}">

                    </div>

                    <div class="order-details">

                        <h2>${order.product.productName}</h2>

                        <p><strong>Brand :</strong> ${order.product.brand}</p>

                        <p><strong>Quantity :</strong> ${order.quantity}</p>

                        <p><strong>Price :</strong> ₹${order.price}</p>

                        <p><strong>Total :</strong> ₹${order.subtotal}</p>

                    </div>

                </div>

                <div class="delivery-section">

                    <div class="address-card">

                        <h3>📍 Delivery Address</h3>

                        <p>

                            ${order.shippingAddress.fullName}<br>

                            ${order.shippingAddress.addressLine1}<br>

                            ${order.shippingAddress.addressLine2 ?? ""}<br>

                            ${order.shippingAddress.city},
                            ${order.shippingAddress.state}<br>

                            ${order.shippingAddress.pincode}<br>

                            ${order.shippingAddress.country}<br>

                            📞 ${order.shippingAddress.phone}

                        </p>

                    </div>

                    <div class="delivery-card">

                        <h3>🚚 Delivery Details</h3>

                        <p><strong>Status :</strong> Delivered</p>

                        <p><strong>Payment :</strong> Cash On Delivery</p>

                        <p><strong>Ordered On :</strong> ${new Date(order.createdAt).toLocaleString()}</p>

                    </div>

                </div>

                <div class="order-actions">

                    <button onclick="buyAgain(${order.product.id})">

                        🔄 Buy Again

                    </button>

                </div>

            </div>

            `;

        });

    }

    catch (error) {

        console.error(error);

    }

}

function buyAgain(productId) {

    localStorage.setItem("buyNowProductId", productId);

    window.location.href = `product-details.html?id=${productId}`;

}