const BASE_URL = "http://16.171.70.157:6060";

const API = `${BASE_URL}/api/user/login`;

const form = document.getElementById("loginForm");

form.addEventListener("submit", async function (e) {

    e.preventDefault();

    const email = document.getElementById("email").value.trim();

    const password = document.getElementById("password").value;

    const user = {

        email: email,

        password: password

    };

    try {

        const response = await fetch(API, {

            method: "POST",

            headers: {

                "Content-Type": "application/json"

            },

            body: JSON.stringify(user)

        });

        if (response.ok) {

            console.log("Inside Success Block");

            const data = await response.json();

            console.log(data);

            showToast("Login Successful");

            localStorage.setItem("loggedUser", JSON.stringify(data));

            window.location.href = "index.html";

        }

        else {

            showToast("Invalid Email or Password");

        }

    }

    catch (error) {

        console.error(error);

        showToast("Server Error");

    }

});