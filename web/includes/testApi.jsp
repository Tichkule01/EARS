<!DOCTYPE html>
<html>
<head>
    <title>EARS Login</title>
</head>
<body>

<h2>Login</h2>

<form id="loginForm">
    Email: <input type="email" id="email" required><br><br>
    Password: <input type="password" id="password" required><br><br>
    <button type="submit">Login</button>
</form>

<p id="error" style="color:red;"></p>

<script>
document.getElementById("loginForm").addEventListener("submit", function(e) {
    e.preventDefault();

    fetch("/Ears/includes/apiAuth", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
        },
        body: JSON.stringify({
            email: email.value,
            password: password.value
        })
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
            // ONE redirect only
            window.location.href = "/Ears/dashboard";
        } else {
            document.getElementById("error").innerText = data.message;
        }
    });
});
</script>