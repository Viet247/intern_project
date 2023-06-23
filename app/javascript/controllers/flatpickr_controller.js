import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    
    flatpickr(".from-date", {
      enableTime: true,
      dateFormat: "d-m-Y"
    })

    flatpickr(".to-date", {
      enableTime: true,
      dateFormat: "d-m-Y"
    })
  }
}




