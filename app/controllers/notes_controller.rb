class NotesController < ApplicationController
  before_action :set_note, except: [:index, :new, :create]

  # GET /notes/new
  def new
    @note = Note.new(page_id: params[:page_id])
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note.page, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note.page, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def move_up
    moved = @note.move_up!
    flash = moved ? {notice: 'Note was successfully moved.'} : {alert: 'Note was not moved.'}
    redirect_to @note.page, flash
  end

  def move_down
    moved = @note.move_down!
    flash = moved ? {notice: 'Note was successfully moved.'} : {alert: 'Note was not moved.'}
    redirect_to @note.page, flash
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to @note.page, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:content, :page_id)
  end
end
