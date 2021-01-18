class Question < ApplicationRecord
     has_many :answers, dependent: :destroy
    #has_many :answers, dependent: :nullify

#association with user model
belongs_to :user, optional: true

    
    validates :title, presence: {message: 'must be provided'},uniqueness: true

     validates :body, length:{minimum: 2, maximum: 500}

end
