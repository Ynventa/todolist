module TasksHelper
  def format_date(time)
    time.strftime("%m/%d/%y %l:%M")
  end
end
