class Toy < ApplicationRecord
  belongs_to :user
  has_many :logs

  include AASM

  aasm do
    state :wake_up, initial: true
    state :ate
    state :trained
    state :played
    state :sleeped
    state :sent

    after_all_transitions :log_status_change, :add_log

    event :eat do
      transitions from: [:wake_up], to: :ate
    end
    event :train do
      transitions from: [:ate], to: :trained
    end
    event :play do
      transitions from: [:trained], to: :played
    end
    event :sleep do
      transitions from: %i[played trained], to: :sleeped
    end
    event :wake_up do
      transitions from: [:sleeped], to: :wake_up
    end
  end

  def log_status_change
    "changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end

  def may_event?(event)
    send("may_#{event}?")
  end

  def send_mail
    SendEmailJob.set(wait: 20.seconds).perform_later(id, user_id)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |toy|
        csv << toy.attributes.values_at(*column_names)
      end
    end
  end

  def call_state(state, event)
    return unless state
    return unless may_event?(event)
    send("#{event}!")
  end

  private

  def add_log
    Log.create(event: aasm.current_event, toy_id: id)
  end
end
