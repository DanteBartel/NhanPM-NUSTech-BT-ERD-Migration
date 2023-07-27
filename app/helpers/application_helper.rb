module ApplicationHelper
    include Pagy::Frontend
    
    def p_datetime(datetime)
        if datetime
            datetime.strftime("%I:%M %p %d/%m/%Y")
        else
            nil
        end
    end

    def short_name(name)
        words = name.split(" ")
        first_chars = words.map { |word| word[0]}
        upcase_first_chars = first_chars.map(&:upcase)
        upcase_first_chars.join
    end

end
