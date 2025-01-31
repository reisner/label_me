import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-photo"
export default class extends Controller {
  connect() {
    var image_path = this.element.dataset.image
    var entries = JSON.parse(this.element.dataset.entries)

    console.log(image_path)
    console.log(entries)
    populate_image_and_labels(entries)

    function populate_image_and_labels(entries) {
      var annotator = new BBoxAnnotator({ url: image_path, read_only: true })
      entries.forEach(function(rect) {
        annotator.add_entry(rect);
      });
    }
  }
}
