class AccountsController < ApplicationController
    def index
        @accounts = Account.order(id: :desc)
    end
    def bankapp
        @account = Account.find(params[:id])
    end
    def deposit
        @account= Account.find(params[:id])
        @account.deposit(params[:amount].to_f)
        if @account.errors.any?
            render 'bankapp'
        else
            redirect_to root_url
        end
    end
    def withdraw
        @account= Account.find(params[:id])
        @account.withdraw(params[:amount].to_f)
        if @account.errors.any?
            render 'bankapp'
        else
            redirect_to root_url
        end
    end
    def clearsuspension
        @account= Account.find(params[:id])
        @account.clear_suspension
        if @account.errors.any?
            render 'bankapp'
        else
            redirect_to root_url
        end
    end
end