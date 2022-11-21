# frozen_string_literal: true

class ApplicationWorker
  include Sidekiq::Worker
  include ActiveSupport::Rescuable

  class UserNotFoundError < StandardError
    def initialize(message = "User not found")
      super
    end
  end

  class WalletNotFoundError < StandardError
    def initialize(message = "Wallet not found")
      super
    end
  end

  class AmountNotEnoughError < StandardError
    def initialize(message = "Wallet balance is not enough")
      super
    end
  end

  class BlockNotFoundError < StandardError
    def initialize(message = "Block not found")
      super
    end
  end

  class PoolNotFoundError < StandardError
    def initialize(message = "Pool not found")
      super
    end
  end

  ERRORS = [UserNotFoundError, WalletNotFoundError, AmountNotEnoughError, BlockNotFoundError].freeze

  ERRORS.each do |error|
    rescue_from error do |e|
      dev_error(e)
    end
  end

  def perform
    raise NotImplementedError
  end

  def success?
    @success ||= false
  end

  private
    def dev_error(e)
      if env_acceptable?
        puts "#{e.class}: #{e.message}"
        puts e.backtrace
      end
    end

    def user_exists?
      User.find_by(id: user_id).present?
    end

    def pool_exists?
      Pool.find_by(id: pool_id).present?
    end

    def block_exists?
      Block.find_by(id: block_id).present?
    rescue NameError
      false
    end

    def wallet_exists?(method, key)
      Wallet.find_by(method => key).present?
    end

    def env_acceptable?
      Rails.env.development? || Rails.env.test?
    end
end
