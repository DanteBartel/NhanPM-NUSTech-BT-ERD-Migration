module ApplicationHelper
    include Pagy::Frontend
    
    def p_datetime(datetime)
        if datetime
            datetime.strftime("%I:%M %p %d/%m/%Y")
        else
            nil
        end
    end
end
