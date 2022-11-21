# frozen_string_literal: true

class CreateTicketWorker < ApplicationWorker
  sidekiq_options retry: false

  def perform(user_id, pool_id, time_ref)
    @user_id = user_id
    @pool_id = pool_id
    @time_ref = time_ref
    raise UserNotFoundError unless user_exists?
    raise PoolNotFoundError unless pool_exists?
    if create_ticket
      @success = true
    end
  end

  private
    attr_reader :user_id, :pool_id, :time_ref

    def create_ticket
      CreateTicketService.new(user_id, pool_id, time_ref).call
    end
end
