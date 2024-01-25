class Arrangement < ApplicationRecord
  belongs_to :agent
  belongs_to :client
  enum status: [:pending, :confirmed, :refused]
  
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :pending
  end

end
