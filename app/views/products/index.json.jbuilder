// https://v3.exchangerate-api.com/local/ed1b70c851f03f4ec7abfb8f/USD/117.199.118.209
json.array! @products do |product|
    json.name product.name
    json.price product.price
end