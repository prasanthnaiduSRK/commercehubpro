const BASE_URL = "http://16.171.70.157:6060";

const API = `${BASE_URL}/api/user/Signup`;

const form = document.getElementById("registerForm");

form.addEventListener("submit", async function (e) {

    e.preventDefault();

    const name = document.getElementById("name").value.trim();

    const email = document.getElementById("email").value.trim();

    const password = document.getElementById("password").value;

    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {

        showToast("Passwords do not match");

        return;

    }

    const user = {

        name: name,

        email: email,

        password: password,


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

            showToast("Registration Successful");

            window.location.href = "login.html";

        }

        else {

            showToast("Registration Failed");

        }

    }

    catch (error) {

        console.error(error);

        alert("Server Error");

    }

});