class User
  include DataMapper::Resource
  include DataMapper::Validate
  include BCrypt
  attr_accessor :password_confirmation

  # Properties

  # General Properties
  property :id,             Serial
  property :email,          String, :format => :email_address, :unique => true
  property :name,           String
  property :password,       BCryptHash
  property :phone,          Integer
  property :role,           String
  property :address,        String

  # Company User
  property :company_name,   String,  :unique => true
  property :inn,            Integer, :unique => true 
  property :kpp,            Integer
  property :bank_account,   Integer
  property :account_number, Integer, :unique => true

  validates_presence_of :company_name, :inn, :bank_account, :kpp, :account_number,  :when => [:company_role]
  validates_presence_of :email, :name, :password, :phone,                           :when => [:general_presence]
  validates_confirmation_of :password

  has n, :carts, :through => Resource

end
