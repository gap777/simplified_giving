import { Controller } from "@hotwired/stimulus"
import Datepicker from 'vanillajs-datepicker/Datepicker'

export default class extends Controller {
  connect() {
    const datepicker = new Datepicker(this.element, {
      buttonClass: 'btn'
    });
  }
}
