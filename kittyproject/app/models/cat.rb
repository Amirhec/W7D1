class Cat < ApplicationRecord

    $CAT_COLOR =  ["blue","white","black","grey","brown"]
    validates :birth_date, :color, :name, :sex, presence: true 
    validate :valid_sex, :birth_date_cannot_be_future, :valid_cat_color


    def valid_sex
        if !["M","F"].include?(sex)
            errors.add(:sex, "invalid sex")
        end
    end

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "birth date can't be in future ")
        end
    end   
    
    def age 
        ((Date.today - birth_date)/(365.0)).round
    end

    def valid_cat_color
        if !$CAT_COLOR.include?(color)
            errors.add(:color, "invalid color")
        end
    end


end


