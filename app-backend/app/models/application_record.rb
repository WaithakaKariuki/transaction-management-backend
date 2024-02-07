class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  self.abstract_class = true

  before_create :generate_uuid

  protected
  def generate_uuid
    self.id = SecureRandom.uuid unless self.id
    # g.orm :active_record, force_foreign_key_type: :uuid
  end
end
