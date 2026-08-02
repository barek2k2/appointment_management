class Patient < ApplicationRecord
  ALLOWED_SORT_COLUMNS = %w[last_name first_name date_of_birth created_at].freeze

  def self.sorted(column)
    order(column)
  end
end
