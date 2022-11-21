# frozen_string_literal: true

class WalletExistsValidator < ActiveModel::Validator
  def validate(record)
    if Wallet.find_by(pr_key: record.receiver_key).nil?
      record.errors[:sender_key] << "Sender key is not valid"
    end

    if Wallet.find_by(pv_key: record.sender_key).nil?
      record.errors[:receiver_key] << "Receiver key is not valid"
    end
  end
end
