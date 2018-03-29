import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  get autocomplete() {
    return new google.maps.places.Autocomplete(this.inputTarget)
  }
  connect() {
    this.autocomplete
  }
}