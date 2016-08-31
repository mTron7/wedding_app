class Response < ActiveRecord::Base
    validates_uniqueness_of :guest1
    validates_uniqueness_of :guest2
    validates_presence_of :attending
    validates_presence_of :guest1

end
