200.times do |n|
  frequency = rand(1..100)
  single_sale = rand(1..1000000).to_i
  mark_up = rand(1..99)
  user_id = rand(1..20)
  customer = rand(1000..99999)
  amount = rand(1..1000)
  job_type = ["web", "digital"].sample
  job_title = "some job"
  quantity = rand(1000..99999)
  pages = rand(1..200)
  Sale.create!( user_id: user_id,
                pages: pages,
                quantity: quantity,
                job_title: job_title,
                job_type: job_type,
                amount: amount,
                customer: customer,
                mark_up: mark_up,
                frequency: frequency,
                single_sale: single_sale)
end
