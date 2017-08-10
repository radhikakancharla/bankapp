class Account < ApplicationRecord
    has_many :transactions
    validates :name, uniqueness: true
    validates :name, :category, presence: true
    def deposit(amount)
        if !amount.is_a? Numeric
            self.errors.add(:amount, 'not a number')
            return
        end
        self.errors.add(:amount, 'less than zero') if amount <= 0
        
        return if self.errors.any?
        ActiveRecord::Base.transaction do
            self.update!(balance: self.balance + amount)
            raise 'explode'
            Transaction.create!(amount: amount, category: 'Deposit', account_id: self.id)
        end
    end
end