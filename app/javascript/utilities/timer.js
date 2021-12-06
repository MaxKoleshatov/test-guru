document.addEventListener('turbolinks:load', function() {
  const timerAll = document.getElementById("time")
  const timerShow = document.getElementById("timer")

  let timeMinut = timerAll.dataset.timeRemaining
  let iD = timerAll.dataset.id

  if(timeMinut <= 0) return nil
  

  timer = setInterval(function () {
    if (timeMinut <= 0) {
      clearInterval(timer)
      document.querySelector('input[type="submit"]').click()
    } else {
      let strTimer = `${timeMinut}`
      timerShow.innerHTML = strTimer
    }
    --timeMinut;
}, 1000)
})