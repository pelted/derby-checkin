import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "output" ]

  set autocomplete(auto) {
    this._autocomplete = auto
  }

  get autocomplete() {
    return this._autocomplete
  }

  get addressFields() {
    return {
      street_number: 'short_name',
      route: 'long_name',
      locality: 'long_name',
      administrative_area_level_1: 'short_name',
      country: 'short_name',
      postal_code: 'short_name'
    }
  }
  
  connect() {
    const options = {
      type: ["address"]
    }
    this._autocomplete = new google.maps.places.Autocomplete(this.inputTarget, options)

    this.autocomplete.addListener('place_changed', this.onPlaceChanged)
    this.inputTarget.addEventListener('change', this.onInputChanged)
  }

  onPlaceChanged = () => {
    let place = this.autocomplete.getPlace()
    let address = {text: this.inputTarget.value, name: place.name, formatted_address: place.formatted_address}
    
    for (const component of place.address_components) {
      let addressType = component.types[0]
      if (this.addressFields[addressType]) {
        let val = component[this.addressFields[addressType]]
        address[addressType] = val        
      }
    }
    this.outputTarget.value = JSON.stringify(address)
  }

  onInputChanged = () => {
    if (this.inputTarget.value.length === 0) {
      this.outputTarget.value = null
    }
  }
}