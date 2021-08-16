prawn_document do |pdf|
  pdf.text @admins.model_name.human(count: @admins.count), size: 24, align: :center
  pdf.move_down 20
  pdf.table(@admins.each_with_index.collect { |admin, index| [index + 1, admin.email] })
end
