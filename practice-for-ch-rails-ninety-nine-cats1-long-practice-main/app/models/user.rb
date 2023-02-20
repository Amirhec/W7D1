class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence:true

    validates :password, length: {minimum: 6}

    before_validation :ensure_session_token

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

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64 

        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64 
        end

       return token
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token 
        self.save!
        return self.session_token
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token 
    end

end
