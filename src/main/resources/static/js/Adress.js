const BASE_URL = "http://16.171.70.157:6060";

const user = JSON.parse(localStorage.getItem("loggedUser"));

if (!user) {

    alert("Please Login First");

    window.location.href = "login.html";

}

document.getElementById("addressForm").addEventListener("submit", saveAddress);

async function saveAddress(e) {

    e.preventDefault();

    const address = {

        fullName: document.getElementById("name").value,
        phone: document.getElementById("phone").value,
        addressLine1: document.getElementById("address1").value,
        addressLine2: document.getElementById("address2").value,
        city: document.getElementById("city").value,
        state: document.getElementById("state").value,
        pincode: document.getElementById("pincode").value,
        country: document.getElementById("country").value

    };

    try {

        const response = await fetch(

            `${BASE_URL}/api/address/add/${user.id}`,

            {

                method: "POST",

                headers: {
                    "Content-Type": "application/json"
                },

                body: JSON.stringify(address)

            }

        );

        if (response.ok) {

            const savedAddress = await response.json();

            localStorage.setItem("selectedAddress", JSON.stringify(savedAddress));

            showToast("Address Saved Successfully ✅");

        } else {

            showToast("Unable To Save Address");

        }

    } catch (error) {

        console.error(error);

    }

}

document.getElementById("checkoutBtn").addEventListener("click", () => {

    const fullName = document.getElementById("name").value.trim();
    const phone = document.getElementById("phone").value.trim();
    const address1 = document.getElementById("address1").value.trim();
    const city = document.getElementById("city").value.trim();
    const state = document.getElementById("state").value.trim();
    const pincode = document.getElementById("pincode").value.trim();
    const country = document.getElementById("country").value.trim();

    if (
        !fullName ||
        !phone ||
        !address1 ||
        !city ||
        !state ||
        !pincode ||
        !country
    ) {
        showToast("Please fill in all the required address details.");
        return;
    }

    const address = localStorage.getItem("selectedAddress");

    if (!address) {
        showToast("Please save your address first.");
        return;
    }

    const productId = localStorage.getItem("buyNowProductId");
    if (productId === null)
    {
    showToast("buyNowProductId is null");
    }
     else
     {
     window.location.href = orders.html?id=${encodeURIComponent(productId)};

});