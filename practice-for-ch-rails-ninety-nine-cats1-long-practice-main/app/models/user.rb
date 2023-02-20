class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence:true

    validates :password, length: {minimum: 6}

    attr_reader :password

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw)
    end

    def is_password?(pw)
        bcrypt = BCrypt::Password.new(self.password_digest)
        bcrypt.is_password?(pw)

    end

    def self.find_by_credentials(username, password)
        @user = User.find(params[:user][:username], params[:user][:password])
        if @user && @user.is_password?(password)
            return @user
        else
            return nil
        end
    end


end
