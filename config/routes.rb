Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'tasks', to: 'tasks#index'
  get "tasks/new", to: "tasks#new"
  # Tenho que colocar o tasks/new antes de tasks/:id porque senão vai achar que new é
  # é um parâmetro, pois começam tem o mesmo VERB e ambos começam com tasks.
  post "tasks", to: "tasks#create"
  get 'tasks/:id', to: 'tasks#show', as: :task
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task # para ler o form
  patch "tasks/:id", to: "tasks#update" # enviar as respostas com o submit
  delete "tasks/:id", to: "tasks#destroy"
end
