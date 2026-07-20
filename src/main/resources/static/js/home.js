const BASE_URL = "http://16.171.70.157:6060";

document.addEventListener("DOMContentLoaded", () => {

    const user = JSON.parse(localStorage.getItem("loggedUser"));
    const profileBtn = document.getElementById("profileBtn");
    const dropdownMenu = document.getElementById("dropdownMenu");

    if (!profileBtn) {
        return;
    }

    loadHeroImages();

    if (!user) {

        profileBtn.innerHTML = "Login";

        if (dropdownMenu) {
            dropdownMenu.remove();
        }

        profileBtn.addEventListener("click", () => {
            window.location.href = "login.html";
        });

        return;

    }

    // User logged in
    profileBtn.innerHTML = "👤 " + user.name;

    profileBtn.addEventListener("click", function (e) {

        e.stopPropagation();
        dropdownMenu.classList.toggle("show");

    });

    document.addEventListener("click", function () {

        dropdownMenu.classList.remove("show");

    });

    dropdownMenu.addEventListener("click", function (e) {

        e.stopPropagation();

    });

});

// Logout
function logout() {

    localStorage.removeItem("loggedUser");
    window.location.href = "login.html";

}

async function loadHeroImages() {

    try {

        const response = await fetch(`${BASE_URL}/api/products/get`);

        const products = await response.json();

        if (products.length === 0) {
            return;
        }

        const hero = document.getElementById("heroImage");
        let index = 0;

        hero.src = `${BASE_URL}/images/${products[index].imageUrl}`;

        setInterval(() => {

            index++;

            if (index >= products.length) {
                index = 0;
            }

            hero.src = `${BASE_URL}/images/${products[index].imageUrl}`;

        }, 3000);

    } catch (error) {

        console.log(error);

    }

    const days = document.getElementById("days");
    const hours = document.getElementById("hours");
    const minutes = document.getElementById("minutes");
    const seconds = document.getElementById("seconds");

    let totalSeconds = Math.floor(Math.random() * (5 * 24 * 60 * 60)) + 24 * 60 * 60;

    function updateCountdown() {

        let d = Math.floor(totalSeconds / 86400);
        let h = Math.floor((totalSeconds % 86400) / 3600);
        let m = Math.floor((totalSeconds % 3600) / 60);
        let s = totalSeconds % 60;

        days.innerText = String(d).padStart(2, "0");
        hours.innerText = String(h).padStart(2, "0");
        minutes.innerText = String(m).padStart(2, "0");
        seconds.innerText = String(s).padStart(2, "0");

        if (totalSeconds > 0) {
            totalSeconds--;
        } else {
            totalSeconds = Math.floor(Math.random() * (5 * 24 * 60 * 60)) + 24 * 60 * 60;
        }

    }

    updateCountdown();

    setInterval(updateCountdown, 1000);

}

function openCategory(category) {

    if (category === "Beauty" || category === "Groceries") {

        showToast(
            `🚧 ${category} category is coming soon! We're working hard to bring you the best products. Stay tuned!`,
            "info"
        );

        return;

    }

    window.location.href = `product.html?category=${encodeURIComponent(category)}`;

}