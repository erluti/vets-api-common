# frozen_string_literal: true

# REVIEW message is an ActiveRecord model

FactoryBot.define do
  factory :message do
    sequence :id do |n|
      n
    end

    category { 'OTHER' }
    sequence :subject do |n|
      "Subject #{n}"
    end

    sequence :body do |n|
      "Body #{n}"
    end

    attachment { false }
    sent_date { 'Thu, 11 Jul 2013 20:25:54 GMT' }
    sender_id { 1 }
    sender_name { 'Sender 1' }
    recipient_id { 613_586 }
    recipient_name { 'Recipient 1' }
    read_receipt { 'READ' }
  end
end
