module AdminsBackofficeHelper
  def active_link?(path)
    request.env['PATH_INFO'] == path
  end
end
