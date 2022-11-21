# frozen_string_literal: true

json.array! @signatures, partial: "signatures/signature", as: :signature
