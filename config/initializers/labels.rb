class Labels
  DEFAULT_LABELS = [ "Label1", "Label2", "Label3", "Label4" ].freeze
  CUSTOM_LABELS_PATH = "config/labels.txt"

  def self.label_list
    if File.exist?(CUSTOM_LABELS_PATH)
      labels = File.readlines(CUSTOM_LABELS_PATH).map do |label|
        label = label.strip
        if label.match(/^[a-zA-Z0-9\s]*$/).nil?
          raise Exception.new("Non Alphanumeric label found in configs/labels.txt")
        end
        label
      end
    else
      DEFAULT_LABELS
    end
  end
end

raise Exception.new("Non Alphanumeric label found in configs/labels.txt")
