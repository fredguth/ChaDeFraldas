
Contribution.create!([
  {user_id: 1, event_id: 1, product_id: 2},
  {user_id: 1, event_id: 1, product_id: 2}
])
Event.create!([
  {name: "Chá de Fraldas do Joaquim", welcome_message: "Olá, venham participar desse momento histórico em nossas vidas .", thankyou_message: "Obrigado por participar do nosso evento.", is_open: true, user_id: 1, status: nil}
])
Product.create!([
  {name: "", description: "1 Pacote Jumbo de Fraldas Huggies Turma da Mônica Conforto", value: "29.9", image_url: "produto1.png"},
  {name: "", description: "2 Pacotes Jumbo de Fraldas Huggies Turma da Mônica Conforto", value: "59.9", image_url: "produto1.png"},
  {name: "", description: "3 Pacotes Jumbo de Fraldas Huggies Turma da Mônica Conforto", value: "89.9", image_url: "produto1.png"},
  {name: "", description: "4 Pacotes Jumbo de Fraldas Huggies Turma da Mônica Conforto", value: "109.9", image_url: "produto1.png"}
])
Selection.create!([
  {event_id: 1, product_id: 1},
  {event_id: 1, product_id: 2},
  {event_id: 1, product_id: 3}
])
