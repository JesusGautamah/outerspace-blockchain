# frozen_string_literal: true

class ApplicationService
  private
    attr_reader :user_id, :wallet_id, :wallet_key, :wallet_method
  
    def dev_error(e)
      if env_acceptable?
        puts "#{e.class}: #{e.message}"
        puts e.backtrace
      end
    end

    def user_exists?
      return false unless user_id
      User.find_by(id: user_id).present?
    end

    def wallet_exists?(method, key)
      Wallet.find_by(method => key).present?
    end

    def env_acceptable?
      Rails.env.development? || Rails.env.test?
    end
end
