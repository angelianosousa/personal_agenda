class Task < ApplicationRecord
  belongs_to :board, counter_cache: true
  belongs_to :user, counter_cache: true

  validates :start_time, presence: true
  
  scope :search_tasks, -> (user, start_date){
    where(user_id: user.id)
    .where(
      start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
    )
   }
end
