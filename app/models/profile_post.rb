class ProfilePost < Post
	validates :profile, :presence => true
  belongs_to :profile, :class_name => "User", foreign_key: "profile_id"
end
