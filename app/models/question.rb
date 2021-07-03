class Question < ApplicationRecord
  validates_presence_of :note, message: "You have to ask a question"

  enum status: { unanswered: 0, answered: 10, }, _default: "unanswered"

  def attribution
  end
end
