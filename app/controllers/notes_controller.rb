class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)

    if note.save
      redirect_to Estimate.find note.estimate
    else
      flash[:error] = note.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  def update
    note = Note.find params[:id]

    if note.update_attributes(note_params)
      redirect_to note.estimate
    else
      flash[:error] = note.errors.full_messages.to_sentence
      redirect_to note.estimate
    end
  end

  def destroy
    note = Note.find params[:id]
    note.destroy
    redirect_to Estimate.find params[:estimate_id]
  end

  private

  def note_params
    params.require(:note).permit(:text, :done, :estimate_id)
  end

end
