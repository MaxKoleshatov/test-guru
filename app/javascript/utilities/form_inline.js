import { FormInline } from './FormInline.js'

document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link')
  
  
  if (controls) new FormInline(controls) 
})