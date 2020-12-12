class User < ApplicationRecord
  devise :database_authenticatable

  enum role: {
    admin: 'admin',
    client: 'client'
  }
end
