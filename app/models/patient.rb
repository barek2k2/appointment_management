class Patient < ApplicationRecord
  before_save :sanitize_notes

  private

  def sanitize_notes
    self.notes = ActionController::Base.helpers.sanitize(notes)
  end
end
