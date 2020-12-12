class User::RegisterForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :password

  validates :first_name, :last_name, :email, :password, presence: true

  def validate!
    raise ActiveRecord::RecordInvalid, self unless valid?

    User.new(attributes)
  end

  private

  def attributes
    {
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password
    }
  end
end
