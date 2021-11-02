document.addEventListener('turbolinks:load', function() {
  const progressBar = document.getElementById('progress-test')
  
  if (progressBar) {
    const questionNimber = progressBar.dataset.questionNumber - 1
    const questionCount = progressBar.dataset.questionsCount
    const percentProgress = 100 * Math.abs(questionNimber/questionCount)

    progressBar.style.width = percentProgress + "%"
  }
})
