Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :customers, except: [:new, :edit] do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
      end

      resources :invoice_items, except: [:new, :edit] do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
        member do
          get "invoice"
          get "item"
        end
      end

      resources :invoices, except: [:new, :edit] do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
        member do
          get "transactions"
          get "invoice_items"
          get "items"
          get "customer"
          get "merchant"
        end
      end

      resources :items, except: [:new, :edit] do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
        member do
          get "invoice_items"
          get "merchant"
        end
      end

      resources :merchants, except: [:new, :edit] do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
        member do
          get "items"
          get "invoices"
        end
      end

      resources :transactions, except: [:new, :edit] do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
        member do
          get "invoice"
        end
      end
    end
  end
end
