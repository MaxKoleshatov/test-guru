document.addEventListener('turbolinks:load', function() {
    var control = document.getElementById('password_confirm')

    if (control) { control.addEventListener('input', checkPassword) }
})
    
function checkPassword() {
    var pass1 = document.getElementById("password")
    var pass2 = document.getElementById("password_confirm")
    
    if (pass1.value === "" || pass2.value === "") {
      pass2.style.backgroundColor = "transparent"
    } else if (pass1.value === pass2.value) {
      pass2.style.backgroundColor = "green"
    } else {
      pass2.style.backgroundColor = "red"
    }
}