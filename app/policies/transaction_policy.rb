class TransactionPolicy < ApplicationPolicy
  def create?
    !(@record.post.user == @user)
  end
end
