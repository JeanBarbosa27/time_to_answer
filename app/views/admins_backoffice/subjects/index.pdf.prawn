prawn_document do |pdf|
  pdf.text @subjects.model_name.human(count: @subjects.count), size: 24, align: :center
  pdf.move_down 20
  pdf.table(@subjects.each_with_index.collect { |admin, index| [index + 1, admin.description] })
end
