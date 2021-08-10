module SiteHelper
  def jumbotron_text
    case params[:action]
    when 'index'
      {
        title: 'Seja bem vindo!',
        texts: [
          'Esse é o Time to Answer, aqui você pode errar à vontade, para acertar na hora da prova!',
          'Abaixo você vê as últimas perguntas cadastradas.'
        ]
      }
    when 'questions'
      {
        title: 'Resultado de busca',
        texts: [
          "Exibindo resultados para: \"#{params[:term]}\""
        ]
      }
    when 'subject'
      {
        title: "Filtrado por: \"#{params[:subject]}\"",
        texts: []
      }
    end
  end
end
