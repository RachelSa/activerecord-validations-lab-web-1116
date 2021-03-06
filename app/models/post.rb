class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :non_clickbait


  def non_clickbait
    if title != nil
      clickbait = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]

      errors.add(:base, 'Needs clickbait') unless clickbait.any? {|bait| title.match bait} 
     end 
  end




end
