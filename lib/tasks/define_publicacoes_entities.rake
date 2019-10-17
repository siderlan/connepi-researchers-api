namespace :define_publicacoes_entities do
  desc "Define instituicoes table and area table based on publicacoes"

  #There are 11 thousand of registers about publications
  #There are 331 universities registered
  
  task define_entities: :environment do
    Publicacao.all.each do |publicacao|
      Instituicao.create(
        sigla: publicacao.instituicao_attribute
      ) unless Instituicao.where(sigla: publicacao.instituicao_attribute).any?

      Area.create(nome: publicacao.area_attribute) unless Area.where(nome: publicacao.area_attribute).any?
      puts "Criando Registros..."
    end
  end

  task update_publicacoes: :environment do
    Publicacao.all.each do |publicacao|
      instituicao = Instituicao.find_by(sigla: publicacao.instituicao_attribute)
      area = Area.find_by(nome: publicacao.area_attribute)
      publicacao.update(instituicao_id: instituicao.id, area_id: area.id)
    end
  end

end