DEFAULT_PASSWORD = '123456'.freeze

def show_spinner(start_message, end_message = 'Successfully done!')
  spinner = TTY::Spinner.new("[:spinner] #{start_message}")
  spinner.auto_spin
  yield
  spinner.success("(#{end_message})")
end
