document.addEventListener("DOMContentLoaded", () => {

    const user = JSON.parse(localStorage.getItem("loggedUser"));

    if (!user)
    {
        window.location.href = "login.html";
        return;
    }

    document.getElementById("userName").textContent = user.name;
    document.getElementById("userRole").textContent = user.role;
    document.getElementById("name").textContent = user.name;
    document.getElementById("email").textContent = user.email;
});


function logout()
{
    localStorage.removeItem("loggedUser");
    window.location.href = "login.html";

}