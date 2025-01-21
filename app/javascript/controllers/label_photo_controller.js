import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="label-photo"
export default class extends Controller {
  static targets = ["template", "label_row", "label_header"]

  reset() {
    Controller.annotator.clear_all();
  }

  connect() {
    console.log("HI")
    var label_form_template = this.templateTarget.innerHTML; 
    var label_table_row_template = this.label_rowTarget.innerHTML;
    var label_table_header_template = this.label_headerTarget.innerHTML;
    var image_path = this.element.dataset.image
    var labels = JSON.parse(this.element.dataset.labels)
    console.log(this.element.dataset.entries)
    var existing_entries = JSON.parse(this.element.dataset.entries)
    var color_list = Array.from({length: labels.length}, () => "red")

    var options = {
      url: image_path,
      input_method: "select",
      labels: labels,
      color_list: color_list,
      guide: true,
      onchange: function(entries) {
        create_entry_table(entries)
      }
    };

    Controller.annotator = new BBoxAnnotator(options);

    // Initialize labelling if it already exists
    create_entry_table(existing_entries)
    existing_entries.forEach(function(entry) {
      Controller.annotator.add_entry(entry)
    });

    function create_entry_table(entries) {
      var labelsdiv = document.getElementById("labels")
      var labels_params_div = document.getElementById("labelsparams")
      labelsdiv.innerHTML = ""
      if (entries.length > 0) {
        var table = document.createElement("table")
        table.classList.add('table')
        table.classList.add('table-sm')
        table.style.width = "auto"
        table.innerHTML = label_table_header_template
        labels_params_div.innerHTML = "";
        $.each(entries, function( index, entry ) {
          add_entry_to_table(table, entry)
          add_entry_to_params_div(labels_params_div, entry)
        });
        labelsdiv.appendChild(table);
      } else {
        labelsdiv.innerHTML = "No Labels Identified";
      }
    }

    function add_entry_to_table(table, entry) {
      var row = label_table_row_template.replace("LABEL", entry.label)
      row = row.replace("LEFT", entry.left)
      row = row.replace("TOP", entry.top)
      row = row.replace("WIDTH", entry.width)
      row = row.replace("HEIGHT", entry.height)
      table.innerHTML = table.innerHTML + row
    }

    function add_entry_to_params_div(labels_params_div, entry) {
      var content = label_form_template.replace(/TEMPLATE_RECORD/g, Math.floor(Math.random() * 20))
      content = content.replace(/LABEL_SYMBOL/g, entry.label)
      content = content.replace(/LABEL_LEFT/g, entry.left)
      content = content.replace(/LABEL_TOP/g, entry.top)
      content = content.replace(/LABEL_WIDTH/g, entry.width)
      content = content.replace(/LABEL_HEIGHT/g, entry.height)
      labels_params_div.innerHTML = labels_params_div.innerHTML + content
    }
  }
}
