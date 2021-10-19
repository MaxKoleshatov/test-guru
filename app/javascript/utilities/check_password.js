document.addEventListener('turbolinks:load', function() {
  const passwordConfirm = document.getElementById('password_confirm')

  if (passwordConfirm) { passwordConfirm.addEventListener('input', checkPassword) }   
})
    
  function checkPassword() {
    const pass1 = document.getElementById("password")
    const pass2 = document.getElementById("password_confirm")
    const ColorRed = "#ff6666"
    const ColorGreen = "#66cc66"

    function changeColor(color) {
      pass2.style.backgroundColor = color
    }
    
    if (pass1.value === "" || pass2.value === "") {
      changeColor('transparent')
    } else if (pass1.value === pass2.value) {
      changeColor(ColorGreen)
    } else {
      changeColor(ColorRed)
    }
  }