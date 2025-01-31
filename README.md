Junto com @thurjob Desenvolvemos essa api Ruby on Rails

PUB ESCOBAR 

Instalar o Rvm:
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable 
source ~/.rvm/scripts/rvm

Instalar o Ruby:
rvm install Ruby

Instalar Rails:
gem install rails

Instalar o Docker:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt install -y docker-ce docker-ce-cli containerd.io

Instalar o Docker-Compose:
sudo curl -L "https://github.com/docker/composse/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

Verificar se tudo foi instalado corretamente:
rails -v
ruby -v
sudo docker -v
docker -v

Para criar o projeto, sem as views:
rails new pub_escobar  --api  

Configurar DB:
rails db:create

rails db:migrate

rails server

Para criar o modelo do item:
rails generate model Item pricing:float  name:string    
 
Para gerar o modelo do order: 
rails generate model Order customer_name:string   
 
Para gerar o modelo do orderItems ja com as chaves estrangeiras:
rails generate model OrderItems quantity:integer item:references order:references  
 
 Para gerar as rotas
rails routes   
 
 Gerar o controller dos items:
rails generate controller Items    
 
 Gerar o controller das orders:
-rails generate controller Orders   
 

Gerar o controller dos ordersItems:
rails generate controller OrderItems  

Para fazer um post nos items:
curl -X POST http://localhost:3000/items -H "Content-Type: application/json" -d '{"item": {"name": "Produto A", "pricing": 25.50}}
rails db:migrate

rails s  para testar
 
 Para instalar as gems configuradas:
bundle install   


Para instalar o rspec: 
rails generate rspec:install   

rails g rswag:install

rails g rswag:ui:install

rails g rswag:api:install 

touch spec/swagger_helper.rb 
