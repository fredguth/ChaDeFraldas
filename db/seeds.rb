User.create!([
  {email: "fredguth@gmail.com", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2014-02-01 02:57:18", last_sign_in_at: "2014-01-31 03:04:12", current_sign_in_ip: "189.60.32.251", last_sign_in_ip: "189.60.32.251", provider: "facebook", uid: "535155966", oauth_token: "CAAC26whWELABAH0WPH35EaphlJHSjanbTvh6rtPivH49Is5R7VhlehwZA2NH6BV2qBZArZBKLpZC6RREq0n6G4w5ZAPAfZC9rZAFIMzCQ3bfgha3LCuFGy8ab7eN8ZA2muEaNAGF09z6uje8n5D6DPgi6MXkXyFCfnx4FfCXq6xtW2CwLYTD8e99ZAnjhvXPW5LYZD", oauth_expires_at: "2014-04-01 23:47:58", name: "Frederico Guth", first_name: "Frederico", last_name: "Guth"},
  {email: "mike_kmvpidb_martinazziwitz@tfbnw.net", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-02-01 03:21:08", last_sign_in_at: "2014-02-01 03:21:08", current_sign_in_ip: "189.60.32.251", last_sign_in_ip: "189.60.32.251", provider: "facebook", uid: "100007671941560", oauth_token: "CAAC26whWELABAHa8KhQD7tVoZAJgQ79sK49wb7RZBcx23jBpZBJ5H94ZB9LlOcGpZCceLWjP894k599bPASf4J63YgGwL2hRbyMnMKjrVYc39flML8AA2AceFRuTcEZCFlXEemCb5c4ZB5HykXtZC1XOUGSxidJThZBB2w5n9VZClCz8quIuebtwoejdwX2hMm18wZD", oauth_expires_at: "2014-04-02 03:21:05", name: "Mike Amgfgaidaefj Martinazziwitz", first_name: "Mike", last_name: "Martinazziwitz"},
  {email: "jennifer_lhlnjfz_shepardson@tfbnw.net", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-02-01 03:32:15", last_sign_in_at: "2014-02-01 03:32:15", current_sign_in_ip: "189.60.32.251", last_sign_in_ip: "189.60.32.251", provider: "facebook", uid: "100007687805254", oauth_token: "CAAC26whWELABAIb448VEq1zKmd6CU3ZCSfX2nAvyxujxDeMKreSzGfsvFBENFaXLYlGgpLOeM3mtwBzJKrov9p46Hf55AnB9PZAZC7ZB2OfZBMK9dfqmY280dpuxWpZBjx3QnsPln9eGImYNhCbIsdgSgTUzRHBQB1VvDqJvLzSKMhq8y6aAVspjhaMVOQkCEZD", oauth_expires_at: "2014-04-02 03:32:13", name: "Jennifer Amgfhghjebed Shepardson", first_name: "Jennifer", last_name: "Shepardson"}
])
Contribution.create!([
  {user_id: 1, event_id: 1, product_id: 2, expires_on: nil, purchased_at: nil},
  {user_id: 1, event_id: 1, product_id: 2, expires_on: nil, purchased_at: nil},
  {user_id: 1, event_id: 2, product_id: 4, expires_on: nil, purchased_at: nil},
  {user_id: 1, event_id: 2, product_id: 4, expires_on: nil, purchased_at: nil},
  {user_id: 2, event_id: 2, product_id: 4, expires_on: nil, purchased_at: "2014-02-01"},
  {user_id: 3, event_id: 3, product_id: 3, expires_on: nil, purchased_at: "2014-02-01"}
])
Event.create!([
  {name: "Chá de Fraldas do Joaquim", welcome_message: "Olá, venham participar desse momento histórico em nossas vidas .", thankyou_message: "Obrigado por participar do nosso evento.", is_open: true, user_id: 1, status: nil},
  {name: "Chá de Fraldas da Mariana", welcome_message: "Oba, você aqui!", thankyou_message: "Tchauzinho", is_open: true, user_id: 1, status: nil},
  {name: "Chá do filho do Mike", welcome_message: "Oi", thankyou_message: "Obrigado", is_open: true, user_id: 2, status: nil},
  {name: "Chá da filha da Jennifer", welcome_message: "foo", thankyou_message: "bar", is_open: true, user_id: 3, status: nil}
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
  {event_id: 1, product_id: 3},
  {event_id: 2, product_id: 1},
  {event_id: 2, product_id: 2},
  {event_id: 2, product_id: 4},
  {event_id: 3, product_id: 2},
  {event_id: 3, product_id: 3},
  {event_id: 3, product_id: 4},
  {event_id: 4, product_id: 1},
  {event_id: 4, product_id: 3},
  {event_id: 4, product_id: 4}
])
