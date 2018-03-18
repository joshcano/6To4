class TransactionsController < ApplicationController
  before_action :authenticate_user!

  # POST /transactions
  def create
    @transaction = Post.find(params['post_id']).transactions.new(transaction_params)
    @transaction.user = current_user
    authorize @transaction
    @transaction.save

    if @transaction.save
      redirect_to @transaction.post, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:post_id, :comment, :amount, :user_id)
    end
end
