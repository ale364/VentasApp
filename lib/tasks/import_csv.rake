namespace :import do
  desc "Importar productos desde un archivo CSV"
  task productos: :environment do
    require 'csv'
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'productos.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')
    csv.each do |row|
      producto = Producto.new
      producto.nombre = row['nombre']
      producto.descripcion = row['descripcion']
      producto.precio = row['precio']
      producto.stock = row['stock']
      producto.save!
      puts "#{producto.nombre} guardado"
    end
    puts "Importación completada"
  end
end
