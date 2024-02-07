Rswag::Api.configure do |c|
  # Especifica la carpeta raíz donde se encuentran los archivos JSON de Swagger
  # Esto es utilizado por el middleware de Swagger para manejar solicitudes para descripciones de la API
  # NOTA: Si estás usando rswag-specs para generar Swagger, asegúrate de configurarlo
  # para que genere archivos en la misma carpeta
  c.swagger_root = Rails.root.to_s + '/swagger'

  # Injecta una función lambda para alterar el Swagger devuelto antes de la serialización
  # La función tendrá acceso al envío de rack para la solicitud actual
  # Por ejemplo, podrías aprovechar esto para asignar dinámicamente la propiedad "host"
  #
  # c.swagger_filter = lambda { |swagger, env| swagger['host'] = env['HTTP_HOST'] }
end