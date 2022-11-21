# frozen_string_literal: true

class AssignContractWorker < ApplicationWorker
  def perform(ticket_id)
    @ticket_id = ticket_id
    assign_contract
  end

  private
  attr_reader :ticket_id

  def ticket
    @ticket ||= Ticket.find_by(id: ticket_id)
  end

  def transactions
    @transactions ||= Transaction.where(id: ticket.transaction_id_list)
  end

  def contracts
    @contracts ||= Contract.where(transaction_id: transactions.pluck(:id))
  end

  def assign_contract
    AssignContractsService.new(contracts.pluck(:id), ticket_id).call
  end
end
