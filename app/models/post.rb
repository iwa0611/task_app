class Post < ApplicationRecord
  validates :title,presence:true
  validates :start,presence:true
  validates :finish,presence:true

  validate:check_date_today
  validate:check_date_finish

  def check_date_today
    if finish.nil? || finish <= Date.today
      errors.add(:finish,"は今日以降を選択してください")
    end
  end
  
  def check_date_finish
    if finish.nil? || finish < start
      errors.add(:finish,"は開始日より後の日にちを選択してください")
    end
  end
end
