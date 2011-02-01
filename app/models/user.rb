class User < ActiveRecord::Base
  has_many :commits
  has_many :concerns
  has_many :approvals

  validates_presence_of :username
  validates_presence_of :email

  mount_uploader :avatar, AvatarUploader

  def self.authenticate(username, password)
    return nil if username.blank? || password.blank?

    # LDAP_OPTIONS = {:host => "xxx, :port => xxx, :base => "dc=xxx,dc=xxx,dc=xxx"}
    Net::LDAP.open(LDAP_OPTIONS) do |ldap|
      if ldap.bind(:username => "usa\\#{username}", :password => password, :method => :simple)
        user = User.where(:username => username).first

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
