class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id , presence: true 
  validates :post_id , presence: true 
  validates :content, presence: true, length: { maximum: 500 }
  validate  :picture_size
  

  private 

  def picture_size
       if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5MB")
       end 
  end
end

