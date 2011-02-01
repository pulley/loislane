class User < ActiveRecord::Base
  has_many :commits
  has_many :concerns
  has_many :approvals

  validates_presence_of :username
  validates_presence_of :email

  mount_uploader :avatar, AvatarUploader

  def self.authenticate(username, password)
    return nil if username.blank? || password.blank?

    if user = User.where(:username => username).first
      return user
    else
      Net::LDAP.open(:host => "ttwpusaldap01.usa.tribune.com", :port => 389, :base => "dc=usa,dc=tribune,dc=com") do |ldap|
        if ldap.bind(:username => "usa\\#{username}", :password => password, :method => :simple)
          unless user
            user = User.create!(:username => username, :email => "#{username}@tribune.com")
          end

          return user
        else
          Rails.logger.error("LDAP: Error #{ldap.get_operation_result.code}")
          return nil
        end
      end
    end
  end
end
