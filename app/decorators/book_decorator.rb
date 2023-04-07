class BookDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  def status_book_text
    case status_book
    when 1
      return "Свободна"
    when 2
      return "Забронирована"
    when 3
      return "Читается"
    else
      return "Неизвестно"
    end
  end

  def condtition_book_text
    case condition_book
    when 1
      return "Как новая"
    when 2
      return "Удовлитворительно"
    when 3
      return "Повидавшая жизнь"
    else
      return "Неизвестно"
    end
  end

  def place_book_name
    case place_id
    when 1
      return "Проходная 1"
    when 2
      return "Проходная 2"
    when nil 
      return "user"
    else
      return "Неизвестно"
    end   
  end

end
