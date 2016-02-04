class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :workspaces
  has_many :ratings
  has_many :rated_workspaces, through: :ratings, source: :workspace

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_rated?(workspace)
    reviewed_workspaces.include? workspace
  end
end
