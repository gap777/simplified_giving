import { Controller } from "@hotwired/stimulus"
import Datepicker from 'vanillajs-datepicker/Datepicker'

export default class extends Controller {
  connect() {
    new Datepicker(this.element, {
      buttonClass: 'btn',
      autohide: true,
      format: {
        toValue(date, format, locale) {
          return date.toISOString().split('T')[0]
        },
        toDisplay(date, format, locale) {
          return date.toLocaleDateString(locale, { year: 'numeric', month: 'long', day: 'numeric' })
        },
      },
    });
  }
}
