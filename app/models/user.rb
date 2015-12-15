class User < ActiveRecord::Base

  validates :first_name, presence: true

  has_many :likes
  has_many :comments
  has_and_belongs_to_many :goals

  has_many :created_posts, :class_name => 'Post', :foreign_key => 'creator_id'
  has_many :profile_posts, :class_name => 'Post', :foreign_key => 'profile_id'

  has_many :following_followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :following_followings, :class_name => 'Following', :foreign_key => 'follower_id'

  has_many :followers, :through => :following_followers
  has_many :followings, :through => :following_followings, :source => :user

  def posts
    Post.where("creator_id = ? or profile_id = ?",id,id)
  end

  def self.from_facebook_token(token)
    facebook ||= Koala::Facebook::API.new(token)
    fetched_data = facebook.api("/me?fields=id,first_name,last_name,hometown,gender,birthday,picture")

    if(not fetched_data["error"])

    user = self.where(facebook_id: fetched_data["id"]).first_or_initialize.tap do |user|

      if(fetched_data["first_name"])
        user.first_name ||= fetched_data["first_name"]
      end

      if(fetched_data["last_name"])
        user.last_name ||= fetched_data["last_name"]
      end

      if(fetched_data["hometown"])
        user.city ||= fetched_data["hometown"]["name"].split(",")[0]
        user.country ||= fetched_data["hometown"]["name"].split(",")[1]
      end

      if(fetched_data["gender"])
        user.gender ||= fetched_data["gender"] == "male"
      end

      if(fetched_data["birthday"])
        user.date_of_birth ||= Date.strptime(fetched_data["birthday"], "%m/%d/%Y")
      end

      if(fetched_data["picture"])
        user.profile_picture ||= fetched_data["picture"]["data"]["url"]
      end

      if(fetched_data["id"])
        user.facebook_id = fetched_data["id"]
      end

      user.facebook_token = token

      user.save!
    end

  end

  end

end
