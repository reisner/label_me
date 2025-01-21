class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy label save_labels ]

  # GET /images or /images.json
  def index
    @images = Image.all
  end

  # GET /images/1 or /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy!

    respond_to do |format|
      format.html { redirect_to images_path, status: :see_other, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def label
    @labels = [ "A", "B", "C" ]
    @image_labels_json = @image.image_labels.map do |label|
      label.as_json(only: [ :left, :top, :width, :height ]).merge({
        "label": label.symbol_entry.name,
        "color": "red"
      })
    end
    @image_labels_json = @image_labels_json.to_json
  end

  def save_labels
    #   image_labels_attributes = params.has_key?(:image) ? label_params[:image_labels_attributes] : []
    #   if @image.save_labels(image_labels_attributes, current_user)
    #     redirect_to image_url(@image), notice: "Labels were successfully saved."
    #   else
    #     redirect_to image_url(@image), alert: "An error was encountered while saving Labels."
    #   end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.expect(image: [ :name, :image_file ])
    end
end
