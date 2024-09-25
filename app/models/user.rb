class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User


  has_one_attached :image
  include DeviseTokenAuth::Concerns::User

    def image_url
      Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?
    end
  
    def as_json(options = {})
      super(options).merge(
        image: {
            url: image_url
        }
      )
    end
  
end