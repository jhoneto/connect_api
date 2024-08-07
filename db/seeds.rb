# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create a default organization
Organization.create!(name: 'Outlabs')

# Create a default channel
Channel.create!(
  organization: Organization.first,
  name: 'WhatsApp',
  uuid: 'whatsapp',
  callback_method: 'post',
  callback_url: 'https://webhook.site/#!/view/9a196a38-a305-4725-b097-368bb8e8e4f9',
  callback_headers: { 'Content-Type' => 'application/json' },
  provider: 'facebook',
  channel_type: 'whatsapp',
  config: { 'facebook_api_token' => 'EAALCdFq7IWIBO5OjE99GcV4ISQlKoTpbPz2WMDUYcmOx0ZCMoixYNrwxoHw9ajbalZAt83jpVF0HHhdSFjSnokZAybESTtP5ti48kzcvU4FEtiQBAvkq7s8K6ZCn6aH4DPI7pqvO6bUJxk653CHnwYqShrEmKb15tg4NZCrPLpjJygB9rXQW08LFAPeC9M0bvfQddeBFp3fy6Ava6zXsN2esgdlQZD',
            'facebook_whatsapp_number' => '220835044450225'
          }
)

# Create a default template
Template.create!(
  organization: Organization.first,
  name: 'Confirmação de Consulta pelo WhatsApp',
  content: %Q[
           Olá {{1}}, aqui é do {{2}}.
           Confirma sua consulta no {{3}} as {{4}}.
          ],
  status: 'active',
  channel_code: 'confirmacao_consulta_completo',
  callback_method: 'post',
  callback_url: '',
  callback_headers: { 'Content-Type' => 'application/json' },
  channel: Channel.first
)
