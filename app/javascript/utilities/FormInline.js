export class FormInline {
  constructor(controls) {
    this.controls = controls
    this.setup()
  }

  setup(){
    this.controls.forEach(element => element.addEventListener('click', this.formInlineHandler))
  }
    

  formInlineHandler(event) {
    event.preventDefault()
    
    const testId = this.dataset.testId
     
    const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

    if (formInline && formInline.classList.contains('hide')) {
      testTitle.classList.add('hide')
      formInline.classList.remove('hide')
      link.textContent = 'Cancel'
    } else if (formInline) {
      testTitle.classList.remove('hide')
      formInline.classList.add('hide')
      link.textContent = 'Edit'
    }
  }   
}
  