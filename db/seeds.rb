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
  config: { 'facebook_api_token' => 'EAALCdFq7IWIBO3Jf4bZCbtJJ2ZCq3gIHHKuKijwVpyg3bfZCv3BLdykqDQu9sX3hWh8622YESyEKLxf53D7BhgYZBvecniqDy6cZCpFQfOb4yO7fgLelR8uFyTH2FdLmjIDyIHIZC9uTRAeSeFFRAIRsmNswWMDUCvkycjUG6NTA92sCjmlcBVi9NHQG9GiWkFXgasFSzMZBh9DTmXKrHlKJpFT4QQZD',
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
