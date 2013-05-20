Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :brothers do
    resources :brothers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :brothers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :brothers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
